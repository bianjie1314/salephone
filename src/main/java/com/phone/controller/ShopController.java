package com.phone.controller;


import com.phone.common.CommonResult;
import com.phone.common.MessageConstant;
import com.phone.common.PageBean;
import com.phone.common.SearchVo;
import com.phone.pojo.PicturePojo;
import com.phone.pojo.ShopPojo;
import com.phone.pojo.UserPojo;
import com.phone.service.IPictureService;
import com.phone.service.IShopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 商店接口
 */
@Controller
@RequestMapping(value="/shop")
public class ShopController {

    private static Logger logger = LoggerFactory.getLogger(ShopController.class);

    @Autowired
    private IShopService iShopService;


    //获取列表
    @RequestMapping(value="/getShopList",method=RequestMethod.GET )
    // @ResponseBody
    public String getShopList(SearchVo searchVo, PageBean page, Model model, HttpServletRequest request){
        logger.info("********** 进入 getShopList 方法,searchVo={},page={}********** ",new Object[]{searchVo,page});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        model.addAttribute("shopList", iShopService.selectShopList(searchVo,page,userInfo));
        model.addAttribute("searchVo", searchVo);
        return "admin/shop/shop-list";
    }

    //进行更新状态
    @RequestMapping(value = "/updateStatus/{id}/{status}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult updateStatus(@PathVariable int id, @PathVariable int status) {
        logger.info("************  进入  updateStatus 方法,id={},status={} ************ ",new Object[]{id, status});
        return iShopService.updateStatus(id,status);
    }

    //删除
    @RequestMapping(value="/delete/{shopId}",method=RequestMethod.GET )
    @ResponseBody
    public CommonResult deleteShop(@PathVariable("shopId") int shopId){
        logger.info("********** 进入 deleteShop 方法,shopId={}********** ",new Object[]{shopId});
        return iShopService.deleteById(shopId);
    }

    //进行多选删除
    @RequestMapping(value = "/deleteShopByChoice", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult deleteShopByChoice(String choiceId) {
        logger.info("************  进入  deleteShopByChoice 方法,参数choiceId={} ************ ",new Object[]{ choiceId});
        return iShopService.deleteByChoiceId(choiceId);
    }

    //根据id获取
    @RequestMapping(value="/getShopById/{shopId}",method=RequestMethod.GET )
    public String getShopById(@PathVariable("shopId") int id,String view,Model model){
        logger.info("********** 进入 getShopById 方法,id={}********** ",new Object[]{id});
        model.addAttribute("shopInfo",iShopService.getById(id));
        return view;
    }

    //更新
    @RequestMapping(value="/update" )
    @ResponseBody
    public CommonResult updateShop(@RequestBody ShopPojo shop){
        logger.info("********** 进入 updateShop 方法,shop={}********** ",new Object[]{shop});
        return iShopService.updateBean(shop);
    }

    //新增
    @RequestMapping(value="/add")
    @ResponseBody
    public CommonResult addShop(@RequestBody ShopPojo shop, HttpServletRequest request){
        logger.info("********** 进入 addShop 方法,shop={}********** ",new Object[]{shop});
        UserPojo userInfo = (UserPojo)request.getSession().getAttribute("userInfo");
        return iShopService.addBean(shop,userInfo);
    }



}
