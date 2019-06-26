<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<script>
    $(function(){
        $("#editForm").submit(function(){
            var password1 = $("#password").val();
            var password2 = $("#password-confirm").val();
            if (password1.length == 0){
                alert("密码不能为空!")
                return false;
            }
            if (password1 != password2){
                alert("两次密码不一致!")
                return false;
            }

            var msg = "确认修改密码吗?\n请确认！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
            return true;
        });
    });
</script>

<div class="workingArea">

    <br/>
    <br/>
    <div class="panel panel-warning editDiv">
        <div class="panel-heading">修改密码</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="<%=basePath%>/user/editPassword">
                <table class="editTable">
                    <tr>
                        <td>密码:</td>
                        <td><input  id="password" name="password" type="password" class="form-control"/></td>
                    </tr>
                    <tr>
                        <td>确认密码:</td>
                        <td><input  id="password-confirm" name="password-confirm" type="password" class="form-control"/></td>
                    </tr>
                    <tr><td>&nbsp;&nbsp;</td></tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="${u.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
