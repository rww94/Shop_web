<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/fore/top_nosearch.jsp"%>
<div class="payedDiv">
    <div class="payedTextDiv">
        <img src="../images/site/paySuccess.png">
        <span>您已成功付款</span>
    </div>
    <div class="payedAddressInfo">
        <ul>
            <li>收货地址：${order.address} ${order.receiver} ${order.mobile }</li>
            <li>实付款：<span class="payedInfoPrice">
			￥<fmt:formatNumber type="number" value="${param.totalPrice}" minFractionDigits="2"/>
            </li>
        </ul>

<%--        <div class="paedCheckLinkDiv">--%>
<%--            您可以--%>
<%--            <a class="payedCheckLink" href="forebought">查看交易详情 </a>--%>
<%--        </div>--%>

    </div>
    <div class="payedSeperateLine">
    </div>
</div>
