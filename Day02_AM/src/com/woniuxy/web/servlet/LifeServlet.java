package com.woniuxy.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 测试Servlet生命周期
 *		 创建:[默认]第一次访问(发起请求)时由tomcat创建出servlet实例,且只会创建一次(单例)-->init()只会执行一次
 *
 *			面试:能否在服务器启动的时候创建出这个Servlet实例?
 *			  <load-on-startup>1</load-on-startup>
 *       	  <!--默认-1,服务器启动不会创建,改成1就会在启动服务器时创建了-->
 *				数字越小就先被创建
 *				数字相同-->容器决定-->(放在下面的先创建?)
 *
 *			每次请求都会执行service()方法 [service涵盖了所有的请求方式]
 *			销毁:在关闭服务器/卸载应用程序
 *
 *
 *		 面试题:
 *		 	请你谈谈对Servlet的理解?
 *		 	tomcat的一个小程序 用来处理请求request和响应response的
 *		 	
 *		 	Servlet的生命周期?
 *
 *		 	Servlet是如何做到一个实例处理多个请求的?
 *		 		Servlet是单例多线程的,tomcat内部配备了线程池
 *		 		(请求阈值 300~700-->tomcat调优-->忙不过来-->tomcat集群-->负载均衡)
 *
 *
 *		 	Servlet线程安全吗?
 *
 */
public class LifeServlet extends HttpServlet {
	@Override
	public void init() throws ServletException {
		System.out.println("LifeServlet创建了");
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("LifeServlet执行了service()");
	}

	@Override
	public void destroy() {
		System.out.println("LifeServlet销毁了");
	}
}
