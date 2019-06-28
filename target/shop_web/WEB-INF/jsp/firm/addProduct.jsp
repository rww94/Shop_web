
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<br/>
<br/>
<br/>
<br/>
<div class="panel panel-warning addDiv">
    <div class="panel-heading">新增产品</div>
    <div class="panel-body">
        <form method="post" id="addForm" action="<%=basePath%>/firm/product_add">
            <table class="addTable">
                <tr>
                    <td>产品名称：</td>
                    <td><input id="name" name="name" type="text"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>原价格：</td>
                    <td><input value="99.98" name="original_price" type="text"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>优惠价格：</td>
                    <td><input id="now_price"  value="19.98" name="now_price" type="text"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>库存：</td>
                    <td><input id="stock_number"  value="99" name="stock_number" type="text"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>详细信息：</td>
                    <td><input id="message" name="message" type="text"
                               class="form-control"></td>
                </tr>
                <tr>
                    <td>图片上传</td>
                    <td><input type="file" name="file"></td>
                </tr>
                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <input type="hidden" name="cid" value="${c.id}">
                        <button type="submit" class="btn btn-success">提 交</button>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>