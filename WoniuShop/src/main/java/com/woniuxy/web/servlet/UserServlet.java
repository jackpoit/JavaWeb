package com.woniuxy.web.servlet;

import com.woniuxy.entity.User;
import com.woniuxy.service.impl.UserServiceImpl;
import com.woniuxy.util.BaseServlet;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: rua
 * @Date: 2021/7/29 19:08
 * @Description: 用于处理用户所有请求的Servlet
 */
@MultipartConfig
@WebServlet("/user")
public class UserServlet extends BaseServlet {


	UserServiceImpl usi = new UserServiceImpl();

	public void checkName(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String username = req.getParameter("l_username");
		boolean flag = usi.isUserExist(username);
		resp.getWriter().write(flag ? "Y" : "N");
	}

	public void login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String username = req.getParameter("l_username");
		String password = req.getParameter("l_pwd");

		User user = usi.loginUser(username, password);
		String resStr = user == null ? "N" : "Y";
		resp.getWriter().write(resStr);

	}

	public void register(HttpServletRequest req, HttpServletResponse resp) throws Exception {


		User user = new User();
		user.setUsername(req.getParameter("r_username"));
		user.setPassword(req.getParameter("r_pwd"));
		user.setMobile(req.getParameter("r_phone"));
		user.setEmail(req.getParameter("r_email"));
		user.setLevel(0);
		String imgPath = "http://localhost:8080/WoniuShop/images/user/1.jpg";
		user.setImage(imgPath);
		boolean flag = usi.registerUser(user);

		resp.getWriter().write(flag ? "Y" : "N");

	}


}


