<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <title>商品详情</title>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <script src="bootstrap/js/jquery-3.5.1.js"></script>
  <script src="bootstrap/js/bootstrap.js"></script>
  <script type="text/javascript" src="js/detail.js"></script>
</head>
<body>
<jsp:include page="head.jsp"/>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>

<!--商品的展示区-->
<div class="container" style="margin-top: 100px">
  <div class="row">
    <!--商品的轮播图区域-->
    <div class="col-md-5" style="height: 500px;">
      <div id="showImg" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="imges/goods/1.jpg" alt="">
          </div>
          <div class="item">
            <img src="imges/goods/2.jpg" alt="">
          </div>
          <div class="item">
            <img src="imges/goods/3.jpg" alt="">
          </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#showImg" role="button" data-slide="prev" style="background:none;">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#showImg" role="button" data-slide="next" style="background:none;">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>

    <!--商品详情区域-->
    <div class="col-md-7 detail" style="height: 500px;">
      <div class="row">
        <span class="title">蜗牛10plus</span>
      </div>

      <div class="row">
        <div class="col-md-12">
          <span class="activity">「火爆抢购中，最高享24期免息，低至221元起/期；加149元得199元55W立式风冷无线充；加69元得皮革保护壳」</span>
          <span class="info"> 120X 超远变焦 / 120W 秒充科技 / 120Hz刷新率 + 240Hz采样率 / 骁龙865旗舰处理器 / 双模5G / 10倍光学变焦 /
                    OIS光学防抖+EIS数字防抖 / 2000万超清前置相机 / 双串蝶式石墨烯基锂离子电池 / 等效4500mAh大电量 / 120W
                       有线秒充+50W无线秒充+10W无线反充 / WiFi 6 / 多功能NFC / 红外遥控</span>
        </div>
      </div>

      <div class="row">
        <span class="price">￥2298.88</span>
      </div>

      <div class="row">
        <div style="font-size: 16px;margin: 5px">选择颜色：</div>
        <div class="col-md-6 text-center">
          <div class="row rule" id="color">
            <div class="col-md-5 table-bordered active">陶瓷黑</div>
            <div class="col-md-5 table-bordered">透明版</div>
            <div class="col-md-5 table-bordered">高贵银</div>
            <div class="col-md-5 table-bordered">土豪金</div>
          </div>
        </div>
      </div>
      <div  class="row">
        <div style="font-size: 16px;margin: 5px">选择版本:</div>
        <div class="col-md-6 text-center">
          <div class="row rule" id="version">
            <div class="col-md-5 table-bordered active">8G+128G</div>
            <div class="col-md-5 table-bordered">8G+256G</div>
            <div class="col-md-5 table-bordered">12G+128G</div>
            <div class="col-md-5 table-bordered">12G+256G</div>
          </div>
        </div>
      </div>
      <div style="margin-top: 20px">
        数量：<input type="number" min="1" max="10" value="1" class="text-center">&nbsp;&nbsp;
        库存（<span>1024</span>）件
      </div>

      <div class="option">
        <div class="shopcart">加入购物车</div>
        <div class="buy">立即购买</div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
