<%@ page import="com.woniuxy.entity.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%--设置根路径--%>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":"
                + request.getServerPort() + request.getContextPath() + "/";
    %>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>蜗牛商城</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="js/index.js"></script>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

<jsp:include page="head.jsp"/>
<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>

<!--订单详情-->
<div class="container order">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 addr">
            <div class="logo col-md-2">
                <span class="glyphicon glyphicon-map-marker"></span>
            </div>
            <div class="info col-md-10">
                <p>
                    <span class="name">张飞</span>
                    <span class="mobile">18817384287</span>
                </p>
                <p>上海市浦东新区燕乔大厦15楼蜗牛学院前台</p>
                <p class="msg">收货不便时，可选择暂存服务</p>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>