package com.shop.service.Impl;

import com.shop.mapper.OrderItemMapper;
import com.shop.mapper.ProductMapper;
import com.shop.pojo.Order;
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

    @Override
    public List<OrderItem> getListByOid(Integer oid) {
        return orderItemMapper.getListByOid(oid);
    }

    public void setProduct(OrderItem orderItem) {
        Product product = productService.getById(orderItem.getPid());
        orderItem.setProduct(product);
    }

    @Override
    public void setProduct(List<OrderItem> orderItems) {
        for (OrderItem orderItem: orderItems) {
            setProduct(orderItem);
        }
    }

    @Override
    public void updateById(OrderItem orderItem) {
        orderItemMapper.updateById(orderItem);
    }

    @Override
    public void fill(Order order) {
        if (null != order) {
            // 根据订单id 查询该订单里所有的订单项
            List<OrderItem> orderItems = orderItemMapper.getListByOid(order.getId());
            if (null != orderItems) {
                // 为订单项设置商品属性
                setProduct(orderItems);
                // 订单总价格
                float totalPrice = 0;
                // 订单里的订单项数量
                int totalNumber = 0;
                for (OrderItem orderItem : orderItems) {
                    totalPrice += orderItem.getNumber() * (orderItem.getPrice());
                    totalNumber += orderItem.getNumber();
                }
                // 为订单设置总价格
                order.setTotalPrice(totalPrice);
                // 为订单设置订单项总数量
                order.setProductNumber(totalNumber);
                // 为订单填充订单项
                order.setOrderItemList(orderItems);
            }
        }
    }
    @Override
    public void fillOrder(List<Order> orders) {
        if (null != orders){
            for (Order order : orders){
                fill(order);
            }
        }
    }
}
