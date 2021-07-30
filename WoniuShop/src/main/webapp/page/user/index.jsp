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
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12 bg-primary adv">
            <img src="images/ad1.webp" width="100%">
        </div>
    </div>
</div>

<!--精选商品-->
<div class="container">
    <h3 style="line-height: 40px;">精选商品</h3>
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
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12 bg-primary adv">
            <img src="images/ad2.webp" width="100%">
        </div>
    </div>
</div>


<!-- 热销商品-->
<div class="container">
    <h3 style="line-height: 40px;">热销商品</h3>
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
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12 bg-primary adv">
            <img src="images/ad3.webp" width="100%">
        </div>
    </div>
</div>

<!--手机-->
<div class="container">
    <h3 style="line-height: 40px;">手机</h3>
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
</div>

<!--登录的模态框-->
<div class="modal" id="loginModal" tabindex="-1">
    <div class="modal-dialog" style="width: 400px;">
        <div class="modal-content">
            <div class="modal-header" style="background:linear-gradient(to bottom,#3f6eaa,#157dc5);">
                <button type="button" class="close" data-dismiss="modal" >&times;</button>
                <h3 class="text-center" style="color: #fff">用 户 登 录</h3>
            </div>
            <div class="modal-body">
                <form action="doLogin" class="form-horizontal">
                    <div class="form-group">
                        <label for="uname" class="col-md-3 control-label">用户名</label>
                        <div class="col-md-7">
                            <input type="text" id="uname" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pwd" class="col-md-3 control-label">密码</label>
                        <div class="col-md-7">
                            <input type="text" id="pwd" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> 记住用户名和密码
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-8 col-md-offset-2">
                            <button type="button" class="btn btn-block btn-primary">登录</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--注册的模态框-->
<div class="modal" id="registerModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background:linear-gradient(to bottom,#3f6eaa,#157dc5);" >
                <button type="button" class="close" data-dismiss="modal" >&times;</button>
                <h3 class="text-center" style="color: #fff">用 户 注 册</h3>
            </div>
            <div class="modal-body">
                <form action="" class="form-horizontal">
                    <div class="form-group">
                        <label for="rg_uname" class="col-md-2 control-label">用户名</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="rg_uname" name="uname">
                        </div>
                        <div class="col-md-5 control-label" style="text-align: left;">用户名只能是字母，且6~16位</div>
                    </div>
                    <div class="form-group">
                        <label for="rg_pwd" class="col-md-2 control-label">密 码</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="rg_pwd" name="pwd">
                        </div>
                        <div class="col-md-5 control-label" style="text-align: left;">6~16字母数字下划线组成</div>
                    </div>
                    <div class="form-group">
                        <label for="rg_repwd" class="col-md-2 control-label">密码确认</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="rg_repwd">
                        </div>
                        <div class="col-md-5 control-label" style="text-align: left;">请再次确认密码</div>
                    </div>
                    <div class="form-group">
                        <label for="rg_mobile" class="col-md-2 control-label">手机号码</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="rg_mobile">
                        </div>
                        <div class="col-md-5 control-label" style="text-align: left;">请输入您的手机号码</div>
                    </div>
                    <div class="form-group">
                        <label for="rg_email" class="col-md-2 control-label">邮 箱</label>
                        <div class="col-md-5">
                            <input type="text" class="form-control" id="rg_email">
                        </div>
                        <div class="col-md-5 control-label" style="text-align: left;">请输入您的邮箱</div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> 我同意
                                    <a href="" style="color: red">用户注册协议</a>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2">
                            <button type="button" class="btn btn-block btn-danger">注 册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
