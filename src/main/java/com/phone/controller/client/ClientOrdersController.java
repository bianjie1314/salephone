package com.phone.controller.client;


import com.phone.common.CommonResult;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.OrdersPojo;
import com.phone.pojo.UserPojo;
import com.phone.service.IOrdersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 订单信息接口
 */
@Controller
@RequestMapping(value="/client/order")
public class ClientOrdersController {

    private static Logger logger = LoggerFactory.getLogger(ClientOrdersController.class);

    @Autowired
    private IOrdersService iOrdersService;


    //获取列表
    @RequestMapping(value="/getOrderList",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult getOrderList(SearchVo searchVo, PageBean page,HttpServletRequest request){
        logger.info("********** 进入 client - getOrderList 方法,searchVo={},page={}********** ",new Object[]{searchVo,page});
        UserPojo user = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        return iOrdersService.getOrdersList(searchVo, page,user);
    }


    //获取列表
    @RequestMapping(value="/countOrderStatus",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult countOrderStatus(HttpServletRequest request){
        logger.info("********** 进入 client - countOrderStatus 方法 ********** ");
        UserPojo user = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        return iOrdersService.countOrderStatus(user);
    }

    //删除
    @RequestMapping(value="/delete/{id}",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult deleteOrders(@PathVariable("id") int id){
        logger.info("********** 进入 client - deleteOrders 方法,id={}********** ",new Object[]{id});
        return iOrdersService.deleteById(id);
    }

    //标记--->签收订单
    @RequestMapping(value = "/penOrder", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult penOrder(String choiceId,HttpServletRequest request) {
        logger.info("************  进入 client - penOrder 方法,choiceId={} ************ ",new Object[]{choiceId});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        return iOrdersService.penOrder(choiceId,userInfo);
    }

    //退货申请
    @RequestMapping(value = "/applayReturnOrder", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult applayReturnOrder(int orderId,HttpServletRequest request) {
        logger.info("************  进入 client - applayReturnOrder 方法,orderId={} ************ ",new Object[]{orderId});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        return iOrdersService.applayReturnOrder(orderId,userInfo);
    }

    //更新订单数量
    @RequestMapping(value="/updateNum")
    @ResponseBody
    public CommonResult updateNum(@RequestBody OrdersPojo orders){
        logger.info("********** 进入 client - updateNum 方法,orders={}********** ",new Object[]{orders});
        return iOrdersService.updateOrderNum(orders);
    }


    //统计需要支付的金额账单
    @RequestMapping(value="/countPayFree")
    @ResponseBody
    public CommonResult countPayFree(String orderIds,HttpServletRequest request){
        logger.info("********** 进入 client - countPayFree 方法,orderIds={}********** ",new Object[]{orderIds});
        return iOrdersService.countPayFree(orderIds);
    }

    //支付订单
    @RequestMapping(value="/payOrders")
    @ResponseBody
    public CommonResult payOrders(String orderIds,HttpServletRequest request){
        logger.info("********** 进入 client - payOrders 方法,orderIds={}********** ",new Object[]{orderIds});
        UserPojo user = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        CommonResult commonResult = iOrdersService.payOrders(orderIds, user);
        if (commonResult.isResult()){
            //更新客户端的信息缓存(余额可能存在修改)
            request.getSession().setAttribute("clientUserInfo",user);
        }
        return commonResult;
    }

    //添加购物车
    @RequestMapping(value="/addCar")
    @ResponseBody
    public CommonResult addCar(@RequestBody OrdersPojo orders,HttpServletRequest request){
        logger.info("********** 进入 client - addOrders 方法,orders={}********** ",new Object[]{orders});
        //用户信息
        UserPojo user = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        return iOrdersService.addBean(orders,user);
    }
}
