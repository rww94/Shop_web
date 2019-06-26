<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; %>

<link rel="stylesheet" href="../css/forehome/style.css" />
<javastr>

</javastr>
<nav class="top">
    <a href="<%=basePath %>/fore/foreHome">
        <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
        商城首页
    </a>

    <c:if test="${!empty user}">
        <a href="<%=basePath %>/user/information">${user.name}</a>
        <a href="<%=basePath %>/user/logout">退出</a>
    </c:if>

    <c:if test="${empty user}">
        <a href="<%=basePath %>/user/Login">请登录</a>
        <a href="<%=basePath %>/user/Register">免费注册</a>
    </c:if>

    <span class="pull-right">
                <a href="<%=basePath %>/user/userOrder">我的订单</a>
                <a href="forecart">
                <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
                购物车<strong>${cartTotalItemNumber}</strong>件</a>
        </span>
</nav>

<form action="foresearch" method="post" >
    <div class="searchDiv">
        <input name="keyword" type="text">
        <button  type="submit" class="searchButton">搜索</button>
        <div class="searchBelow">
            <c:forEach items="${categories}" var="c" varStatus="st">
                <c:if test="${st.count>=1 and st.count<=4}">
                            <span>
                                <a href="forecategory?cid=${c.id}">
                                        ${c.name}
                                </a>
                                <c:if test="${st.count!=4}">
                                    <span>|</span>
                                </c:if>
                            </span>
                </c:if>
            </c:forEach>
        </div>
    </div>
</form>