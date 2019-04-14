package com.phone.service.impl;

import com.phone.common.*;
import com.phone.dao.IPhoneDao;
import com.phone.dao.IPictureDao;
import com.phone.dao.IShopDao;
import com.phone.pojo.PhonePojo;
import com.phone.pojo.PicturePojo;
import com.phone.pojo.UserPojo;
import com.phone.pojo.vo.PageViewVo;
import com.phone.service.IPhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class PhoneServiceImpl implements IPhoneService {

    @Autowired
    IPhoneDao iPhoneDao;
    @Autowired
    IShopDao iShopDao;
    @Autowired
    IPictureDao iPictureDao;

    @Override
    public CommonResult addBean(PhonePojo phonePojo, UserPojo userPojo) {
        if (phonePojo == null || userPojo == null){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        phonePojo.setCreateTime(new Date());

        int result = iPhoneDao.addBean(phonePojo);
        if (result <= 0){
            return CommonResult.ERROR(MessageConstant.RUN_ERROR);
        }
        return CommonResult.SUCCESS(MessageConstant.ADD_SUCCESS,result);
    }

    @Override
    public CommonResult deleteById(int id) {
        if (id <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        iPhoneDao.deleteById(id);
        return CommonResult.SUCCESS(MessageConstant.DELETE_SUCCESS,null);
    }

    @Override
    public CommonResult deleteByChoiceId(String idStr) {
        if (StringUtils.isEmpty(idStr)){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        String[] index = (idStr.substring(idStr.indexOf(',') + 1)).split(",");
        iPhoneDao.deleteByChoiceId( Arrays.asList(index));
        return CommonResult.SUCCESS(MessageConstant.DELETE_SUCCESS,null);
    }

    @Override
    public CommonResult updateBean(PhonePojo phonePojo) {
        if (phonePojo == null || phonePojo.getId() <= 0){
            return CommonResult.ERROR(MessageConstant.PARAM_ERROR);
        }
        phonePojo.setUpdateTime(new Date());
        iPhoneDao.updateBean(phonePojo);
        return CommonResult.SUCCESS(MessageConstant.UPDATE_SUCCESS,null);
    }


    @Override
    public List<PhonePojo> selectPhoneList(SearchVo searchVo, PageBean page,UserPojo userInfo) {
        return iPhoneDao.selectPhoneList(getQueryMap(searchVo,page,userInfo));
    }

    //查询条件
    private Map<String,Object> getQueryMap(SearchVo searchVo, PageBean page,UserPojo userInfo){
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
            if (!StringUtils.isEmpty(searchVo.getCategory())){
                paramMap.put("type",searchVo.getCategory());
            }
            if (searchVo.getIndex() >0 ){
                paramMap.put("shopId",searchVo.getIndex());
            }
            if (!StringUtils.isEmpty(searchVo.getEndTime())){
                paramMap.put("endTime",searchVo.getEndTime());
            }
        }
        if (page != null && page.getStart() >= 0){
            paramMap.put("start",page.getStart());
            paramMap.put("offset",page.getOffset());
        }
        return paramMap;
    }

    @Override
    public CommonResult selectPhonePage(SearchVo searchVo, PageBean page,UserPojo userInfo) {
        Map<String, Object> queryMap = getQueryMap(searchVo, page,userInfo);
        //数量为0
        int count = iPhoneDao.countPhoneList(queryMap);
        if (count == 0){
            return CommonResult.SUCCESS(0,null);
        }
        page.setTotal(count);
        List<PhonePojo> phonePojos = iPhoneDao.selectPhoneList(queryMap);
        if (phonePojos != null && phonePojos.size() > 0){
            for (PhonePojo p: phonePojos ) {
                if (!StringUtils.isEmpty(p.getPictureIds())){
                    List<PicturePojo> byIds = iPictureDao.getByIds(Arrays.asList(p.getPictureIds().split(",")));
                    p.setPictures(byIds);
                }
            }
        }
        return CommonResult.SUCCESS(count,phonePojos);
    }

    @Override
    public PhonePojo getById(int id) {
        PhonePojo phonePojo = iPhoneDao.getById(id);
        if (phonePojo != null) {
            if (!StringUtils.isEmpty(phonePojo.getPictureIds())) {
                List<PicturePojo> byIds = iPictureDao.getByIds(Arrays.asList(phonePojo.getPictureIds().split(",")));
                phonePojo.setPictures(byIds);
            }
        }
        return phonePojo;
    }

    @Override
    public CommonResult selectPhoneType() {
        return CommonResult.SUCCESS(iPhoneDao.selectPhoneType());
    }
}
