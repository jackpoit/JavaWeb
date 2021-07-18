package com.woniuxy.web.servlet;

import com.woniuxy.dao.UserDao;
import com.woniuxy.dao.impl.UserDaoImpl;
import com.woniuxy.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.sql.SQLException;


public class RegisterServlet extends HttpServlet {
	private static UserDao udi;

	static {
		udi = new UserDaoImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		Writer writer=resp.getWriter();
		String username = req.getParameter("r_username");
		String password = req.getParameter("r_pwd");
		String phone = req.getParameter("r_phone");
		String email = req.getParameter("r_email");
		User user = new User(username, password, phone, email);
		int rows = 0;
		try {
			rows = udi.add(user);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		if (rows!=0){
			req.setAttribute("registerRows",rows);
			req.getRequestDispatcher("/index.jsp").forward(req,resp);
//			writer.write("<script>window.location.href ='index.jsp';</script>");
//			writer.write("<script>alert('注册成功');</script>");
//			resp.sendRedirect("/WoniuShop/index.jsp");
//			writer.write("<script>alert('注册成功');$('#loginModal').modal('show');</script>");
		}else {
			writer.write("注册失败");
		}
	}
}