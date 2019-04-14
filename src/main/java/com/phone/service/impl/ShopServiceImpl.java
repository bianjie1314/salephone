package com.phone.service.impl;

import com.phone.common.*;
import com.phone.dao.IShopDao;
import com.phone.pojo.ShopPojo;
import com.phone.pojo.UserPojo;
import com.phone.service.IShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

@Service
public class ShopServiceImpl implements IShopService {

    @Autowired
    IShopDao shopDao;

    @Override
    public CommonResult addBean(ShopPojo shopPojo,UserPojo userInfo) {
        if (userInfo == null || userInfo.getId() < 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        shopPojo.setUserId(userInfo.getId());
        shopPojo.setCreateTime(new Date());
        int result = shopDao.addBean(shopPojo);
        if (result <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        return CommonResult.SUCCESS(MessageConstant.ADD_SUCCESS,result);
    }

    @Override
    public CommonResult deleteById(int id) {
        if (id <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        shopDao.deleteById(id);
        return CommonResult.SUCCESS(MessageConstant.DELETE_SUCCESS,null);
    }


    @Override
    public CommonResult deleteByChoiceId(String idStr) {
        if (StringUtils.isEmpty(idStr)){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        String[] index = (idStr.substring(idStr.indexOf(',') + 1)).split(",");
        shopDao.deleteByChoiceId( Arrays.asList(index));
        return CommonResult.SUCCESS(MessageConstant.DELETE_SUCCESS,null);
    }

    @Override
    public CommonResult updateBean(ShopPojo shopPojo) {
        if (shopPojo == null || shopPojo.getId() <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        shopDao.updateBean(shopPojo);
        return CommonResult.SUCCESS(MessageConstant.UPDATE_SUCCESS,null);
    }

    @Override
    public ShopPojo getById(int id) {
        return shopDao.getById(id);
    }

    @Override
    public CommonResult getShopName(UserPojo userInfo) {
        if (userInfo == null || userInfo.getRoleId() <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        int userId = 0;
        if (userInfo.getRoleId() != Constant.USER_ADMIN){//非管理员
            userId = userInfo.getId();
        }
        return CommonResult.SUCCESS(shopDao.getShopInfo(userId));
    }


    @Override
    public List<ShopPojo> selectShopList(SearchVo searchVo, PageBean page,UserPojo userInfo) {
        Map<String,Object> paramMap = new HashMap<>();
        if (userInfo != null && userInfo.getRoleId() != Constant.USER_ADMIN){//非管理员
            paramMap.put("userId",userInfo.getId());
        }
        if (searchVo != null){
            if (!StringUtils.isEmpty(searchVo.getText())){
                paramMap.put("name",searchVo.getText());
            }
            if (!StringUtils.isEmpty(searchVo.getStartTime())){
                paramMap.put("startTime",searchVo.getStartTime());
            }
            if (!StringUtils.isEmpty(searchVo.getEndTime())){
                paramMap.put("endTime",searchVo.getEndTime());
            }
            if (!StringUtils.isEmpty(searchVo.getCategory())){
                paramMap.put("status",searchVo.getCategory());
            }
        }
        if (page != null && page.getStart() >= 0){
            paramMap.put("start",page.getStart());
            paramMap.put("offset",page.getOffset());
        }
        return shopDao.selectShopList(paramMap);
    }


    /**
     * 更新菜单状态
     * @param id
     * @param status
     * @return
     */
    @Override
    public CommonResult updateStatus(int id, int status) {
        if (id <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        ShopPojo shopPojo = new ShopPojo();
        //此处处理，反之前端不合法参数
        if (status == Constant.SHOP_STATUS_NORMAL){
            shopPojo.setStatus(Constant.SHOP_STATUS_NORMAL);
        }else if(status == Constant.SHOP_STATUS_ENABEL){
            shopPojo.setStatus(Constant.SHOP_STATUS_ENABEL);
        }
        shopPojo.setId(id);
        shopPojo.setUpdateTime(new Date());
        shopDao.updateBean(shopPojo);

        return CommonResult.SUCCESS(MessageConstant.UPDATE_SUCCESS,null);
    }

}
