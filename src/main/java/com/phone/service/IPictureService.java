package com.phone.service;

import com.phone.common.PageBean;
import com.phone.pojo.OrdersPojo;
import com.phone.pojo.PicturePojo;
import com.phone.pojo.UserPojo;

import java.util.List;

public interface IPictureService {

    /**
     * 添加信息
     * @param picture
     * @return
     */
    public int addBean(PicturePojo picture);

    /**
     * 通过id删除
     * @param id
     */
    public void deleteById(int id);

    /**
     * 更新
     * @param picture
     */
    public void updateBean(PicturePojo picture);

    /**
     * 查询满足条件的信息
     * @param picture
     * @param page
     * @return
     */
    public List<PicturePojo> selectPictureList(PicturePojo picture, PageBean page);

    /**
     * 通过id获取
     * @param id
     * @return
     */
    public PicturePojo getById(int id);


}
