package com.woniuxy.web.servlet;

import com.github.pagehelper.util.StringUtil;
import com.woniuxy.entity.Order;
import com.woniuxy.entity.Product;
import com.woniuxy.service.impl.OrderServiceImpl;
import com.woniuxy.service.impl.ProductServiceImpl;
import com.woniuxy.util.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author: rua
 * @Date: 2021/8/4 15:43
 * @Description:
 */
@WebServlet("/order")
public class OrderServlet extends BaseServlet {
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddmmss");
	private OrderServiceImpl osi = new OrderServiceImpl();
	private ProductServiceImpl psi = new ProductServiceImpl();

	public void addOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		boolean flag = false;
		String uid = req.getParameter("o_uid");
		if (StringUtil.isEmpty(uid)) {
			return;
		}
		Order order = new Order();
		order.setUid(Integer.parseInt(uid));
		order.setStatus(0);
		String pid = req.getParameter("o_pid");
		if (!StringUtil.isEmpty(pid)) {
			order.setPid(Integer.parseInt(pid));
		}
		order.setDetail(req.getParameter("o_detail"));
		String numStr = req.getParameter("o_num");
		if (StringUtil.isEmpty(numStr))
			return;
		int num = Integer.parseInt(numStr);
		List<Order> list = osi.getOrder(order);
		if (list == null) {
			order.setNum(num);
			Date now = new Date();
			order.setOno(sdf.format(now));
			flag = osi.addOrder(order);
		} else {
			Order oriOrder = list.get(0);
			Order upOrder = new Order();
			upOrder.setId(oriOrder.getId());
			upOrder.setNum(oriOrder.getNum() + num);
			flag = osi.updateOrder(upOrder);
		}
		String res="";
		if (!flag){
			res="N";
		}else {
			res=osi.getOrder(order).get(0).getId().toString();
		}
		resp.getWriter().write(res);
	}

	public void commitOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String[] oids = req.getParameterValues("ids");
		List<Integer> ids = new ArrayList<>();
		Integer id = null;
		for (int i = 0; i < oids.length; i++) {
			if (!StringUtil.isEmpty(oids[i])) {
				id = Integer.parseInt(oids[i]);
				if (!osi.commitOrder(id)) {
					ids.add(id);
				}
			}
		}
		StringBuilder res = new StringBuilder();
		if (!ids.isEmpty()) {
			for (Integer oid : ids) {
				res.append(oid).append(",");
			}
			res.setCharAt(res.lastIndexOf(","), '号');
			res.append("订单提交失败");
		} else {
			res.append("提交成功");
		}
		resp.getWriter().write(res.toString());
	}

	public String showOrderPage(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String uidStr = req.getParameter("uid");
		if (StringUtil.isEmpty(uidStr))
			return null;

		Order order = new Order();
		order.setUid(Integer.parseInt(uidStr));
		order.setStatus(0);
		List<HashMap<String, Object>> res = null;
		List<Order> list = osi.getOrder(order);
		if (list != null) {
			res = new LinkedList<>();
			for (Order o : list) {
				HashMap<String, Object> map = new HashMap<>();
				Integer pid = o.getPid();
				Product product = psi.getOnePro(pid);
				map.put("product", product);
				map.put("order", o);
				res.add(map);
			}
		}
		req.setAttribute("list", res);
		return "forward:/page/user/shopcart.jsp";
	}

	//根据id删除订单
	public void deleteByIds(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String[] oids = req.getParameterValues("ids");
		Integer[] ids = new Integer[oids.length];
		for (int i = 0; i < ids.length; i++) {
			if (oids[i] != null) {
				ids[i] = Integer.parseInt(oids[i]);
			}
		}
		boolean flag = osi.doDelete(ids);
		System.out.println(flag);
		resp.getWriter().write(flag ? "Y" : "N");

	}

	public String showCommitedOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String uidStr = req.getParameter("uid");
		if (StringUtil.isEmpty(uidStr))
			return null;

		Order order = new Order();
		order.setUid(Integer.parseInt(uidStr));
		order.setStatus(1);
		List<HashMap<String, Object>> res = null;
		List<Order> list = osi.getOrder(order);
		if (list != null) {
			res = new LinkedList<>();
			for (Order o : list) {
				HashMap<String, Object> map = new HashMap<>();
				Integer pid = o.getPid();
				Product product = psi.getOnePro(pid);
				map.put("product", product);
				map.put("order", o);
				res.add(map);
			}
		}
		req.setAttribute("list", res);
		return "forward:/page/user/order.jsp";
	}

	//根据id删除订单
	public void deleteCommitedOrders(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String[] oids = req.getParameterValues("ids");
		List<Integer> ids = new ArrayList<>();
		Integer id = null;
		for (int i = 0; i < oids.length; i++) {
			if (!StringUtil.isEmpty(oids[i])) {
				id = Integer.parseInt(oids[i]);
				if (!osi.deleteCommitedOrders(id)) {
					ids.add(id);
				}
			}
		}
		StringBuilder res = new StringBuilder();
		if (!ids.isEmpty()) {
			for (Integer oid : ids) {
				res.append(oid).append(",");
			}
			res.setCharAt(res.lastIndexOf(","), '号');
			res.append("订单删除失败");
		} else {
			res.append("删除成功");
		}
		resp.getWriter().write(res.toString());

	}

//	public void buyNow(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//		boolean flag = false;
//		String uid = req.getParameter("o_uid");
//		if (StringUtil.isEmpty(uid)) {
//			return;
//		}
//		Order order = new Order();
//		order.setUid(Integer.parseInt(uid));
//		order.setStatus(0);
//		String pid = req.getParameter("o_pid");
//		if (!StringUtil.isEmpty(pid)) {
//			order.setPid(Integer.parseInt(pid));
//		}
//		order.setDetail(req.getParameter("o_detail"));
//		String numStr = req.getParameter("o_num");
//		if (StringUtil.isEmpty(numStr))
//			return;
//		int num = Integer.parseInt(numStr);
//		List<Order> list = osi.getOrder(order);
//		if (list == null) {
//			order.setNum(num);
//			Date now = new Date();
//			order.setOno(sdf.format(now));
//			flag = osi.addOrder(order);
//		} else {
//			Order oriOrder = list.get(0);
//			Order upOrder = new Order();
//			upOrder.setId(oriOrder.getId());
//			upOrder.setNum(oriOrder.getNum()+num);
//			flag = osi.updateOrder(upOrder);
//		}
//		resp.getWriter().write(flag ? "Y" : "N");
//	}

}
