<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <% String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>购物车</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/shopcart.css">
    <script src="js/shopcart.js"></script>
</head>
<body>
<%--包含头部菜单--%>
<jsp:include page="head.jsp"></jsp:include>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>

<!--购物车-->
<div class="shopcart">
    <!--<div class="title">我的购物车</div>-->
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
                <td width="100px" align="center">操作</td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="1">
                </td>
                <td class="pimg">
                    <img src="images/p1.webp"/>
                </td>
                <td class="info">
                    「Note 10 Pro全版本闪降100元；享6期免息；华夏银行信用卡分期最高可减60
                </td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span>998.0</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times;</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="2">
                </td>
                <td class="pimg">
                    <img src="images/p2.webp"/>
                </td>
                <td class="info">
                    「Note 10 Pro全版本闪降100元；享6期免息；华夏银行信用卡分期最高可减60
                </td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span>2000.0</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times;</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="3">
                </td>
                <td class="pimg">
                    <img src="images/p3.webp"/>
                </td>
                <td class="info">
                    「Note 10 Pro全版本闪降100元；享6期免息；华夏银行信用卡分期最高可减60
                </td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span>3000</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times;</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="4">
                </td>
                <td class="pimg">
                    <img src="images/p8.webp"/>
                </td>
                <td class="info">
                    「Note 10 Pro全版本闪降100元；享6期免息；华夏银行信用卡分期最高可减60
                </td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span>4000</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times;</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="5">
                </td>
                <td class="pimg">
                    <img src="images/p7.webp"/>
                </td>
                <td class="info">
                    「Note 10 Pro全版本闪降100元；享6期免息；华夏银行信用卡分期最高可减60
                </td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span>5000</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times;</span>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <!--结算小计-->
    <div class="footer navbar-fixed-bottom">
        <div class="opt">
            <input type="checkbox" id="delAll">
            <label for="delAll">全选</label>
            <a href="">删除选中的商品</a>
            <a href="">移入关注</a>
            <a href="">清理购物车</a>
        </div>
        <div class="cal">
            <span>已选择<span class="num" id="chooseNum">0</span>件商品</span>
            <span>总价 <span class="totalPrice" id="totalPrice">¥0.00</span></span>
<%--            <button type="button" class="btn-cal">结 算</button>--%>
            <button type="button" class="btn-cal" id="commitOrder">提交订单</button>
        </div>
    </div>
</div>
</body>
</html>