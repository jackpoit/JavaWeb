package com.woniuxy.web.servlet;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.woniuxy.entity.Product;
import com.woniuxy.entity.User;
import com.woniuxy.service.impl.ProductServiceImpl;
import com.woniuxy.util.BaseServlet;
import com.woniuxy.util.MD5Util;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * @author: jackpoit
 * @date: 2021/7/31 17:20
 * @description:
 */

@MultipartConfig
@WebServlet("/product")
public class ProductServlet extends BaseServlet {
	private ProductServiceImpl psi = new ProductServiceImpl();


	//展示页面
	public void showPage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int currentPage = 1;
		if (!StringUtil.isEmpty(req.getParameter("currentPage"))) {
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
		}
		List<Product> list = psi.findByPage(currentPage);
		String jsonStr = JSON.toJSONString(list);
		resp.getWriter().write(jsonStr);
	}

	//销量排序
	public void showSalePage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<Product> list = psi.getOrderByKeyword("sale", "DESC");
		String jsonStr = JSON.toJSONString(list);
		resp.getWriter().write(jsonStr);
	}

	//根据关键词分页
	public String search(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String keyword = req.getParameter("keyword");
		if (keyword == null)
			keyword = "";
		String cp = req.getParameter("currentPage");
		int currentPage = 1;
		if (!StringUtil.isEmpty(cp))
			currentPage = Integer.parseInt(cp);

		PageInfo<Product> info = psi.getOnePageByKeyword(currentPage, keyword,8);

		req.setAttribute("info",info);
		req.setAttribute("kw",keyword);


		 return "forward:/page/user/proList.jsp";
	}

	//添加
	public void add(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		Product product = new Product();
		String pName = req.getParameter("add_pname");
		if (!StringUtil.isEmpty(pName)) {
			product.setPname(pName);
		}
		String pInfo = req.getParameter("add_pinfo");
		if (!StringUtil.isEmpty(pInfo)) {
			product.setPinfo(pInfo);
		}
		String price = req.getParameter("add_price");
		if (!StringUtil.isEmpty(price)) {
			product.setPrice(new BigDecimal(price));
		}
		String stock = req.getParameter("add_stock");
		if (!StringUtil.isEmpty(stock)) {
			product.setStock(Integer.parseInt(stock));
		}
		String sale = req.getParameter("add_sale");
		if (!StringUtil.isEmpty(sale)) {
			product.setSale(Integer.parseInt(sale));
		}

		String pType = req.getParameter("add_ptype");
		if (!StringUtil.isEmpty(pType)) {
			product.setPtype(Integer.parseInt(pType));
		}
		String status = req.getParameter("add_status");
		if (!StringUtil.isEmpty(status)) {
			product.setStatus(Integer.parseInt(status));
		}

		String imgPath = null;
		Part part = req.getPart("add_image");

		if (part!=null &&part.getSize() != 0) {
			String fileName = part.getSubmittedFileName();
			String suffix = fileName.substring(fileName.lastIndexOf(".")); // 文件的扩展名
//			fileName =pName.substring(pName.lastIndexOf("|")) + suffix;
			fileName =pName.replace("|","").replace(" ","") + suffix;
			String uploadPath = "D:/MyProgram/nginx-1.18.0/html/upload/" + "product";
			File file = new File(uploadPath);
			if (!file.exists()) {
				file.mkdirs(); // 创建用户目录用于存放自己的图片
			}
			uploadPath = uploadPath + File.separator + fileName;
			// 上传到服务器
			part.write(uploadPath);
			imgPath = "http://localhost/upload/" + "product" + "/" + fileName;
			product.setImage(imgPath);
		}
		boolean flag = psi.addPro(product);

		resp.getWriter().write(flag ? "Y" : "N");
	}

	//根据关键词分页
	public void showByKeyword(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String keyword = req.getParameter("keyword");
		if (keyword == null)
			keyword = "";
		String cp = req.getParameter("currentPage");
		int currentPage = 1;
		if (!StringUtil.isEmpty(cp))
			currentPage = Integer.parseInt(cp);

		PageInfo<Product> info = psi.getOnePageByKeyword(currentPage, keyword,5);


		String s = JSON.toJSONString(info);
		resp.getWriter().write(s);

	}
}
