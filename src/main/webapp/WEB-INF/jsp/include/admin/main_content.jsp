<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Date date = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss");
    String today = df.format(date);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>桌面</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>

<body>
<div class="container-fluid">
    <h3 style="text-align:center;">当前管理员:&nbsp;&nbsp;
        <font color="red"><%= session.getAttribute("admin")%></font>&nbsp;&nbsp;<br/><br/>
        登录时间:&nbsp;&nbsp;<font color="red"><%=today %></font></h3>

</div>
</body>
</html>
