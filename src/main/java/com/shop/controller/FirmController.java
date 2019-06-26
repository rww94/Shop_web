package com.shop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.pojo.Category;
import com.shop.pojo.Firm;
import com.shop.pojo.Order;
import com.shop.pojo.Product;
import com.shop.service.*;
import com.shop.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.shop.util.Page;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("firm")
public class FirmController {
    @Autowired
    FirmService firmService;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    /*
    * 跳转功能:厂商登陆跳转
    * */
    @RequestMapping("Login")
    public String Login(Model model){
        return "firm/login";
    }
    /*
    * 厂商登陆处理
    * */
    @RequestMapping("firm_login")
    public String firmlogin(HttpServletRequest request, HttpSession session){
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        if(null==name||null==password){
            return "redirect:Login";
        }
        //进行MD5加密验证厂商密码
        password = MD5Util.MD5EncodeUtf8(password);
        Firm firm = firmService.queryForLogin(name,password);
        // 厂商不存在则回到登录界面
        if (null == firm){
            request.setAttribute("message","账号密码有误");
            return "firm/login";
        }
        // 登录成功跳转到主页面
        session.setAttribute("firm",firm);
        return "firm/firmHome";
    }
    /*
    * 厂商退出登陆
    * */
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("firm");
        return "redirect:Login";
    }
    /*
    * 分类管理
    * */
    @RequestMapping("category_list")
    public String getCategoryList(Model model, Page page,HttpSession session){
        //得到厂商Session信息
        Firm firm = (Firm)session.getAttribute("firm");
        // 取数据前设置分页参数
        PageHelper.offsetPage(page.getStart(),page.getCount());
        //通过厂商id查询所管理的类别
        List<Category> categories = categoryService.getListByfid(firm.getId());
        if (null != categories ){
            // 获取数据总记录数
            int total = (int) new PageInfo<>(categories).getTotal();
            // 为分页类设置参数: 总记录数
            page.setTotal(total);
            model.addAttribute("page",page);
        }
        //返回类别信息
        model.addAttribute("cs",categories);
        return "firm/listCategory";
    }
    /*
    * 根据类别id获取商品列表
    * */
    @RequestMapping("product_list")
    public String list(Model model, Integer cid, Page page){
        if (null == cid){
            return "fail";
        }
        //通过产品类别查询具体商品列表
        Category category = categoryService.getById(cid);
        // 取数据前设置分页参数（每一页的记录数量）
        page.setCount(5);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        //为类别填充商品信息
        productService.fill(category);
        List<Product> products = category.getProducts();
        // 得到产品总数
        int total = (int) new PageInfo<>(products).getTotal();
        // 为url设置相应参数
        page.setParam("&cid="+cid);
        page.setTotal(total);

        model.addAttribute("ps",products);
        model.addAttribute("c",category);
        model.addAttribute("page",page);
        return "firm/listProductByCategory";
    }
    /*
    * 跳转功能: 跳转到添加分类页面
    * */
    @RequestMapping("addCategoryPage")
    public String addCategoryPage(){return "firm/addCategory";}
    /*
    * 添加分类
    * */
    @RequestMapping("category_add")
    public String category_add(Category category){
        categoryService.addCategory(category);
        return "redirect:category_list";
    }
    /*
    * 根据分类id，编辑分类信息
    * */
    @RequestMapping("category_edit")
    public String category_edit(Model model, Integer id){
        if (null == id){
            return "fail";
        }
        Category category = categoryService.getById(id);
        model.addAttribute("c",category);
        return "firm/editCategory";
    }

    /*
    * 更新分类信息
    * */
    @RequestMapping("category_update")
    public String updateCategory(Category category){
        if (null == category){
            return "fail";
        }
        categoryService.updateCategory(category);
        return "redirect:/firm/category_list";
    }
    /*
    * 删除分类
    * */
    @RequestMapping("category_delete")
    public String deleteCategory(Integer id){
        categoryService.deleteCategory(id);
        return "redirect:/firm/category_list";
    }
    /*
    * 跳转功能：跳转到编辑商品页面
    * */
    @RequestMapping("product_edit")
    public String editProduct(Model model, Integer id){
        if (null == id){
            return "fail";
        }
        Product product = productService.getById(id);
        Category category = categoryService.getById(product.getCid());
        model.addAttribute("p",product);
        model.addAttribute("c",category);
        return "firm/editProduct";
    }
    /*
    * 商品信息修改
    * */
    @RequestMapping("product_update")
    public String updateProduct(Product product){
        if (null == product){
            return "fail";
        }
        productService.updateProduct(product);
        return "redirect:/firm/product_list?cid="+product.getCid();
    }
    /*
    * 添加商品
    * */
    @RequestMapping("product_add")
    public String addProduct(Product product){
        if (null == product){
            return "fail";
        }
        product.setCreate_date(new Date());
        productService.addProduct(product);
        return "redirect:/firm/product_list?cid="+product.getCid();
    }
    @RequestMapping("product_delete")
    public String deleteProduct(Integer pid){
        if (null == pid){
            return "fail";
        }
        //通过pid得到商品信息
        Product product = productService.getById(pid);
        //删除商品
        productService.deleteProduct(product);
        //跳转到这个商品所属类别的商品列表展示页
        return "redirect:/firm/product_list?cid="+product.getCid();
    }
    /*
    * 取出所有产品,跳转到产品展示界面
    * */
    @RequestMapping("getProductList")
    public String productList(Model model, Page page){
        // 取出数据前设置分页参数
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> products = productService.getAllProduct();
        // 得到产品总数
        int total = (int) new PageInfo<>(products).getTotal();
        page.setTotal(total);
        model.addAttribute("ps",products);
        model.addAttribute("page",page);
        return "firm/listAllProduct";
    }
    /*
    * 跳转功能：跳转到厂商管理订单页面
    * */
    @RequestMapping("getOrderList")
    public String getOrderList(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Order> orders = orderService.getList();
        // 得到订单总数
        int total = (int) new PageInfo<>(orders).getTotal();
        page.setTotal(total);
        // 给订单填充属性值
        orderItemService.fillOrder(orders);
        model.addAttribute("page",page);
        model.addAttribute("orders",orders);
        return "firm/listOrder";
    }
    @RequestMapping("confirmOrder")
    public String confirmOrder(Integer orderId,String orderStatus){
        orderService.updateStatus(orderId,orderStatus);
        return "redirect:getOrderList";
    }
}
