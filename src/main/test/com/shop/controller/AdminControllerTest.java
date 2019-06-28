package com.shop.controller;

import com.shop.pojo.User;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:springMVC.xml"})
public class AdminControllerTest {

    private MockHttpServletRequest request;
    private MockHttpServletResponse response;

    @Autowired
    private AdminController adminController ;

    @Before
    public void setUp(){
        request = new MockHttpServletRequest();
        request.setCharacterEncoding("UTF-8");
        response = new MockHttpServletResponse();
    }

    @Test
    public void adminLogin() {
    }

    @Test
    public void adminlogin() {
    }

    @Test
    public void logout() {
        System.out.println("sdsds");
    }

    @Test
    public void getUserList() {
    }

    @Test
    public void getFirmList() {
    }

    @Test
    public void deleteUser() {
    }

    @Test
    public void addUser() {
    }

    @Test
    public void addFirm() {
    }

    @Test
    public void add_firm() {
    }

    @Test
    public void add_user(){

    }
}