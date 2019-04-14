package com.phone.controller.common;

import com.phone.common.CommonResult;
import com.phone.common.Constant;
import com.phone.common.MessageConstant;
import com.phone.pojo.UserPojo;
import com.phone.service.IUserService;
import com.phone.utils.VerifyCodeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
public class RegisterController {
	
	private static Logger logger = LoggerFactory.getLogger(RegisterController.class);

	@Autowired
	private IUserService iUserService;

	//注册
	@RequestMapping(value="/reg",method=RequestMethod.GET )
	@ResponseBody
	public CommonResult reg(String mobile, String password,String username,int type,HttpServletRequest request){
		logger.info("********** 进入 reg 方法,mobile={},password={},username={},type={} ********** ",new Object[]{mobile,password,username,type});
		CommonResult commonResult = iUserService.register(mobile,password,username,type);
		if (commonResult.isResult()){ //登陆成功
			//缓存用户信息到session中
			if (type ==Constant.USER_ADMIN || type ==Constant.USER_SHOP){//管理员//商户
				request.getSession().setAttribute("serInfo", commonResult.getData());
			}else {//普通用户u
				request.getSession().setAttribute("clientUserInfo", commonResult.getData());
			}
		}
		return commonResult;

	}


}
