package com.woniuxy.web.servlet;

import com.woniuxy.dao.ProductDao;
import com.woniuxy.dao.impl.ProductDaoImpl;
import com.woniuxy.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

public class AddServlet extends HttpServlet {

	private static ProductDao pdi;

	static {
		pdi = new ProductDaoImpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pname = req.getParameter("pname");
		String pinfo = req.getParameter("pinfo");
		BigDecimal price = new BigDecimal(req.getParameter("price"));
		Integer stock = Integer.parseInt(req.getParameter("stock"));
		String image = req.getParameter("pimage");

		Product product = new Product(pname, pinfo, price, stock, 0, image);
		int rows = 0;
		try {
			rows = pdi.add(product);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		String resStr = "";
		if (rows != 0) {
			resStr = "添加成功";
		} else {
			resStr = "添加失败";
		}
		req.setAttribute("addResStr", resStr);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

}
