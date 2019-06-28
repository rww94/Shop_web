package com.shop.service.Impl;

import com.shop.mapper.OrderMapper;
import com.shop.pojo.Order;
import com.shop.pojo.OrderItem;
import com.shop.pojo.User;
import com.shop.service.OrderItemService;
import com.shop.service.OrderService;
import com.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceimpl implements OrderService {
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    UserService userService;

    public void addOrder(Order order) {
        orderMapper.insertOrder(order);
    }
    @Override
    public float addOrder(Order order, List<OrderItem> orderItems) {
        // 订单总价格
        float totalPrice = 0;
        // 添加订单
        addOrder(order);

        for (OrderItem orderItem : orderItems){
            // 为订单项设置orderId属性
            orderItem.setOid(order.getId());
            // 更新订单项
            orderItemService.updateById(orderItem);
            // 计算总价格
            totalPrice += orderItem.getProduct().getNow_price()*orderItem.getNumber();
        }
        return totalPrice;
    }

    @Override
    public Order getById(Integer id) {
        return orderMapper.getById(id);
    }

    @Override
    public void updateOrder(Order order) {
        orderMapper.updateOrder(order);
    }

    @Override
    public List<Order> getListByUid(Integer uid) {
        return orderMapper.getListByUid(uid);
    }

    @Override
    public List<Order> getList() {
        List<Order> orders = orderMapper.getList();
        // 为订单设置会员属性
        setUser(orders);
        return orders;
    }

    @Override
    public void setUser(Order order) {
        int uid = order.getUid();
        User user = userService.getById(uid);
        order.setUser(user);
    }

    @Override
    public void setUser(List<Order> orders) {
        for(Order order:orders){
            setUser(order);
        }
    }

    @Override
    public void updateStatus(Integer orderId, String orderStatus, Date date) {
        orderMapper.updateStatus(orderId,orderStatus,date);
    }
}
