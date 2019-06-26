package com.shop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.pojo.Firm;
import com.shop.pojo.User;
import com.shop.service.UserService;
import com.shop.util.MD5Util;
import com.shop.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import com.shop.service.AdminService;
import com.shop.pojo.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/*
* 管理员控制器
* */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    AdminService adminService;
    @Autowired
    UserService userService;
    /*
    * 跳转功能:管理员登陆跳转
    * */
    @RequestMapping("Login")
    public String adminLogin(){
        return "admin/login";
    }
    /*
    * 登陆验证
    * */
    @RequestMapping("admin_login")
    public String adminlogin(HttpServletRequest request,HttpSession session){
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        if(null==name||null==password){
            return "admin/login";
        }
        password = MD5Util.MD5EncodeUtf8(password);
        Admin admin = adminService.queryForLogin(name,password);
        // 用户不存在则回到登录界面
        if (null == admin){
            request.setAttribute("message","账号密码有误");
            return "admin/login";
        }
        // 登录成功跳转到主页面
        session.setAttribute("admin",admin.getName());
        return "admin/adminHome";
    }
    /*
    * 管理员退出
    * */
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("admin");
        return "redirect:/admin/adminLogin";
    }

    /*
     * 获取会员数据,跳转到用户展示页面
     * */
    @RequestMapping("getUserList")
    public String getUserList(Model model, Page page){
        page.setCount(5);
        // 取出数据前设置分页参数
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<User> users = userService.getUserList();
        // 获得用户总数
        int total = (int) new PageInfo<>(users).getTotal();
        page.setTotal(total);
        model.addAttribute("page",page);
        model.addAttribute("users",users);
        return "admin/listUser";
    }
    /*
    * 厂商信息列表
    * */
    @RequestMapping("getFirmList")
    public String getFirmList(Model model, Page page){
        // 取出数据前设置分页参数
//        PageHelper.offsetPage(page.getStart(),page.getCount());
//        List<User> users = userService.getUserList();
//        // 获得用户总数
//        int total = (int) new PageInfo<>(users).getTotal();
//        page.setTotal(total);
//        model.addAttribute("page",page);
//        model.addAttribute("users",users);
        return "admin/listFirm";
    }
    /*
     * 根据id 删除会员
     * */
    @RequestMapping("user_delete")
    public String deleteUser(Integer id){
        if (null == id){
            return "fail";
        }
        userService.deleteUser(id);
        return "redirect:/admin/getUserList";
    }
    /*
     * 跳转功能:跳转到添加用户界面
     * */
    @RequestMapping("addUser")
    public String addUser(){
        return "admin/addUser";
    }

    /*
     * 跳转功能:跳转到添加厂商界面
     * */
    @RequestMapping("addFirm")
    public String addFirm(){
        return "admin/addFirm";
    }
    /*
     * 管理员添加厂商
     * */
    @RequestMapping("add_firm")
    public String add_firm(Firm firm){
//        userService.addUser(user);
        return "redirect:/admin/getFirmList";
    }
    /*
    * 管理员添加用户
    * */
    @RequestMapping("add_user")
    public String add_user(HttpServletResponse response, User user) throws IOException {
        if (null == user){
            return "fail";
        }
        PrintWriter out = response.getWriter();

        List<User> old_users = userService.getByName(user.getName());
        if (old_users.isEmpty()){
            user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
            userService.addUser(user);
            out.print("<script language=\"javascript\">alert('添加用户成功')</script>");

        }else{
            out.print("<script language=\"javascript\">alert('用户名已存在')</script>");
        }
        return "redirect:/admin/getUserList";
    }
}
