<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.shop.pojo.Firm" %>
<%@ page import="com.shop.pojo.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    User user=(User)session.getAttribute("user");
    if(null==user){
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
            <a href="user/userInformation?id=<%=user.getId()%>" target="right"><span>信息修改</span></a>
        </li>
        <li class="nav-item">
            <a href="user/userPassword?id=<%=user.getId()%>" target="right"><span>密码修改</span></a>
        </li>
        <li class="nav-item">
            <a href="user/logout" target="_blank"><strong>退出登录</strong></a>
        </li>
    </ul>
</div>
</body>
</html>
