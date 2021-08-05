<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":"
                + request.getServerPort() + request.getContextPath() + "/";
    %>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/backstage.css">
    <script type="text/javascript" src="js/backstage.js"></script>
</head>
<body>
<!--导航条-->
<div class="banner">
    <div class="row">
        <div class="col-md-1 navbar-left" style="padding-top: 15px">
            <img src="images/logo-woniu.png" width="200px" height="50px" alt="">
        </div>
        <div class="col-md-4 navbar-right userInfo">
            <img src="images/user/1.jpg" width="50px" class="img-circle" alt="">
            <span>上海 . 研发部 . 张无忌</span>
            <a href="#" style="color: yellow">[修改密码]</a>
            <a href="#" style="color: red">[注销]</a>
        </div>
    </div>
</div>

<!--功能区-->
<div class="row">
    <!-- 导航选项卡 -->
    <div class="col-md-2 text-center">
        <ul class="nav nav-stacked navbar-default" style="height: 560px;padding: 50px 0px" role="tablist">
            <li role="presentation" class="active"><a href="#user" data-toggle="tab">用户管理</a></li>
            <li role="presentation"><a href="#product" data-toggle="tab" id="pro-btn">商品管理</a></li>
            <li role="presentation"><a href="#order" data-toggle="tab" id="ori-btn">订单管理</a></li>
            <li role="presentation"><a href="#extend" data-toggle="tab">扩展功能</a></li>
        </ul>
    </div>

    <!-- 导航面板 -->
    <div class="col-md-10" style="height: 560px;margin-left: -14px;background:#fff;">
        <div class="tab-content">
            <!--用户管理模块-->
            <div class="tab-pane active" id="user">
                <!--用户工具栏-->
                <div class="row" style="margin: 50px 0px 20px 0px">
                    <form action="page/admin/user" class="form-inline" method="post">
                        <div class="col-md-7">
                            <input type="hidden" name="m" value="page">
                            <div class="form-group">
                                <label for="uid" class="control-label">编号:</label>
                                <input type="text" id="uid" name="uid" class="form-control" placeholder="用户编号"
                                       style="width: 130px">
                            </div>
                            <div class="form-group">
                                <label for="uname" class="control-label">用户名:</label>
                                <input type="text" id="uname" name="uname" class="form-control" placeholder="用户名"
                                       style="width: 130px">
                            </div>
                            <div class="form-group">
                                <label for="uphone" class="control-label">手机:</label>
                                <input type="text" id="uphone" name="uphone" class="form-control" placeholder="手机号码"
                                       style="width: 130px">
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span> 搜索
                            </button>
                        </div>

                        <div class="col-md-4 col-md-offset-1">
                            <button type="button" class="btn btn-danger" onclick="deleteUsers()">
                                <span class="glyphicon glyphicon-remove-sign"></span> 批量删除
                            </button>
                            <button type="button" class="btn btn-primary" onclick="addUser();">
                                <span class="glyphicon glyphicon-plus-sign"></span> 添加
                            </button>
                            <button type="button" class="btn btn-success">
                                <span class="glyphicon glyphicon-upload"></span> 上传
                            </button>
                            <button type="button" class="btn btn-info">
                                <span class="glyphicon glyphicon-download"></span> 下载
                            </button>
                        </div>
                    </form>
                </div>
                <!--用户数据展示-->
                <div class="row" style="min-height: 380px;">
                    <table class="col-md-11 table-bordered text-center table-hover"
                           style="margin-left: 40px;line-height:60px;">
                        <tr style="font-weight: bold;background:#666;color: #fff98a">
                            <td>
                                <input type="checkbox" id="uall">
                                <label for="uall">全选</label>
                            </td>
                            <td>编号</td>
                            <td>用户名</td>
                            <td>手机号码</td>
                            <td>用户头像</td>
                            <td>用户类别</td>
                            <td colspan="2">其他操作</td>
                        </tr>
                        <c:forEach var="user" items="${info.list}">
                            <tr>
                                <td><input type="checkbox" name="users" value="${user.id}"></td>
                                <td>${user.id}</td>
                                <td>${user.username}</td>
                                <td>${user.mobile}</td>
                                <td>
                                    <c:if test="${!empty user.image}">
                                        <img src="${user.image}" alt="" style="width: 50px;" class="img-circle">
                                    </c:if>
                                    <c:if test="${empty user.image}">
                                        <div class="img-circle" style="background-color: #607b84;
                                        width: 50px;height: 50px;margin: 0 auto">
                                        </div>
                                    </c:if>
                                </td>
                                <td><c:if test="${empty user.level}">普通用户</c:if><c:if test="${!empty user.level}"><c:if
                                        test="${user.level==0}">普通用户</c:if><c:if test="${user.level==1}">vip</c:if><c:if
                                        test="${user.level==2}">vvvip</c:if></c:if></td>
                                <td>
                                    <button type="button" class="btn btn-danger" onclick="deleteUser(${user.id})">
                                        <span class="glyphicon glyphicon-remove"></span>删除
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-primary" onclick="editUser(this)">
                                        <span class="glyphicon glyphicon-pencil"></span>修改
                                    </button>
                                </td>
                                <td class="sr-only"><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
                                <td class="sr-only">${user.realName}</td>
                                <td class="sr-only">${user.idCard}</td>
                                <td class="sr-only">${user.email}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <!--用户分页展示-->
                <c:if test="${info.pages>1}">
                    <div class="container row text-center">
                        <ul class="pagination">
                                <%--上一页--%>
                            <li>
                                <a href="page/admin/user?m=page&currentUserPage=${info.prePage}&keyword=${keyword}">上一页</a>
                            </li>
                                <%--中间页码--%>
                            <c:forEach var="i" begin="1" end="${info.pages}">
                                <c:if test="${info.pageNum==i}">
                                    <li class="active"><a href="javascript:;">${i}</a></li>
                                </c:if>
                                <c:if test="${info.pageNum!=i}">
                                    <li>
                                        <a href="page/admin/user?m=page&currentUserPage=${i}&keyword=${keyword}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <li>
                                <a href="page/admin/user?m=page&currentUserPage=${info.nextPage}&keyword=${keyword}">下一页</a>
                            </li>
                        </ul>
                    </div>
                </c:if>
            </div>

            <!--商品管理模块-->
            <div class="tab-pane" id="product">
                <!--商品工具栏-->
                <div class="row" style="margin: 50px 0px 20px 0px">
                    <form action="" class="form-inline">
                        <div class="col-md-7">
                            <div class="form-group">
                                <label for="pname" class="control-label">商品名:</label>
                                <input type="text" id="pname" class="form-control" placeholder="商品名称"
                                       style="width: 140px">
                            </div>
                            <div class="form-group">
                                <label for="start" class="control-label">价格范围:</label>
                                <input type="number" id="start" class="form-control" style="width: 120px" min="0"
                                       placeholder="起始价格">
                            </div>
                            <div class="form-group">
                                <label for="end" class="control-label">-</label>
                                <input type="number" id="end" class="form-control" style="width: 120px" min="0"
                                       placeholder="最终价格">
                            </div>
                            <button type="button" class="btn btn-primary" id="pro_search">
                                <span class="glyphicon glyphicon-search" ></span> 搜索
                            </button>
                        </div>

                        <div class="col-md-4 col-md-offset-1">
                            <button type="button" class="btn btn-danger" onclick="deleteAll();">
                                <span class="glyphicon glyphicon-remove-sign"></span> 批量删除
                            </button>
                            <button type="button" class="btn btn-primary" onclick=" $('#addProModal').modal('show');">
                                <span class="glyphicon glyphicon-plus-sign"></span> 添加
                            </button>
                            <button type="button" class="btn btn-success">
                                <span class="glyphicon glyphicon-upload"></span> 上传
                            </button>
                            <button  type="button" class="btn btn-info">
                                <span class="glyphicon glyphicon-download"></span> 下载
                            </button>
                        </div>
                    </form>
                </div>
                <!--商品数据展示-->
                <div class="row" style="height: 380px; overflow: hidden">
                    <table class="col-md-11 table-bordered text-center table-hover"
                           style="margin-left: 40px;line-height:60px;">
                        <tr style="font-weight: bold;background:#666;color: #fff98a">
                            <td>
                                <input type="checkbox" id="pall">
                                <label for="pall">全选</label>
                            </td>
                            <td>编号</td>
                            <td>商品名称</td>
                            <td>商品图片</td>
                            <td>商品价格</td>
                            <td>商品库存</td>
                            <td>商品销量</td>
                            <td>商品类别</td>
                            <td>状态(上架/下架)</td>
                            <td colspan="2">其他操作</td>
                        </tr>
                        <tbody id="pro_content">

                        </tbody>

                    </table>
                </div>
                <!--商品分页展示-->
                <div class="row text-center">
                    <ul class="pagination" id="proPageNav">

                    </ul>
                </div>
            </div>

            <!--订单管理模块-->
            <div class="tab-pane" id="order">
                <!--订单工具栏-->
                <div class="row" style="margin: 50px 0px 20px 0px">
                    <form action="" class="form-inline">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="oid" class="control-label">订单号:</label>
                                <input type="text" id="oid" class="form-control" placeholder="订单号" style="width: 140px">
                            </div>
                            <div class="form-group">
                                <label for="opname" class="control-label">商品名:</label>
                                <input type="text" id="opname" class="form-control" style="width: 120px"
                                       placeholder="商品名称">
                            </div>
                            <div class="form-group">
                                <label for="state" class="control-label">订单状态</label>
                                <select name="state" id="state" style="width: 120px" class="form-control">
                                    <option value="">全部</option>
                                    <option value="0">未付款</option>
                                    <option value="1">已付款/未发货</option>
                                    <option value="2">已发货</option>
                                    <option value="3">已完成/未评论</option>
                                    <option value="4">已完成/已评论/</option>
                                </select>
                            </div>
                            <button type="button" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span> 搜索
                            </button>
                        </div>

                        <div class="col-md-4 text-center">
                            <a href="" class="btn btn-danger">
                                <span class="glyphicon glyphicon-remove-sign"></span> 批量删除</a>
                            <a href="" class="btn btn-success">
                                <span class="glyphicon glyphicon-upload"></span> 上传</a>
                            <a href="" class="btn btn-info">
                                <span class="glyphicon glyphicon-download"></span> 下载</a>
                        </div>
                    </form>
                </div>
                <!--订单数据展示-->
                <div class="row" style="height: 380px; overflow: hidden">
                    <table class="col-md-11 table-bordered text-center table-hover"
                           style="margin-left: 40px;line-height:60px;">
                        <tr style="font-weight: bold;background:#666;color: #fff98a">
                            <td>
                                <input type="checkbox" id="oall">
                                <label for="pall">全选</label>
                            </td>
                            <td>订单号</td>
                            <td>商品名称</td>
                            <td>商品图片</td>
                            <td>商品单价</td>
                            <td>购买数量</td>
                            <td>订单金额</td>
                            <td>创建时间</td>
                            <td>完成时间</td>
                            <td>订单状态</td>
                            <td>其他操作</td>
                        </tr>
