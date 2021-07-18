
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户中心</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/user.css">
    <script type="text/javascript" src="js/admin.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="col-md-2  text-center aside">
        <ul class="nav" role="tablist" id="myTabs">
            <li class="active"><a href="#info" aria-controls="user" role="tab" data-toggle="tab">编辑资料</a></li>
            <li><a href="#order" aria-controls="user" role="tab" data-toggle="tab">订单管理</a></li>
            <li><a href="#address" aria-controls="user" role="tab" data-toggle="tab">地址管理</a></li>
            <li><a href="#commit" aria-controls="user" role="tab" data-toggle="tab">添加评论</a></li>
        </ul>
    </div>
    <div class="col-md-10 content">
        <div class="title">
            <div class="col-md-9 text-center">
                Welcome to the user center
            </div>
            <div class="col-md-3">
                <img src="imges/user/4.jpg" width="40px" class="img-circle" alt="">
                <span class="person">admin</span></div>
        </div>
        <hr>
        <div class="tab-content">
            <%--info界面--%>
            <div role="tabpanel" class="tab-pane active" id="info">
                <div class="col-md-6 col-md-offset-3">
                    <div class="text-center" style="margin-bottom: 10px;font-size: 28px">
                        编辑用户资料
                    </div>
                    <div class="text-center" style="margin-bottom: 10px"><img src="imges/user/1.jpg" alt="..."
                                                                              class="img-circle" style="width: 100px">
                    </div>
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

                        <div class="form-group">
                            <label for="a_phone" class="control-label col-md-2">手机号:</label>
                            <div class="col-md-9">
                                <input type="text" id="a_phone" name="a_phone" class="form-control"
                                       placeholder="请输入手机号码">
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
                                <button type="submit" class="btn btn-primary " onclick="changeItem(true)">确认修改</button>
                                <button type="submit" class="btn  " style="background-color:#f0ad4e;;"
                                        onclick="changeItem(true)">返回首页
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%--订单界面--%>
            <div role="tabpanel" class="tab-pane" id="order">

                <div class="text-center" style="margin-bottom: 10px;font-size: 28px">
                    订单管理
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
                            <td colspan="2">操作</td>
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
                                <button type="button" class="btn btn-success" onclick="delTr(this)">确认收货</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-warning" onclick="delTr(this)">取消订单</button>
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
                                <button type="button" class="btn btn-success" onclick="delTr(this)">确认收货</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-warning" onclick="delTr(this)">取消订单</button>
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
                                <button type="button" class="btn btn-success" onclick="delTr(this)">确认收货</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-warning" onclick="delTr(this)">取消订单</button>
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

            <%--地址界面--%>
            <div role="tabpanel" class="tab-pane" id="address">
                <div class="text-center" style="margin-bottom: 10px;font-size: 28px">
                    地址管理
                </div>
                <div class="row">
                    <div class="col-md-2 navbar-right text-center" style="height: 50px;line-height: 50px">
                        <button class="btn bg-primary" type="submit">
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
                            <td>地址信息</td>
                            <td>详细地址</td>
                            <td>邮政编号</td>
                            <td>收货人姓名</td>
                            <td>手机号码</td>
                            <td colspan="2">操作</td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>1</td>
                            <td>上海市浦东新区</td>
                            <td>张东路2020弄xxx号xxxx室</td>
                            <td>000000</td>


                            <td>jack</td>
                            <td>19232324252</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                            <td>
                                <button type="button" class="btn bg-info">
                                    <span class="glyphicon glyphicon-pencil"></span>修改
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>1</td>
                            <td>上海市浦东新区</td>
                            <td>张东路2020弄xxx号xxxx室</td>
                            <td>000000</td>


                            <td>jack</td>
                            <td>19232324252</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                            <td>
                                <button type="button" class="btn bg-info">
                                    <span class="glyphicon glyphicon-pencil"></span>修改
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>选择<input type="checkbox"></td>
                            <td>1</td>
                            <td>上海市浦东新区</td>
                            <td>张东路2020弄xxx号xxxx室</td>
                            <td>000000</td>


                            <td>jack</td>
                            <td>19232324252</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="delTr(this)">&times;删除</button>
                            </td>
                            <td>
                                <button type="button" class="btn bg-info">
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

            <%--评论界面--%>
            <div role="tabpanel" class="tab-pane" id="commit">
                <div class="text-center" style="margin-bottom: 10px;font-size: 28px">
                    评论管理
                </div>
                <div style="min-height: 217px">
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
                            <td class="commit_content">评论内容</td>
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
                            <td class="commit_content">这也太啊发asfasfasfasfasfasfafs顺丰安抚奥数棒了吧</td>
                            <td>
                                <button type="button" class="btn btn-success" onclick="delTr(this)">添加评论</button>
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
                            <td class="commit_content">这也太棒了吧</td>
                            <td>
                                <button type="button" class="btn btn-success" onclick="delTr(this)">添加评论</button>
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
                            <td class="commit_content">这也太棒了吧</td>
                            <td>
                                <button type="button" class="btn btn-success" onclick="delTr(this)">添加评论</button>
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

</body>
</html>
