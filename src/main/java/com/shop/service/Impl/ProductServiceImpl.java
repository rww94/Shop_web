package com.shop.service.Impl;

import com.shop.mapper.ProductMapper;
import com.shop.pojo.Category;
import com.shop.pojo.Product;
import com.shop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;

    @Override
    public void fill(Category category) {
        List<Product> products =  productMapper.selectByCategoryId(category.getId());
        category.setProducts(products);
    }

    @Override
    public void fill(List<Category> categories) {
        for (Category category : categories){
            fill(category);
        }
    }

    @Override
    public Product getById(Integer id) {
        return productMapper.getById(id);
    }

    @Override
    public List<Product> searchProducts(String ketword) {
        return productMapper.searchBykeyword(ketword);
    }

    @Override
    public List<Product> getProductsBycid(Integer cid) {
        return productMapper.selectByCategoryId(cid);
    }
}
