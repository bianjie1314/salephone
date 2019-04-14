package com.phone.controller.client;


import com.phone.common.CommonResult;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.EvelatePojo;
import com.phone.pojo.UserPojo;
import com.phone.service.IEvelateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 评价接口
 */
@Controller
@RequestMapping(value="/client/evelate")
public class ClientEvelateController {

    private static Logger logger = LoggerFactory.getLogger(ClientEvelateController.class);

    @Autowired
    private IEvelateService iEvelateService;

    //获取手机对应的评论列表
    @RequestMapping(value="/getEvelatePage",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult getEvelatePage(SearchVo searchVo, PageBean pageBean, Model model, HttpServletRequest request){
        logger.info("********** 进入 client - getEvelatePage 方法,searchVo={},pageBean={} ********** ",new Object[]{searchVo,pageBean});
        UserPojo user = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        CommonResult commonResult = iEvelateService.getEvelatePage(searchVo, pageBean,user);
        model.addAttribute("searchVo",searchVo);
        model.addAttribute("pageBean",pageBean);
        return commonResult;
    }


    //获取用户对应订单评论列表
    @RequestMapping(value="/getUserEvelatePage",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult getUserEvelatePage(SearchVo searchVo,PageBean pageBean, Model model, HttpServletRequest request){
        logger.info("********** 进入 client - getUserEvelatePage 方法,searchVo={},pageBean={} ********** ",new Object[]{searchVo,pageBean});
        UserPojo user = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        CommonResult commonResult = iEvelateService.getEvelatePage(searchVo, pageBean,user);
        model.addAttribute("searchVo",searchVo);
        model.addAttribute("pageBean",pageBean);
        return commonResult;
    }

    //新增
    @RequestMapping(value="/addEvelate" )
    @ResponseBody
    public CommonResult addEvelate(@RequestBody EvelatePojo evelate, HttpServletRequest request){
        logger.info("********** 进入 addEvelate 方法,evelate={}********** ",new Object[]{evelate});
        UserPojo user = (UserPojo)request.getSession().getAttribute("clientUserInfo");
        return iEvelateService.addBean(evelate,user);
    }
}
