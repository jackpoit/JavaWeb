package com.woniuxy.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;


@WebServlet("/my1")
public class MyServlet1 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//1.获取工程的虚拟访问路径
		String contextPath = req.getContextPath();  //Day02_AM
		System.out.println("contextPath=" + contextPath);

		//2.获取Servlet的映射路径
		String servletPath = req.getServletPath();  //my1
		System.out.println("servletPath=" + servletPath);

		//3.获取访问者的ip
		String remoteIP = req.getRemoteAddr();  //my1
		System.out.println("remoteIP=" + remoteIP);

		//4.获取请求的URL URI
		StringBuffer requestURL = req.getRequestURL();
		System.out.println("requestURL=" + requestURL);

		String requestURI = req.getRequestURI();
		System.out.println("requestURI=" + requestURI);

		//重点 请求参数的获取
		String username=req.getParameter("username");
		System.out.println("username="+username);

		//获取的值是数组形式(多个值)
		String[] hobbys=req.getParameterValues("hobbys");
		if (hobbys!=null){
			for (String hobby:hobbys)
				System.out.println(hobby);
		}

		//将请求参数以map形式来保存
		Map<String, String[]> parameterMap = req.getParameterMap();
		Set<Map.Entry<String, String[]>> entries = parameterMap.entrySet();
		for (Map.Entry<String, String[]> entry:entries){
			System.out.println(entry.getKey()+":"+ Arrays.toString(entry.getValue()));
		}

	}
}
