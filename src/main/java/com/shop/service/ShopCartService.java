package com.shop.service;

import com.shop.pojo.ShopCart;

import java.util.List;

public interface ShopCartService {
    /*
    * 通过用户id得到购物车信息
    * */
    List<ShopCart> getListByUid(Integer uid);
    /*
    * 为一个购物车项填充商品信息
    * */
    void setProduct(ShopCart shopCart);
    /*
    * 为一组购物车项填充商品信息
    * */
    void setProduct(List<ShopCart> shopCarts);
    /*
    * 更新购物车项
    * */
    void update(ShopCart shopCart);
    /*
    * 添加购物车项
    * */
    void add(ShopCart shopCart);
    /*
    * 通过购物项id得到
    * */
    ShopCart getById(Integer id);
    /*
    * 通过id删除购物车信息项
    * */
    void deleteById(Integer id);
}
