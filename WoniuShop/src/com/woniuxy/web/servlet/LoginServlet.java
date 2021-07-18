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

public class LoginServlet extends HttpServlet {
	private static UserDao udi;

	static {
		udi = new UserDaoImpl();
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		Writer writer=resp.getWriter();
		req.setCharacterEncoding("utf-8");
		String username=req.getParameter("l_username");
		String password=req.getParameter("l_pwd");
		User user=null;
		try {
			user=udi.findByName(username);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		String resStr="";
		if (user==null){
			resStr="没有此用户";
		}else {
			if (!password.equals(user.getPassword())){
				resStr="密码错误";
			}else {
				resStr="登录成功";
				req.setAttribute("name",user.getUsername());
				System.out.println(user);
			}
		}
		req.setAttribute("loginStr",resStr);
		req.getRequestDispatcher("/index.jsp").forward(req,resp);
	}
}
