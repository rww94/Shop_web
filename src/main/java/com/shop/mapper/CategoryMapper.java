package com.shop.mapper;

import com.shop.pojo.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> getCategoryList();
    List<Category> getListByfid(Integer fid);
    Category getCategory(Integer id);
    void addCategory(Category category);
    void updateCategory(Category category);
    void deleteCategory(Integer id);
}
