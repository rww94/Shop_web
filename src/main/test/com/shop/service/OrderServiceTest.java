package com.shop.service;

import com.shop.pojo.Order;
import org.junit.Test;

import java.util.Date;

public class OrderServiceTest extends BaseServiceTest{

    @Test
    public void addOrder() {
    }

    @Test
    public void addOrder1() {
    }

    @Test
    public Order getById() {
        Integer id = 1;
        Order order = orderService.getById(id);
        System.out.println(order);
        return order;
    }

    @Test
    public void updateOrder() {
        Order order = getById();
        order.setStatus(OrderService.waitConfirm);
        order.setPay_date(new Date());
        orderService.updateOrder(order);
        System.out.println(order);

    }
}