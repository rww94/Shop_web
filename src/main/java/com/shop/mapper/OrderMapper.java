package com.shop.mapper;

import com.shop.pojo.Order;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface OrderMapper {
    void insertOrder(Order order);
    Order getById(Integer id);
    void updateOrder(Order order);
    List<Order> getListByUid(Integer uid);
    List<Order> getList();
    void updateStatus(@Param("id")Integer orderId, @Param("status")String orderStatus,@Param("date") Date date);
}
