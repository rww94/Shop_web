<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/fore/top_nosearch.jsp"%>


<div class="buyPageDiv">
    <form action="forecreateOrder" method="post">

        <div class="buyFlow">
            <div style="clear:both"></div>
        </div>
        <div class="address">
            <div class="addressTip">输入收货地址</div>
            <div>
                <table class="addressTable">
                    <tr>
                        <td class="firstColumn">详细地址<span class="redStar">*</span></td>

                        <td><textarea id="address" name="address" placeholder="请填写详细收货地址"></textarea></td>
                    </tr>
                    <tr>
                        <td>收货人姓名 <span class="redStar">*</span></td>
                        <td><input  id="receiver" name="receiver" type="text"></td>
                    </tr>
                    <tr>
                        <td>手机号码 <span class="redStar">*</span></td>
                        <td><input id="mobile" name="mobile"  placeholder="请输入11位手机号码" type="text"></td>
                    </tr>
                    <br/>
                    <tr>
                        <td>用户留言 </td>
                        <td><textarea name="message"></textarea></td>
                    </tr>
                    <input type="hidden" name="id" value="${order.id}"/>
                    <input type="hidden" name="orderCode" value="${order.orderCode}"/>
                    <input type="hidden" name="uid" value="${order.uid}"/>
                    <input type="hidden" name="totalPrice" value="${totalPrice}"/>

                </table>

            </div>

        </div>
        <div class="productList">
            <div class="productListTip">确认订单信息</div>

            <table class="productListTable">
                <thead>
                <tr>
                    <th colspan="2" class="productListTableFirstColumn"></th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <tr class="rowborder">
                    <td  colspan="2" ></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </thead>
                <tbody class="productListTableTbody">
                <c:forEach items="${orderItems}" var="oi" varStatus="st" >
                    <tr class="orderItemTR">
                        <td class="orderItemFirstTD"><img class="orderItemImg" src="../images/productSingle/${oi.product.image}.jpg"></td>
                        <td class="orderItemProductInfo">
                            <a  href="foreproduct?pid=${oi.product.id}" class="orderItemProductLink">
                                    ${oi.product.name}
                            </a>
                        </td>
                        <td>
                            <span class="orderItemProductPrice">￥<fmt:formatNumber type="number" value="${oi.price}" minFractionDigits="2"/></span>
                        </td>
                        <td>
                            <span class="orderItemProductNumber">${oi.number}</span>
                        </td>
                        <td><span class="orderItemUnitSum">
						￥<fmt:formatNumber type="number" value="${oi.price*oi.number}" minFractionDigits="2"/>
						</span></td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>

        </div>

        <div class="orderItemTotalSumDiv">
            <div class="pull-right">
                <span>实付款：</span>
                <span class="orderItemTotalSumSpan">￥<fmt:formatNumber type="number" value="${totalPrice}" minFractionDigits="2"/></span>
            </div>
        </div>
        <div class="submitOrderDiv">
            <button type="submit" class="submitOrderButton" onClick="return order()">提交订单</button>
        </div>
    </form>
</div>

<script type="text/javascript">
    function order() {//下单
        var address_value = $("#address").val();
        if (address_value.length == 0) {
            alert("地址不能为空!")
            $("#address")[0].focus();
            return false;
        }
        var receiver_value = $("#receiver").val();
        if (receiver_value.length == 0) {
            alert('收货人不能为空')
            $("#receiver")[0].focus();
            return false;
        }
        var mobile_value = $("#mobile").val();
        var regMobile =/^0?1[3|4|5|8][0-9]\d{8}$/;
        if(!regMobile.test(mobile_value)){
            alert('手机或电话有误')
            $("#mobile")[0].focus();
            return false;
        }
        return true;
    }
</script>