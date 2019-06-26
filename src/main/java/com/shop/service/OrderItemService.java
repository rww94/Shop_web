package com.shop.service;

import com.shop.pojo.Order;
import com.shop.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {
    /*
    * 添加订单元素项
    * */
    void add(OrderItem orderItem);
    /*
    * 通过id得到订单元素项
    * */
    OrderItem getById(Integer id);
    /*
    * 通过订单项得到订单元素列表
    * */
    List<OrderItem> getListByOid(Integer oid);
    /*
    * 为订单元素填充商品信息
    * */
    void setProduct(OrderItem orderItem);
    /*
    * 为一组订单项填充商品
    * */
    void setProduct(List<OrderItem> orderItems);
    /*
    * 更新订单元素
    * */
    void updateById(OrderItem orderItem);
    /*
    * 为订单填充必要属性，如总价格，订单项总数，订单项等
    * */
    void fill(Order order);
    /*
     * 为一组订单填充必要属性
     * */
    void fillOrder(List<Order> orders);
}
