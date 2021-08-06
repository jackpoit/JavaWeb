<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/shopcart.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/order.js"></script>
</head>
<body>
<%--包含头部菜单--%>
<jsp:include page="head.jsp"></jsp:include>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>
<div class="container order">
    <input type="hidden" id="uid" value="${sesUser.id}">

    <div class="row">
        <div class="col-md-2 ">
            <h3>请选择地址:</h3>
        </div>
        <div class="col-md-10 " style="padding: 0" id="add_content">

        </div>

    </div>
</div>


<c:if test="${empty list}">
    <div class="shopcart" >
        <h2 class="text-center" style="color: #b0b0b0">订单为空!</h2>
    </div>
</c:if>
<c:if test="${!empty list}">
    <!--购物车-->
    <div class="shopcart" style="margin-top: 20px">
        <div class="allLabel">
            全部商品
            <span id="s_total"></span>
        </div>
        <!--表格-->

        <div class="box">
            <table>
                <tbody>
                <tr style="height: 45px; background:#e0e0e0;">
                    <td colspan="2" width="130px" style="padding-left:8px">
                        <input type="checkbox" id="all">
                        <label for="all">全选</label>
                    </td>
                    <td colspan="2" width="460px">
                        商品
                    </td>
                    <td width="90px" align="center">单价</td>
                    <td width="100px" align="center">数量</td>
                    <td width="120px" align="center">小计</td>
                    <td width="120px" align="center">操作</td>
                </tr>


                <c:forEach var="map" items="${list}">
                    <tr class="item">
                        <td class="check">
                            <input type="hidden" name="z" value="${map.product.pname}">
                            <input type="checkbox" name="product" value="${map.order.id}">
                        </td>
                        <td class="pimg" onclick='forwardDetails(${map.product.id})'>
                            <img src="${map.product.image}"/>
                        </td>
                        <td class="info" onclick='forwardDetails(${map.product.id})'>
                                ${map.product.pinfo}
                        </td>
                        <td class="size">
                            <p>${map.order.detail}</p>
                        </td>
                        <td class="price">
                            ¥<span>${map.product.price}</span>
                        </td>
                        <td class="num">
                            <input type="number" min="1" max="1000" value="${map.order.num}" name="count" disabled>
                        </td>
                        <td class="subtotal">
                            ¥<span>${(map.product.price)*(map.order.num)}</span>
                        </td>
                        <td class="del">
                            <span onclick="deleteOrder(${map.order.id})">&times;</span>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <!--结算小计-->
        <div class="footer navbar-fixed-bottom">
            <div class="opt">
                <input type="checkbox" id="delAll">
                <label for="delAll">全选</label>
                <a href="javascript:;" onclick="deleteAllOrder()">删除选中的订单</a>
            </div>
            <div class="cal">
                <span>已选择<span class="num" id="chooseNum">0</span>份订单</span>
                <span>总价 <span class="totalPrice" id="totalPrice">¥0.00</span></span>
                <button type="button" class="btn-cal" onclick="submitOrder()">结 算</button>
                <form action="goAlipay" method="post" class="sr-only" id="aliForm">
                    <input type="hidden" name="money" id="money">
                    <input type="hidden" name="pname" id="pname">
                    <input type="hidden" name="ids" id="ids">
                    <input type="hidden" name="uid" value="${sesUser.id}">
                    <input type="hidden" name="address" id="address">
                </form>
            </div>
        </div>
    </div>
</c:if>

<div style="display: none" id="returnAliForm">

</div>
</body>
</html>