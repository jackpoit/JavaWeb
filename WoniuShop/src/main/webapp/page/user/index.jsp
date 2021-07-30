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

<!--菜单栏-->
<div class="container" style="margin-top:60px; line-height: 100px;">
    <div class="col-md-1" style="margin-top: 25px;">
        <img src="images/logo.jpg" width="100px" height="50px" alt="">
    </div>
    <div class="col-md-8" style="line-height: 80px;">
        <ul class="nav nav-justified">
            <li><a href="">蜗牛手机</a></li>
            <li><a href="">蜗牛Plus</a></li>
            <li><a href="">电视</a></li>
            <li><a href="">笔记本</a></li>
            <li><a href="">家电</a></li>
            <li><a href="">路由器</a></li>
            <li><a href="">智能硬件</a></li>
            <li><a href="">服务</a></li>
        </ul>
    </div>
    <div class="col-md-3" style="padding: 0">
        <form action="" class="form-inline">
            <div class="form-group">
                <label class="sr-only" for="kw">关键词</label>
                <input type="text" class="form-control" id="kw" name="keyword" style="height: 40px">
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-primary" style="height: 40px"
                        onclick="$('#loginModal').modal('show')">
                    搜索
                </button>
            </div>

        </form>
    </div>
</div>

<!--分割线-->
<hr>

<!-- 轮播区域-->
<div class="container">
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
    <div class="col-md-10" style="height: 360px;margin-left: -15px">
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
                    <img src="images/bg1.png" alt="">
                </div>
                <div class="item">
                    <img src="images/bg2.webp" alt="">
                </div>
                <div class="item">
                    <img src="images/bg3.webp" alt="">
                </div>
                <div class="item">
                    <img src="images/bg4.webp" alt="">
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

<!--热门商品-->
<div class="container">
    <h3 style="line-height: 50px;">热门商品</h3>
    <!--热门商品展示区-->
    <div class="row">
        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="images/p1.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="images/p2.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="images/p3.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="images/p4.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="images/p5.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="images/p6.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="images/p1.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>
    </div>
    <!--分页导航条-->
    <div class="row">
        <ul class="pager">
            <li><a href="">上一页</a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li><a href="">5</a></li>
            <li><a href="">下一页</a></li>
        </ul>
    </div>
</div>


</body>
</html>
