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
    <title>用户注册</title>
    <link rel="stylesheet" href="../css/login.css" type="text/css" />
    <style type="text/css">
        body{font-family:Microsoft YaHei,Segoe UI,Tahoma,Arial,Verdana,sans-serif;font-size:12px;color:#fff;height:100%;line-height:1;background:#985f0d}
        select{width:270px;height:42px;margin-top:25px;padding:0px 15px;border:1px solid rgba(255,255,255,.15);border-radius:6px;color:#fff;letter-spacing:2px;font-size:16px;background:transparent;}
        option{color:#b00000;letter-spacing:2px;font-size:16px;background:#fff;}
    </style>
    <script type="text/javascript" src="../js/jquery/2.0.0/jquery.min.js"></script>
</head>

<body>
<div class="login-box">
    <h1>用户注册</h1>
    <form id="addForm" method="post" action="<%=basePath %>/user/user_register">
        <div class="name">
            <label>账号：</label>
            <input type="text" name="name" id="name" tabindex="1" autocomplete="off" />
        </div>
        <div class="password">
            <label>密  码：</label>
            <input type="password" name="password" maxlength="16" id="password" tabindex="2"/>
        </div>
        <div class="password">
            <label>确认密码：</label>
            <input type="password" name="password-confirm" maxlength="16" id="password-confirm" tabindex="2"/>
        </div>
        <div>
            <label>性别：</label>
            <select name="sex" id="sex">
                <option value="">保密</option>
                <option value="男">男士</option>
                <option value="女">女士</option>
            </select>
        </div>
        <div>
            <label>请输入电话：</label>
            <input  id="telephone" name="telephone" type="text" class="form-control" maxlength="15"/>
        </div>
        <div>
            <label>请输入地址：</label>
            <input  id="adress" name="adress" type="text" class="form-control" maxlength="15"/>
        </div>
        <div>
            <label>请输入邮箱：</label>
            <input  id="email" name="email" type="text" class="form-control" maxlength="15"/>
        </div>
        <br/>
        <div class="register">
            <button type="submit" tabindex="5">注册</button>
        </div>
    </form>
    <br/>
    <div class="form-actions">
        <a class="btn pull-left btn-link text-muted" href="<%=basePath %>/fore/foreHome">
            返回首页
        </a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a class="btn pull-left btn-link text-muted" href="<%=basePath %>/user/Login">
            登陆
        </a>
    </div>
</div>

<div class="screenbg">
</div>
<script type="text/javascript">
    <c:if test="${!empty message}">
    alert('${message}')
    </c:if>
    $(function(){
        $("#addForm").submit(function(){
            var name = $("#name").val().length;
            var password1 = $("#password").val();
            var password2 = $("#password-confirm").val();
            if (name == 0){
                alert("用户名不能为空!");
                return false;
            }
            if (password1.length == 0){
                alert("密码不能为空!")
                return false;
            }
            if (password1 != password2){
                alert("两次密码不一致!")
                return false;
            }

            var msg = "确认注册吗?\n请确认！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
            return true;
        });
    });
</script>
</body>
</html>
