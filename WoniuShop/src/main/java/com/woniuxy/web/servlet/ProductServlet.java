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

	//规则排序
	public void showPageByRule(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String keyword = req.getParameter("keyword");
		if (StringUtil.isEmpty(keyword)){
			keyword="";
		}
		String isDesc = req.getParameter("isDesc");
		if (StringUtil.isEmpty(keyword)||"false".equals(isDesc)){
			isDesc="ASC";
		}else {
			isDesc="DESC";
		}
		Product product =null;
		String type = req.getParameter("type");
		if (!StringUtil.isEmpty(type)){
			product=new Product();
			product.setPtype(Integer.parseInt(type));
		}
		List<Product> list = psi.getOrderByKeyword(product,keyword, isDesc);
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

		PageInfo<Product> info = psi.getOnePageByKeyword(currentPage, keyword,8,null,null);

		req.setAttribute("info",info);
		req.setAttribute("kw",keyword);


		 return "forward:/page/user/proList.jsp";
	}


	//后台
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
			fileName =pName.replace("|","").replace(" ","") ;
			String uploadPath = "D:/MyProgram/nginx-1.18.0/html/upload/" + "product/"+fileName;
			String imageName ="head" + suffix;
			File file = new File(uploadPath);
			if (!file.exists()) {
				file.mkdirs(); // 创建用户目录用于存放自己的图片
			}
			uploadPath = uploadPath + File.separator + imageName;
			// 上传到服务器
			part.write(uploadPath);
			imgPath = "http://localhost/upload/" + "product" + "/" +fileName+"/"+ imageName;
			product.setImage(imgPath);

		}
		boolean flag = psi.addPro(product);

		resp.getWriter().write(flag ? "Y" : "N");
	}

	//根据关键词分页
	public void showByKeyword(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String keyword = req.getParameter("keyword");
		if (keyword == null||"-1".equals(keyword))
			keyword = "";

		String cp = req.getParameter("currentPage");
		int currentPage = 1;
		if (!StringUtil.isEmpty(cp))
			currentPage = Integer.parseInt(cp);

		Integer fromPrice=null;
		String fp = req.getParameter("fromPrice");
		if (!StringUtil.isEmpty(fp)&&!"-1".equals(fp))
			fromPrice = Integer.parseInt(fp);

		Integer toPrice=null;
		String tp = req.getParameter("toPrice");
		if (!StringUtil.isEmpty(tp)&&!"-1".equals(tp))
			toPrice = Integer.parseInt(cp);


		PageInfo<Product> info = psi.getOnePageByKeyword(currentPage, keyword,5,fromPrice,toPrice);

		String s = JSON.toJSONString(info);
		resp.getWriter().write(s);
	}
	//修改
	public void edit(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		Product product = new Product();
		String pid = req.getParameter("pid");
		if (StringUtil.isEmpty(pid)) {
			return;
		}
		product.setId(Integer.parseInt(pid));
		
		String pName = req.getParameter("e_add_pname");
		if (!StringUtil.isEmpty(pName)) {
			product.setPname(pName);
		}
		String pInfo = req.getParameter("e_add_pinfo");
		if (!StringUtil.isEmpty(pInfo)) {
			product.setPinfo(pInfo);
		}
		String price = req.getParameter("e_add_price");
		if (!StringUtil.isEmpty(price)) {
			product.setPrice(new BigDecimal(price));
		}
		String stock = req.getParameter("e_add_stock");
		if (!StringUtil.isEmpty(stock)) {
			product.setStock(Integer.parseInt(stock));
		}
		String sale = req.getParameter("e_add_sale");
		if (!StringUtil.isEmpty(sale)) {
			product.setSale(Integer.parseInt(sale));
		}

		String pType = req.getParameter("e_add_ptype");
		if (!StringUtil.isEmpty(pType)) {
			product.setPtype(Integer.parseInt(pType));
		}
		String status = req.getParameter("e_add_status");
		if (!StringUtil.isEmpty(status)) {
			product.setStatus(Integer.parseInt(status));
		}

		String imgPath = null;
		Part part = req.getPart("e_add_image");

		if (part!=null &&part.getSize() != 0) {
			String fileName = part.getSubmittedFileName();
			String suffix = fileName.substring(fileName.lastIndexOf(".")); // 文件的扩展名
			fileName =pName.replace("|","").replace(" ","") ;
			String uploadPath = "D:/MyProgram/nginx-1.18.0/html/upload/" + "product/"+fileName;
			String imageName ="head" + suffix;

			File file = new File(uploadPath);
			if (!file.exists()) {
				file.mkdirs(); // 创建用户目录用于存放自己的图片
			}
			uploadPath = uploadPath + File.separator + imageName;
			// 上传到服务器
			part.write(uploadPath);
			imgPath = "http://localhost/upload/" + "product" + "/" +fileName+"/"+ imageName;
			product.setImage(imgPath);
		}
		boolean flag = psi.editPro(product);

		resp.getWriter().write(flag ? "Y" : "N");
	}
	//根据id删除商品
	public void deleteByIds(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String[] pids = req.getParameterValues("ids");
		Integer[] ids = new Integer[pids.length];
		for (int i = 0; i < ids.length; i++) {
			if (pids[i] != null) {
				ids[i] = Integer.parseInt(pids[i]);
			}
		}
		boolean flag = psi.doDelete(ids);
		System.out.println(flag);
		resp.getWriter().write(flag ? "Y" : "N");

	}
}
