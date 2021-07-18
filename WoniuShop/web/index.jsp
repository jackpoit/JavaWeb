<%@ page import="com.woniuxy.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: rua
  Date: 2021/7/16
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
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
<!--头部导航-->
<div class="navbar-fixed-top" style="background:#333;height:60px; line-height: 60px;">
    <div class="container">
        <div class="col-md-2 navbar-left" style="height: 60px;line-height: 60px">
            <img src="imges/user/4.jpg" width="40px" class="img-circle" alt="">
            <span class="person" id="user-name-label" onclick="$('#loginModal').modal('show')">
            请登录
            </span>
        </div>

        <div class="col-md-5 navbar-right">
            <button type="button" class="btn btn-primary" >
                <span class="glyphicon glyphicon-home"></span>
                首页
            </button>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#loginModal">
                <span class="glyphicon glyphicon-log-in"></span>
                登录
            </button>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#registerModal">
                <span class="glyphicon glyphicon-plus"></span>
                注册
            </button>
            <button type="button" class="btn btn-success" onclick="openAdmin()">
                <span class="glyphicon glyphicon-user"></span>
                个人中心
            </button>
            <button type="button" class="btn btn-warning" onclick="location.href='shopcart.jsp'">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                购物车
            </button>
        </div>
    </div>
</div>


<!--菜单栏-->
<div class="container" style="margin-top:60px; line-height: 100px;">
    <div class="col-md-1" style="margin-top: 25px;">
        <img src="imges/logo.jpg" width="100px" height="50px" alt="">
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
    <div class="col-md-3">
        <form action="" class="form-inline">
            <div class="form-group">
                <label class="sr-only" for="kw">关键词</label>
                <input type="text" class="form-control" id="kw" name="keyword" style="height: 40px">
            </div>
            <button type="button" class="btn btn-primary" style="height: 40px" onclick="$('#loginModal').modal('show')">
                搜索
            </button>
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
                    <img src="imges/bg1.png" alt="">
                </div>
                <div class="item">
                    <img src="imges/bg2.webp" alt="">
                </div>
                <div class="item">
                    <img src="imges/bg3.webp" alt="">
                </div>
                <div class="item">
                    <img src="imges/bg4.webp" alt="">
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
                <img src="imges/p1.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="imges/p2.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="imges/p3.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="imges/p4.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="imges/p5.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="imges/p6.webp" alt="">
                <div class="caption">
                    <h4 class="title">Redmi Note 10 Pro</h4>
                    <p class="info">天玑1100年度旗舰芯 / VC液冷散热 / 67W 闪充 5000mAh 大电池 </p>
                    <p class="price">1599元起</p>
                </div>
            </div>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <div class="thumbnail pro-item">
                <img src="imges/p1.webp" alt="">
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

