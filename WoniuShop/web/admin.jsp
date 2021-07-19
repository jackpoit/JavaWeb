<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/admin.css">
    <script type="text/javascript" src="js/admin.js"></script>
</head>
<body>
<div class=" myNav">
    蜗牛商城后台系统
</div>
<div class="container-fluid">
    <div class="col-md-2  text-center aside">
        <ul class="nav" role="tablist" id="myTabs">
            <li class="active"><a href="#user" aria-controls="user" role="tab" data-toggle="tab">用户管理</a></li>
            <li><a href="#item" aria-controls="user" role="tab" data-toggle="tab">商品管理</a></li>
            <li><a href="#order" aria-controls="user" role="tab" data-toggle="tab">订单管理</a></li>
            <li><a href="backLogin.jsp">退出系统</a></li>
        </ul>
    </div>
    <div class="col-md-10 content">
        <div class="title">
            <div class="col-md-10 text-center">
                Welcome to the woniu mall
            </div>
            <div class="col-md-2">
                <img src="imges/user/4.jpg" width="40px" class="img-circle" alt="">
                <span class="person">admin</span></div>
        </div>
        <hr>
        <div class="tab-content">
            <%--User界面--%>
            <div role="tabpanel" class="tab-pane active" id="user">
                <div class="row user">
                    <div class="col-md-8 navbar-left" style="height: 70px; line-height: 70px">
                        <form class="form-inline">
                            <div class="form-group ">
                                <label for="userNo">编号:</label>
                                <input type="text" class="form-control" id="userNo" name="userNo"
                                       placeholder="请输入用户编号" style="width: 165px">
                            </div>
                            <div class="form-group ">
                                <label for="userName">用户名:</label>
                                <input type="text" class="form-control" id="userName" name="userName"
                                       placeholder="请输入用户姓名" style="width: 165px">
                            </div>
                            <div class="form-group ">
                                <label for="userPhone">手机</label>
                                <input type="email" class="form-control" id="userPhone" name="userPhone"
                                       placeholder="请输入用户手机号码" style="width: 165px">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">搜索</button>
                            </div>
                        </form>

                    </div>
                    <div class="col-md-4 navbar-right text-center" style="height: 70px;line-height: 70px">
                        <a class="btn btn-default" href="#" role="button">
                            <span class="glyphicon glyphicon-download"></span>
                            下载
                        </a>
                        <button class="btn btn-default" type="button" style="background-color: #5CB85C">
                            <span class="glyphicon glyphicon-upload"></span>上传
                        </button>
                        <button class="btn btn-default" type="button" style="background-color: #F0AD4E">
                            <span class="glyphicon glyphicon-remove-circle"></span>批量删除
                        </button>
                        <button class="btn btn-default" type="button" style="background-color:#5BC0DE"
                                data-toggle="modal" data-target="#addModal">
                            <span class="glyphicon glyphicon-plus"></span>添加
                        </button>
                    </div>
                </div>
                <div style="min-height: 217px">
                <table class="table table-hover table-bordered text-center" style="line-height: 2;">
                    <tbody>
                    <tr>
                        <td><label>
                            <input type="checkbox">全选/全消
                        </label></td>
                        <td>编号</td>
                        <td>用户名</td>
                        <td>手机号码</td>
                        <td>用户头像</td>
                        <td>用户类别</td>
                        <td colspan="2">操作</td>
                    </tr>
                    <c:forEach var="u" items="${userList}">
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>${u.id}</td>
                            <td>${u.username}</td>
                            <td>${u.phone}</td>
                            <td>
                                <img src="imges/user/4.jpg" width="40px" class="img-circle" alt=""></td>
                            <td>普通用户</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#modifyModal">
                                    <span class="glyphicon glyphicon-pencil"></span>修改
                                </button>
                            </td>
                        </tr>
                    </c:forEach>



                    </tbody>
                </table>
                </div>
                <div class="container text-center">
                    <ul class="pagination">
                        <li><a href="javascript:;" onclick=" getPagePath(this)">&laquo;</a></li>
                        <li><a href="javascript:;" onclick=" getPagePath(this)">1</a></li>
                        <li><a href="javascript:;" onclick=" getPagePath(this)">2</a></li>
                        <li><a href="javascript:;" onclick=" getPagePath(this)">3</a></li>
                        <li><a href="javascript:;" onclick=" getPagePath(this)">4</a></li>
                        <li><a href="javascript:;" onclick=" getPagePath(this)">&raquo;</a></li>
                    </ul>
                </div>

                <script>
                    getUserPage(${userPage});
                </script>
            </div>
            <%--商品界面--%>
            <div role="tabpanel" class="tab-pane" id="item">
                <div class="row item">
                    <div class="col-md-8 navbar-left" style="height: 70px; line-height: 70px">
                        <form class="form-inline">
                            <div class="form-group ">
                                <label for="itemName">商品名称:</label>
                                <input type="text" class="form-control" id="itemName" name="itemName"
                                       placeholder="请输入商品名称" style="width: 165px">
                            </div>
                            <div class="form-group ">
                                <label for="priceRangeFrom">价格范围:</label>
                                <input type="text" class="form-control" id="priceRangeFrom" name="priceRangeFrom"
                                       placeholder="请输入价格" style="width: 145px">
                            </div>
                            <div class="form-group ">
                                <label for="priceRangeTo">-</label>
                                <input type="text" class="form-control" id="priceRangeTo" name="priceRangeTo"
                                       placeholder="请输入价格" style="width: 145px">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary ">搜索</button>
                            </div>
                        </form>

                    </div>
                    <div class="col-md-4 navbar-right text-center" style="height: 70px;line-height: 70px">
                        <a class="btn btn-default" href="#" role="button">
                            <span class="glyphicon glyphicon-download"></span>
                            下载
                        </a>
                        <button class="btn btn-default" type="submit" style="background-color: #5CB85C">
                            <span class="glyphicon glyphicon-upload"></span>上传
                        </button>
                        <button class="btn btn-default" type="submit" style="background-color: #F0AD4E">
                            <span class="glyphicon glyphicon-remove-circle"></span>批量删除
                        </button>
                        <button class="btn btn-default" type="submit" style="background-color:#5BC0DE">
                            <span class="glyphicon glyphicon-plus"></span>添加
                        </button>
                    </div>
                </div>
                <div style="height: 217px">
                    <table class="table table-hover table-bordered " style="line-height: 2;">
                        <tbody class="text-center">
                        <tr>
                            <td><label>
                                <input type="checkbox">全选/全消
                            </label></td>
                            <td>编号</td>
                            <td>商品名称</td>
                            <td>商品数量</td>
                            <td>商品价格</td>
                            <td>商品图片</td>
                            <td>商品销量</td>
                            <td>商品类别</td>
                            <td>状态(上/下架)</td>
                            <td colspan="2">操作</td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>1</td>
                            <td>蜗牛plus</td>
                            <td>999件</td>
                            <td>1999.99元</td>
                            <td>
                                <img src="imges/user/4.jpg" width="40px" alt=""></td>
                            <td>10000件</td>
                            <td>手机</td>
                            <td>上架</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil"></span>修改
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>1</td>
                            <td>蜗牛plus</td>
                            <td>999件</td>
                            <td>1999.99元</td>
                            <td>
                                <img src="imges/user/4.jpg" width="40px" alt=""></td>
                            <td>10000件</td>
                            <td>手机</td>
                            <td>上架</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil"></span>修改
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>1</td>
                            <td>蜗牛plus</td>
                            <td>999件</td>
                            <td>1999.99元</td>
                            <td>
                                <img src="imges/user/4.jpg" width="40px" alt=""></td>
                            <td>10000件</td>
                            <td>手机</td>
                            <td>上架</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil"></span>修改
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="container text-center">
                    <ul class="pagination">
                        <li><a href="">&laquo;</a></li>
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">&raquo;</a></li>
                    </ul>
                </div>
            </div>
            <%--订单界面--%>
            <div role="tabpanel" class="tab-pane" id="order">
                <div class="row order">
                    <div class="col-md-8 navbar-left" style="height: 70px; line-height: 70px">
                        <form class="form-inline">
                            <div class="form-group ">
                                <label for="orderNo">订单编号:</label>
                                <input type="text" class="form-control" id="orderNo"
                                       placeholder="请输入订单编号" style="width: 165px">
                            </div>
                            <div class="form-group ">
                                <label for="OrderitemName">商品名称:</label>
                                <input type="text" class="form-control" id="OrderitemName"
                                       placeholder="请输入商品名称" style="width: 165px">
                            </div>
                            <div class="form-group ">
                                <label for="orderStatus">订单状态</label>
                                <select class="form-control" id="orderStatus">
                                    <option name="orderStatus">全部</option>
                                    <option name="orderStatus">1</option>
                                    <option name="orderStatus">2</option>
                                    <option name="orderStatus">3</option>
                                    <option name="orderStatus">4</option>
                                    <option name="orderStatus">5</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary ">搜索</button>
                            </div>
                        </form>

                    </div>
                    <div class="col-md-4 navbar-right text-center" style="height: 70px;line-height: 70px">
                        <a class="btn btn-default" href="#" role="button">
                            <span class="glyphicon glyphicon-download"></span>
                            下载
                        </a>
                        <button class="btn btn-default" type="submit" style="background-color: #5CB85C">
                            <span class="glyphicon glyphicon-upload"></span>上传
                        </button>
                        <button class="btn btn-default" type="submit" style="background-color: #F0AD4E">
                            <span class="glyphicon glyphicon-remove-circle"></span>批量删除
                        </button>

                    </div>
                </div>
                <div style="height: 217px">
                    <table class="table table-hover table-bordered text-center" style="line-height: 2;">
                        <tbody>
                        <tr>
                            <td><label>
                                <input type="checkbox">全选/全消
                            </label></td>
                            <td>订单编号</td>
                            <td>商品名称</td>
                            <td>商品数量</td>
                            <td>商品价格</td>
                            <td>小计</td>
                            <td>商品图片</td>
                            <td>下单时间</td>
                            <td>收货时间</td>
                            <td>状态</td>
                            <td>操作</td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>2020052001</td>
                            <td>蜗牛10plus</td>
                            <td>2件</td>
                            <td>1999.99元</td>
                            <td>3333.33元</td>
                            <td>
                                <img src="imges/user/4.jpg" width="40px" alt=""></td>
                            <td>2020-05-20</td>
                            <td>未收货</td>
                            <td>待收货</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>2020052001</td>
                            <td>蜗牛10plus</td>
                            <td>2件</td>
                            <td>1999.99元</td>
                            <td>3333.33元</td>
                            <td>
                                <img src="imges/user/4.jpg" width="40px" alt=""></td>
                            <td>2020-05-20</td>
                            <td>未收货</td>
                            <td>待收货</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>2020052001</td>
                            <td>蜗牛10plus</td>
                            <td>2件</td>
                            <td>1999.99元</td>
                            <td>3333.33元</td>
                            <td>
                                <img src="imges/user/4.jpg" width="40px" alt=""></td>
                            <td>2020-05-20</td>
                            <td>未收货</td>
                            <td>待收货</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="container text-center">
                    <ul class="pagination">
                        <li><a href="">&laquo;</a></li>
                        <li><a href="">1</a></li>
                        <li><a href="">2</a></li>
                        <li><a href="">3</a></li>
                        <li><a href="">4</a></li>
                        <li><a href="">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>
