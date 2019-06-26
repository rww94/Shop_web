<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<div class="workingArea">

    <ol class="breadcrumb">
        <li><a href="category_list">所有分类</a></li>
        <li class="active">商品列表</li>
    </ol>

    <div class="listDataTableDiv" style="width: 1000px">
        <table
                class="table table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>商品名称</th>
                <th>原价</th>
                <th>优惠价</th>
                <th>库存</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td><img width="40px" src="../images/productSingle/${p.image}.jpg"></td>
                    <td>${p.name}</td>
                    <td>${p.original_price}</td>
                    <td>${p.now_price}</td>
                    <td>${p.stock_number}</td>
                    <td><a href="product_edit?id=${p.id}"><span>编辑</span></a></td>
                    <td><a deleteLink="true" href="product_delete?pid=${p.id}"><span>删除</span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>

</div>
