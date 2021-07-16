package com.woniuxy.web.servlet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * 模拟商场打折购买的结算系统
 */
public class CalculatorServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");

		//1.获取商品价格
		String priceStr = req.getParameter("price");
		if (priceStr == null || "".equals(priceStr)) {
			resp.getWriter().write("您选择的商品有问题无法结算");
			return;
		}
		float price = Float.parseFloat(priceStr);
		float oprice = price; //原价
		String discount = "不打折";
		String level = "普通用户";

		//2.获取真实的请求URI(工程访问路由/请求路由)
		String uri = req.getRequestURI();

		//3.根据用户等级打折
		if (uri.endsWith("/buy/vip")) {
			price = price * 0.8f;
			discount = "打八折";
			level = "vip";
		} else if (uri.endsWith("/buy/vvip")) {
			price = price * 0.5f;
			discount = "打五折";
			level = "超级vip";
		}

		//4.返回响应
		resp.getWriter().write("用户购买的商品原价为:" + oprice + "," +
				"用户等级为:" + level + ",所有商品" + discount + ",最终结算金额:" + price);
	}
}
