package com.woniuxy.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;

public class RegisterServlet extends HttpServlet {
	private  static HashMap<String,User> map;
	static {
		map=new HashMap<>();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		Writer writer=resp.getWriter();
		String l_username=req.getParameter("l_username");
		String l_pwd=req.getParameter("l_pwd");
		User temp=map.get(l_username);
		String res;
		if (temp!=null){
			if (l_pwd.equals(temp.getPassword())){
				res="登录成功";
			}else {
				res="密码错误";
			}
		}else {
			res="用户不存在";
		}
		writer.write(res);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		Writer writer=resp.getWriter();
		String r_username=req.getParameter("r_username");
		String r_pwd=req.getParameter("r_pwd");
		String r_phone=req.getParameter("r_phone");
		String r_email=req.getParameter("r_email");
		if (map.containsKey(r_username)){
			writer.write("用户已存在");
		}else {
			map.put(r_username,new User(r_username,r_pwd,r_phone,r_email));
			writer.write("添加用户成功");
		}



	}
}