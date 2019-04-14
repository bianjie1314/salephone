package com.phone.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 手机信息
 */
public class PhonePojo implements Serializable {

    private int id;
    //名称
    private String name;
    //单价
    private double unitPrice;
    //销售价
    private double salePrice;
    //型号
    private String type;
    //简介
    private String description;
    //图片信息
    private List<PicturePojo> pictures;
    //剩余库存数量
    private int storeNum;
    //已经售出储量
    private int offerNum;
    //开始销售时间
    private Date startTime;
    //结束销售时间
    private Date endTime;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;
    //详细页面
    private String htmlText;
    //所属店铺
    private int shopId;
    //图片编号
    private String pictureIds;
    //所属店铺
    private ShopPojo shop;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<PicturePojo> getPictures() {
        return pictures;
    }

    public void setPictures(List<PicturePojo> pictures) {
        this.pictures = pictures;
    }

    public int getStoreNum() {
        return storeNum;
    }

    public void setStoreNum(int storeNum) {
        this.storeNum = storeNum;
    }

    public int getOfferNum() {
        return offerNum;
    }

    public void setOfferNum(int offerNum) {
        this.offerNum = offerNum;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getHtmlText() {
        return htmlText;
    }

    public void setHtmlText(String htmlText) {
        this.htmlText = htmlText;
    }

    public int getShopId() {
        return shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getPictureIds() {
        return pictureIds;
    }

    public void setPictureIds(String pictureIds) {
        this.pictureIds = pictureIds;
    }

    public ShopPojo getShop() {
        return shop;
    }

    public void setShop(ShopPojo shop) {
        this.shop = shop;
    }
}