<%--                        <tr>--%>
<%--                            <td><input type='checkbox' name='orders' value=''></td>--%>
<%--                            <td>202107150034</td>--%>
<%--                            <td>蜗牛Plus</td>--%>
<%--                            <td>--%>
<%--                                <img src='images/p1.webp' width='60px' alt=''>--%>
<%--                            </td>--%>
<%--                            <td>2000元</td>--%>
<%--                            <td>10</td>--%>
<%--                            <td>20000元</td>--%>
<%--                            <td>2021/07/15 00:00:00</td>--%>
<%--                            <td>2021/07/16 09:20:00</td>--%>
<%--                            <td>已完成</td>--%>
<%--                            <td><a href='#' class='btn btn-danger'><span--%>
<%--                                    class='glyphicon glyphicon-remove'></span>删除</a></td>--%>
<%--                        </tr>--%>
                        <tbody id="ori_content">

                        </tbody>
                    </table>
                </div>
                <!--订单分页展示-->
                <div class="row">
                    <ul class="pager">
                        <li><a href="#">上一页</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">下一页</a></li>
                    </ul>
                </div>
            </div>

            <!--扩展功能-->
            <div class="tab-pane" id="extend">
                <h1 class="text-center" style="margin-top: 100px;color: #b0b0b0">功能还未开放，敬请期待!!!</h1>
            </div>
        </div>
    </div>
