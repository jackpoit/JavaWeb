package com.woniuxy.web.servlet;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.util.StringUtil;
import com.woniuxy.entity.Address;
import com.woniuxy.service.impl.AddressServiceImpl;
import com.woniuxy.util.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author: jackpoit
 * @date: 2021/8/1
 * @description:
 **/
@WebServlet("/address")
public class AddressServlet extends BaseServlet {
	private AddressServiceImpl asi = new AddressServiceImpl();

	public void showAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String uid = req.getParameter("uid");
		if (StringUtil.isEmpty(uid)) {
			return;
		}
		List<Address> list = asi.findAll(Integer.parseInt(uid));
		String jsonStr = JSON.toJSONString(list);
		resp.getWriter().write(jsonStr);
	}

	public void add(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String uid = req.getParameter("add_uid");
		if (StringUtil.isEmpty(uid)) {
			return;
		}
		Address address = new Address();
		address.setUid(Integer.parseInt(uid));
		address.setUsername(req.getParameter("add_name"));
		address.setMobile(req.getParameter("add_phone"));
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String district = req.getParameter("district");
		String area = province + " ";
		if (province.endsWith("市")) {
			area += district;
		} else {
			area += city + " " + district;
		}
		address.setArea(area);
		address.setLocation(req.getParameter("fullAddress"));
		String isDefault = req.getParameter("isdefault");
		if ("true".equals(isDefault)) {
			address.setIsDefault(1);
		} else {
			address.setIsDefault(0);
		}
		String districtCode = req.getParameter("districtCode");
		System.out.println(districtCode);
		if (!StringUtil.isEmpty(districtCode)) {
			address.setPostcode(asi.getPostCode(districtCode));
		}

		boolean flag = asi.add(address);
		resp.getWriter().write(flag ? "Y" : "N");
	}

	public void remove(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String id = req.getParameter("id");
		if (StringUtil.isEmpty(id)) {
			return;
		}
		int addId = Integer.parseInt(id);
		boolean flag = asi.deleteById(addId);
		resp.getWriter().write(flag ? "Y" : "N");

	}

	public void setDefault(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String uidStr = req.getParameter("uid");
		if (StringUtil.isEmpty(uidStr)) {
			return;
		}
		Address address = new Address();
		address.setUid(Integer.parseInt(uidStr));
		String idStr = req.getParameter("id");
		if (!StringUtil.isEmpty(idStr)) {
			address.setId(Integer.parseInt(idStr));
		}
		address.setIsDefault(1);

		boolean flag = asi.setDefault(address);
		resp.getWriter().write(flag ? "Y" : "N");

	}

	public void edit(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String uid = req.getParameter("add_uid");
		if (StringUtil.isEmpty(uid)) {
			return;
		}
		String id = req.getParameter("add_id");
		if (StringUtil.isEmpty(id)) {
			return;
		}
		Address address = new Address();
		address.setUid(Integer.parseInt(uid));
		address.setId(Integer.parseInt(id));
		address.setUsername(StringUtil.isEmpty(req.getParameter("add_name"))?null:req.getParameter("add_name"));
		address.setMobile(StringUtil.isEmpty(req.getParameter("add_phone"))?null:req.getParameter("add_phone"));
		address.setLocation(StringUtil.isEmpty(req.getParameter("fullAddress"))?null:req.getParameter("fullAddress"));

		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String district = req.getParameter("district");
		if (!"-1".equals(province) && !"-1".equals(city) && !"-1".equals(district)) {
			String area = province + " ";
			if (province.endsWith("市")) {
				area += district;
			} else {
				area += city + " " + district;
			}
			address.setArea(area);
		}

		String isDefault = req.getParameter("isdefault");
		if ("true".equals(isDefault)) {
			address.setIsDefault(1);
		} else {
			address.setIsDefault(0);
		}
		String districtCode = req.getParameter("districtCode");
		if (!StringUtil.isEmpty(districtCode) && !"-1".equals(districtCode)) {
			address.setPostcode(asi.getPostCode(districtCode));
		}
		boolean flag = asi.update(address);
		resp.getWriter().write(flag ? "Y" : "N");
	}
}
