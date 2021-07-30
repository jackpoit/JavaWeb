<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <% String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人中心</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/city.js"></script>
</head>
<body>
<%--包含头部菜单--%>
<jsp:include page="head.jsp"></jsp:include>

<%--<!--菜单栏-->--%>
<jsp:include page="menu.jsp"></jsp:include>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 5px"></div>

<!--个人中心展示区-->
<div class="container">
    <div class="row">
        <!-- 导航选项卡 -->
        <div class="col-md-2 text-center">
            <ul class="nav nav-stacked navbar-default aside-tab" role="tablist">
                <li role="presentation" class="active"><a href="#person"  data-toggle="tab">个人资料</a></li>
                <li role="presentation"><a href="#address"  data-toggle="tab">收货地址</a></li>
                <li role="presentation"><a href="#order" data-toggle="tab">订单管理</a></li>
            </ul>
        </div>

        <!-- 导航面板 -->
        <div class="col-md-10" style="height: 560px;margin-left: -14px;background:#fff;">
            <div class="tab-content">
                <!--个人资料模块-->
                <div class="tab-pane active" id="person">
                    <div class="col-md-8 col-md-offset-2">
                        <h3 class="text-center">个 人 资 料</h3>
                        <div id="showBox" style="height: 100px;width: 100px;margin: 30px auto">
                            <img src="/WoniuShop/images/user/15.jpg" width="100%" class="img-circle">
                        </div>
                        <form class="form-horizontal" action="/WoniuShop/edit" method="post">
                            <div class="form-group">
                                <label for="user" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="user" value="jack">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pwd" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="pwd" value="111111">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mobile" class="col-sm-2 control-label">手机号码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="mobile" value="18817386666">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="MyImg" class="col-sm-2 control-label">更新头像</label>
                                <div class="col-sm-10">
                                    <input type="file" class="form-control" id="MyImg">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-4">
                                    <button type="submit" class="btn btn-success navbar-left">确认修改</button>
                                    <a href="/WoniuShop/index.html" class="btn btn-primary navbar-right">返回首页</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!--收货地址管理模块-->
                <div class="tab-pane" id="address">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <h3 class="text-center">收 货 地 址</h3>
                            <div class="row" style="margin: 10px 0px;">
                                <button class="btn btn-primary navbar-right" data-toggle="modal" data-target="#addAddress">新增地址</button>
                            </div>
                            <div class="row">
                                <table class="table-bordered table-hover text-center" style="line-height: 50px;width: 100%">
                                    <tr style="background:#666; color: yellow;font-weight: bold">
                                        <td>收货人</td>
                                        <td>手机号码</td>
                                        <td>选择地区</td>
                                        <td>详细地址</td>
                                        <td>邮政编码</td>
                                        <td colspan="3">操作</td>
                                    </tr>
                                    <tr>
                                        <td>jack</td>
                                        <td>18817386666</td>
                                        <td>上海市 浦东新区</td>
                                        <td>燕乔大厦15楼前台蜗牛学院</td>
                                        <td>021209</td>
                                        <td><span class="default-addr">默认地址</span></td>
                                        <td><button class="btn btn-info">修改</button></td>
                                        <td><button class="btn btn-danger">删除</button></td>
                                    </tr>
                                    <tr>
                                        <td>admin</td>
                                        <td>18817386666</td>
                                        <td>上海市 浦东新区</td>
                                        <td>燕乔大厦15楼前台蜗牛学院</td>
                                        <td>021209</td>
                                        <td>
                                            <button class="btn btn-success">设置默认</button>
                                        </td>
                                        <td><button class="btn btn-info">修改</button></td>
                                        <td><button class="btn btn-danger">删除</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!--订单管理模块-->
                <div class="tab-pane" id="order">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="text-center">订 单 管 理</h3>
                            <div class="row" style="margin: 20px 0px;">
                                <table class="table-bordered table-hover text-center" style="line-height: 50px;width: 100%">
                                    <tr style="background:#666; color: yellow;font-weight: bold">
                                        <td>订单号</td>
                                        <td>商品图片</td>
                                        <td>商品单价</td>
                                        <td>购买数量</td>
                                        <td>商品小计</td>
                                        <td>创建时间</td>
                                        <td>完成时间</td>
                                        <td>订单状态</td>
                                        <td colspan="2">操作</td>
                                    </tr>
                                    <tr>
                                        <td>202010210434</td>
                                        <td>
                                            <img src="/WoniuShop/images/p1.webp" width="60px" height="60px" alt="">
                                        </td>
                                        <td>1000元</td>
                                        <td>4</td>
                                        <td>4000元</td>
                                        <td>2021年07月25日 00:00:00</td>
                                        <td>2021年07月28日 09:00:00</td>
                                        <td>确认收货</td>
                                        <td><button class="btn btn-info">修改</button></td>
                                        <td><button class="btn btn-danger">删除</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--添加地址的模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="addAddress">
    <div class="modal-dialog" style="width: 550px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center">添加收货地址</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="addAddress" method="post">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">收货人</label>
                        <div class="col-sm-9">
                            <input type="email" class="form-control" id="name" placeholder="名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">手机号码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="phone" placeholder="手机号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">选择地区</label>
                        <div class="col-sm-3">
                            <select name="province" id="province" class="form-control">
                                <option value="-1">省</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <select name="city" id="city" class="form-control">
                                <option value="-1">市</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <select name="district" id="district" class="form-control">
                                <option value="-1">区</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fullAddress" class="col-sm-3 control-label">详细地址</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="fullAddress" placeholder="详细地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="flag"> 设为默认地址
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button type="submit" class="btn btn-primary btn-block">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
