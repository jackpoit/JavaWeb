<%--
  Created by IntelliJ IDEA.
  User: rua
  Date: 2021/7/16
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
</head>
<body>

<ul class="nav nav-justified">
    <li><a href="">登录</a></li>
    <li><a href="">注册</a></li>
    <li><a href="">个人中心</a></li>
    <li><a href="">退出</a></li>
</ul>

<%--jsp可以嵌入java代码:jsp的小脚本--%>
<%
    //此处的代码会被翻译到.java的service方法中
    int a=10;
    int b=20;
    System.out.println(a+b);
    response.getWriter().write(a);
    out.print(a);
%>
<%=a %> <%--out.print(a);--%>

<%--打印九九乘法表--%>
<h2 class="text-center">九九乘法表</h2>
<%
    for (int i = 1; i <=9; i++) {
        for (int j = 1; j<=i ; j++) {
            out.print(i+"x"+j+"="+i*j+"\t");
        }
    	out.write("<br>");
        //out.print和out.write的区别
        //print可以理解为sout的重载
        //write只能输出字符相关的数据(可以理解是用io写在前端的)
    }

    //曾经此处还可以写JDBC代码(随着业务的庞杂,最后JSP就尽量不嵌套java脚本
    //只专注以显示页面的数据(html+css+js)数据的动态显示
%>

    <%=request.getContextPath()+"<br>"%>
    <%=request.getRequestURI()+"<br>"%>
    <%=request.getRequestURL()+"<br>"%>



</body>
</html>
