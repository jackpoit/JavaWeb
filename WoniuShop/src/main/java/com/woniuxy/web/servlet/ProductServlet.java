package com.woniuxy.web.servlet;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.util.StringUtil;
import com.woniuxy.entity.Product;
import com.woniuxy.service.impl.ProductServiceImpl;
import com.woniuxy.util.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @Author: rua
 * @Date: 2021/7/31 17:20
 * @Description:
 */
@WebServlet("/product")
public class ProductServlet extends BaseServlet {
	private ProductServiceImpl psi=new ProductServiceImpl();

	public void showAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		List<Product> list = psi.getAll();

	}

	public void showPage(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		int currentPage=1;
		if (!StringUtil.isEmpty(req.getParameter("currentPage"))){
			currentPage=Integer.parseInt(req.getParameter("currentPage"));
		}

		List<Product> list = psi.findByPage(currentPage);
		String jsonStr = JSON.toJSONString(list);
		resp.getWriter().write(jsonStr);

	}
}
