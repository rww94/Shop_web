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
    <div class="panel-heading">新增产商</div>
    <div class="panel-body">
        <form id="addForm" action="<%=basePath%>/admin/add_firm" method="post">
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
                    <td>全&nbsp;&nbsp;称:</td>
                    <td><input  id="fullname" name="fullname" type="text" class="form-control" maxlength="15"/></td>
                </tr>
                <tr>
                    <td>相关信息:</td>
                    <td><input  id="message" name="message" type="text" class="form-control" maxlength="15"/></td>
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
            var md5_password = hex_md5(password1);
            $("#password").val(md5_password);
            return true;
        });
    });
</script>