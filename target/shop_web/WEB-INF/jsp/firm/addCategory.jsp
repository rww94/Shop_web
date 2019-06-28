<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.shop.pojo.Firm" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    Firm firm = (Firm)session.getAttribute("firm");
%>

<link rel="stylesheet" type="text/css" href="../css/back/style.css">

<div class="panel panel-warning addDiv" style="margin-top: 100px; margin-left: 50px; margin-right: 50px">
    <div class="panel-heading">新增分类</div>
    <div class="panel-body">
        <form id="addForm" action="<%=basePath%>/firm/category_add" method="post">
            <table class="addTable">
                <tr>
                    <td>分类名称:</td>
                    <td><input  id="name" name="name" type="text" class="form-control"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input  id="fid" name="fid" type="text" value="<%=firm.getId()%>" class="form-control" style="display: none"/></td>
                </tr>
                <br/>
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
            if(!checkEmpty("name","分类名称"))
                return false;
            var msg = "确认添加分类吗?\n请确认！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
            return true;
        });
    });
</script>
