<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/back/style.css">

<div class="container" style="margin-right: 100px">
    <div style="width: 100%;height: 20px;"></div>
    <table class="table table-bordered table-hover  table-condensed">
        <caption>分类列表</caption>
        <thead>
            <tr class="success">
                <th>ID</th>
                <th>类别</th>
                <th>商品管理</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${cs}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td><a href="product_list?cid=${c.id}">商品管理</a></td>
                    <td><a href="category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="category_delete?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>

</div>



