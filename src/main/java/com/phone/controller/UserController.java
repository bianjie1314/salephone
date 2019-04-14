package com.phone.controller;


import com.phone.common.CommonResult;
import com.phone.common.MessageConstant;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.PhonePojo;
import com.phone.pojo.UserPojo;
import com.phone.service.IPhoneService;
import com.phone.service.IUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户信息接口
 */
@Controller
@RequestMapping(value="/user")
public class UserController {

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private IUserService iUserService;

    //获取列表
    @RequestMapping(value="/getUserList",method=RequestMethod.GET )
    // @ResponseBody
    public String getUserList(SearchVo searchVo, PageBean page, Model model){
        logger.info("********** 进入 getUserList 方法,searchVo={},page={}********** ",new Object[]{searchVo,page});
        model.addAttribute("userList", iUserService.selectUserList(searchVo,page));
        model.addAttribute("searchVo", searchVo);
        return "admin/user/user-list";
    }

    //根据id获取
    @RequestMapping(value="/getUserById/{userId}",method=RequestMethod.GET )
    public String getUserById(@PathVariable("userId") int id,String view,Model model){
        logger.info("********** 进入 getUserById 方法,id={}********** ",new Object[]{id});
        model.addAttribute("userInfo",iUserService.getById(id));
        return view;
    }

    //删除
    @RequestMapping(value="/delete/{userId}",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult deleteUser(@PathVariable("userId")  int userId){
        logger.info("********** 进入 deletePhone 方法,userId={}********** ",new Object[]{userId});
        return iUserService.deleteById(userId);
    }


    //进行多选删除
    @RequestMapping(value = "/deleteUserByChoice", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult deleteUserByChoice(String choiceId) {
        logger.info("************  进入  deleteUserByChoice 方法,参数choiceId={} ************ ",new Object[]{ choiceId});
        return iUserService.deleteByChoiceId(choiceId);
    }

    //更新自己信息
    @RequestMapping(value="/update")
    @ResponseBody
    public CommonResult updateUser(@RequestBody UserPojo user, HttpServletRequest request){
        logger.info("********** 进入 updateUser 方法,user={}********** ",new Object[]{user});
        // 更新缓存
        CommonResult commonResult = iUserService.updateBean(user);
        if (commonResult.isResult()){
            request.getSession().setAttribute("userInfo",commonResult.getData());
        }
        return commonResult;
    }

    //更新别人信息
    @RequestMapping(value="/update/other")
    @ResponseBody
    public CommonResult updateOtherUser(@RequestBody UserPojo user, HttpServletRequest request){
        logger.info("********** 进入 updateUser 方法,user={}********** ",new Object[]{user});
        // 更新缓存
        return iUserService.updateBean(user);
    }

    //新增
    @RequestMapping(value="/add")
    @ResponseBody
    public CommonResult addUser(@RequestBody UserPojo user){
        logger.info("********** 进入 addUser 方法,user={}********** ",new Object[]{user});
        return iUserService.addBean(user);
    }


}
