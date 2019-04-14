package com.phone.controller;


import com.phone.common.CommonResult;
import com.phone.common.MessageConstant;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.PhonePojo;
import com.phone.pojo.UserPojo;
import com.phone.service.IPhoneService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 手机商品接口
 */
@Controller
@RequestMapping(value="/phone")
public class PhoneController {

    private static Logger logger = LoggerFactory.getLogger(PhoneController.class);

    @Autowired
    private IPhoneService iPhoneService;


    //获取列表
    @RequestMapping(value="/getPhoneList",method=RequestMethod.GET )
   // @ResponseBody
    public String getPhoneList(SearchVo searchVo, PageBean page, Model model, HttpServletRequest request){
        logger.info("********** 进入 getPhoneList 方法,searchVo={},page={}********** ",new Object[]{searchVo,page});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");

        model.addAttribute("phoneList", iPhoneService.selectPhoneList(searchVo,page,userInfo));
        model.addAttribute("searchVo", searchVo);
        return "admin/phone/phone-list";
    }

    //根据id获取
    @RequestMapping(value="/getPhoneById/{phoneId}",method=RequestMethod.GET )
    public String getPhoneById(@PathVariable("phoneId") int id,String view,Model model){
        logger.info("********** 进入 getPhoneById 方法,id={}********** ",new Object[]{id});
        model.addAttribute("phoneInfo",iPhoneService.getById(id));
        return view;
    }

    //删除
    @RequestMapping(value="/delete/{phoneId}",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult deletePhone(@PathVariable("phoneId")  int phoneId){
        logger.info("********** 进入 deletePhone 方法,phoneId={}********** ",new Object[]{phoneId});
        return iPhoneService.deleteById(phoneId);
    }


    //进行多选删除
    @RequestMapping(value = "/deletePhoneByChoice", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult deletePhoneByChoice(String choiceId) {
        logger.info("************  进入  deletePhoneByChoice 方法,参数choiceId={} ************ ",new Object[]{ choiceId});
        return iPhoneService.deleteByChoiceId(choiceId);
    }

    //更新
    @RequestMapping(value="/update")
    @ResponseBody
    public CommonResult updatePhone(@RequestBody PhonePojo phone, HttpServletRequest request){
        logger.info("********** 进入 updatePhone 方法,phone={}********** ",new Object[]{phone});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        Object attribute = request.getSession().getAttribute("pic" + userInfo.getId());
        if (attribute != null){
            phone.setPictureIds((String)attribute);
        }
        request.getSession().removeAttribute("pic" + userInfo.getId());
        return  iPhoneService.updateBean(phone);
    }

    //新增
    @RequestMapping(value="/add")
    @ResponseBody
    public CommonResult addPhone(@RequestBody PhonePojo phone, HttpServletRequest request){
        logger.info("********** 进入 addPhone 方法,phone={}********** ",new Object[]{phone});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        Object attribute = request.getSession().getAttribute("pic" + userInfo.getId());
        if (attribute != null){
            phone.setPictureIds((String)attribute);
        }
        request.getSession().removeAttribute("pic" + userInfo.getId());
        return iPhoneService.addBean(phone,userInfo);
    }

}
