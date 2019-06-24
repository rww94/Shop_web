<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<script>
    function checkEmpty(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }

    function checkNumber(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        if(isNaN(value)){
            alert(name+ "必须是数字");
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }

    function checkInt(id, name){
        var value = $("#"+id).val();
        if(value.length==0){
            alert(name+ "不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        if(parseInt(value)!=value){
            alert(name+ "必须是整数");
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }

    $(function(){
        $("a").click(function(){
            var deleteLink = $(this).attr("deleteLink");
            console.log(deleteLink);
            if("true"==deleteLink){
                var confirmDelete = confirm("确认要删除");
                if(confirmDelete)
                    return true;
                return false;

            }
        });
    })
</script>
<%@include file="../include/fore/top.jsp"%>
<link rel="stylesheet" href="../css/fore/style.css" type="text/css" />

    <div class="homepageDiv">
        <%@include file="../include/fore/categoryAndCarousel.jsp"%>
        <%@include file="../include/fore/homePageCategoryProducts.jsp"%>
    </div>

    <footer role="contentinfo" style="margin-left: 200px">

        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3>购物指南</h3>
                    <ul class="list-unstyled">
                        <li><a>服务商信息</a></li>
                        <li><a>购买流程</a></li>
                        <li><a>注册登录</a></li>
                        <li><a>支付方式</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h3>配送方式</h3>
                    <ul class="list-unstyled">
                        <li><a>配送方式</a></li>
                        <li><a>配送方式信息</a></li>
                        <li><a>签收原则</a></li>
                        <li><a>物流查询 </a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h3>售后服务</h3>
                    <ul class="list-unstyled">
                        <li><a>订单发票</a></li>
                        <li><a>手机频道</a></li>
                        <li><a>售后政策总则</a></li>
                        <li><a>手机售后政策总则</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>
