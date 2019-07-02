
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<div class="workingArea">
    <br>
    <br>
    <h1 class="label label-info" >订单管理</h1>
    <br>
    <br>
    <div class="listDataTableDiv" style="margin-top: 20px; margin-left: 0px; margin-right: 50px">
        <table class="table table-bordered table-hover1  table-condensed">
            <thead>
            <tr class="success" >
                <th width="80px" style="text-align: center">ID</th>
                <th width="100px" style="text-align: center">状态</th>
                <th width="120px" style="text-align: center">总金额</th>
                <th width="100px" style="text-align: center">买家名称</th>
                <th style="text-align: center">收货地址</th>
                <th width="110px" style="text-align: center">创建时间</th>
                <th width="120px" style="text-align: center">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="o">
                <tr>
                    <td align="center">${o.id}</td>
                    <td align="center">${o.statusChange()}</td>
                    <td align="center">￥<fmt:formatNumber type="number" value="${o.totalPrice}" minFractionDigits="2"/></td>
                    <td align="center">${o.user.name}</td>
                    <td align="center">${o.user.address}</td>
                    <td align="center"><fmt:formatDate value="${o.create_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td style="width:200px;"align="center">
                        <c:if test="${o.status=='waitConfirm'}">
                            <a  href="updateOrderStatus?orderId=${o.id}&orderStatus=confirmed">
                                <button  style="width: 60px" class="orderPageCheckOrderItems btn btn-primary btn-xs">接受</button>
                            </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="updateOrderStatus?orderId=${o.id}&orderStatus=refused">
                                <button style="width: 60px" class="orderPageCheckOrderItems btn btn-primary btn-xs">拒绝</button>
                            </a><br/><br/>
                        </c:if>
                        <button oid=${o.id} class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button>
                    </td>
                </tr>
                <tr class="orderPageOrderItemTR"  oid=${o.id}>
                    <td colspan="10" align="center">

                        <div  class="orderPageOrderItem">
                            <table width="1000px" align="center" class="orderPageOrderItemTable">
                                <c:forEach items="${o.orderItemList}" var="oi">
                                    <tr>
                                        <td align="left">
                                            <img width="40px" height="40px" src="../images/productSingle/${oi.product.image}.jpg">
                                        </td>
                                        <td>
                                                <span>${oi.product.name}</span>
                                            </a>
                                        </td>
                                        <td align="right">
                                            <span class="text-muted">${oi.number}个</span>
                                        </td>
                                        <td align="right">
                                            <span class="text-muted">单价：￥${oi.product.now_price}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <c:if test="${empty orders}">
        <div class="noMatch">暂时没有满足条件的订单</div>
    </c:if>
    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>
</div>

<script>
    $(".orderPageCheckOrderItems").click(function(){
        var value = $(this).text()
        if(value!='查看详情'){
            var msg = '是否'+value+'?';
            if(confirm(msg)){
                return true;
            }else{
                return false;
            }
        }
    });

    $(function(){
        $("tr.orderPageOrderItemTR").hide();
        $("button.orderPageCheckOrderItems").click(function(){
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
        });
    });
</script>
