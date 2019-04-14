package com.phone.controller;


import com.phone.common.CommonResult;
import com.phone.common.MessageConstant;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.OrdersPojo;
import com.phone.pojo.UserPojo;
import com.phone.service.IOrdersService;
import com.phone.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.criteria.Order;
import javax.servlet.http.HttpServletRequest;

/**
 * 订单信息接口
 */
@Controller
@RequestMapping(value="/order")
public class OrdersController {

    private static Logger logger = LoggerFactory.getLogger(OrdersController.class);

    @Autowired
    private IOrdersService iOrdersService;


    //获取列表
    @RequestMapping(value="/getOrderList",method=RequestMethod.GET )
    public String getOrderList(SearchVo searchVo, PageBean page, Model model, HttpServletRequest request){
        logger.info("********** 进入 getOrderList 方法,searchVo={},page={}********** ",new Object[]{searchVo,page});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        model.addAttribute("orderList", iOrdersService.selectOrdersList(searchVo,page,userInfo));
        model.addAttribute("searchVo", searchVo);
        return "admin/order/order-list";
    }

    //根据id获取
    @RequestMapping(value="/getOrderById/{orderId}",method=RequestMethod.GET )
    public String getOrderById(@PathVariable("orderId") int id,String view,Model model){
        logger.info("********** 进入 getOrderById 方法,id={}********** ",new Object[]{id});
        model.addAttribute("orderInfo",iOrdersService.getById(id));
        return view;
    }


    //发货
    @RequestMapping(value = "/delieveryOrder", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult delieveryOrder(String choiceId,HttpServletRequest request) {
        logger.info("************  进入  delieveryOrder 方法,choiceId={} ************ ",new Object[]{choiceId});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        return iOrdersService.delieveryOrder(choiceId,userInfo);
    }


    //退货
    @RequestMapping(value = "/returnOrder", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult returnOrder(String choiceId,int status,HttpServletRequest request) {
        logger.info("************  进入  returnOrder 方法,choiceId={},status={} ************ ",new Object[]{choiceId,status});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        return iOrdersService.returnOrder(choiceId,status,userInfo);
    }


    //取消订单
    @RequestMapping(value = "/cancerOrder", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult cancerOrder(String choiceId,HttpServletRequest request) {
        logger.info("************  进入  returnOrder 方法,choiceId={} ************ ",new Object[]{choiceId});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        return iOrdersService.cancerOrder(choiceId,userInfo);
    }

    //标记--->顾客已签收订单
    @RequestMapping(value = "/penOrder", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult penOrder(String choiceId,HttpServletRequest request) {
        logger.info("************  进入 penOrder 方法,choiceId={} ************ ",new Object[]{choiceId});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        return iOrdersService.penOrder(choiceId,userInfo);
    }




    //删除
    @RequestMapping(value="/delete",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult deleteOrders(int id){
        logger.info("********** 进入 deleteOrders 方法,id={}********** ",new Object[]{id});
        return iOrdersService.deleteById(id);
    }

}
