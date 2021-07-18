package com.woniuxy.web.servlet;

import com.woniuxy.dao.UserDao;
import com.woniuxy.dao.impl.UserDaoImpl;
import com.woniuxy.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


public class UserPageServlet extends HttpServlet {
	private static UserDao udi;

	static {
		udi = new UserDaoImpl();
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = Integer.parseInt(req.getParameter("page"));
		int len= Integer.parseInt(req.getParameter("len"));
		List<User> list=null;
		try {
			list=udi.findByPage(page,len);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		req.setAttribute("userList",list);
		req.setAttribute("userPage",page);
		req.getRequestDispatcher("/admin.jsp").forward(req,resp);

	}
}
