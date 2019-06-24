package com.shop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.pojo.*;
import com.shop.service.CategoryService;
import com.shop.service.OrderItemService;
import com.shop.service.ProductService;
import com.shop.service.UserService;
import com.shop.util.Page;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
* 前端各种控制
* */
@Controller
@RequestMapping("fore")
public class ForeController {
    @Autowired
    UserService userService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    OrderItemService orderItemService;
    /*
    * 首页展示
    * */
    @RequestMapping("foreHome")
    public String home(Model model){
        List<Category> categories = categoryService.getList();
        if (null != categories){
            productService.fill(categories);
        }
        model.addAttribute("categories",categories);
        return "fore/foreHome";
    }
    /*
    * 商品分类展示
    * */
    @RequestMapping("forecategory")
    public String forecategory(Integer cid, Model model, Page page){
        if(null==cid){
            return "redirect:foreHome";
        }
        //  设置分页参数
        page.setCount(12);
        // 为url设置相应参数
        page.setParam("&cid="+cid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> products = productService.getProductsBycid(cid);
        // 获得产品总数
        int total = (int) new PageInfo<>(products).getTotal();
        page.setTotal(total);
        model.addAttribute("page",page);
        model.addAttribute("products",products);
        return "fore/showCategory";
    }
    /*
    * 具体商品信息
    * */
    @RequestMapping("foreproduct")
    public String showProduct(Integer pid, Model model){
        if(null==pid){
            return "redirect:/fore/foreHome";
        }
        // 根据pid 获取分类
        Product product = productService.getById(pid);
        if (null == product){
            return "fail";
        }
        Category category = categoryService.getById(product.getCid());
        model.addAttribute("category",category);
        model.addAttribute("product",product);
        return "fore/showProduct";
    }
    /*
    * 主页搜素功能
    * */
    @RequestMapping("foresearch")
    public String search(String keyword, Model model,Page page){
        if(null==keyword||""==keyword){
            return "fore/searchResult";
        }
        //分页参数设置
        page.setCount(12);
        //为url设置相应参数
        page.setParam("&keyword="+keyword);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> products = productService.searchProducts(keyword);

        int total = (int) new PageInfo<>(products).getTotal();
        page.setTotal(total);

        model.addAttribute("page",page);
        model.addAttribute("products",products);
        return "fore/searchResult";
    }
    /*
    * 订单第一步，生成订单元素项
    * */
    @RequestMapping("forebuyFirst")
    public String buyFirst(int pid, int num, HttpSession session){
        Product product = productService.getById(pid);
        // 新增订单项ID
        int oiid = 0;
        User user = (User) session.getAttribute("user");
        OrderItem orderItem = new OrderItem();
        orderItem.setUid(user.getId());
        orderItem.setNumber(num);
        orderItem.setPid(pid);
        orderItem.setPrice(product.getNow_price());
        orderItemService.add(orderItem);
        oiid = orderItem.getId();
        return "redirect:forebuy?oiid="+oiid;
    }
    /*
    * 进入订单填写页
    * */
    @RequestMapping("forebuy")
    public String buy(String[] oiid, HttpSession session, Model model){
        List<OrderItem> orderItems = new ArrayList<>();
        float totalPrice = 0;
        // 根据订单项id 查找订单
        for (String s : oiid) {
            int id = Integer.parseInt(s);
            OrderItem orderItem = orderItemService.getById(id);
            totalPrice += orderItem.getPrice()*orderItem.getNumber();
            orderItems.add(orderItem);
        }
        session.setAttribute("orderItems", orderItems);
        model.addAttribute("totalPrice", totalPrice);
        return "fore/buy";
    }
    /*
    * 创建订单
    * */
    @RequestMapping("forecreateOrder")
    public String createOrder(Model model, Order order, HttpSession session){
        return "fail";
//        User user = (User) session.getAttribute("user");
//        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
//        order.setOrderCode(orderCode);
//        order.setCreate_date(new Date());
//        order.setUid(user.getId());
//        order.setStatus(OrderService.waitPay);
//        List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
//        float totalPrice = orderService.add(order,orderItems);

//        return "redirect:forealipay?orderId="+order.getId() + "&totalPrice=" + totalPrice;
    }
}
