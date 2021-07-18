package com.woniuxy.web.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 模拟安居客租房经理
 *
 * @author rua
 */
@WebServlet("/anjuke/manager")
public class ManagerServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");


		System.out.println("welcome,Mr.zhang server u");

//		String customer = req.getParameter("customer");
//		int price= Integer.parseInt(req.getParameter("price"));
//		resp.getWriter().write("找到了");

		//此问题这个Servlet解决不了,需要其他Servlet解决
		//此时就需要使用转发方式,将该请求对象传递给另一个Servlet



		//req.getRequestDispatcher("tony").forward(req,resp);
							//不加就是 在/anjuke/后拼接 tony

		req.setAttribute("bonus",0.1);

		req.getRequestDispatcher("/anjuke/tony").forward(req,resp);
						//这个"/"是表示相对于当前工程(模块)的相对路径(与a的"/"不一样 那个是相对于项目/服务器的)
						//工程内部请求
	}
}

/**
 * 转发重点:
 * 1.无论发生了多少次转发,地址栏永远不会变
 * 2.一次请求一次响应[请求参数和请求域对象中的数据都是共享的](指的是请求对象和响应对象?)
 * 3.req.getRequestDispatcher("/路径").forward(req,resp);
 * 4.使用场景:在一次请求中若需要携带数据时,优先使用转发,处理速度较快
 * 		req.setAttribute("")  req.getAttribute("")
 *
 */
