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

    <title>桌面</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .table th, .table td {
            text-align: center;
            vertical-align: middle!important;
        }
    </style>
</head>
<%
    String name = user.getName();
%>
<body>
<div class="container-fluid">
    <h3>欢迎注册会员:<%=name%></h3>
</div>
</body>
</html>
