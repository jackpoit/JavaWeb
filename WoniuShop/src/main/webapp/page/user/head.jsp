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
    <title></title>
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
            <a href="page/user/index.jsp" class="btn btn-primary">
                <span class="glyphicon glyphicon-home"></span>
                首页
            </a>
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#loginModal">
                <span class="glyphicon glyphicon-log-in"></span>
                登录
            </button>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#registerModal">
                <span class="glyphicon glyphicon-plus"></span>
                注册
            </button>
            <button type="button" class="btn btn-success" onclick="location.href = 'page/user/personal.jsp';">
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
</body>
</html>
