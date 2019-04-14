package com.phone.pojo;

import java.io.Serializable;
import java.util.Date;


/**
 * 订单记录
 */
public class OrdersPojo implements Serializable {


    private int id;
    //用户编号
    private int userId;
    //订单编号
    private String orderCode;
    //手机编号
    private int phoneId;
    //购买数量
    private int num;
    //花费金额
    private double pay;
    //状态，1:未支付，2:已支付，3:待发货,4:待收获,5:已签收,6:已评价,7:取消订单,8:货物退回
    private int status;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

    //对应用户信息
    private UserPojo user;

    //对应的手机信息
    private PhonePojo phone;

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

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public int getPhoneId() {
        return phoneId;
    }

    public void setPhoneId(int phoneId) {
        this.phoneId = phoneId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public double getPay() {
        return pay;
    }

    public void setPay(double pay) {
        this.pay = pay;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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

    public UserPojo getUser() {
        return user;
    }

    public void setUser(UserPojo user) {
        this.user = user;
    }

    public PhonePojo getPhone() {
        return phone;
    }

    public void setPhone(PhonePojo phone) {
        this.phone = phone;
    }
}
