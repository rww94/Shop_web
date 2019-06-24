<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.shop.pojo.Firm" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Firm firm=(Firm)session.getAttribute("firm");
    if(null==firm){
        response.sendRedirect("Login");
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>菜单</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/back/nav.css">
    <link rel="stylesheet" type="text/css" href="font/iconfont.css">
    <script type="text/javascript" src="js/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="js/nav.js"></script>
</head>
<body>
<div class="nav">
    <div style="text-align:center; ">
    <ul>
        <li class="nav-item">
            &nbsp;&nbsp;&nbsp;
        </li>
        <li class="nav-item">
            <a href="fore/foreHome" target="_blank"><strong>网站首页</strong></a>
        </li>
        <li class="nav-item">
            <a href="javascript:;">分类管理</a>
            <ul>
                <li><a href="firm/category_list" target="right"><span>分类列表</span></a></li>
                <li><a href="firm/addCategoryPage" target="right"><span>添加分类</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a href="javascript:;">商品管理</a>
            <ul>
                <li><a href="product/getItemList" target="right"><span>商品列表</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a href="javascript:;">订单管理</a>
            <ul>
                <li><a href="order/getOrderList" target="right"><span>订单列表</span></a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a href="firm/logout" target="_blank"><strong>退出登录</strong></a>
        </li>
    </ul>
</div>
</body>
</html>
