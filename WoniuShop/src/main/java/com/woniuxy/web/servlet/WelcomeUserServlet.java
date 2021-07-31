package com.woniuxy.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author jackpoit
 * @date: 2021/7/29 19:08
 * @description: index页面导向
 */
@WebServlet("/welcome/user")
public class WelcomeUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 同步请求
		req.getRequestDispatcher("/page/user/index.jsp").forward(req, resp);
	}
}