<!--修改用户模态框-->
<div class="modal fade" id="modifyModal" tabindex="-1">
    <div class="modal-dialog" style="width: 500px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-header">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h4 class="modal-title text-left">修改用户</h4>
            </div>
            <div class="modal-body">
                <div class="text-center" style="margin-bottom: 10px"><img src="imges/user/1.jpg" alt="..."
                                                                          class="img-circle" style="width: 100px"></div>
                <form action="register" class="form-horizontal" method="post">
                    <div class="form-group">
                        <label for="m_userNo" class="control-label col-md-2 ">编号:</label>
                        <div class="col-md-9">
                            <input type="text" id="m_userNo" class="form-control" placeholder="请输入用户编号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="r_username" class="control-label col-md-2 ">用户名:</label>
                        <div class="col-md-9">
                            <input type="text" id="r_username" class="form-control" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="r_pwd" class="control-label col-md-2">密码:</label>
                        <div class="col-md-9">
                            <input type="password" id="r_pwd" class="form-control" placeholder="请输入密码">
                        </div>
                    </div>
                    <%--                    <div class="form-group">--%>
                    <%--                        <label for="r_repwd" class="control-label col-md-2">密码确认:</label>--%>
                    <%--                        <div class="col-md-9">--%>
                    <%--                            <input type="password"  id="r_repwd" class="form-control" >--%>
                    <%--                        </div>--%>

                    <%--                    </div>--%>
                    <div class="form-group">
                        <label for="r_phone" class="control-label col-md-2">手机号:</label>
                        <div class="col-md-9">
                            <input type="text" id="r_phone" class="form-control" placeholder="请输入手机号码">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="r_pic" class="control-label col-md-2">头像:</label>
                        <div class="col-md-9">
                            <input type="file" id="r_pic" name="r_pic" class="form-control">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-md-6 col-md-offset-3 text-center">
                            <button type="submit" class="btn btn-primary " onclick="changeItem(true)">确认修改</button>
                            <button type="submit" class="btn btn-primary " onclick="changeItem(true)">返回首页</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--添加用户模态框-->
