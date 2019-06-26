<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册用户登录</title>
    <link rel="stylesheet" href="../css/login.css" type="text/css" />
    <style type="text/css">
        body{font-family:Microsoft YaHei,Segoe UI,Tahoma,Arial,Verdana,sans-serif;font-size:12px;color:#fff;height:100%;line-height:1;background:#985f0d}
    </style>
    <script type="text/javascript" src="../js/jquery/2.0.0/jquery.min.js"></script>
</head>

<body>
<div class="login-box">
    <h1>用户登录</h1>
    <form method="post" action="<%=basePath %>/user/user_login">
        <div class="name">
            <label>账号：</label>
            <input type="text" name="name" id="name" tabindex="1" autocomplete="off" />
        </div>
        <div class="password">
            <label>密  码：</label>
            <input type="password" name="password" maxlength="16" id="password" tabindex="2"/>
        </div>
        <br/>
        <div class="login">
            <button type="submit" tabindex="5">登录</button>
        </div>
    </form>
    <br/>
    <div class="form-actions">
        <a class="btn pull-left btn-link text-muted" href="<%=basePath %>/fore/foreHome">
            返回首页
        </a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="btn pull-left btn-link text-muted" href="<%=basePath %>/user/Register">
            注册
        </a>
    </div>
</div>

<div class="screenbg">
</div>
<script type="text/javascript">
    <c:if test="${!empty message}">
    alert('${message}')
    </c:if>
    function login() {//登录
        var value = $("#name").val();
        if (value.length == 0) {
            alert("用户名不能为空!")
            $("#name")[0].focus();
            return false;
        }
        var value1 = $("#password").val();
        if (value1.length == 0) {
            alert('密码不能为空')
            $("#password")[0].focus();
            return false;
        }

    }
</script>
</body>
</html>
