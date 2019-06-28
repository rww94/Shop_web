<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>

<div class="workingArea">
    <div style="width: 100%;height: 20px;"></div>
    <h1 class="label label-info" >厂商管理</h1>

    <div class="listDataTableDiv" style="margin-top: 100px; margin-left: 50px; margin-right: 50px">
        <table class="table table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>登陆名称</th>
                <th>厂商全称</th>
                <th>信息</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${firms}" var="f">
                <tr>
                    <td>${f.id}</td>
                    <td>${f.name}</td>
                    <td>${f.fullname}</td>
                    <td>${f.message}</td>
                    <td><a deleteLink="true" href="<%=basePath %>/admin/firm_delete?id=${f.id}"><span
                            class=" 	glyphicon glyphicon-trash"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>
</div>

