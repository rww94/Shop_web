<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.shop.pojo.Firm" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<link rel="stylesheet" type="text/css" href="../css/back/style.css">

<div class="panel panel-warning addDiv" style="margin-top: 100px; margin-left: 50px; margin-right: 50px">
    <div class="panel-heading">新增用户</div>
    <div class="panel-body">
        <form id="addForm" action="<%=basePath%>/admin/add_user" method="post">
            <table class="addTable">
                <tr>
                    <td>用户名:</td>
                    <td><input  id="name" name="name" type="text" class="form-control"/></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input  id="password" name="password" type="password" class="form-control"/></td>
                </tr>
                <tr>
                    <td>确认密码:</td>
                    <td><input  id="password-confirm" name="password-confirm" type="password" class="form-control"/></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><select name="sex" class="form-control">
                        <option value="" selected>保密</option>
                        <option value="男">男士</option>
                        <option value="女">女士</option>
                    </select></td>
                </tr>
                <tr>
                    <td>请输入电话:</td>
                    <td><input  id="telephone" name="telephone" type="text" class="form-control" maxlength="15"/></td>
                </tr>
                <tr>
                    <td>请输入地址:</td>
                    <td><input  id="address" name="address" type="text" class="form-control" maxlength="15"/></td>
                </tr>
                <tr>
                    <td>请输入邮箱:</td>
                    <td><input  id="email" name="email" type="text" class="form-control" maxlength="15"/></td>
                </tr>
                <tr><td>&nbsp;&nbsp;</td></tr>
                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <button type="submit" class="btn btn-success">提 交</button>
                        <button type="reset" class="btn btn-primary">重置</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<script>
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

            var msg = "确认添加用户吗?\n请确认！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
            return true;
        });
    });
</script>