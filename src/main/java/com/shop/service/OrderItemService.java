package com.shop.service;

import com.shop.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {
    /*
    * 添加订单元素项
    * */
    void add(OrderItem orderItem);
    /**/
    OrderItem getById(Integer id);
    /*
    * 为订单元素填充商品信息
    * */
    void setProduct(OrderItem orderItem);
}
