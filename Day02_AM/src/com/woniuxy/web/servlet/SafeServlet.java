package com.woniuxy.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * 测试Servlet的线程安全性
 * Servlet是非线程安全的
 * 如何安全?
 *
 */
public class SafeServlet extends HttpServlet {
//	private String name=null;  //多个人访问,数据就不对了:脏数据
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		synchronized (this){  //并发性极大降低 导致响应速度极慢
//
//			name = req.getParameter("name");
//			try {
//				TimeUnit.SECONDS.sleep(3);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
//			resp.setContentType("text/html;charset=utf-8");
//			resp.getWriter().write(name);
//		}
//	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//name是方法内的局部变量
		String name = req.getParameter("name");
		//栈封闭方式:多使用局部变量 尽量少用共享变量

		try {
			TimeUnit.SECONDS.sleep(3);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		resp.setContentType("text/html;charset=utf-8");
		resp.getWriter().write(name);
	}
}

