<%--
  Created by IntelliJ IDEA.
  User: rua
  Date: 2021/7/24
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
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
            <li role="presentation"><a href="#product" data-toggle="tab">商品管理</a></li>
            <li role="presentation"><a href="#order" data-toggle="tab">订单管理</a></li>
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
                                <td>${user.phone}</td>
                                <td>
                                    <c:if test="${!empty user.imagePath}">
                                        <img src="${user.imagePath}" alt="" style="width: 50px;" class="img-circle">
                                    </c:if>
                                    <c:if test="${empty user.imagePath}">
                                        <div class="img-circle" style="background-color: #607b84;
                                        width: 50px;height: 50px;margin: 0 auto">
                                        </div>
                                    </c:if>
                                </td>
                                <td><c:if test="${!empty user.userLevel}">${user.userLevel}</c:if><c:if
                                        test="${empty user.userLevel}">普通用户</c:if></td>
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
                                <input type="text" id="start" class="form-control" style="width: 120px"
                                       placeholder="起始价格">
                            </div>
                            <div class="form-group">
                                <label for="end" class="control-label">-</label>
                                <input type="text" id="end" class="form-control" style="width: 120px"
                                       placeholder="最终价格">
                            </div>
                            <button type="button" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span> 搜索
                            </button>
                        </div>

                        <div class="col-md-4 col-md-offset-1">
                            <a href="" class="btn btn-danger">
                                <span class="glyphicon glyphicon-remove-sign"></span> 批量删除</a>
                            <a href="" class="btn btn-primary">
                                <span class="glyphicon glyphicon-plus-sign"></span> 添加</a>
                            <a href="" class="btn btn-success">
                                <span class="glyphicon glyphicon-upload"></span> 上传</a>
                            <a href="" class="btn btn-info">
                                <span class="glyphicon glyphicon-download"></span> 下载</a>
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
                        <tr>
                            <td><input type="checkbox" name="products" value=""></td>
                            <td>1</td>
                            <td>蜗牛Plus</td>
                            <td>
                                <img src="images/p1.webp" width="60px" alt="">
                            </td>
                            <td>2000元</td>
                            <td>1000</td>
                            <td>100</td>
                            <td>手机</td>
                            <td>上架</td>
                            <td><a href="#" class="btn btn-danger"><span
                                    class="glyphicon glyphicon-remove"></span>删除</a></td>
                            <td><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#updateModal"><span
                                    class="glyphicon glyphicon-pencil"></span>修改</a></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="products" value=""></td>
                            <td>1</td>
                            <td>华为P40</td>
                            <td>
                                <img src="images/p3.webp" width="60px" alt="">
                            </td>
                            <td>2000元</td>
                            <td>1000</td>
                            <td>100</td>
                            <td>手机</td>
                            <td>上架</td>
                            <td><a href="#" class="btn btn-danger"><span
                                    class="glyphicon glyphicon-remove"></span>删除</a></td>
                            <td><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#updateModal"><span
                                    class="glyphicon glyphicon-pencil"></span>修改</a></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="products" value=""></td>
                            <td>1</td>
                            <td>iphone 12</td>
                            <td>
                                <img src="images/p2.webp" width="60px" alt="">
                            </td>
                            <td>2000元</td>
                            <td>1000</td>
                            <td>100</td>
                            <td>手机</td>
                            <td>上架</td>
                            <td><a href="#" class="btn btn-danger"><span
                                    class="glyphicon glyphicon-remove"></span>删除</a></td>
                            <td><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#updateModal"><span
                                    class="glyphicon glyphicon-pencil"></span>修改</a></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="products" value=""></td>
                            <td>1</td>
                            <td>iphone 12</td>
                            <td>
                                <img src="images/p4.webp" width="60px" alt="">
                            </td>
                            <td>2000元</td>
                            <td>1000</td>
                            <td>100</td>
                            <td>手机</td>
                            <td>上架</td>
                            <td><a href="#" class="btn btn-danger"><span
                                    class="glyphicon glyphicon-remove"></span>删除</a></td>
                            <td><a href="#" class="btn btn-primary" data-toggle="modal" data-target="#updateModal"><span
                                    class="glyphicon glyphicon-pencil"></span>修改</a></td>
                        </tr>
                    </table>
                </div>
                <!--商品分页展示-->
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
                                    <option value="">未付款</option>
                                    <option value="">已付款</option>
                                    <option value="">未发货</option>
                                    <option value="">已发货</option>
                                    <option value="">确认收货</option>
                                    <option value="">未评论</option>
                                    <option value="">已评论</option>
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
                        <tr>
                            <td><input type="checkbox" name="products" value=""></td>
                            <td>202107150034</td>
                            <td>蜗牛Plus</td>
                            <td>
                                <img src="images/p1.webp" width="60px" alt="">
                            </td>
                            <td>2000元</td>
                            <td>10</td>
                            <td>20000元</td>
                            <td>2021/07/15 00:00:00</td>
                            <td>2021/07/16 09:20:00</td>
                            <td>已完成</td>
                            <td><a href="#" class="btn btn-danger"><span
                                    class="glyphicon glyphicon-remove"></span>删除</a></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="products" value=""></td>
                            <td>202107150023</td>
                            <td>iphone</td>
                            <td>
                                <img src="images/p2.webp" width="60px" alt="">
                            </td>
                            <td>6000元</td>
                            <td>2</td>
                            <td>12000元</td>
                            <td>2021/07/14 00:00:00</td>
                            <td>暂无</td>
                            <td>未收货</td>
                            <td><a href="#" class="btn btn-danger"><span
                                    class="glyphicon glyphicon-remove"></span>删除</a></td>
                        </tr>
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


