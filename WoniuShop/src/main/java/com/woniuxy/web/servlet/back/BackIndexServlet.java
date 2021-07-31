package com.woniuxy.web.servlet.back;

import com.github.pagehelper.PageInfo;
import com.woniuxy.entity.User;
import com.woniuxy.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: rua
 * @Date: 2021/7/25 0:45
 * @Description:
 */
@WebServlet("/page/admin/back")
public class BackIndexServlet extends HttpServlet {
	UserServiceImpl usi = new UserServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");

		PageInfo<User> info = usi.findOnePage(1, "");

		req.setAttribute("info", info);
		req.getRequestDispatcher("/page/admin/backstage.jsp").forward(req, resp);
	}
}
