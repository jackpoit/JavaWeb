<%@ page import="com.woniuxy.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--标准的JSTL核心core库的导入--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>用户页面</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
</head>
<body>
<a href="getData">从Servlet接收字符串</a>
<hr>
<%
    //1.可以从request域中把转发过来的数据取出来
    String name = (String) request.getAttribute("name");
    out.print(name + "1");
%>
<%=request.getAttribute("name") + "2"%>
<%--我们可以使用EL表达式来取代在JSP中嵌入的Java脚本
    在初始化页面时不会显示--%>
${name}

<hr>
获取域中的对象的属性:
<%
    User user = (User) request.getAttribute("user");
    out.print(user);
    //out.print(user.getId());
    //out.print(user.getPassword());
%>

<%--${user}--%>
<%--<br>--%>
<%--${user.id}-${user.username}-${user.password}--%>

<hr>
获取集合中的对象属性
<%
    ArrayList<User> list = (ArrayList<User>) request.getAttribute("userList");
//  if (list!=null){
//      for(User user1:list){
//      	out.print(user1+"<br>");
//      }
//  }else {
//  	out.print("没有数据");
//  }
%>

<br>
EL获取集合的对象属性: ${userList[3].username}

JSTL来遍历域中的集合对象:
<br>
<c:forEach var="p" items="${userList}">
    ${p} <br>
</c:forEach>


<%--<c:forEach var="row" begin="1" end="9">--%>
<%--    <c:forEach var="col" begin="1" end="${row}">--%>
<%--        ${col}&times;${row}=${row*col}--%>
<%--    </c:forEach>--%>
<%--    <br>--%>
<%--</c:forEach>--%>

<hr>

<h3>BootStrap+EL+JSTL完成后的数据呈现</h3>
<div class="col-md-8 col-md-offset-2">
<table class="table table-bordered table-hover">
    <tbody class="text-center">
        <tr class="font-bold">
            <td>编号</td>
            <td>姓名</td>
            <td>密码</td>
            <td>性别</td>
        </tr>
        <c:forEach var="p" items="${userList}">
        <tr>
            <td>${p.id}</td>
            <td>${p.username}</td>
            <td>${p.password}</td>
            <td>${p.gender}</td>
        </tr>
        </c:forEach>

    </tbody>
</table>
</div>

</body>
</html>
