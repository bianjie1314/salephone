package com.phone.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单流程操作记录
 */
public class OrderProcessLogPojo implements Serializable {

    private int id;
    //订单编号id
    private int order_id;
    //操作人
    private int user_id;
    //类型：1:未支付，2:待发货,3:待收获,4:已签收,5:已评价,6:取消订单,7:订单完成,8:退货申请，9:退货同意,10:退货拒绝,11:退货完成
    private int type;
    //备注
    private String note;
    //创建时间
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


}
