<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品详情</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/detail.js"></script>
</head>
<body>
<%--包含头部菜单--%>
<jsp:include page="head.jsp"></jsp:include>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>
<input type="hidden" id="uid" value="${sesUser.id}">
<input type="hidden" id="pid" value="${product.id}">
<c:if test="${empty product}">
    <h2 class="text-center" style="color: #b0b0b0">未有该商品的数据!</h2>
</c:if>
<c:if test="${!empty product}">
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
                            <img src="${product.image}" alt="">
                        </div>
                        <div class="item">
                            <img src="/WoniuShop/images/goods/2.jpg" alt="">
                        </div>
                        <div class="item">
                            <img src="/WoniuShop/images/goods/3.jpg" alt="">
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#showImg" role="button" data-slide="prev"
                       style="background:none;">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#showImg" role="button" data-slide="next"
                       style="background:none;">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

            <!--商品详情区域-->
            <c:if test="${ product.status==1}">
                <h2 class="text-center" style="color: #b0b0b0">抱歉,该商品已下架</h2>
            </c:if>
            <c:if test="${ product.status==0}">
                <div class="col-md-7 detail" style="height: 500px;">
                    <div class="row" style="padding-left: 15px">
                        <span class="title">${product.pname}</span>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                                <%-- <span class="activity">「火爆抢购中，最高享24期免息，低至221元起/期；加149元得199元55W立式风冷无线充；加69元得皮革保护壳」</span>--%>
                            <span class="info">${product.pinfo} </span>
                        </div>
                    </div>

                    <div class="row">
                        <c:if test="${empty product.details}">
                            <span class="price">￥${product.price}</span>
                        </c:if>
                        <c:if test="${!empty product.details}">
                            <span class="price">￥${product.price}</span>
                        </c:if>
                    </div>

                    <div class="row">
                        <div style="font-size: 16px;margin: 5px">选择款式：</div>
                        <div class="col-md-6 text-center">
                            <div class="row rule" id="style" style="height: 84px">
                                <c:if test="${!empty product.details}">
                                    <%--        <div class="col-md-5 table-bordered active">陶瓷黑</div>--%>
                                    <c:forEach var="detail" items="${product.details}">
                                        <div class="col-md-5 table-bordered">${detail.style}</div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty product.details}">
                                    <div class="col-md-5 table-bordered">崭新出厂</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div style="font-size: 16px;margin: 5px">选择图案:</div>
                        <div class="col-md-6 text-center">
                            <div class="row rule" id="edition" style="height: 84px">
                                <c:if test="${!empty product.details}">
                                    <%--                        <div class="col-md-5 table-bordered active">陶瓷黑</div>--%>
                                    <c:forEach var="detail" items="${product.details}">
                                        <div class="col-md-5 table-bordered">${detail.edition}</div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty product.details}">
                                    <div class="col-md-5 table-bordered">崭新出厂</div>
                                </c:if>

                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 20px">
                        数量：<input type="number" min="1" max="${product.stock}" value="1" class="text-center" id="num">&nbsp;&nbsp;
                        库存（<span id="stock" style="color: red">${product.stock}</span>）件
                        销量（<span id="sale" style="color: red">${product.sale}</span>）件
                    </div>

                    <div class="option">
                        <div class="shopcart" id="addShopCart">加入购物车</div>
                        <div class="buy" id="buyNow">立即购买</div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</c:if>


</body>
</html>
