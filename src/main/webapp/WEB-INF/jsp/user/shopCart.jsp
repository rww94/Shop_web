<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/fore/top_nosearch.jsp"%>

<title>购物车</title>
<div class="cartDiv">
    <div class="cartTitle pull-right">
    </div>
    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
            <tr>
                <th class="selectAndImage">
                    <img selectit="false" class="selectAllItem" src="../images/site/cartNotSelected.png">
                    全选
                </th>
                <th>商品信息</th>
                <th>单价</th>
                <th>数量</th>
                <th width="120px">金额</th>
                <th class="operation">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${shopCarts}" var="oi">
                <tr oiid="${oi.id}" class="cartProductItemTR">
                    <td>
                        <img selectit="false" oiid="${oi.id}" class="cartProductItemIfSelected" src="../images/site/cartNotSelected.png">
                        <a style="display:none" href="#nowhere"><img src="../images/site/cartSelected.png"></a>
                        <img class="cartProductImg"  src="../images/productSingle/${oi.product.image}.jpg">
                    </td>
                    <td>
                        <div class="cartProductLinkOutDiv">
                            <a href="<%=basePath%>/fore/foreproduct?pid=${oi.product.id}" class="cartProductLink">${oi.product.name}</a>
                        </div>
                    </td>
                    <td>
                        <span  class="cartProductItemPromotionPrice">￥${oi.product.now_price}</span>

                    </td>
                    <td>
                         <span pid="${oi.product.id}" oiid="${oi.id}" class="orderItemNumberSetting">${oi.number}</span>
                    </td>
                    <td >
							<span class="cartProductItemSmallSumPrice" oiid="${oi.id}" pid="${oi.product.id}" >
							￥<fmt:formatNumber type="number" value="${oi.product.now_price*oi.number}" minFractionDigits="2"/>
							</span>
                    </td>
                    <td>
                        <a deleteLink="true" href="shopcart_delete?id=${oi.id}"><span>删除</span></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="cartFoot">
        <span></span>

        <div class="pull-right">
            <span></span>

            <span>已选商品合计: </span>
            <span class="cartSumPrice" >￥0.00</span>
            <button class="createOrderButton" disabled="disabled" >结  算</button>
        </div>
    </div>
</div>

<script>
    $(function(){
        $("img.cartProductItemIfSelected").click(function(){
            var selectit = $(this).attr("selectit")
            if("selectit" == selectit){
                $(this).attr("src","../images/site/cartNotSelected.png");
                $(this).attr("selectit","false")
                $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
            }
            else{
                $(this).attr("src","../images/site/cartSelected.png");
                $(this).attr("selectit","selectit")
                $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
            }
            syncSelect();
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();
        });
        $("img.selectAllItem").click(function(){
            var selectit = $(this).attr("selectit")
            if("selectit"==selectit){
                $("img.selectAllItem").attr("src","../images/site/cartNotSelected.png");
                $("img.selectAllItem").attr("selectit","false")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","../images/site/cartNotSelected.png");
                    $(this).attr("selectit","false");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
                });
            }
            else{
                $("img.selectAllItem").attr("src","../images/site/cartSelected.png");
                $("img.selectAllItem").attr("selectit","selectit")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","../images/site/cartSelected.png");
                    $(this).attr("selectit","selectit");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
                });
            }
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();

        });

        $("button.createOrderButton").click(function(){
            var params = "";
            $(".cartProductItemIfSelected").each(function(){
                if("selectit"==$(this).attr("selectit")){
                    var oiid = $(this).attr("oiid");
                    params += "&oiid="+oiid;
                }
            });
            params = params.substring(1);
            location.href="../fore/foreCartbuy?"+params;
        });

    })
    function syncCreateOrderButton(){
        var selectAny = false;
        $(".cartProductItemIfSelected").each(function(){
            if("selectit"==$(this).attr("selectit")){
                selectAny = true;
            }
        });
        if(selectAny){
            $("button.createOrderButton").css("background-color","#C40000");
            $("button.createOrderButton").removeAttr("disabled");
        }
        else{
            $("button.createOrderButton").css("background-color","#AAAAAA");
            $("button.createOrderButton").attr("disabled","disabled");
        }

    }
    function syncSelect(){
        var selectAll = true;
        $(".cartProductItemIfSelected").each(function(){
            if("false"==$(this).attr("selectit")){
                selectAll = false;
            }
        });

        if(selectAll)
            $("img.selectAllItem").attr("src","../images/site/cartSelected.png");
        else
            $("img.selectAllItem").attr("src","../images/site/cartNotSelected.png");

    }

    function calcCartSumPriceAndNumber(){
        var sum = 0;
        var totalNumber = 0;
        $("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
            var oiid = $(this).attr("oiid");
            var price =$(".cartProductItemSmallSumPrice[oiid="+oiid+"]").text();
            price = price.replace(/,/g, "");
            price = price.replace(/￥/g, "");
            sum += new Number(price);

            var num =$(".orderItemNumberSetting[oiid="+oiid+"]").val();
            totalNumber += new Number(num);

        });

        $("span.cartSumPrice").html("￥"+formatMoney(sum));
        $("span.cartTitlePrice").html("￥"+formatMoney(sum));
        $("span.cartSumNumber").html(totalNumber);
    }
    function formatMoney(num){
        num = num.toString().replace(/\$|\,/g,'');
        if(isNaN(num))
            num = "0";
        sign = (num == (num = Math.abs(num)));
        num = Math.floor(num*100+0.50000000001);
        cents = num%100;
        num = Math.floor(num/100).toString();
        if(cents<10)
            cents = "0" + cents;
        for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
            num = num.substring(0,num.length-(4*i+3))+','+
                num.substring(num.length-(4*i+3));
        return (((sign)?'':'-') + num + '.' + cents);
    }
</script>

