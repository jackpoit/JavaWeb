<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
    <base href="<%=basePath%>">
    <script src="js/head.js"></script>
</head>
<!--头部导航-->
<div class="navbar-fixed-top banner">
    <div class="container">
        <input type="hidden" id="id" value="${sesUser.id}">
        <c:if test="${empty sesUser}">
            <div class="row">
                <div class="col-md-2 navbar-left" id="n_nav_name">
                    <img src='images/user/4.jpg' width='40px' class='img-circle' alt=''><span class='person' id="n_nav_loginSpan">请登录</span>
                </div>
                <div class="col-md-5 navbar-right text-right">
                    <button type="button" class="btn btn-danger" id="n_nav_login" >
                        <span class="glyphicon glyphicon-log-in"></span>
                        登录
                    </button>
                    <button type="button" class="btn btn-info" id="n_nav_register" data-toggle="modal"
                            data-target="#registerModal">
                        <span class="glyphicon glyphicon-plus"></span>
                        注册
                    </button>

                    <a href="page/user/index.jsp" class="btn btn-primary">
                        <span class="glyphicon glyphicon-home"></span>
                        首页
                    </a>

                </div>
            </div>
        </c:if>
        <c:if test="${!empty sesUser}">
            <div class="row">
                <div class="col-md-2 navbar-left" id="nav_name">
                    <img src='${sesUser.image}' width='40px' class='img-circle' alt=''><span class='person' onclick='$("#loginModal").modal("show")'>${sesUser.username}</span>
                </div>
                <div class="col-md-5 navbar-right text-right">
                    <a href="page/user/index.jsp" class="btn btn-primary">
                        <span class="glyphicon glyphicon-home"></span>
                        首页
                    </a>
                    <a href="page/user/personal.jsp" id="nav_personal" class="btn btn-info">
                        <span class="glyphicon glyphicon-user"></span>
                        个人中心
                    </a>
                    <button type="button" id="nav_shopcart" class="btn btn-warning">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        购物车
                    </button>
                    <button type="button" id="nav_order" class="btn btn-success">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        订单中心
                    </button>
                    <button type="button" class="btn btn-danger" id="nav_exist">
                        <span class="glyphicon glyphicon-log-in"></span>
                        注销
                    </button>
                </div>
            </div>
        </c:if>
    </div>
</div>

<!--注册模态框-->
<div class="modal fade" id="registerModal" tabindex="-1" data-backdrop="static">
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
                        <label for="r_username" class="control-label col-md-2 "><span
                                style="color: red">*</span>用户名</label>
                        <div class="col-md-5">
                            <input type="text" id="r_username" name="r_username" class="form-control"
                                   placeholder="请输入用户名">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="checkUserSpan">用户名只能是字母且6-16位</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="r_pwd" class="control-label col-md-2"><span style="color: red">*</span>密码</label>
                        <div class="col-md-5">
                            <input type="password" id="r_pwd" name="r_pwd" class="form-control" placeholder="请输入密码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="rpwdSpan">6-16位字母数字下划线组成</span>
                        </label>

                    </div>
                    <div class="form-group">
                        <label for="r_repwd" class="control-label col-md-2"><span
                                style="color: red">*</span>密码确认</label>
                        <div class="col-md-5">
                            <input type="password" id="r_repwd" name="r_repwd" class="form-control"
                                   placeholder="请再次确认密码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="rrepwdSpan"></span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="r_phone" class="control-label col-md-2"><span style="color: red">*</span>手机号</label>
                        <div class="col-md-5">
                            <input type="text" id="r_phone" name="r_phone" class="form-control" placeholder="请输入您的手机号码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="rphoneSpan"></span>
                        </label>
                    </div>
                    <div class="form-group row">
                        <label for="r_email" class="control-label col-md-2"><span style="color: red">*</span>邮箱</label>
                        <div class="col-md-5">
                            <input type="text" id="r_email" name="r_email" class="form-control" placeholder="请输入您的邮箱">
                        </div>
                        <label class="control-label col-md-4 " style="text-align: left">
                            <span id="remailSpan"></span>
                        </label>

                    </div>
                    <div class="form-group row">
                        <label for="r_image" class="control-label col-md-2">头像</label>
                        <div class="col-md-5">
                            <input type="file" id="r_image" name="r_image" class="form-control">
                        </div>
                        <div class="col-md-5" style="position: relative">
                            <div class=" text-center" id="h_showImg" style="position: absolute;left: 20%"></div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-2">性别</label>
                        <label class="radio-inline" style=" margin-left: 20px;">
                            <input type="radio" name="r_gender" id="r_gender1" value="男" checked> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="r_gender" id="r_gender2" value="女"> 女
                        </label>
                    </div>
                    <div class="form-group row">
                        <label for="r_birthday" class="control-label col-md-2">生日</label>
                        <div class="col-md-5">
                            <input type="date" id="r_birthday" name="r_birthday" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="r_realName" class="control-label col-md-2">真实姓名</label>
                        <div class="col-md-5">
                            <input type="text" id="r_realName" name="r_realName" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="r_idCard" class="control-label col-md-2">身份证</label>
                        <div class="col-md-5">
                            <input type="text" id="r_idCard" name="r_idCard" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="checkbox col-md-10 col-md-offset-2">
                            <label>
                                <input type="checkbox" id="ragree">
                                我同意 <span style="color: red">用户注册协议</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group ">
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
<div class="modal fade" id="loginModal" tabindex="-1" data-backdrop="static">
    <div class="modal-dialog" style="width: 400px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #7575d2">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h4 class="modal-title text-center" style="color: #FFFFFF;letter-spacing: 5px">用户登录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="login_form">
                    <input type="hidden" name="m" value="login">
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
                                <input type="checkbox" id="rememberLogin">记住用户名密码
                                <input type="hidden" name="cookieFlag" id="cookieFlag" value="false">
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
<div class="modal fade" id="registerSuccessModal" tabindex="-1" data-backdrop="static">
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
<!--提示信息模态框-->
<div class="modal fade" id="infoModal" tabindex="-1">
    <div class="modal-dialog" style="width: 400px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-body text-center">
                <h4 id="info"></h4>
            </div>
        </div>
    </div>
</div>

