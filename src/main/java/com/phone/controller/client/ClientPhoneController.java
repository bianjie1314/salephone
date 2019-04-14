package com.phone.controller.client;


import com.phone.common.CommonResult;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.UserPojo;
import com.phone.service.IPhoneService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 手机商品接口
 */
@Controller
@RequestMapping(value="/client/phone")
public class ClientPhoneController {

    private static Logger logger = LoggerFactory.getLogger(ClientPhoneController.class);

    @Autowired
    private IPhoneService iPhoneService;


    //最新的推荐列表
    @RequestMapping(value="/getPhonePage" )
   @ResponseBody
    public CommonResult getPhonePage(SearchVo searchVo,PageBean pageBean, Model model, HttpServletRequest request){
        logger.info("********** 进入 client - getNewPhoneList 方法,searchVo={},pageBean={} ********** ",new Object[]{searchVo,pageBean});
      //  UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        CommonResult commonResult = iPhoneService.selectPhonePage(searchVo, pageBean,null);
        model.addAttribute("searchVo",searchVo);
        model.addAttribute("pageBean",pageBean);
        return commonResult;
    }

    //根据id获取
    @RequestMapping(value="/selectPhoneType",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult selectPhoneType(){
        logger.info("********** 进入 selectPhoneType 方法,********** ");
        return iPhoneService.selectPhoneType();
    }


    //根据id获取
    @RequestMapping(value="/getPhoneById/{phoneId}",method=RequestMethod.GET )
    public String getPhoneById(@PathVariable("phoneId") int id,String view,Model model){
        logger.info("********** 进入 getPhoneById 方法,id={}********** ",new Object[]{id});
        model.addAttribute("phoneInfo",iPhoneService.getById(id));
        return view;
    }


}
