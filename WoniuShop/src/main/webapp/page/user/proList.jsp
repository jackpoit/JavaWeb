<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商品展示</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-3.5.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <script>
        function forwardDetails(id) {

            location.href="product?m=forwardDetails&pid="+id;

        }
    </script>
</head>
<body>
<%--包含头部菜单--%>
<jsp:include page="head.jsp"></jsp:include>

<!--菜单栏-->
<jsp:include page="menu.jsp"></jsp:include>

<!--分割线-->
<div style="border-top: 1px solid #e0e0e0;margin-bottom: 10px"></div>

<!--查询商品展示区-->
<div class="container">
    <c:if test="${empty info.list}">
        <h2 class="text-center" style="color: #b0b0b0">还未帮您查询到任何数据!</h2>
    </c:if>
    <c:if test="${!empty info.list}">

        <div class="row">
            <c:forEach var="product" items="${info.list}">
                <div class="col-xs-6 col-sm-4 col-md-3" onclick='forwardDetails(${product.id})'>
                    <div class="thumbnail pro-item">
                        <img src="${product.image}" alt="">
                        <div class="caption">
                            <h4 class="title">${product.pname}</h4>
                            <p class="info">${product.pinfo}</p>
                            <p class="price">${product.price}起</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!--分页导航条-->
        <c:if test="${info.pages>1}">
            <div class="col-md-12 text-center">
                <ul class="pagination">
                        <%--处理上一页逻辑--%>
                    <li><a href="product?m=search&currentPage=${info.prePage}&keyword=${kw}">上一页</a></li>

                        <%--处理中间页码的逻辑--%>
                    <c:forEach var="i" begin="1" end="${info.pages}">
                        <c:if test="${info.pageNum == i}">
                            <li class="active"><a href="javascript:;">${i}</a></li>
                        </c:if>
                        <c:if test="${info.pageNum != i}">
                            <li><a href="product?m=search&currentPage=${i}&keyword=${kw}">${i}</a></li>
                        </c:if>
                    </c:forEach>

                        <%--处理下一页的逻辑--%>
                    <li><a href="product?m=search&currentPage=${info.nextPage}&keyword=${kw}">下一页</a></li>
                </ul>
            </div>
        </c:if>
    </c:if>
</div>

</body>
</html>