</div>


<%--用户编辑模态框--%>
<div class="modal fade" id="editUserModal" tabindex="-1" data-backdrop="static">
    <div class="modal-dialog" style="width: 700px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #7575d2">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h4 class="modal-title text-center" style="color: #FFFFFF;letter-spacing: 5px">修改用户</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="page/admin/user" method="post" id="editUserForm"
                      enctype="multipart/form-data">
                    <input type="hidden" name="m" value="edit">
                    <input type="hidden" name="eid" id="eid">
                    <div class="form-group">
                        <label for="e_username" class="control-label col-md-2 "><span
                                style="color: red">*</span>用户名</label>
                        <div class="col-md-5">
                            <input type="text" id="e_username" name="e_username" class="form-control" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_pwd" class="control-label col-md-2"><span style="color: red">*</span>密码</label>
                        <div class="col-md-5">
                            <input type="password" id="e_pwd" name="e_pwd" class="form-control" placeholder="请输入密码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="epwdSpan">6-16位字母数字下划线组成</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="e_repwd" class="control-label col-md-2"><span
                                style="color: red">*</span>密码确认</label>
                        <div class="col-md-5">
                            <input type="password" id="e_repwd" name="e_repwd" class="form-control"
                                   placeholder="请再次确认密码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="erepwdSpan"></span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="e_phone" class="control-label col-md-2"><span style="color: red">*</span>手机号</label>
                        <div class="col-md-5">
                            <input type="text" id="e_phone" name="e_phone" class="form-control" placeholder="请输入您的手机号码">
                        </div>
                        <label class="control-label col-md-4 text-left" style="text-align: left">
                            <span id="e_rphoneSpan"></span>
                        </label>
                    </div>
                    <div class="form-group row">
                        <label for="e_email" class="control-label col-md-2"><span style="color: red">*</span>邮箱</label>
                        <div class="col-md-5">
                            <input type="text" id="e_email" name="e_email" class="form-control" placeholder="请输入您的邮箱">
                        </div>
                        <label class="control-label col-md-4 " style="text-align: left">
                            <span id="e_remailSpan"></span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">用户类别</label>
                        <label class="radio-inline" style="margin-left: 20px;">
                            <input type="radio" name="e_level" id="e_level1" value="0" checked> 普通用户
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="e_level" id="e_level2" value="1"> vip
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="e_level" id="e_level3" value="2">vvvip
                        </label>
                    </div>
                    <div class="form-group row">
                        <label for="e_image" class="control-label col-md-2">头像</label>
                        <div class="col-md-5">
                            <input type="file" id="e_image" name="e_image" class="form-control">
                        </div>
                        <div class="col-md-5" style="position: relative">
                            <div class=" text-center" id="e_h_showImg" style="position: absolute;left: 20%"></div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="e_birthday" class="control-label col-md-2">生日</label>
                        <div class="col-md-5">
                            <input type="date" id="e_birthday" name="e_birthday" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="e_realName" class="control-label col-md-2">真实姓名</label>
                        <div class="col-md-5">
                            <input type="text" id="e_realName" name="e_realName" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="e_idCard" class="control-label col-md-2">身份证</label>
                        <div class="col-md-5">
                            <input type="text" id="e_idCard" name="e_idCard" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 col-md-offset-2 ">
                            <button type="button" class="btn btn-primary btn-block" id="e_register_btn">更新</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--用户添加模态框--%>
