package com.shop.service;

import com.shop.pojo.Category;
import org.junit.Test;
import java.util.List;

public class CategoryServiceServiceTest extends BaseServiceTest {

    private Integer id = 12;
    private Integer fid = 10;
    @Test
    public void getList() {
        List<Category> list = categoryService.getList();
        System.out.println(list);
    }

    @Test
    public void getListByfid() {
        List<Category> listByfid = categoryService.getListByfid(fid);
        System.out.println(listByfid);
    }

    @Test
    public void getById() {
        Category byId = categoryService.getById(id);
        System.out.println(byId);
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