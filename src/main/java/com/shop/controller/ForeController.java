package com.shop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.pojo.*;
import com.shop.service.*;
import com.shop.util.Page;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
    @Autowired
    OrderService orderService;
    @Autowired
    ShopCartService shopCartService;
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
    public String forecategory(Model model, Integer cid, Page page){
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
    public String search(Model model, String keyword, Page page){
        if(null==keyword||""==keyword){
            return "fore/searchResult";
        }
        //分页参数设置
        page.setCount(12);
        //为url设置相应参数
        page.setParam("&keyword="+keyword);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> products = productService.searchProducts(keyword);
        System.out.println("Size="+products.size());
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
    public String forebuyFirst(Integer pid, Integer num, HttpSession session){
        if(null == pid || null == num){
            return "redirect:/fore/foreHome";
        }
        Product product = productService.getById(pid);
        //判断库存是否充足
        if(product.getStock_number()<num){
            return "noEnough";
        }
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
    public String buy(Model model, String[] oiid, HttpSession session){
        if(null == oiid){
            return "redirect:/fore/foreHome";
        }
        List<OrderItem> orderItems = new ArrayList<>();
        float totalPrice = 0;
        // 根据订单项id 查找订单项信息
        for (String s : oiid) {
            int id = Integer.parseInt(s);
            OrderItem orderItem = orderItemService.getById(id);
            totalPrice += orderItem.getPrice()*orderItem.getNumber();
            orderItems.add(orderItem);
        }
        /*
        * 生成新订单
        * */
        Order order = new Order();
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
        order.setOrderCode(orderCode);
        //订单入库和为订单元素项设置oid
        orderService.addOrder(order,orderItems);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("order", order);
        model.addAttribute("orderItems",orderItems);
        return "fore/buy";
    }
    /*
    * 创建订单
    * */
    @RequestMapping("forecreateOrder")
    public String createOrder(Order order, Float totalPrice, HttpSession session){
        if(null == order||null == totalPrice){
            return "redirect:/fore/foreHome";
        }
        //得到订单元素信息
        List<OrderItem> orderItems = orderItemService.getListByOid(order.getId());
        //判断库存是否充足
        for(OrderItem orderItem:orderItems){
            Product product = productService.getById(orderItem.getPid());
            if(product.getStock_number()<orderItem.getNumber()){
                return "noEnough";
            }else{
                //更新商品库存
                product.setStock_number(product.getStock_number()-orderItem.getNumber());
                productService.updateProduct(product);
            }
        }
        User user = (User) session.getAttribute("user");
        order.setCreate_date(new Date());
        order.setUid(user.getId());
        //设置订单状态（等待支付）
        order.setStatus(OrderService.waitPay);
        //得到订单总价同时添加订单入数据库
        orderService.updateOrder(order);
        return "redirect:forealipay?orderId="+order.getId() + "&totalPrice=" + totalPrice;
    }
    /*
    * 跳转功能：发起支付请求
    * */
    @RequestMapping("forealipay")
    public String alipay(){
        return "fore/alipay";
    }
    /*
    * 点击确认支付,服务端跳转到支付页面
    * */
    @RequestMapping("forepay")
    public String pay(Integer orderId, Model model){
        if(null == orderId){
            return "redirect:/fore/foreHome";
        }
        Order order = orderService.getById(orderId);
        if (null == order){
            return "fail";
        }
        order.setStatus(OrderService.waitConfirm);
        order.setPay_date(new Date());
        orderService.updateOrder(order);
        model.addAttribute("order",order);
        return "fore/pay";
    }
    /*
    * 添加到购物车
    * */
    @RequestMapping("foreaddCart")
    @ResponseBody
    public String foreaddCart(Integer pid,Integer number, HttpSession session){
        if(null==pid||null==number){
            return "redirect:/fore/foreHome";
        }
        User user = (User) session.getAttribute("user");
        // 标识购物车是否已经存在该产品
        boolean exist = false;
        // 查询当前用户购物车信息项, 存在该产品则加对应数量
        List<ShopCart> shopCarts = shopCartService.getListByUid(user.getId());
        for(ShopCart shopCart:shopCarts){
            if(shopCart.getPid().equals(pid)){
                shopCart.setNumber(shopCart.getNumber()+number);
                shopCartService.update(shopCart);
                exist = true;
                break;
            }
        }
        // 购物车不存在该产品，则生成新的购物车信息项
        if(!exist){
            ShopCart shopCart = new ShopCart();
            shopCart.setUid(user.getId());
            shopCart.setNumber(number);
            shopCart.setPid(pid);
            shopCartService.add(shopCart);
        }
        return "success";
    }
    /*
    * 从购物车进行购买
    * */
    @RequestMapping("foreCartbuy")
    public String foreCartbuy(Model model, String[] oiid, HttpSession session){
        if(null==oiid){
            return "redirect:/fore/foreHome";
        }
        User user = (User) session.getAttribute("user");
        StringBuffer oid = new StringBuffer();
        //循环从购物车下单的商品
        for (String s : oiid) {
            Integer id = Integer.parseInt(s);
            ShopCart shopCart = shopCartService.getById(id);
            //判断库存是否充足
            Product product = productService.getById(shopCart.getPid());
            if(product.getStock_number()<shopCart.getNumber()){
                return "noEnough";
            }
            //将购物车项转化为订单元素项
            OrderItem orderItem = new OrderItem();
            orderItem.setUid(user.getId());
            orderItem.setNumber(shopCart.getNumber());
            orderItem.setPid(shopCart.getPid());
            orderItem.setPrice(shopCart.getProduct().getNow_price());
            //插入新的订单元素项
            orderItemService.add(orderItem);
            //构造订单请求路径
            oid.append("&oiid="+orderItem.getId());
            //从购物车删除
            shopCartService.deleteById(id);
        }
        //截去路径中的第一个&符号
        String res = oid.substring(1);
        return "redirect:forebuy?"+res;
    }
}