<!--注册模态框-->
<div class="modal fade" id="registerModal" tabindex="-1">
    <div class="modal-dialog" style="width: 700px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #7575d2">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h4 class="modal-title text-center" style="color: #FFFFFF;letter-spacing: 5px">用户注册</h4>
            </div>
            <div class="modal-body">
                <form action="register" class="form-horizontal" method="post">
                    <div class="form-group">
                        <label for="r_username" class="control-label col-md-2 ">用户名</label>
                        <div class="col-md-5">
                            <input type="text" id="r_username" name="r_username" class="form-control">
                        </div>
                        <div class="col-md-5 " style="line-height: 2"><span>用户名只能是字母且6-16位</span></div>
                        <span></span>
                    </div>
                    <div class="form-group">
                        <label for="r_pwd" class="control-label col-md-2">密码</label>
                        <div class="col-md-5">
                            <input type="password" id="r_pwd" name="r_pwd" class="form-control">
                        </div>
                        <div class="col-md-4 " style="line-height: 2"><span>6-16位字母数组下划线组成</span></div>
                        <span></span>
                    </div>
                    <div class="form-group">
                        <label for="r_repwd" class="control-label col-md-2">密码确认</label>
                        <div class="col-md-5">
                            <input type="password" id="r_repwd" name="r_repwd" class="form-control">
                        </div>
                        <div class="col-md-4 " style="line-height: 2"><span>请再次确认密码</span></div>
                        <span></span>
                    </div>
                    <div class="form-group">
                        <label for="r_phone" class="control-label col-md-2">手机号</label>
                        <div class="col-md-5">
                            <input type="text" id="r_phone" name="r_phone" class="form-control">
                        </div>
                        <div class="col-md-4 " style="line-height: 2"><span>请输入您的手机号码</span></div>
                        <span></span>
                    </div>
                    <div class="form-group">
                        <label for="r_email" class="control-label col-md-2">邮箱</label>
                        <div class="col-md-5">
                            <input type="text" id="r_email" name="r_email" class="form-control">
                        </div>
                        <div class="col-md-4 " style="line-height: 2"><span>请输入您的邮箱</span></div>
                        <span></span>
                    </div>
                    <div class="form-group">
                        <div class="checkbox col-md-10 col-md-offset-2">
                            <label>
                                <input type="checkbox">
                                我同意 <span style="color: red">用户注册协议</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group t">
                        <div class="col-md-5 col-md-offset-2 ">
                            <button type="submit" class="btn btn-primary btn-block">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!--登录模态框-->
<div class="modal fade" id="loginModal" tabindex="-1">
    <div class="modal-dialog" style="width: 400px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #7575d2">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h4 class="modal-title text-center" style="color: #FFFFFF;letter-spacing: 5px">用户登录</h4>
            </div>
            <div class="modal-body">
                <form action="login" class="form-horizontal" method="post">
                    <div class="form-group">
                        <label for="l_username" class="control-label col-md-3">用户名</label>
                        <div class="col-md-7">
                            <input type="text" id="l_username" name="l_username" class="form-control"
                                   placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="l_pwd" class="control-label col-md-3">密码</label>
                        <div class="col-md-7">
                            <input type="password" placeholder="请输入密码" id="l_pwd" name="l_pwd" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="checkbox col-md-9 col-md-offset-3">
                            <label>
                                <input type="checkbox">记住用户名密码
                            </label>
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-md-4 col-md-offset-2 ">
                            <button type="submit" class="btn btn-primary btn-block">登录</button>
                        </div>
                        <div class="col-md-4 ">
                            <button type="button" class="btn btn-primary btn-block"
                                    onclick="$('#loginModal').modal('hide');$('#registerModal').modal('show')">跳转注册
                            </button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--注册成功模态框-->
<div class="modal fade" id="registerSuccessModal" tabindex="-1">
    <div class="modal-dialog" style="width: 400px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-body text-center">
                <h4>注册成功,正在跳转登录页面...</h4>
                <div class="row text-center">
                    <div class="col-md-6 col-md-offset-3 ">
                        <button type="button" class="btn btn-primary btn-block"
                                onclick="$('#registerSuccessModal').modal('hide');$('#loginModal').modal('show')">立即跳转
                        </button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!--登录成功模态框-->
<div class="modal fade" id="loginSuccessModal" tabindex="-1">
    <div class="modal-dialog" style="width: 400px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-body text-center">
                <h4>${loginStr}</h4>
            </div>
        </div>
    </div>
</div>
<script>
    <%
       if (request.getAttribute("registerRows")!=null){
       	out.write("registerSuccess()");
       }
    %>
</script>
<script>
    <%
        String name=(String) request.getAttribute("name");
        System.out.println(name);
        if (request.getAttribute("loginStr")!=null){
       	out.write("loginRes('"+name+"')");  //此处name要加引号 不然就 undefined
       }
    %>
</script>
<%--<div class="sr-only" onchange="openLogin()">${rows}</div>--%>
</body>
</html>
