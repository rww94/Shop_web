package com.shop.service;

import com.shop.pojo.Order;
import com.shop.pojo.OrderItem;

import java.util.List;

public interface OrderService {
    /*
    *  添加订单
    * */
    void addOrder(Order order);
    /*
    * 新增订单,同时修改订单项数据,返回订单总价格
    * */
    float addOrder(Order order, List<OrderItem> orderItems);
    /*
    * 通过订单编号得到订单
    * */
    Order getById(Integer id);
    /*
    * 更新订单信息
    * */
    void updateOrder(Order order);
    /*
    * 通过用户id得到订单列表
    * */
    List<Order> getListByUid(Integer uid);
    /*
    * 查询所有订单列表
    * */
    List<Order> getList();
    /*
    * 为订单填充用户信息
    * */
    void setUser(Order order);
    /*
    * 为一组订单填充用户
    * */
    void setUser(List<Order> orders);
    /*
    * 厂商更改订单状态
    * */
    void updateStatus(Integer orderId, String orderStatus);
    /*
    * 订单状态
    * */
    public static final String waitPay = "waitPay";          //等待支付
    public static final String waitConfirm = "waitConfirm";      //等待确认
    public static final String finish = "finish";             //已确认
    public static final String refuse = "refuse";             //已拒绝
    public static final String delete = "delete";              //已删除
}
