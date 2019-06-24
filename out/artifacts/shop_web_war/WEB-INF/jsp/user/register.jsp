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

    <style type="text/css">
        html{overflow-y:scroll;vertical-align:baseline;}
        body{font-family:Microsoft YaHei,Segoe UI,Tahoma,Arial,Verdana,sans-serif;font-size:12px;color:#fff;height:100%;line-height:1;background:#985f0d}
        *{margin:0;padding:0}
        ul,li{list-style:none}
        h1{font-size:30px;font-weight:700;text-shadow:0 1px 4px rgba(0,0,0,.2)}
        .login-box{width:410px;margin:120px auto 0 auto;text-align:center;padding:30px;border-radius:10px;}
        .login-box .name,.login-box .password,.login-box,.login-box{font-size:16px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
        .login-box .remember input{box-shadow:none;width:15px;height:15px;margin-top:25px}
        .login-box .remember label{display:inline-block;height:42px;width:70px;line-height:34px;text-align:left}
        .login-box label{display:inline-block;width:100px;text-align:right;vertical-align:middle}
        .login-box img{width:148px;height:42px;border:none}
        input[type=text],input[type=password]{width:270px;height:42px;margin-top:25px;padding:0px 15px;border:1px solid rgba(255,255,255,.15);border-radius:6px;color:#fff;letter-spacing:2px;font-size:16px;background:transparent;}
        select{width:270px;height:42px;margin-top:25px;padding:0px 15px;border:1px solid rgba(255,255,255,.15);border-radius:6px;color:#fff;letter-spacing:2px;font-size:16px;background:transparent;}
        option{color:#b00000;letter-spacing:2px;font-size:16px;background:#fff;}
        button{cursor:pointer;width:100%;height:44px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
        input:focus{outline:none;box-shadow:0 2px 3px 0 rgba(0,0,0,.1) inset,0 2px 7px 0 rgba(0,0,0,.2)}
        button:hover{box-shadow:0 15px 30px 0 rgba(255,255,255,.15) inset,0 2px 7px 0 rgba(0,0,0,.2)}
        .screenbg{position:fixed;bottom:0;left:0;z-index:-999;overflow:hidden;width:100%;height:100%;min-height:100%;}
        .screenbg ul li{display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
        .screenbg ul a{left:0;top:0;width:100%;height:100%;display:inline-block;margin:0;padding:0;cursor:default;}
        .screenbg a img{vertical-align:middle;display:inline;border:none;display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
        .bottom a{color:#FFF;text-decoration:none;}
        .bottom a:hover{text-decoration:underline;}
    </style>

    <script type="text/javascript" src="../js/jquery/2.0.0/jquery.min.js"></script>
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

</body>
</html>
