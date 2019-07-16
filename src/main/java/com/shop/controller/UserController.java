package com.shop.controller;

import com.shop.pojo.*;
import com.shop.service.*;
import com.shop.util.MD5Util;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
/*
* 用户控制器
* */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ShopCartService shopCartService;
    @Autowired
    ProductService productService;
    /*
     * 跳转功能：到用户登录界面
     * */

    @RequestMapping("Login")
    public String Login(){
        return "user/login";
    }

    /*
    * 跳转功能：到用户注册界面
    * */
    @RequestMapping("Register")
    public String Register(){
        return "user/register";
    }

    /*
     * 用户登录后台处理
     * */
    @RequestMapping("user_login")
    public String forelogin(HttpServletRequest request, HttpSession session){
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        if(null==name||null==password){
            return "redirect:/fore/foreHome";
        }
        //进行MD5加密验证用户密码
//        password = MD5Util.MD5EncodeUtf8(password);
        User user = userService.queryForLogin(name,password);
        if (null == user){
            request.setAttribute("message","账号密码有误");
            return "user/login";
        }
        // 用户已登录, 保存用户名, 跳转到前台首页
        session.setAttribute("user",user);
        return "redirect:/fore/foreHome";
    }

    /*
    * 用户注册后台处理
    * */
    @RequestMapping("user_register")
    public String user_register(User user,HttpServletRequest request){
        if (null == user.getName()){
            return "redirect:/fore/foreHome";
        }
        //数据库查询是否有老用户和注册名相同
        List<User> old_users = userService.getByName(user.getName());
        if (old_users.isEmpty()){
            //添加用户到数据库
            userService.addUser(user);
            String s = "注册成功!请登录 ";
            request.setAttribute("message",s);
            return "user/login";
        }else{
            String s = "用户名已经存在! ";
            request.setAttribute("message",s);
            return "user/register";
        }
    }

    /*
    * 检查用户是否登陆
    * */
    @RequestMapping("forecheckLogin")
    @ResponseBody
    public String checkLogin(HttpSession session){
        User user = (User) session.getAttribute("user");
        if (null != user)
            return "success";
        return "fail";
    }

    /*
    *Ajax验证 模态窗口登录账号密码是否正确
    * */
    @RequestMapping("foreloginAjax")
    @ResponseBody
    public String loginAjax(String name, String password, HttpSession session){
        if(null==name||null==password){
            return "redirect:/fore/foreHome";
        }
        //MD5加密验证密码是否正确
//        password = MD5Util.MD5EncodeUtf8(password);
        //判断是否是同一个登录对象
        User user_Logined = (User)session.getAttribute("user");
        if(null!=user_Logined){
            if(!user_Logined.getName().equals(name)){
                return "fail";
            }else{
                return "success";
            }
        }else{
            User user = userService.queryForLogin(name,password);
            if (null == user){
                return "fail";
            }
            session.setAttribute("user",user);
            return "success";
        }
    }

    /*
     * 用户退出登录
     * */
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:/fore/foreHome";
    }

    /*
    * 用户详情展示
    * */
    @RequestMapping("information")
    public String showInformation(HttpSession session){
        User user = (User) session.getAttribute("user");
        if (null == user){
            return "fail";
        }
        session.setAttribute("user",user);
        return "user/userHome";
    }

    /*
    * 跳转功能：修改用户信息
    * */
    @RequestMapping("userInformation")
    public String userInformation(Integer id, HttpSession session){
        if(null==id){
            return "user/login";
        }
        User user =  userService.getById(id);
        session.setAttribute("u",user);
        return "user/editUser";
    }

    /*
    * 跳转功能：修改用户密码
    * */
    @RequestMapping("userPassword")
    public String userPassword(Integer id, HttpSession session){
        if(null==id){
            return "user/login";
        }
        User user =  userService.getById(id);
        session.setAttribute("u",user);
        return "user/editPassword";
    }

    /*
    * 修改用户信息
    * */
    @RequestMapping("editUser")
    public String editUser(User user, HttpSession session){
        if(null==user){
            return "user/login";
        }
        //编辑用户信息
        userService.editUser(user);
        //重新保存用户Session信息
        user =  userService.getById(user.getId());
        session.setAttribute("user",user);
        return "redirect:userInformation?id="+user.getId();
    }

    /*
    * 修改用户密码
    * */
    @RequestMapping("editPassword")
    public String editPassword(User user, HttpSession session, HttpServletResponse response) throws IOException {
        if(null==user){
            return "user/login";
        }
        //MD5加密
//        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        //Dao层编辑用户密码
        userService.editUserByPassword(user);
        //删除用户Session返回重新登录界面
        session.removeAttribute("user");
        PrintWriter out = response.getWriter();
        out.print("<script language=\"javascript\">alert('修改成功！请重新登录')</script>");
        return "redirect:Login";
    }

    /*
    * 跳转功能：跳转到用户订单管理页面
    * */
    @RequestMapping("userOrder")
    public String userOrder(Model model, HttpSession session){
        //得到用户信息
        User user = (User) session.getAttribute("user");
        //得到该用户所拥有的订单
        List<Order> orders = orderService.getListByUid(user.getId());
        if (null != orders){
            //填充订单所有的订单项元素
            orderItemService.fillOrder(orders);
            model.addAttribute("orders",orders);
        }
        return "user/userOrder";
    }

    /*
    * 用户更新订单状态（确认收货和取消）
    * */
    @RequestMapping("updateOrderStatus")
    public String updateOrderStatus(Integer orderId,String orderStatus){
        if(null==orderId||null==orderStatus){
            return "redirect:userOrder";
        }
        //如果取消订单还原所有库存
        if("canceled".equals(orderStatus)){
            List<OrderItem> orderItems = orderItemService.getListByOid(orderId);
            for(OrderItem orderItem:orderItems){
                Product product = productService.getById(orderItem.getPid());
                if(null!=product){
                    product.setStock_number(product.getStock_number()+orderItem.getNumber());
                    productService.updateProduct(product);
                }
            }
        }
        Date date = new Date();
        orderService.updateStatus(orderId,orderStatus,date);
        return "redirect:userOrder";
    }

    /*
    * 得到用户购物车信息项列表
    * */
    @RequestMapping("shopCart")
    public String shopCart(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (null == user) {
            return "fail";
        }
        List<ShopCart> shopCarts = shopCartService.getListByUid(user.getId());
        model.addAttribute("shopCarts",shopCarts);
        return "user/shopCart";
    }
    /*
    * 删除购物车信息项
    * */
    @RequestMapping("shopcart_delete")
    public String shopcart_delete(Integer id) {
        shopCartService.deleteById(id);
        return "redirect:shopCart";
    }

}
