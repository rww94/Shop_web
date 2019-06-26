package com.shop.mapper;

import com.shop.pojo.OrderItem;

import java.util.List;

public interface OrderItemMapper {
    void add(OrderItem orderItem);
    OrderItem getById(Integer id);
    void  updateById(OrderItem orderItem);
    List<OrderItem> getListByOid(Integer oid);
}
