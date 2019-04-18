package com.phone.service.impl;

import com.phone.common.*;
import com.phone.dao.*;
import com.phone.pojo.*;
import com.phone.pojo.vo.OrderFreeVo;
import com.phone.service.IOrdersService;
import com.phone.service.IUserService;
import com.phone.utils.NumberUtil;
import com.phone.utils.OrderCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.OrderUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.transaction.Transactional;
import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;


@Service
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    IOrdersDao iOrdersDao;
    @Autowired
    IOrderProcessLogDao orderProcessLogDao;
    @Autowired
    IPhoneDao iPhoneDao;
    @Autowired
    IWalletLogDao iWalletLogDao;
    @Autowired
    IUserService  iUserService;
    @Autowired
    IPictureDao iPictureDao;

    @Override
    public CommonResult addBean(OrdersPojo ordersPojo,UserPojo user) {
        if (user == null || user.getId() <= 0 ){
            return CommonResult.ERROR(MessageConstant.NEED_LOGIN);
        }
        if (ordersPojo == null ||ordersPojo.getPhoneId() < 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        //未支付
        ordersPojo.setStatus(Constant.ORDER_PAY_DOING);
        ordersPojo.setCreateTime(new Date());
        ordersPojo.setUserId(user.getId());
        //计算金额
        PhonePojo phone = iPhoneDao.getById(ordersPojo.getPhoneId());
        if (phone == null){
            return CommonResult.ERROR(MessageConstant.PHONE_NO_EXISTS);
        }
        ordersPojo.setPay(phone.getSalePrice() * ordersPojo.getNum());
        //订单编号
        ordersPojo.setOrderCode(OrderCodeUtil.getOrderCode());
        int result = iOrdersDao.addBean(ordersPojo);
        if (result <= 0){
            return CommonResult.ERROR(MessageConstant.RUN_ERROR);
        }
        //订单记录
        OrderProcessLogPojo processLogPojo = new OrderProcessLogPojo();
        processLogPojo.setCreateTime(new Date());
        processLogPojo.setOrder_id(ordersPojo.getId());
        processLogPojo.setType(Constant.ORDER_PAY_DOING);
        processLogPojo.setUser_id(ordersPojo.getId());
        orderProcessLogDao.addBean(processLogPojo);

        return CommonResult.SUCCESS(MessageConstant.ADD_SUCCESS,result);
    }

    @Override
    public CommonResult deleteById(int id) {
        if (id <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        iOrdersDao.deleteById(id);
        return CommonResult.SUCCESS(MessageConstant.DELETE_SUCCESS,null);
    }

    @Override
    public CommonResult updateBean(OrdersPojo ordersPojo) {
        if (ordersPojo == null || ordersPojo.getId() <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        iOrdersDao.updateBean(ordersPojo);
        return CommonResult.SUCCESS(MessageConstant.UPDATE_SUCCESS,null);

    }

    @Override
    public List<OrdersPojo> selectOrdersList(SearchVo searchVo, PageBean page,UserPojo userInfo) {
        if (userInfo == null){
            return null;
        }
        return iOrdersDao.selectOrdersDetailList(getQueryMap(searchVo,page,userInfo));
    }

    private Map<String,Object> getQueryMap(SearchVo searchVo, PageBean page,UserPojo userInfo){
        Map<String,Object> paramMap = new HashMap<>();
        if (userInfo != null && userInfo.getRoleId() != Constant.USER_ADMIN){//非管理员
            if (userInfo.getRoleId() == Constant.USER_COMMON){
                paramMap.put("userId",userInfo.getId());//购买者
            }else {
                paramMap.put("hashId",userInfo.getId());//店家
            }
        }
        if (searchVo != null){
            if (!StringUtils.isEmpty(searchVo.getCategory())){
                List<String> statusList = Arrays.asList(searchVo.getCategory().split(","));
                List<Integer> listIds = Arrays.asList(searchVo.getCategory().split(",")).stream().map(s -> Integer.parseInt(s.trim())).collect(Collectors.toList());
                paramMap.put("statusRange",listIds);
            }
            if (!StringUtils.isEmpty(searchVo.getText())){
                paramMap.put("orderCode",searchVo.getText());
            }
            if (searchVo.getIndex() > 0){
                paramMap.put("status",searchVo.getIndex());
            }
            if (searchVo.getUserFlag() > 0){
                paramMap.put("userId",searchVo.getUserFlag());
            }
            if (!StringUtils.isEmpty(searchVo.getStartTime())){
                paramMap.put("startTime",searchVo.getStartTime());
            }
            if (!StringUtils.isEmpty(searchVo.getEndTime())){
                paramMap.put("endTime",searchVo.getEndTime());
            }
        }
        if (page != null && page.getStart() >= 0){
            paramMap.put("start",page.getStart());
            paramMap.put("offset",page.getOffset());
        }
        return paramMap;
    }

    @Override
    public CommonResult getOrdersList(SearchVo searchVo, PageBean page, UserPojo user) {
        if (user == null){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        Map<String, Object> queryMap = getQueryMap(searchVo, page,user);
        int count = iOrdersDao.countOrders(queryMap);
        if (count <= 0){
            return CommonResult.SUCCESS(0,null);
        }
        List<OrdersPojo> ordersPojos = iOrdersDao.selectOrdersDetailList(queryMap);
        if (ordersPojos != null && ordersPojos.size() > 0){
            for (OrdersPojo ordersPojo: ordersPojos ) {
                if (!StringUtils.isEmpty(ordersPojo.getPhone().getPictureIds())){
                    List<PicturePojo> byIds = iPictureDao.getByIds(Arrays.asList(ordersPojo.getPhone().getPictureIds().split(",")));
                    ordersPojo.getPhone().setPictures(byIds);
                }
            }
        }
        page.setTotal(count);
        return CommonResult.SUCCESS(count,ordersPojos);
    }


    @Override
    public OrdersPojo getById(int id) {
        return iOrdersDao.getById(id);
    }

    @Override
    public CommonResult updateStatus(int id, int status) {
        if (id <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        OrdersPojo bean = iOrdersDao.getById(id);
        if (bean == null){
            return CommonResult.ERROR(MessageConstant.ORDER_NO_EXISTS);
        }
        return CommonResult.ERROR(MessageConstant.UPDATE_SUCCESS);
    }

    @Override
    public CommonResult delieveryOrder(String idStr,UserPojo userPojo) {
        if (StringUtils.isEmpty(idStr)){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }

        String[] ids = (idStr.substring(idStr.indexOf(',') + 1)).split(",");

        Map<String,Object> map = new HashMap<>();
        map.put("ids",ids);
        List<OrdersPojo> ordersPojos = iOrdersDao.selectOrdersList(map);
        if (ordersPojos == null || ordersPojos.size() == 0){
            return CommonResult.ERROR(MessageConstant.ORDER_NO_EXISTS);
        }

        List<OrderProcessLogPojo> processLogPojos = new ArrayList<>();
        for (OrdersPojo order:ordersPojos) {
            if (order.getStatus()== Constant.ORDER_PAY_DOING){//未支付
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_NO_PAY);
            }

            if (order.getStatus() == Constant.ORDER_CANCER){//已取消
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_HAVE_CANCER);
            }

            if (order.getStatus() >= Constant.ORDER_GAINS){//已发货
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_HAVE_DELIVERY);
            }

            OrderProcessLogPojo processLogPojo = new OrderProcessLogPojo();
            processLogPojo.setCreateTime(new Date());
            processLogPojo.setOrder_id(order.getId());
            processLogPojo.setType(Constant.ORDER_GAINS);
            processLogPojo.setUser_id(userPojo.getId());
            processLogPojos.add(processLogPojo);
        }
        //设置待收货状态
        map.put("status",Constant.ORDER_GAINS);
        map.put("updateTime",new Date());
        iOrdersDao.updateByMap(map);

        //发货记录
        if (processLogPojos.size() > 0){
            orderProcessLogDao.insertBatch(processLogPojos);
        }

        return CommonResult.SUCCESS(MessageConstant.ORDER_DELIVERY_SUCCESS,null);
    }

    @Override
    public CommonResult returnOrder(String idStr,int status, UserPojo userPojo) {
        if (StringUtils.isEmpty(idStr) || status < Constant.ORDER_RETURN_APPLAY || status > Constant.ORDER_RETURN_REFUSE){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }

        String[] ids = (idStr.substring(idStr.indexOf(',') + 1)).split(",");

        Map<String,Object> map = new HashMap<>();
        map.put("ids",ids);
        List<OrdersPojo> ordersPojos = iOrdersDao.selectOrdersList(map);
        if (ordersPojos == null || ordersPojos.size() == 0){
            return CommonResult.ERROR(MessageConstant.ORDER_NO_EXISTS);
        }

        List<OrderProcessLogPojo> processLogPojos = new ArrayList<>();
        for (OrdersPojo order:ordersPojos) {

            if (order.getStatus() == Constant.ORDER_CANCER){//已取消
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_HAVE_CANCER);
            }

            if (order.getStatus() != Constant.ORDER_RETURN_APPLAY){//已处理过退货申请
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_NO_RETURN_APPLAY);
            }

            OrderProcessLogPojo processLogPojo = new OrderProcessLogPojo();
            processLogPojo.setCreateTime(new Date());
            processLogPojo.setOrder_id(order.getId());
            processLogPojo.setType(status);
            processLogPojo.setUser_id(userPojo.getId());
            processLogPojos.add(processLogPojo);
        }
        //设置待收货状态
        map.put("status",status);
        map.put("updateTime",new Date());
        iOrdersDao.updateByMap(map);

        //发货记录
        if (processLogPojos.size() > 0){
            orderProcessLogDao.insertBatch(processLogPojos);
        }

        return CommonResult.SUCCESS(MessageConstant.ORDER_RETURN_APPLAY_SOLVE_SUCCESS,null);
    }

    @Override
    public CommonResult updateOrderNum(OrdersPojo orders) {
        if (orders == null || orders.getId() <= 0 || orders.getNum() <= 0 || orders.getPhoneId() <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        PhonePojo phonePojo = iPhoneDao.getById(orders.getPhoneId());
        if (phonePojo == null){
            return CommonResult.ERROR(MessageConstant.PHONE_NO_EXISTS);
        }
        //更新价格
        orders.setPay(orders.getNum() * phonePojo.getSalePrice());
        iOrdersDao.updateBean(orders);

        return CommonResult.SUCCESS(MessageConstant.UPDATE_SUCCESS,null);
    }

    @Transactional
    @Override
    public CommonResult payOrders(String orderIds,UserPojo user) {
        if (StringUtils.isEmpty(orderIds)){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        String[] idArr = orderIds.split(",");
        Map<String,Object> map = new HashMap<>();
        map.put("ids",idArr);
        List<OrdersPojo> ordersPojos = iOrdersDao.selectOrdersList(map);
        if (ordersPojos == null || ordersPojos.size() == 0){
            return CommonResult.ERROR(MessageConstant.ORDER_NO_EXISTS);
        }

        List<OrderProcessLogPojo> processLogPojoList = new ArrayList<>();
        List<WalletLogPojo> walletLogPojos = new ArrayList<>();
        //账户余额比较
        double needPay = iOrdersDao.countNeedPay(map);
        UserPojo userPojo = iUserService.getById(user.getId());
        if (userPojo.getBalance() < needPay){
            return CommonResult.ERROR(MessageConstant.BALANCE_NO_ENOUGH);
        }

        for (OrdersPojo order:ordersPojos) {

            if (order.getStatus() == Constant.ORDER_CANCER){//已取消
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_HAVE_CANCER);
            }
            //更新订单状态为已支付(待发货)
            OrdersPojo ordersPojo = new OrdersPojo();
            ordersPojo.setId(order.getId());
            ordersPojo.setStatus(Constant.ORDER_DELIVERY);
            ordersPojo.setUpdateTime(new Date());
            iOrdersDao.updateBean(ordersPojo);

            //日志记录
            OrderProcessLogPojo processLogPojo = new OrderProcessLogPojo();
            processLogPojo.setType(Constant.ORDER_DELIVERY);
            processLogPojo.setUser_id(user.getId());
            processLogPojo.setCreateTime(new Date());
            processLogPojo.setOrder_id(order.getId());
            processLogPojoList.add(processLogPojo);


            //钱包付款记录
            WalletLogPojo walletLogPojo = new WalletLogPojo();
            walletLogPojo.setCreateTime(new Date());
            walletLogPojo.setNote("订单支付");
            walletLogPojo.setType(Constant.WALLET_PAY_2);
            walletLogPojo.setUserId(user.getId());
            walletLogPojo.setMoney(order.getPay());
            walletLogPojo.setOrderId(order.getId());
            walletLogPojos.add(walletLogPojo);
        }

        //更新账户余额,保留两个小数点
        double balance = NumberUtil.formateDoubleWithTwoPoint(userPojo.getBalance() - needPay);
        UserPojo updateUser = new UserPojo();
        updateUser.setId(user.getId());
        updateUser.setBalance(balance);
        updateUser.setUpdateTime(new Date());
        iUserService.updateBean(updateUser);
        //更新客户端显示的账户余额问题
        user.setBalance(balance);

        //财务记录
        if (walletLogPojos.size() > 0){
            iWalletLogDao.insertBatch(walletLogPojos);
        }

        if (processLogPojoList.size() > 0){
            orderProcessLogDao.insertBatch(processLogPojoList);
        }

        //批量插入订单操作日志
        orderProcessLogDao.insertBatch(processLogPojoList);
        return CommonResult.SUCCESS(MessageConstant.PAY_SUCCESS,null);
    }

    @Override
    public CommonResult countPayFree(String orderIds) {

        OrderFreeVo orderFreeVo = new OrderFreeVo();
        if (!StringUtils.isEmpty(orderIds)){
            String[] orderIdArr = orderIds.split(",");
            orderFreeVo.setSize(orderIdArr.length);
            //费用明细
            for (String orderIdStr:orderIdArr){
                int orderId = Integer.parseInt(orderIdStr);
                //更新订单状态为已支付(待发货)
                OrdersPojo ordersPojo = iOrdersDao.getById(orderId);
                //由于没有设置快递费用,此处将需要支付的金额与商品总价一样
                orderFreeVo.setPhonePrice(orderFreeVo.getPhonePrice()+ordersPojo.getPay());
                orderFreeVo.setTotalPrice(orderFreeVo.getTotalPrice()+ordersPojo.getPay());
            }
        }
        return CommonResult.SUCCESS(orderFreeVo);
    }

    @Override
    public CommonResult countOrderStatus(UserPojo user) {
        if(user == null || user.getId() <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        //统计各种订单的数量
        Map<String,Integer> map = iOrdersDao.countOrderStatus(user.getId());
        return CommonResult.SUCCESS(map);
    }

    @Transactional
    @Override
    public CommonResult cancerOrder(String ids,  UserPojo userInfo) {
        if (StringUtils.isEmpty(ids)){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }

        String[] idArr = (ids.substring(ids.indexOf(',') + 1)).split(",");

        Map<String,Object> map = new HashMap<>();
        map.put("ids",idArr);
        List<OrdersPojo> ordersPojos = iOrdersDao.selectOrdersList(map);
        if (ordersPojos == null || ordersPojos.size() == 0){
            return CommonResult.ERROR(MessageConstant.ORDER_NO_EXISTS);
        }

        List<OrderProcessLogPojo> processLogPojos = new ArrayList<>();
        List<UserPojo> userPojos = new ArrayList<>();
        List<WalletLogPojo> walletLogPojos = new ArrayList<>();
        for (OrdersPojo order:ordersPojos) {

            if (order.getStatus() == Constant.ORDER_CANCER){//已取消
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_HAVE_CANCER);
            }

            if (order.getStatus() >= Constant.ORDER_GAINS){//已发货无法取消
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_DELEIVE);
            }

            OrderProcessLogPojo processLogPojo = new OrderProcessLogPojo();
            processLogPojo.setCreateTime(new Date());
            processLogPojo.setOrder_id(order.getId());
            processLogPojo.setType(Constant.ORDER_CANCER);
            processLogPojo.setUser_id(userInfo.getId());
            processLogPojos.add(processLogPojo);

            //金额退款
            if (order.getStatus() == Constant.ORDER_DELIVERY){
                //用户账户
                UserPojo userPojo = new UserPojo();
                userPojo.setId(order.getUserId());
                userPojo.setBalance(order.getPay());
                userPojos.add(userPojo);
                //退款记录
                WalletLogPojo walletLogPojo = new WalletLogPojo();
                walletLogPojo.setCreateTime(new Date());
                walletLogPojo.setNote("订单取消退款");
                walletLogPojo.setType(Constant.WALLET_CANCER_3);
                walletLogPojo.setUserId(order.getUserId());
                walletLogPojo.setMoney(order.getPay());
                walletLogPojo.setOrderId(order.getId());
                walletLogPojos.add(walletLogPojo);
            }
        }
        //设置待收货状态
        map.put("status",Constant.ORDER_CANCER);
        map.put("updateTime",new Date());
        iOrdersDao.updateByMap(map);

        //用户金额退款
        if (userPojos.size() > 0){
            iUserService.batchUpdateMoney(userPojos);
        }

        //财务记录
        if (walletLogPojos.size() > 0){
            iWalletLogDao.insertBatch(walletLogPojos);
        }

        //发货记录
        if (processLogPojos.size() > 0){
            orderProcessLogDao.insertBatch(processLogPojos);
        }

        return CommonResult.SUCCESS(MessageConstant.ORDER_CANCER_SUCCESS,null);
    }

    @Transactional
    @Override
    public CommonResult penOrder(String ids, UserPojo userInfo) {
        if (StringUtils.isEmpty(ids)){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }

        String[] idArr = (ids.substring(ids.indexOf(',') + 1)).split(",");
        Map<String,Object> map = new HashMap<>();
        map.put("ids",idArr);
        List<OrdersPojo> ordersPojos = iOrdersDao.selectOrdersList(map);
        if (ordersPojos == null || ordersPojos.size() == 0){
            return CommonResult.ERROR(MessageConstant.ORDER_NO_EXISTS);
        }
        List<OrderProcessLogPojo> processLogPojos = new ArrayList<>();
        for (OrdersPojo order:ordersPojos) {

            if (order.getStatus() == Constant.ORDER_CANCER){//已取消
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_HAVE_CANCER);
            }

            if (order.getStatus() != Constant.ORDER_GAINS){//已发货无法取消
                return CommonResult.ERROR(order.getOrderCode()+MessageConstant.ORDER_NOT_DELEIVE);
            }

            OrderProcessLogPojo processLogPojo = new OrderProcessLogPojo();
            processLogPojo.setCreateTime(new Date());
            processLogPojo.setOrder_id(order.getId());
            processLogPojo.setType(Constant.ORDER_PEN);
            processLogPojo.setUser_id(userInfo.getId());
            processLogPojos.add(processLogPojo);

        }
        //设置待收货状态
        map.put("status",Constant.ORDER_PEN);
        map.put("updateTime",new Date());
        iOrdersDao.updateByMap(map);

        //发货记录
        if (processLogPojos.size() > 0){
            orderProcessLogDao.insertBatch(processLogPojos);
        }

        return CommonResult.SUCCESS(MessageConstant.ORDER_CANCER_SUCCESS,null);
    }

    @Transactional
    @Override
    public CommonResult applayReturnOrder(int orderId, UserPojo userInfo) {
        if (orderId <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        OrdersPojo ordersPojo = iOrdersDao.getById(orderId);
        if (ordersPojo == null){
            return CommonResult.ERROR(MessageConstant.ORDER_NO_EXISTS);
        }

        if (ordersPojo.getStatus() != Constant.ORDER_GAINS){
            return CommonResult.ERROR(MessageConstant.ORDER_NO_GAIN);
        }

        //更新订单
        OrdersPojo updateOrder = new OrdersPojo();
        updateOrder.setId(orderId);
        updateOrder.setStatus(Constant.ORDER_RETURN_APPLAY);
        updateOrder.setUpdateTime(new Date());
        iOrdersDao.updateBean(updateOrder);

        //订单流程记录
        OrderProcessLogPojo processLogPojo = new OrderProcessLogPojo();
        processLogPojo.setCreateTime(new Date());
        processLogPojo.setOrder_id(orderId);
        processLogPojo.setType(Constant.ORDER_RETURN_APPLAY);
        processLogPojo.setUser_id(userInfo.getId());
        orderProcessLogDao.addBean(processLogPojo);
        return CommonResult.SUCCESS(MessageConstant.ORDER_APPLYING_DOING,null);
    }


}
