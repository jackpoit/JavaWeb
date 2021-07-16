package com.woniuxy.web.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

/**
 * 模拟另一个销售
 */

@WebServlet("/anjuke/tony")
public class TonyServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String customer = req.getParameter("customer");
		int price= Integer.parseInt(req.getParameter("price"));

		double bonus = (double) req.getAttribute("bonus");
		System.out.println("tony可获得"+price*bonus+"的佣金");

		//响应给客户端
		resp.getWriter().write("客户信息:"+customer+","+price+"元");
	}
}
