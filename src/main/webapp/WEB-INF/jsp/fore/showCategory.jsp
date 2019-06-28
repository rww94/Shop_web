<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/fore/top.jsp"%>

<div id="category">
    <div class="categoryPageDiv">

        <c:if test="${empty param.categorycount}">
            <c:set var="categorycount" scope="page" value="100"/>
        </c:if>

        <c:if test="${!empty param.categorycount}">
            <c:set var="categorycount" scope="page" value="${param.categorycount}"/>
        </c:if>

        <div class="categoryProducts">
            <c:forEach items="${products}" var="p" varStatus="stc">
                <c:if test="${stc.count<=categorycount}">
                    <div class="productUnit" price="${p.now_price}">
                            <a href="foreproduct?pid=${p.id}">
                                <img class="productImage" src="../images/productSingle/${p.image}.jpg">
                            </a>
                            <span class="productPrice">¥<fmt:formatNumber type="number" value="${p.now_price}" minFractionDigits="2"/></span>
                            <a class="productLink" href="foreproduct?pid=${p.id}">
                                    ${fn:substring(p.name, 0, 50)}
                            </a>
                        </div>
                </c:if>
            </c:forEach>

            <c:if test="${empty products}">
            <div class="noMatch">该分类下暂时没有产品</div>
                </c:if>

            <div style="clear:both"></div>
        </div>
            <c:if test="${!empty products}">
                <div class="pageDiv">
                    <%@include file="../include/admin/adminPage.jsp" %>
                </div>
            </c:if>
    </div>
</div>
