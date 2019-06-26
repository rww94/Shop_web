package com.shop.service;

import com.shop.pojo.User;
import com.shop.util.MD5Util;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserServiceTest extends BaseServiceTest{
    User user = new User();
    @Test
    public void addUser() {
        user.setName("Jerry");
        user.setPassword("222222");
        user.setSex("男");
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        userService.addUser(user);
    }

    @Test
    public void deleteUser() {
        String  password = MD5Util.MD5EncodeUtf8("123456");
        System.out.println(password);
    }

    @Test
    public void getUserList() {
        userService.getUserList();
    }

    @Test
    public void queryForLogin() {
        user.setName("Tom");
        user.setPassword("123456");
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        User user1   = userService.queryForLogin(user.getName(),user.getPassword());
        System.out.println(user1.getId()+" "+user1.getName());
    }

    @Test
    public void getById() {
    }

    @Test
    public void editUser() {
    }

    @Test
    public void editUserByPassword() {
    }

    @Test
    public void getByName() {
    }
}