<div class="modal fade" id="addModal" tabindex="-1">
    <div class="modal-dialog" style="width: 500px;margin-top: 150px">
        <div class="modal-content">
            <div class="modal-header">
                <a href="#" class="close" data-dismiss="modal">&times;</a>
                <h4 class="modal-title text-left">添加用户</h4>
            </div>
            <div class="modal-body">
                <div class="text-center" style="margin-bottom: 10px"><img src="imges/user/1.jpg" alt="..."
                                                                          class="img-circle" style="width: 100px"></div>
                <form action="register" class="form-horizontal" method="post">
                    <div class="form-group">
                        <label for="a_username" class="control-label col-md-2 ">用户名:</label>
                        <div class="col-md-9">
                            <input type="text" id="a_username" name="a_username" class="form-control"
                                   placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="a_pwd" class="control-label col-md-2">密码:</label>
                        <div class="col-md-9">
                            <input type="password" id="a_pwd" name="a_pwd" class="form-control" placeholder="请输入密码">
                        </div>
                    </div>
                    <%--                    <div class="form-group">--%>
                    <%--                        <label for="r_repwd" class="control-label col-md-2">密码确认:</label>--%>
                    <%--                        <div class="col-md-9">--%>
                    <%--                            <input type="password"  id="r_repwd" class="form-control" >--%>
                    <%--                        </div>--%>

                    <%--                    </div>--%>
                    <div class="form-group">
                        <label for="a_phone" class="control-label col-md-2">手机号:</label>
                        <div class="col-md-9">
                            <input type="text" id="a_phone" name="a_phone" class="form-control" placeholder="请输入手机号码">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="a_pic" class="control-label col-md-2">头像:</label>
                        <div class="col-md-9">
                            <input type="file" id="a_pic" name="a_pic" class="form-control">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-md-6 col-md-offset-3 text-center">
                            <button type="submit" class="btn btn-primary " >确认添加</button>
                            <button type="submit" class="btn btn-primary " >返回首页</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>