<div class="modal fade" id="addUserModal" tabindex="-1" data-backdrop="static">
    <div class="modal-dialog" style="width: 700px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #7575d2">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h4 class="modal-title text-center" style="color: #FFFFFF;letter-spacing: 5px">用户添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="page/admin/user" method="post" id="addUserForm"
                      enctype="multipart/form-data">
                    <input type="hidden" name="m" value="add">
                    <input type="hidden" name="id" id="id">
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
                    <div class="form-group">
                        <label class="col-md-2 control-label">用户类别</label>
                        <label class="radio-inline" style="margin-left: 20px;">
                            <input type="radio" name="r_level" id="r_level1" value="0" checked> 普通用户
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="r_level" id="r_level2" value="1"> vip
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="r_level" id="r_level3" value="2">vvvip
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
                        <label class="radio-inline" style="margin-left: 20px;">
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
                        <div class="col-md-5 col-md-offset-2 ">
                            <button type="button" class="btn btn-primary btn-block" id="register_btn">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--商品添加模态框--%>
<div class="modal fade" tabindex="-1" data-backdrop="static" id="addProModal">
    <div class="modal-dialog" style="width: 550px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center">添加商品</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="pro_addForm">
                    <div class="form-group">
                        <input type="hidden" name="m" value="add">
                        <label for="add_pname" class="col-sm-3 control-label">商品名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="add_pname" id="add_pname" placeholder="商品名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_pinfo" class="col-sm-3 control-label">商品信息</label>
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" name="add_pinfo" id="add_pinfo" >
                            <textarea class="form-control" rows="3" id="add_pinfo_area" placeholder="商品描述信息"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_price" class="col-sm-3 control-label">商品价格</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="add_price" id="add_price" placeholder="价格">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="add_image" class="control-label col-md-3">商品图片</label>
                        <div class="col-md-4">
                            <input type="file" id="add_image" name="add_image" class="form-control">
                        </div>
                        <div class="col-md-5" style="position: relative">
                            <div class=" text-center" id="add_showImg" style="position: absolute;"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_stock" class="col-sm-3 control-label">库存</label>
                        <div class="col-sm-4">
                            <input type="number" class="form-control" name="add_stock" id="add_stock" min="0" max="100" step="1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_sale" class="col-sm-3 control-label">销量</label>
                        <div class="col-sm-4">
                            <input type="number" class="form-control" name="add_sale" id="add_sale" min="0" max="100" step="1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_ptype" class="col-sm-3 control-label">类型</label>
                        <div class="col-sm-4">
                            <select name="add_ptype" id="add_ptype" class="form-control">
                                <option value="0">刀</option>
                                <option value="1">枪</option>
                                <option value="2">手套</option>
                                <option value="3">杂项</option>
                                <option value="4">印花</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_status" class="col-sm-3 control-label">状态</label>
                        <div class="col-sm-4">
                            <select name="add_status" id="add_status" class="form-control">
                                <option value="0">上架</option>
                                <option value="1">下架</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8 col-sm-offset-3">
                            <button type="button" class="btn btn-primary btn-block" id="add_proBtn">添加</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%--商品修改模态框--%>
