package com.woniuxy.web.servlet;

import com.woniuxy.entity.Product;
import com.woniuxy.service.ProductService;
import com.woniuxy.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

public class AddProductServlet extends HttpServlet {


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ProductService psi = new ProductServiceImpl();

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String pname = req.getParameter("pname");
		String pinfo = req.getParameter("pinfo");
		BigDecimal price = new BigDecimal(req.getParameter("price"));
		Integer stock = Integer.parseInt(req.getParameter("stock"));
		String image = req.getParameter("pimage");
		Product product = new Product(pname, pinfo, price, stock, 0, image);

		boolean flag = psi.addProduct(product);
		String resStr = "";
		if (flag) {
			resStr = "添加成功";
		} else {
			resStr = "添加失败";
		}
		req.setAttribute("addResStr", resStr);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
//		resp.setHeader("refresh","0;url=index.jsp"); 跳回来
	}

}
