package com.woniuxy.web.servlet;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.util.StringUtil;
import com.woniuxy.entity.Order;
import com.woniuxy.entity.OrderPageModal;
import com.woniuxy.entity.Product;
import com.woniuxy.service.impl.OrderServiceImpl;
import com.woniuxy.service.impl.ProductServiceImpl;
import com.woniuxy.util.BaseServlet;
import org.apache.ibatis.annotations.ResultMap;

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
	private SimpleDateFormat confirmSdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
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
		String res = "";
		if (!flag) {
			res = "N";
		} else {
			res = osi.getOrder(order).get(0).getId().toString();
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
			res.setCharAt(res.lastIndexOf(","), '???');
			res.append("??????????????????");
		} else {
			res.append("????????????");
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

	//??????id????????????
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

	//??????id????????????
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
			res.setCharAt(res.lastIndexOf(","), '???');
			res.append("??????????????????");
		} else {
			res.append("????????????");
		}
		resp.getWriter().write(res.toString());

	}

	public void updateNum(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtil.isEmpty(idStr))
			return;
		Order order = new Order();
		order.setId(Integer.parseInt(idStr));
		String numStr = req.getParameter("num");
		if (StringUtil.isEmpty(numStr))
			return;
		order.setNum(Integer.parseInt(numStr));
		Integer[] ids=new Integer[1];
		ids[0]=order.getId();
		List<Order> list = osi.findByIds(ids);
		order.setPid(list.get(0).getPid());
		boolean flag = osi.updateNum(order);
		resp.getWriter().write(flag ? "Y" : "N");
	}

	//????????????????????? ????????????
	public void showByKeyword(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String ono = req.getParameter("ono");
		if (ono == null || "-1".equals(ono))
			ono = "";

		String cp = req.getParameter("currentPage");
		int currentPage = 1;
		if (!StringUtil.isEmpty(cp))
			currentPage = Integer.parseInt(cp);

		Integer status = null;
		String st = req.getParameter("status");
		if (!StringUtil.isEmpty(st) && !"-1".equals(st))
			status = Integer.parseInt(st);

		String pname = req.getParameter("pname");
		if (pname == null || "-1".equals(pname))
			pname = "";

		OrderPageModal info = osi.getOnePageBySome(currentPage, 5, ono, status, pname,null);

		String s = JSON.toJSONString(info);
		System.out.println(s);
		resp.getWriter().write(s);
	}

	public void showByUid(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String uidStr = req.getParameter("uid");
		if (StringUtil.isEmpty(uidStr)){
			return;
		}
		Integer uid=Integer.parseInt(uidStr);

		String cp = req.getParameter("currentPage");
		int currentPage = 1;
		if (!StringUtil.isEmpty(cp))
			currentPage = Integer.parseInt(cp);

		OrderPageModal info = osi.getOnePageBySome(currentPage, 5, "", null, "",uid);

		String s = JSON.toJSONString(info);
		System.out.println(s);
		resp.getWriter().write(s);

	}

	public void confirmOrder(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String idStr = req.getParameter("id");
		if (StringUtil.isEmpty(idStr)){
			return;
		}
		Integer id=Integer.parseInt(idStr);
		Order order = new Order();
		Date now = new Date();
		order.setId(id);
		order.setStatus(4);
		order.setEndTime(confirmSdf.format(now));
		boolean flag = osi.updateOrder(order);
		resp.getWriter().write(flag ? "Y" : "N");
	}
}
