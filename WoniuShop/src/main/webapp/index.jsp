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

<!--头部导航-->
<div class="navbar-fixed-top" style="background:#333;height:60px; line-height: 60px;">
    <div class="container">
        <div class="col-md-2 navbar-left" style="height: 60px;line-height: 60px">
            <img src="images/user/4.jpg" width="40px" class="img-circle" alt="">
            <span class="person" id="user-name-label" onclick="$('#loginModal').modal('show')">
            请登录
            </span>
        </div>

        <div class="col-md-5 navbar-right">
            <button type="button" class="btn btn-primary">
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
            <button type="button" class="btn btn-success" onclick="location.href = 'page/user/user.jsp';">
                <span class="glyphicon glyphicon-user"></span>
                个人中心
            </button>
            <button type="button" class="btn btn-warning" onclick="location.href='page/user/shopcart.jsp'">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                购物车
            </button>
        </div>
    </div>
</div>


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

<!--注册模态框-->
<div class="modal fade" id="registerModal" tabindex="-1">
    <div class="modal-dialog" style="width: 700px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #7575d2">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h4 class="modal-title text-center" style="color: #FFFFFF;letter-spacing: 5px">用户注册</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="register_form">
                    <input type="hidden" name="m" value="register">
                    <div class="form-group">
                        <label for="r_username" class="control-label col-md-2 ">用户名</label>
                        <div class="col-md-5">
                            <input type="text" id="r_username" name="r_username" class="form-control"
                                   placeholder="请输入用户名">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="checkUserSpan">用户名只能是字母且6-16位</span>
                        </label>
                    </div>

                    <div class="form-group">
                        <label for="r_pwd" class="control-label col-md-2">密码</label>
                        <div class="col-md-5">
                            <input type="password" id="r_pwd" name="r_pwd" class="form-control" placeholder="请输入密码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="rpwdSpan">6-16位字母数字下划线组成</span>
                        </label>

                    </div>
                    <div class="form-group">
                        <label for="r_repwd" class="control-label col-md-2">密码确认</label>
                        <div class="col-md-5">
                            <input type="password" id="r_repwd" name="r_repwd" class="form-control"
                                   placeholder="请再次确认密码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="rrepwdSpan"></span>
                        </label>

                    </div>
                    <div class="form-group">
                        <label for="r_phone" class="control-label col-md-2">手机号</label>
                        <div class="col-md-5">
                            <input type="text" id="r_phone" name="r_phone" class="form-control" placeholder="请输入您的手机号码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="rphoneSpan"></span>
                        </label>
                    </div>
                    <div class="form-group row">
                        <label for="r_email" class="control-label col-md-2">邮箱</label>
                        <div class="col-md-5">
                            <input type="text" id="r_email" name="r_email" class="form-control" placeholder="请输入您的邮箱">
                        </div>
                        <label class="control-label col-md-4 " style="text-align: left">
                            <span id="remailSpan"></span>
                        </label>

                    </div>
                    <div class="form-group">
                        <div class="checkbox col-md-10 col-md-offset-2">
                            <label>
                                <input type="checkbox" id="ragree">
                                我同意 <span style="color: red">用户注册协议</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group t">
                        <div class="col-md-5 col-md-offset-2 ">
                            <button type="button" class="btn btn-primary btn-block" id="register_btn">注册</button>
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
                <form class="form-horizontal" id="login_form">
                    <div class="form-group" style="margin-top: 20px;margin-bottom: 10px">
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
                            <button type="button" class="btn btn-primary btn-block" id="login_btn">登录</button>
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
<div class="modal fade" id="infoModal" tabindex="-1">
    <div class="modal-dialog" style="width: 400px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-body text-center">
                <h4 id="info"></h4>
            </div>
        </div>
    </div>
</div>

