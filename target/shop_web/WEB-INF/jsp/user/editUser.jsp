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
            var msg = "确认修改信息吗?\n请确认！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
            return true;
        });
    });
    $(document).ready(function(){
        var key=$("#selectRefundReason").val();
        if(key==null){
            key="";
        }
        //根据值让option选中
        $("#sex option[value='"+key+"']").attr("selected","selected");
    });
</script>

<div class="workingArea">
    <br/>
    <br/>
    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑用户信息</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="<%=basePath%>/user/editUser">
                <table class="editTable">
                    <tr>
                        <td>用户名:</td>
                        <td><input  id="name" name="name" type="text" class="form-control" value="${u.name}" readonly unselectable="on"/></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <input type="hidden" id ="selectRefundReason" value="${u.sex}"/>
                        <td><select name="sex" id="sex" class="form-control">
                            <option value="">保密</option>
                            <option value="男">男士</option>
                            <option value="女">女士</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>请输入电话:</td>
                        <td><input  id="telephone" name="telephone" type="text" class="form-control" maxlength="15" value="${u.telephone}"/></td>
                    </tr>
                    <tr>
                        <td>请输入地址:</td>
                        <td><input  id="address" name="address" type="text" class="form-control" maxlength="15" value="${u.address}"/></td>
                    </tr>
                    <tr>
                        <td>请输入邮箱:</td>
                        <td><input  id="email" name="email" type="text" class="form-control" maxlength="15"/></td>
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
