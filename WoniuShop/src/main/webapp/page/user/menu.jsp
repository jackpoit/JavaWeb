<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <% String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
    <base href="<%=basePath%>">
</head>

<!--菜单栏-->
<div class="container" style="margin-top:60px; line-height: 100px;">
    <div class="row">
        <div class="col-md-1">
            <img src="images/logo.jpg" width="100px" height="50px" style="margin-top: 25px">
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
        <div class="col-md-3 text-right">
            <form action="product" class="form-inline" method="post">
                <input type="hidden" name="m" value="search">
                <div class="form-group">
                    <label class="sr-only" for="kw">关键词</label>
                    <input type="text" class="form-control" id="kw" name="keyword" style="height: 40px">
                </div>
                <button type="submit" class="btn btn-primary" style="height:40px">搜索</button>
            </form>
        </div>
    </div>
</div>