<%--编辑的模态框--%>
<div class="modal fade" tabindex="-1" id="editUserModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center">用户编辑</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <form class="form-horizontal" action="page/admin/user" method="post" id="editUserForm"
                              enctype="multipart/form-data">
                            <input class="sr-only" type="text" name="m" value="edit">
                            <input type="hidden" name="eid" id="eid">
                            <div class="form-group">
                                <label for="ename" class="col-sm-3 control-label">用户名</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ename" name="ename" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="ephone" class="col-sm-3 control-label">手机号码</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ephone" name="ephone" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户类别</label>
                                <label class="radio-inline">
                                    <input type="radio" name="elevel" id="elevel1" value="普通用户">普通用户
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="elevel" id="elevel2" value="vip"> vip
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="elevel" id="elevel3" value="vvvip"> vvvip
                                </label>

                            </div>
                            <div class="form-group">
                                <label for="eImg" class="control-label col-md-2 col-md-offset-1">头像</label>
                                <div class="col-md-8">
                                    <input type="file" name="eImg" id="eImg" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div id="showImg" class="col-md-6 col-md-offset-4"
                                     style="width: 150px;height: 150px;"></div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="button" class="btn btn-primary btn-block" id="user_upload">更新</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--添加的模态框--%>
<div class="modal fade" tabindex="-1" id="addUserModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title text-center">用户添加</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">

                        <form class="form-horizontal" action="page/admin/user" method="post" id="addUserForm"
                              enctype="multipart/form-data">
                            <input type="hidden" name="m" value="add">
                            <input type="hidden" name="id" id="id">
                            <div class="form-group">
                                <label for="r_username" class="col-sm-3 control-label">用户名</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="r_username" name="r_username" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="r_pwd" class="col-sm-3 control-label">密码</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="r_pwd" name="r_pwd" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="r_phone" class="col-sm-3 control-label">手机号码</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="r_phone" name="r_phone" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="r_email" class="col-sm-3 control-label">邮箱</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="r_email" name="r_email" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户类别</label>
                                <label class="radio-inline">
                                    <input type="radio" name="r_level" id="r_level1" value="普通用户" checked> 普通用户
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="r_level" id="r_level2" value="vip"> vip
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="r_level" id="r_level3" value="vvvip"> vvvip
                                </label>
                            </div>

                            <div class="form-group">
                                <label for="r_img" class="control-label col-md-2 col-md-offset-1">头像</label>
                                <div class="col-md-8">
                                    <input type="file" name="r_img" id="r_img" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div id="showAddImg" class="col-md-6 col-md-offset-4"
                                     style="width: 150px;height: 150px;"></div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <button type="button" class="btn btn-primary btn-block" id="user_add">添加用户</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>

    function deleteUser(id) {
        let flag = confirm("您确认要删除" + id + "号用户吗?");
        if (flag) {
            location.href = "page/admin/user?m=deleteByIds&uid=" + id
        }
    }

    function deleteUsers() {
        let $ids = $('input[name="users"]').filter(":checked")
        if ($ids.length === 0) {
            alert("没有选择的用户")
            return;
        }
        let idStr = "";
        let idRes = "";
        for (let i = 0; i < $ids.length; i++) {

            idRes += "uid=" + $ids.eq(i).val();
            idStr += $ids.eq(i).val();
            if (i !== $ids.length - 1) {
                idStr += ",";
                idRes += "&"
            }
        }
        let flag = confirm("您确认要删除" + idStr + "号用户吗?");
        if (flag) {
            location.href = "page/admin/user?m=deleteByIds&" + idRes;
        }
    }
</script>
</body>
</html>
