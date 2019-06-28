package com.shop.mapper;

import com.shop.pojo.ShopCart;

import java.util.List;

public interface ShopCartMapper {
    List<ShopCart> getListByUid(Integer uid);
    void add(ShopCart shopCart);
    void update(ShopCart shopCart);
    ShopCart getById(Integer id);
    void deleteById(Integer id);
}
