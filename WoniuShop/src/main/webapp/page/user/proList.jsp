<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <% String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品展示</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/index.css">

</head>
<body>
<%--包含头部菜单--%>
<jsp:include page="head.jsp"></jsp:include>

<!--菜单栏-->
<jsp:include page="menu.jsp"></jsp:include>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>

<!--查询商品展示区-->
<div class="container">
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
    <div class="row text-center">
        <ul class="pagination">
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