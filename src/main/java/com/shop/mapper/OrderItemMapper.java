package com.shop.mapper;

import com.shop.pojo.OrderItem;

public interface OrderItemMapper {
    void add(OrderItem orderItem);
    OrderItem getById(Integer id);
}
