package com.woniuxy.web.servlet;

import com.github.pagehelper.util.StringUtil;
import com.woniuxy.entity.Order;
import com.woniuxy.service.impl.OrderServiceImpl;
import com.woniuxy.util.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: rua
 * @Date: 2021/8/4 15:43
 * @Description:
 */
@WebServlet("/order")
public class OrderServlet extends BaseServlet {
	private SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddmmss");
	private OrderServiceImpl osi = new OrderServiceImpl();

	public void addOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String uid = req.getParameter("o_uid");
		if (StringUtil.isEmpty(uid)) {
			return;
		}
		Order order = new Order();
		order.setUid(Integer.parseInt(uid));

		String pid = req.getParameter("o_pid");
		if (!StringUtil.isEmpty(pid)) {
			order.setPid(Integer.parseInt(pid));
		}

		order.setDetail(req.getParameter("o_detail"));

		String num = req.getParameter("o_num");
		if (!StringUtil.isEmpty(num)) {
			order.setNum(Integer.parseInt(num));
		}

		//starttime
		Date now = new Date();
		order.setStartTime(sdf1.format(now));
		order.setOno(sdf2.format(now));
		order.setStatus(0);
		boolean flag = osi.addOrder(order);

		resp.getWriter().write(flag ? "Y" : "N");
	}

	public void commitOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtil.isEmpty(idStr)) {
			return;
		}
		int id = Integer.parseInt(idStr);
		boolean flag = osi.commitOrder(id);
		resp.getWriter().write(flag ? "Y" : "N");

	}
}
