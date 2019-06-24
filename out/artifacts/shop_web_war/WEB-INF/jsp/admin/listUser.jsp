<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>
<script type="text/javascript">
    <c:if test="${!empty message}">
    alert('${message}')

    </c:if>
</script>
<div class="workingArea">
    <div style="width: 100%;height: 20px;"></div>
    <h1 class="label label-info" >用户管理</h1>

    <div class="listDataTableDiv" style="margin-top: 100px; margin-left: 50px; margin-right: 50px">
        <table class="table table-bordered table-hover  table-condensed">
            <thead>
                <tr class="success">
                    <th>ID</th>
                    <th>用户名称</th>
                    <th>性别</th>
                    <th>电话</th>
                    <th>住址</th>
                    <th>邮箱</th>
                    <th>删除</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.name}</td>
                        <td>${u.sex}</td>
                        <td>${u.telephone}</td>
                        <td>${u.address}</td>
                        <td>${u.email}</td>
                        <td><a deleteLink="true" href="<%=basePath %>/admin/user_delete?id=${u.id}"><span
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

