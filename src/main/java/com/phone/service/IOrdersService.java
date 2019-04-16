package com.phone.service;

import com.phone.common.CommonResult;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.OrdersPojo;
import com.phone.pojo.UserPojo;

import java.util.List;

public interface IOrdersService {

    /**
     * 添加信息
     * @param ordersPojo
     * @param user
     * @return
     */
    public CommonResult addBean(OrdersPojo ordersPojo,UserPojo user);

    /**
     * 通过id删除
     * @param id
     */
    public CommonResult deleteById(int id);

    /**
     * 更新
     * @param ordersPojo
     */
    public CommonResult updateBean(OrdersPojo ordersPojo);

    /**
     * 查询满足条件的信息
     * @param searchVo
     * @param page
     * @param userInfo
     * @return
     */
    public List<OrdersPojo> selectOrdersList(SearchVo searchVo, PageBean page,UserPojo userInfo);

    /**
     * 查询满足条件的信息
     * @param searchVo
     * @param page
     * @param user
     * @return
     */
    public CommonResult getOrdersList(SearchVo searchVo, PageBean page, UserPojo user );

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public OrdersPojo getById(int id);

    /**
     * 更新状态
     * @param id
     * @param status
     * @return
     */
    public CommonResult updateStatus(int id, int status);



    /**
     * 发货
     * @param idStr
     * @param userPojo
     * @return
     */
    public CommonResult delieveryOrder(String idStr, UserPojo userPojo);


    /**
     * 退货
     * @param idStr
     * @param status
     * @return
     */
    public CommonResult returnOrder(String idStr,int status,UserPojo userPojo);

    /**
     * 更新订单数量
     * @param orders
     * @return
     */
    public CommonResult updateOrderNum(OrdersPojo orders);

    /**
     * 订单支付
     * @param orderIds : 订单号用","拼接
     * @param user
     * @return
     */
    public CommonResult payOrders(String orderIds,UserPojo user);

    /**
     * 统计需要支付的账单费用
     * @param orderIds
     * @return
     */
    public CommonResult countPayFree(String orderIds);

    /**
     * 统计各种订单的数量
     * @param user
     * @return
     */
    public CommonResult countOrderStatus(UserPojo user);

    /**
     * 取消订单
     * @param ids
     * @param userInfo
     * @return
     */
    public CommonResult cancerOrder(String ids,UserPojo userInfo);

    /**
     * 顾客签收订单
     * @param choiceId
     * @param userInfo
     * @return
     */
    public CommonResult penOrder(String choiceId, UserPojo userInfo);

    /**
     * 退货申请
     * @param orderId
     * @param userInfo
     * @return
     */
    public CommonResult applayReturnOrder(int orderId, UserPojo userInfo);
}
