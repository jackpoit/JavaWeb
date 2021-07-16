package com.woniuxy.web.servlet;

import com.woniuxy.entity.User;
import org.omg.PortableInterceptor.USER_EXCEPTION;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet("/getData")
public class GetDataServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.需要将相应的数据存放到request域中
		req.setAttribute("name","admin");




		User user=new User(1,"admin","123","男");
		req.setAttribute("user",user);


		ArrayList<User> list=new ArrayList<>();
		list.add(new User(1,"jack","123","男"));
		list.add(new User(2,"harry","222","男"));
		list.add(new User(3,"rose","333","男"));
		list.add(new User(4,"bosh","444","男"));
		list.add(new User(5,"sony","555","男"));

		req.setAttribute("userList",list);

		//2.将请求和响应转发到JSP(那么JSP就可以收到数据了)
		req.getRequestDispatcher("/user.jsp").forward(req,resp);
	}
}
