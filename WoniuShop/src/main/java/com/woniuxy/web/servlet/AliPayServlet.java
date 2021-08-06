package com.woniuxy.web.servlet;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;
import javafx.scene.control.Alert;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

/**
 * @Author: rua
 * @Date: 2021/8/5 23:36
 * @Description:
 */
@SuppressWarnings("serial")
@WebServlet("/goAlipay")
public class AliPayServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = "" + UUID.randomUUID();
		//付款金额，必填
		String total_amount = req.getParameter("money");
		//订单名称，必填
		String subject = "deal_csgo";
		//商品描述，可空

		String body = req.getParameter("pname");
		String ids = req.getParameter("ids");
		String uid = req.getParameter("uid");
		String address = req.getParameter("address");
		HttpSession session = req.getSession();
		session.setAttribute("uid",uid);
		session.setAttribute("ids",ids);
		session.setAttribute("address",address);


		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
				+ "\"total_amount\":\"" + total_amount + "\","
				+ "\"subject\":\"" + subject + "\","
				+ "\"body\":\"" + body + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");


		//请求
		String result;
		try {
			result = alipayClient.pageExecute(alipayRequest).getBody();
			response.setContentType("text/html;charset=" + AlipayConfig.charset);
			response.getWriter().write(result);//直接将完整的表单html输出到页面
			response.getWriter().flush();
			response.getWriter().close();
		} catch (AlipayApiException e) {
			e.printStackTrace();
			response.getWriter().write("捕获异常出错");
			response.getWriter().flush();
			response.getWriter().close();
		}

	}
}
