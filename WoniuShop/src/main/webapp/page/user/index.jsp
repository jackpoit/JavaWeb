<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <% String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>蜗牛商城</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/index.js"></script>
</head>
<body>

<%--包含头部菜单--%>
<jsp:include page="head.jsp"></jsp:include>

<!--菜单栏-->
<jsp:include page="menu.jsp"></jsp:include>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>

<!-- 轮播区域-->
<div class="container">
    <div class="row">
        <div class="col-md-2 bg-danger aside">
            <ul class="nav text-center">
                <li><a href="">手机 电话卡</a></li>
                <li><a href="">电视 盒子</a></li>
                <li><a href="">笔记本 显示器</a></li>
                <li><a href="">家电 插线板</a></li>
                <li><a href="">出行 穿戴</a></li>
                <li><a href="">智能 路由器</a></li>
                <li><a href="">电源 配件</a></li>
                <li><a href="">健康 儿童</a></li>
            </ul>
        </div>
        <div class="col-md-10" style="height: 360px;padding-left: 0px; padding-right: 0px">
            <!--轮播插件-->
            <div class="carousel" id="adv" data-ride="carousel" data-interval="2000">
                <!--1. 定义轮播指针【小圆点】-->
                <ol class="carousel-indicators">
                    <li data-target="#adv" data-slide-to="0" class="active"></li>
                    <li data-target="#adv" data-slide-to="1"></li>
                    <li data-target="#adv" data-slide-to="2"></li>
                    <li data-target="#adv" data-slide-to="3"></li>
                </ol>

                <!--2.定义若干轮播项 item-->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="images/csgo/title01.png" alt="">
                    </div>
                    <div class="item">
                        <img src="images/csgo/title02.png" alt="">
                    </div>
                    <div class="item">
                        <img src="images/csgo/title03.png" alt="">
                    </div>
                    <div class="item">
                        <img src="images/csgo/title04.png" alt="">
                    </div>
                </div>
                <!--3. 轮播的翻页：上一页和下一页-->
                <a href="#adv" class="carousel-control left" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a href="#adv" class="carousel-control right" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12 bg-primary adv">
            <img src="images/csgo/banner1.jpg" width="100%">
        </div>
    </div>
</div>

<!--精选商品-->
<div class="container">
    <h3 style="line-height: 40px;">精选商品</h3>
    <!--热门商品展示区-->
    <div class="row" id="primeProduct">

    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12 bg-primary adv">
            <img src="images/csgo/banner2.jpg" width="100%">
        </div>
    </div>
</div>


<!-- 热销商品-->
<div class="container">
    <h3 style="line-height: 40px;">热销商品</h3>
    <!--热门商品展示区-->
    <div class="row" id="saleProduct">

    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12 bg-primary adv">
            <img src="images/csgo/banner3.jpg" width="100%">
        </div>
    </div>
</div>

<!--步枪-->
<div class="container">
    <h3 style="line-height: 40px;">精选步枪</h3>
    <!--热门商品展示区-->
    <div class="row" id="gunProduct">

    </div>
</div>
<div class="container">
    <h3 style="line-height: 40px;">杂项</h3>
    <!--热门商品展示区-->
    <div class="row" id="itemProduct">

    </div>
</div>
</body>
</html>
