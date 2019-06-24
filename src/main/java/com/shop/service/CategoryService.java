package com.shop.service;

import com.shop.pojo.Category;

import java.util.List;

public interface CategoryService {
    /*
     * 查询所有分类
     * */
    List<Category> getList();
    /*
    * 根据厂商查询分类
    * */
    List<Category> getListByfid(Integer fid);
    /*
    * 根据分类查询获取分类对象
    * */
    Category getById(Integer id);
    /*
    * 添加分类
    * */
    void addCategory(Category category);
    /*
    * 更新分类
    * */
    void updateCategory(Category category);
    /*
    * 根据id删除类别
    * */
    void deleteCategory(Integer id);
}
