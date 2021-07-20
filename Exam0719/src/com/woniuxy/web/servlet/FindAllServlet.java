package com.woniuxy.web.servlet;

import com.woniuxy.entity.Product;
import com.woniuxy.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class FindAllServlet extends HttpServlet {
	private static ProductServiceImpl psi = new ProductServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<Product> list=psi.selectAll();
		req.setAttribute("productList",list);
		req.getRequestDispatcher("/index.jsp").forward(req,resp);
	}
}
