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
	private AddressServiceImpl asi=new AddressServiceImpl();

	public void showAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String uid = req.getParameter("uid");
		if (StringUtil.isEmpty(uid)){
			return;
		}
		List<Address> list = asi.findAll(Integer.parseInt(uid));
		String jsonStr = JSON.toJSONString(list);
		resp.getWriter().write(jsonStr);
	}

	public void add(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		String uid = req.getParameter("add_uid");
		if (StringUtil.isEmpty(uid)){
			return;
		}
		Address address = new Address();
		address.setUid(Integer.parseInt(uid));
		address.setUsername(req.getParameter("add_name"));
		address.setMobile(req.getParameter("add_phone"));
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String district = req.getParameter("district");
		String area=province+" ";
		if (province.endsWith("市")){
			area+=district;
		}else {
			area+=city+" "+district;
		}
		address.setArea(area);
		address.setLocation(req.getParameter("fullAddress"));
		String isDefault = req.getParameter("isdefault");
		if ("true".equals(isDefault)){
			address.setIsDefault(1);
		}else {
			address.setIsDefault(0);
		}
		String districtCode = req.getParameter("districtCode");
		System.out.println(districtCode);
		if (!StringUtil.isEmpty(districtCode)){
			address.setPostcode(asi.getPostCode(districtCode));
		}

		boolean flag = asi.add(address);
		resp.getWriter().write(flag ? "Y" : "N");
	}

}
