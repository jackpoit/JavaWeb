package com.woniuxy.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: rua
 * @Date: 2021/8/6 14:37
 * @Description:
 */
@WebServlet("/alipaySuccess")
public class SuccessServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("success doget");

		Object ids = (String)req.getAttribute("ids");
		System.out.println(ids);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		System.out.println("success dopost");
	}
}
