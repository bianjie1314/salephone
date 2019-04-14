package com.phone.service.impl;

import com.phone.common.PageBean;
import com.phone.dao.IOrdersDao;
import com.phone.dao.IPictureDao;
import com.phone.pojo.OrdersPojo;
import com.phone.pojo.PhonePojo;
import com.phone.pojo.PicturePojo;
import com.phone.pojo.UserPojo;
import com.phone.service.IOrdersService;
import com.phone.service.IPhoneService;
import com.phone.service.IPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PictureServiceImpl implements IPictureService {

    @Autowired
    IPictureDao iPictureDao;

    @Override
    public int addBean(PicturePojo picture) {
        return iPictureDao.addBean(picture);
    }

    @Override
    public void deleteById(int id) {
        iPictureDao.deleteById(id);
    }

    @Override
    public void updateBean(PicturePojo picture) {
        iPictureDao.updateBean(picture);
    }


    @Override
    public List<PicturePojo> selectPictureList(PicturePojo picture, PageBean page) {
        Map<String,Object> paramMap = new HashMap<>();
        if (picture != null){
            if (picture.getType() > 0){
                paramMap.put("type",picture.getType());
            }

            if (picture.getCreateTime() != null){
                paramMap.put("createTime",picture.getCreateTime());
            }
        }
        if (page != null && page.getStart() >= 0){
            paramMap.put("start",page.getStart());
            paramMap.put("offset",page.getOffset());
        }
        return iPictureDao.selectPictureList(paramMap);
    }

    @Override
    public PicturePojo getById(int id) {
        return iPictureDao.getById(id);
    }
}
