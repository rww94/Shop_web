<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/fore/top_nosearch.jsp"%>

<script>
    var deleteOrder = false;
    var deleteOrderid = 0;

    $(function(){
        $("a[orderStatus]").click(function(){
            var orderStatus = $(this).attr("orderStatus");
            if('all'==orderStatus){
                $("table[orderStatus]").show();
            }
            else{
                $("table[orderStatus]").hide();
                $("table[orderStatus="+orderStatus+"]").show();
            }

            $("div.orderType div").removeClass("selectedOrderType");
            $(this).parent("div").addClass("selectedOrderType");
        });
    });

</script>

<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a orderStatus="all" href="#nowhere">所有订单</a></div>
        <div><a  orderStatus="waitPay" href="#nowhere">待付款</a></div>
        <div><a  orderStatus="waitConfirm" href="#nowhere">待确认</a></div>
        <div><a  orderStatus="refuse" href="#nowhere">已拒绝</a></div>
        <div><a  orderStatus="finish" href="#nowhere">已确认</a></div>
        <div class="orderTypeLastOne" style="padding-top: 22px"><a class="noRightborder"> </a></div>
    </div>
    <div style="clear:both"></div>
    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tr>
                <td>商品</td>
                <td width="100px">单价</td>
                <td width="100px">数量</td>
                <td width="120px">实付款</td>
                <td width="100px">订单状态</td>
            </tr>
        </table>
    </div>

    <div class="orderListItem">
        <c:forEach items="${orders}" var="o">
            <table class="orderListItemTable" orderStatus="${o.status}" oid="${o.id}">
                <tr class="orderListItemFirstTR">
                    <td colspan="2">
                        <b>创建时间: <fmt:formatDate value="${o.create_date}" pattern="yyyy-MM-dd HH:mm:ss"/></b>

					</span>
                    </td>
                    <td  colspan="3"><span>订单号:${o.orderCode}</td>
                    <td  colspan="4"></td>
                    </td>
                </tr>
                <c:forEach items="${o.orderItemList}" var="oi" varStatus="st">
                    <tr class="orderItemProductInfoPartTR" >
                        <td class="orderItemProductInfoPartTD"><img width="80" height="80" src="../images/productSingle/${oi.product.image}.jpg"></td>
                        <td class="orderItemProductInfoPartTD">
                                    <a href="<%=basePath%>/fore/foreproduct?pid=${oi.product.id}">${oi.product.name}</a>
                        </td>
                        <td  class="orderItemProductInfoPartTD" width="100px">
                            <div class="orderListItemProductPrice">￥<fmt:formatNumber type="number" value="${oi.product.now_price}" minFractionDigits="2"/></div>
                        </td>
                        <c:if test="${st.count==1}">
                            <td valign="top" rowspan="${fn:length(o.orderItemList)}" class="orderListItemNumberTD orderItemOrderInfoPartTD" width="100px">
                                <span class="orderListItemNumber">${o.productNumber}</span>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItemList)}" width="120px" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
                                <div class="orderListItemProductRealPrice">￥<fmt:formatNumber  minFractionDigits="2"  maxFractionDigits="2" type="number" value="${o.totalPrice}"/></div>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItemList)}" class="orderListItemButtonTD orderItemOrderInfoPartTD" width="100px">
                                <c:if test="${o.status=='waitPay' }">
                                    <span>待付款</span><br/>
                                    <a href="<%=basePath%>/fore/forealipay?orderId=${o.id}&totalPrice=${o.totalPrice}">
                                        <button class="orderListItemConfirm">付款</button>
                                    </a>
                                </c:if>
                                <c:if test="${o.status=='waitConfirm' }">
                                    <span>已付款</span><br/>
                                    <span>等待商家确认</span>
                                </c:if>
                                <c:if test="${o.status=='refuse' }">
                                    <span>商家已拒绝</span>
                                </c:if>
                                <c:if test="${o.status=='finish' }">
                                    <span>商家已确认</span>
                                </c:if>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>

            </table>
        </c:forEach>
    </div>


</div>

