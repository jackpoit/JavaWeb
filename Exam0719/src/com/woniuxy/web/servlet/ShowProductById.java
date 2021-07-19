package com.woniuxy.web.servlet;

import com.woniuxy.dao.ProductDao;
import com.woniuxy.dao.impl.ProductDaoImpl;
import com.woniuxy.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ShowProductById extends HttpServlet {
	private static ProductDao pdi;

	static {
		pdi = new ProductDaoImpl();
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id=Integer.parseInt(req.getParameter("id"));
		Product product=null;
		try {
			product=pdi.findById(id);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		if (product==null){
			req.setAttribute("flag","2");
		}
		req.setAttribute("product",product);
		req.getRequestDispatcher("/index.jsp").forward(req,resp);
	}
}
