package com.shop.service.Impl;

import com.shop.mapper.OrderItemMapper;
import com.shop.mapper.ProductMapper;
import com.shop.pojo.OrderItem;
import com.shop.pojo.Product;
import com.shop.service.OrderItemService;
import com.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {
    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    ProductService productService;
    @Override
    public void add(OrderItem orderItem) {
        orderItemMapper.add(orderItem);
    }

    @Override
    public OrderItem getById(Integer id) {
        OrderItem orderItem = orderItemMapper.getById(id);
        setProduct(orderItem);
        return orderItem;
    }

    public void setProduct(OrderItem orderItem) {
        Product product = productService.getById(orderItem.getPid());
        orderItem.setProduct(product);
    }

}
