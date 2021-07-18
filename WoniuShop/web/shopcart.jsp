
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="css/reset.css">
    <script src="js/shopCart.js"></script>
    <link rel="stylesheet" href="css/shopCart.css">
</head>
<body>

<div class="shopcart">
    <div class="h2-title">我的购物车</div>
    <div class="allLabel">
        全部商品
        <span id="s_total"></span>
    </div>
    <div class="box">
        <table>
            <tbody>
            <tr style="height: 45px;background-color:#e3d6d6;">
                <td colspan="2" style="width: 130px;padding-left: 8px">
                    <input type="checkbox" id="all">
                    <label for="all">全选</label>
                </td>
                <td colspan="2" style="width: 460px">商品</td>
                <td width="90px" align="center">单价</td>
                <td style="width: 100px" align="center">数量</td>
                <td width="120px" align="center">小计</td>
                <td width="100px" align="center">操作</td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="1">
                </td>
                <td class="pimg">
                    <img src="imges/p1.webp" height="200" width="200"/>
                </td>
                <td class="info">天玑1100年度旗舰芯 / VC液冷散热 / 120Hz旗舰变速金刚屏 / 67W 闪充 5000mA</td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span id="price1">5000.0</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span id="subtotal1"></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="2">
                </td>
                <td class="pimg">
                    <img src="imges/p2.webp" height="200" width="200"/>
                </td>
                <td class="info">天玑1100年度旗舰芯 / VC液冷散热 / 120Hz旗舰变速金刚屏 / 67W 闪充 5000mA</td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span id="price2">4000.0</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span id="subtotal2"></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="3">
                </td>
                <td class="pimg">
                    <img src="imges/p3.webp" height="200" width="200"/>
                </td>
                <td class="info">天玑1100年度旗舰芯 / VC液冷散热 / 120Hz旗舰变速金刚屏 / 67W 闪充</td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span id="price3">998.0</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span id="subtotal3"></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="4">
                </td>
                <td class="pimg">
                    <img src="imges/p4.webp" height="200" width="200"/>
                </td>
                <td class="info">天玑1100年度旗舰芯 / VC液冷散热 / 120Hz旗舰变速金刚屏 / 67W 闪充 5000mA</td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span id="price4">2000.0</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span id="subtotal4"></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value="5">
                </td>
                <td class="pimg">
                    <img src="imges/p5.webp" height="200" width="200"/>
                </td>
                <td class="info">天玑1100年度旗舰芯 / VC液冷散热 / 120Hz旗舰变速金刚屏 / 67W 闪充 5000mA</td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span id="price5">3000.0</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span id="subtotal5"></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times</span>
                </td>
            </tr>
            <tr class="item">
                <td class="check">
                    <input type="checkbox" name="product" value=6">
                </td>
                <td class="pimg">
                    <img src="imges/p6.webp" height="200" width="200"/>
                </td>
                <td class="info">天玑1100年度旗舰芯 / VC液冷散热 / 120Hz旗舰变速金刚屏 / 67W 闪充</td>
                <td class="size">
                    <p>单支</p>
                    <p>硬货</p>
                </td>
                <td class="price">
                    ¥<span id="price6">1999.0</span>
                </td>
                <td class="num">
                    <input type="number" min="1" max="1000" value="1" name="count">
                </td>
                <td class="subtotal">
                    ¥<span id="subtotal6"></span>
                </td>
                <td class="del">
                    <span onclick="delPro(this)">&times</span>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="footer clear-fix">
        <div class="opt">
            <input type="checkbox" id="all1">
            <label for="all1">全选</label>
            <a href="">删除选中的商品</a>
            <a href="">移入关注</a>
            <a href="">清理购物车</a>
        </div>
        <div class="cal">
            <span>   已选择<span class="num" id="chooseNum">0</span>件商品</span>
            <span> 总价 <span class="totalPrice" id="totalPrice">¥0.00</span></span>

            <button type="button" class="btn-cal">去结算</button>

        </div>
    </div>

</div>
</body>
</html>