<div class="modal fade" tabindex="-1" data-backdrop="static" id="editProModal">
    <div class="modal-dialog" style="width: 550px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center">修改商品</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="pro_editForm">
                    <div class="form-group">
                        <input type="hidden" name="m" value="edit">
                        <input type="hidden" name="pid" id="pid" >
                        <label for="e_add_pname" class="col-sm-3 control-label">商品名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="e_add_pname" id="e_add_pname" placeholder="商品名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_add_pinfo" class="col-sm-3 control-label">商品信息</label>
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" name="e_add_pinfo" id="e_add_pinfo" >
                            <textarea class="form-control" rows="3" id="e_add_pinfo_area" placeholder="商品描述信息"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_add_price" class="col-sm-3 control-label">商品价格</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="e_add_price" id="e_add_price" placeholder="价格">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="e_add_image" class="control-label col-md-3">商品图片</label>
                        <div class="col-md-4">
                            <input type="file" id="e_add_image" name="e_add_image" class="form-control">
                        </div>
                        <div class="col-md-5" style="position: relative">
                            <div class=" text-center" id="e_add_showImg" style="position: absolute;"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_add_stock" class="col-sm-3 control-label">库存</label>
                        <div class="col-sm-4">
                            <input type="number" class="form-control" name="e_add_stock" id="e_add_stock" min="0" max="100" step="1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_add_sale" class="col-sm-3 control-label">销量</label>
                        <div class="col-sm-4">
                            <input type="number" class="form-control" name="e_add_sale" id="e_add_sale" min="0" max="100" step="1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_add_ptype" class="col-sm-3 control-label">类型</label>
                        <div class="col-sm-4">
                            <select name="e_add_ptype" id="e_add_ptype" class="form-control">
                                <option value="0">刀</option>
                                <option value="1">枪</option>
                                <option value="2">手套</option>
                                <option value="3">杂项</option>
                                <option value="4">印花</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_add_status" class="col-sm-3 control-label">状态</label>
                        <div class="col-sm-4">
                            <select name="e_add_status" id="e_add_status" class="form-control">
                                <option value="0">上架</option>
                                <option value="1">下架</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8 col-sm-offset-3">
                            <button type="button" class="btn btn-primary btn-block" id="e_add_proBtn">添加</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
