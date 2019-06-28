<%@ page import="com.shop.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/fore/top_nosearch.jsp"%>
<div class="aliPayPageDiv">
    <div>
        <span class="confirmMoneyText">扫一扫付款（元）</span>
        <span class="confirmMoney">
		￥<fmt:formatNumber type="number" value="${param.totalPrice}" minFractionDigits="2"/></span>
    </div>
    <div>
        <img style="width: 300px; height: 400px" class="aliPayImg" src="../images/site/alipay.jpg">
    </div>

    <div>
        <button class="confirmPay">确认支付</button>
    </div>

</div>

<div class="modal " id="loginModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog loginDivInProductPageModalDiv">
        <div class="modal-content">
            <div class="loginDivInProductPage">
                <div class="loginErrorMessageDiv">
                    <div class="alert alert-danger" >
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>

                <div class="login_acount_text">支付登录</div>
                <div class="loginInput " >
                                <span class="loginInputIcon ">
                                    <span class=" glyphicon glyphicon-user"></span>
                                </span>
                    <input id="name" name="name" placeholder="会员名" type="text">
                </div>

                <div class="loginInput " >
                                <span class="loginInputIcon ">
                                    <span class=" glyphicon glyphicon-lock"></span>
                                </span>
                    <input id="password" name="password"  type="password" placeholder="密码">
                </div>
                <div style="margin-top:20px">
                    <button class="btn btn-block redButton loginSubmitButton" type="submit">登录</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(".confirmPay").click(function(){
        $("#loginModal").modal('show');
    });
    $("button.loginSubmitButton").click(function(){
        var name = $("#name").val();
        var password = $("#password").val();

        if(0==name.length||0==password.length){
            $("span.errorMessage").html("请输入账号密码");
            $("div.loginErrorMessageDiv").show();
            return false;
        }
        var page = "../user/foreloginAjax";
        $.post(
            page,
            {"name":name,"password":password},
            function(result){
                if("success"==result){
                    self.location.href="forepay?orderId=${param.orderId}&totalPrice=${param.totalPrice}"
                }
                else{
                    $("span.errorMessage").html("账号密码错误");
                    $("div.loginErrorMessageDiv").show();
                }
            }
        );

        return true;
    });
</script>

