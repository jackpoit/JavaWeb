package com.woniuxy.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet的定义:
 * Servlet的创建步骤:
 * 1.类 extends HttpServlet
 * 2.重写 doGet()   doPost()
 * HttpServletRequest :请求对象  ServletRequest
 * HttpServletRespond :响应对象	ServletRespond
 * 3.在web.xml中配置Servlet与路由的映射关系
 */


public class FirstServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//	System.out.println("servlet执行了doGet()");

		//1.通过请求对象来获取请求参数
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username + "" + password);

		//2.服务器返回响应
		// !!!:处理响应的中文乱码
		resp.setContentType("text/html;charset=UTF-8");//修改了网页输出的最终编码
		resp.getWriter().write("server Receive success!!");
		resp.getWriter().write(" <script>alert('hahaha');</script>");
		resp.getWriter().write(" 服务器已经成功接收到请求");

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("servlet执行了doPost()");

		//1.需要处理Post请求中文乱码
		req.setCharacterEncoding("UTF-8");



		//1.通过请求对象来获取请求参数
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username + "" + password);

		//3.返回响应
		resp.setContentType("text/html;charset=UTF-8");
		resp.getWriter().write("表单数据成功接收");

	}
}

