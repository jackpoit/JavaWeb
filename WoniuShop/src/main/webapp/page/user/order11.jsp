<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <% String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
</head>
<body>

<%--包含头部菜单--%>
<jsp:include page="head.jsp"></jsp:include>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>

<!--订单详情-->
<div class="container order">
    <div class="col-md-6 col-md-offset-3" style="margin-bottom: 20px">
        <h2 >请选择地址:</h2>
    </div>
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

</body>
</html>