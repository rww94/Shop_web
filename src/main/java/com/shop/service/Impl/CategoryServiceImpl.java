package com.shop.service.Impl;

import com.shop.mapper.CategoryMapper;
import com.shop.pojo.Category;
import com.shop.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public List<Category> getList() {
       return categoryMapper.getCategoryList();
    }

    @Override
    public List<Category> getListByfid(Integer fid) {
        return categoryMapper.getListByfid(fid);
    }

    @Override
    public Category getById(Integer id) {
        return categoryMapper.getCategory(id);
    }

    @Override
    public void addCategory(Category category) {
        categoryMapper.addCategory(category);
    }

    @Override
    public void updateCategory(Category category) {
        categoryMapper.updateCategory(category);
    }

    @Override
    public void deleteCategory(Integer id) {
        categoryMapper.deleteCategory(id);
    }
}
