package com.shop.service;

import com.shop.mapper.CategoryMapper;
import com.shop.pojo.Category;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import java.util.List;

import static org.mockito.Matchers.any;

public class CategoryServiceServiceTest{

    @InjectMocks
    CategoryService categoryService;

    @Mock
    CategoryMapper categoryMapper;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void getList() {
        Mockito.when(categoryMapper.getListByfid(any(Integer.class))).thenReturn(null);
        List<Category> list = categoryService.getListByfid(any(Integer.class));
        System.out.println(list);
    }

    @Test
    public void getListByfid() {

    }

    @Test
    public void getById() {

    }

    @Test
    public void addCategory() {

    }

    @Test
    public void updateCategory() {
    }

    @Test
    public void deleteCategory() {
    }
}