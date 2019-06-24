package com.shop.pojo;

import java.util.Date;

public class Order {
    /*
    * 订单id
    * */
    private Integer id;
    /*
    * 订单编号
    * */
    private String orderCode;
    /*
    * 下单用户id
    * */
    private Integer uid;
    /*
    * 收货人姓名
    * */
    private String receiver;
    /*
    * 收货人地址
    * */
    private String address;
    /*
    * 联系电话
    * */
    private String mobile;
    /*
    * 用户留言
    * */
    private String user_message;
    /*
    * 厂商id
    * */
    private Integer fid;
    /*
    * 厂商信息
    * */
    private String firm_message;
    /*
    * 创建日期
    * */
    private Date create_date;
    /*
    * 支付日期
    * */
    private Date pay_date;
    /*
    * 确认日期
    * */
    private Date confirm_date;
    /*
    * 订单状态
    * */
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getUser_message() {
        return user_message;
    }

    public void setUser_message(String user_message) {
        this.user_message = user_message;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFirm_message() {
        return firm_message;
    }

    public void setFirm_message(String firm_message) {
        this.firm_message = firm_message;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getPay_date() {
        return pay_date;
    }

    public void setPay_date(Date pay_date) {
        this.pay_date = pay_date;
    }

    public Date getConfirm_date() {
        return confirm_date;
    }

    public void setConfirm_date(Date confirm_date) {
        this.confirm_date = confirm_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
