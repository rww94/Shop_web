package com.shop.service.Impl;

import com.shop.mapper.ShopCartMapper;
import com.shop.pojo.Product;
import com.shop.pojo.ShopCart;
import com.shop.service.ProductService;
import com.shop.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopCartServiceImpl implements ShopCartService {
    @Autowired
    ShopCartMapper shopCartMapper;
    @Autowired
    ProductService productService;

    @Override
    public List<ShopCart> getListByUid(Integer uid) {
        List<ShopCart> shopCarts = shopCartMapper.getListByUid(uid);
        if (null != shopCarts){
            setProduct(shopCarts);
        }
        return shopCarts;
    }

    @Override
    public void setProduct(ShopCart shopCart) {
        Product product = productService.getById(shopCart.getPid());
        if(null!=product) {
            shopCart.setProduct(product);
        }
    }

    @Override
    public void setProduct(List<ShopCart> shopCarts) {
        for(ShopCart shopCart:shopCarts){
            setProduct(shopCart);
        }
    }

    @Override
    public void update(ShopCart shopCart) {
        shopCartMapper.update(shopCart);
    }

    @Override
    public void add(ShopCart shopCart) {
        shopCartMapper.add(shopCart);
    }

    @Override
    public ShopCart getById(Integer id) {
        ShopCart shopCart = shopCartMapper.getById(id);
        setProduct(shopCart);
        return shopCart;
    }

    @Override
    public void deleteById(Integer id) {
        shopCartMapper.deleteById(id);
    }
}
