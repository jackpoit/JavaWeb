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

public class ShowAllProcuctServlet extends HttpServlet {
	private static ProductDao pdi;

	static {
		pdi = new ProductDaoImpl();
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<Product> list=null;
		try {
			list=pdi.findAll();
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		req.setAttribute("userList",list);
		req.getRequestDispatcher("/index.jsp").forward(req,resp);
	}
}
