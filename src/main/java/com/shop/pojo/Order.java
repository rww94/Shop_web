package com.shop.pojo;

import com.shop.service.OrderService;

import java.util.Date;
import java.util.List;

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
    * 厂商备注信息
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
    /*
    * 订单总价
    * */
    private float totalPrice;
    /*
     * 订单内商品总数量
     * */
    private Integer productNumber;
    /*
     * 订单元素项
     * */
    private List<OrderItem> orderItemList;
    /*
    * 订单所属用户信息
    * */
    private User user;

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(Integer productNumber) {
        this.productNumber = productNumber;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    /*
    * 订单状态中英文转化
    * */
    public String statusChange(){
        String desc = null;
        switch (status){
            case OrderService.waitPay:
                desc="待付款";
                break;
            case OrderService.waitConfirm:
                desc="待确认";
                break;
            case OrderService.waitReceive:
                desc="已发货";
                break;
            case OrderService.finished:
                desc="已完成";
                break;
            case OrderService.refused:
                desc="已拒绝";
                break;
            case OrderService.canceled:
                desc="已取消";
                break;
            case OrderService.deleted:
                desc="已刪除";
                break;
            default:
                desc="异常";
        }
        return desc;
    }
}
