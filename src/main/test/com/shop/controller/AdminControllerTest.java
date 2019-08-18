package com.shop.controller;

import com.shop.pojo.Admin;
import com.shop.service.AdminService;
import com.shop.service.FirmService;
import com.shop.service.UserService;
import com.shop.util.Page;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.junit.Assert.*;
import static org.mockito.Matchers.any;

public class AdminControllerTest {

    @Mock
    private AdminService adminService;
    @Mock
    private UserService userService;
    @Mock
    private FirmService firmService;
    @InjectMocks
    AdminController adminController;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }
    @Test
    public void adminLogin() {
        String s = adminController.adminLogin();
        Assert.assertEquals("admin/login", s);
    }

    @Test
    public void adminlogin() {
        HttpServletRequest httpServletRequest = Mockito.mock(HttpServletRequest.class);
        Mockito.when(adminService.queryForLogin(any(String.class),any(String.class))).thenReturn(new Admin());
        String s = adminController.adminLogin(httpServletRequest,any(HttpSession.class));
        Assert.assertEquals("admin/adminHome",s);
    }

    @Test
    public void logout() {
        HttpSession httpSession = Mockito.mock(HttpSession.class);
        httpSession.setAttribute("admin",new Admin());
        String s = adminController.logout(httpSession);
        Assert.assertEquals("redirect:/admin/adminLogin", s);
    }

    @Test
    public void getUserList() {
        Model mode = Mockito.mock(Model.class);
        Page page = Mockito.mock(Page.class);
        Mockito.when(userService.getUserList()).thenReturn(null);
        String s = adminController.getUserList(mode,page);
        Assert.assertEquals("admin/listUser",s);
    }

    @Test
    public void getFirmList() {
        Model mode = Mockito.mock(Model.class);
        Page page = Mockito.mock(Page.class);
        Mockito.when(firmService.getFirmList()).thenReturn(null);
        String s = adminController.getFirmList(mode,page);
        Assert.assertEquals("admin/listFirm",s);
    }

    @Test
    public void deleteUser() {
        String s = adminController.deleteUser(any(Integer.class));
        Assert.assertEquals("redirect:/admin/getUserList",s);
    }

    @Test
    public void firm_delete() {
        String s = adminController.firm_delete(any(Integer.class));
        Assert.assertEquals("redirect:/admin/getFirmList",s);
    }

    @Test
    public void addUser() {
        String s = adminController.addUser();
        Assert.assertEquals("admin/addUser",s);
    }

    @Test
    public void addFirm() {
        String s = adminController.addFirm();
        Assert.assertEquals("admin/addFirm",s);
    }

    @Test
    public void add_user() {
    }

    @Test
    public void add_firm() {
    }
}