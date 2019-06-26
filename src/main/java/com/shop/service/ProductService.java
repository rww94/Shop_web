package com.shop.service;

import com.shop.pojo.Category;
import com.shop.pojo.Product;

import java.util.List;

public interface ProductService {
    /*
    * 为单个分类填充产品集合
    * */
    public void fill(Category category);

    /*
    * 为一组分类的每个类别分别填充产品集合
    * */
    public void fill(List<Category> categories);
    /*
    * 通过商品id查找商品
    * */
    public Product getById(Integer id);
    /*
    * 通过关键词查询商品
    * */
    public List<Product> searchProducts(String ketword);
    /*
    * 通过种类查询商品
    * */
    public List<Product> getProductsBycid(Integer cid);
    /*
    * 更新商品信息
    * */
    void updateProduct(Product product);
    /*
    * 添加商品
    * */
    void addProduct(Product product);
    /*
    * 删除商品
    * */
    void deleteProduct(Product product);
    /*
    * 得到所有商品
    * */
    List<Product> getAllProduct();
}
