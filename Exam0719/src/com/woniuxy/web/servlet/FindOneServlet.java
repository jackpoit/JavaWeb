package com.woniuxy.web.servlet;

import com.woniuxy.entity.Product;
import com.woniuxy.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FindOneServlet extends HttpServlet {
	private static ProductServiceImpl psi = new ProductServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		int id = Integer.parseInt(req.getParameter("id"));
		Product product = psi.selectOneById(id);
		if (product == null) {
			req.setAttribute("flag", "2");
		}
		req.setAttribute("product", product);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
