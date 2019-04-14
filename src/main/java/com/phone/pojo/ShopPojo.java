package com.phone.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 商店信息
 */
public class ShopPojo implements Serializable {


    private int id;
    //店主
    private int userId;
    //名称
    private String name;
    //简介
    private String description;
    //照片id
    private String pictureIds;
    //照片
    private List<PicturePojo> pictures;
    //店铺位置
    private String location;
    //状态，1正常，2下架
    private int status;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

    //所属用户
    private UserPojo user;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPictureIds() {
        return pictureIds;
    }

    public void setPictureIds(String pictureIds) {
        this.pictureIds = pictureIds;
    }

    public List<PicturePojo> getPictures() {
        return pictures;
    }

    public void setPictures(List<PicturePojo> pictures) {
        this.pictures = pictures;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public UserPojo getUser() {
        return user;
    }

    public void setUser(UserPojo user) {
        this.user = user;
    }
}
