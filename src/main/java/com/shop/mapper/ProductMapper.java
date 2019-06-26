package com.shop.mapper;

import com.shop.pojo.Product;

import java.util.List;

public interface ProductMapper {
    List<Product> selectByCategoryId(Integer id);
    Product getById(Integer id);
    List<Product> searchBykeyword(String keyword);
    void updateProduct(Product product);
    void addProduct(Product product);
    List<Product> getAllProduct();
    void deleteProduct(Product product);
}