<script>

    //登录按钮 ajax
    $(function () {
        $('#login_btn').click(function () {
            let uname = $('#l_username').val();
            let pwd = $('#l_pwd').val();
            if (pwd == "" || uname == "") {
                alert("请填写完整的用户名,密码!");
                return;
            }
            let info = $('#info');
            $.ajax({
                url: "user",
                type: "post",
                data: {m: "login", l_username: uname, l_pwd: pwd},
                dataType: "text",
                success: function (text) {
                    let name = '';
                    if ("Y" == text) { //成功
                        info.html("登录成功")
                        name = uname;
                    } else if ("N" == text) {
                        info.html("密码错误")
                    }
                    loginRes(name);
                }
            })
        })

    })

    //注册界面ajax
    $(function () {
        let r_nameFlag = false;
        let pwdFlag = false;
        let phoneFlag = false;
        let emailFlag = false;
        let ragreeFlag = false;
        $('#r_username').blur(function () {
            let checkUserSpan = $('#checkUserSpan');
            let uname = $(this).val(); //获取输入框中的内容
            if ("" == uname) {
                checkUserSpan.html("用户名只能是字母且6-16位");
                checkUserSpan.css({"color": "black"});
                r_nameFlag = false;
                return;
            }
            let unamePattern = /^[a-zA-Z][a-zA-Z0-9]*$/;
            if (!unamePattern.test(uname)) {
                alert("请输入正确的用户名");
                $(this).val("");
                checkUserSpan.html("");
                return;
            }
            $.ajax({
                url: "user",
                type: "get",
                data: {m: "checkName", l_username: uname},
                dataType: "text",
                success: function (text) {
                    if ("Y" == text) { //存在
                        checkUserSpan.html("&times;该用户名已存在");
                        checkUserSpan.css({"color": "red"});
                        r_nameFlag = false;

                    } else if ("N" == text) {
                        checkUserSpan.html("√ &nbsp;用户名可用")
                        checkUserSpan.css({"color": "green"});
                        r_nameFlag = true;
                    }
                }
            })
        })
        $('#ragree').click(function () {
            ragreeFlag = this.checked;
        })
        $('#r_pwd').blur(function () {
            let pwd = $(this).val();
            let $repwd = $('#r_repwd');
            let $rpwdSpan = $('#rpwdSpan');
            let $rrepwdSpan = $('#rrepwdSpan');
            if (pwd == "") {
                $rpwdSpan.css({"color": "black"});
                $rpwdSpan.html("6-16位字母数字下划线组成");
                pwdFlag = false;
                $rrepwdSpan.html("")
                return;
            }
            let pwdPattern = /^[0-9a-zA-Z_]{6,16}$/;
            if (!pwdPattern.test(pwd)) {
                pwdFlag = false;
                alert("密码格式错误")
                $(this).val("");
                $rpwdSpan.html("6-16位字母数字下划线组成");
                $rpwdSpan.css({"color": "black"});
                $rrepwdSpan.html("")
            } else {
                $rpwdSpan.html("√")
                $rpwdSpan.css({"color": "green"});
                if ($repwd.val() == pwd) {
                    $rrepwdSpan.html("√")
                    $rrepwdSpan.css({"color": "green"});
                    pwdFlag = true;
                } else if ($repwd.val() != "") {
                    $rrepwdSpan.html("&times")
                    $rrepwdSpan.css({"color": "red"});
                    pwdFlag = false;
                } else {
                    pwdFlag = false;
                }
            }

        })
        $('#r_repwd').blur(function () {
            let $rrepwdSpan = $('#rrepwdSpan');
            let $r_pwd = $('#r_pwd');
            let repwd = $(this).val();
            if ($r_pwd.val() == "") {
                return;
            }
            if ($r_pwd.val() == repwd) {
                $rrepwdSpan.html("√")
                $rrepwdSpan.css({"color": "green"});
                pwdFlag = true;
            } else {
                $rrepwdSpan.html("&times")
                $rrepwdSpan.css({"color": "red"});
                pwdFlag = false;
            }
        })
        $('#r_phone').blur(function () {
            let phone = $(this).val();
            let $span = $('#rphoneSpan');
            if (phone == "") {
                $span.html("");
                phoneFlag = false;
                return;
            }
            let phonePattern = /^[1][1-9][0-9]{9}$/
            if (!phonePattern.test(phone)) {
                phoneFlag = false;
                alert("手机号格式错误");
                $span.html("");
                $(this).val("");
            } else {
                phoneFlag = true;
                $span.html("√")
                $span.css({"color": "green"});
            }
        })
        $('#r_email').blur(function () {
            let email = $(this).val();
            let $span = $('#remailSpan');
            if (email == "") {
                $span.html("");
                emailFlag = false;
                return;
            }
            let emailPattern = /^[a-z0-9A-Z]+[a-z0-9A-Z._]*@[a-z0-9A-Z]+\.[a-zA-Z]{2,}$/
            if (!emailPattern.test(email)) {
                emailFlag = false;
                alert("邮箱格式错误");
                $span.html("");
                $(this).val("");
            } else {
                emailFlag = true;
                $span.html("√")
                $span.css({"color": "green"});
            }
        })
        $('#register_btn').click(function () {
            if (!ragreeFlag) {
                alert("请同意用户协议")
                return;
            }
            if (r_nameFlag && pwdFlag && phoneFlag && emailFlag) {

               $.ajax({
                   url:"user",
                   type:"post",
                   data:$('#register_form').serialize(),
                    dataType:"text",
                   success:function (text) {
                       if("Y"==text){
                           registerSuccess();
                       }else if ("N"==text){
                           registerFailed();
                           $('#info').html("注册失败");

                       }
                   }
               })
            } else {
                alert("请正确填写所有信息");
            }

        })

    })


</script>
</body>
</html>
