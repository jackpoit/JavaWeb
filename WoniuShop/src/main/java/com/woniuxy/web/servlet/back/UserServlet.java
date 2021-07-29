package com.woniuxy.web.servlet.back;

import com.github.pagehelper.PageInfo;
import com.woniuxy.entity.User;
import com.woniuxy.service.impl.UserServiceImpl;
import com.woniuxy.util.BaseServlet;
import com.woniuxy.util.DBUtil;
import com.woniuxy.util.StringUtil;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;

/**
 * @Author: rua
 * @Date: 2021/7/28 19:23
 * @Description:
 */
@MultipartConfig
@WebServlet("/page/admin/user")
public class UserServlet extends BaseServlet {

	UserServiceImpl usi = new UserServiceImpl();

	/**
	 * 根据id删除员工
	 */
	public String deleteByIds(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String[] uids = req.getParameterValues("uid");
		Integer[] ids = new Integer[uids.length];
		for (int i = 0; i < ids.length; i++) {
			if (uids[i] != null) {
				ids[i] = Integer.parseInt(uids[i]);
			}
		}
		boolean flag = usi.remove(ids);
		resp.getWriter().write("<script>alert('"+(flag?"删除成功":"删除失败")+"')</script>");

		return "redirect:/page/admin/back";
	}

	public String edit(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		User user = new User();
		String username = req.getParameter("ename");
		user.setId(Integer.parseInt(req.getParameter("eid")));
		user.setUsername(req.getParameter("ename"));
		user.setPhone(req.getParameter("ephone"));
		user.setUserLevel(req.getParameter("elevel"));

		Part part = req.getPart("eImg");
		if (part != null) {
			String fileName = part.getSubmittedFileName();
			String suffix = fileName.substring(fileName.lastIndexOf(".")); // 文件的扩展名
			fileName = "head" + suffix;
			String uploadPath = "D:/MyProgram/Tomcat/nginx-1.18.0/html/upload/" + username;
			File file = new File(uploadPath);
			if (!file.exists()) {
				file.mkdirs(); // 创建用户目录用于存放自己的图片
			}
			uploadPath = uploadPath + File.separator + fileName;

			// 上传到服务器
			part.write(uploadPath); //part.write会自动覆盖原文件
			String imgPath = "http://localhost/upload/" + username + "/" + fileName;
			user.setImagePath(imgPath);
		}

		boolean flag = usi.edit(user);

		resp.getWriter().write("<script>alert('" + (flag ? "更新成功" : "更新失败") + "')</script>");

		return "redirect:/page/admin/back";
	}

	public String page(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		//获取当前页码
		String currentUserPageStr = req.getParameter("currentUserPage");
		int currentUserPage = 1;
		if (!StringUtil.isEmpty(currentUserPageStr) ) {
			currentUserPage = Integer.parseInt(currentUserPageStr);
		}
		//获取模糊查询关键字
		String keyword = req.getParameter("keyword");
		String userIdKeyword = req.getParameter("uid");
		String usernameKeyword = req.getParameter("uname");
		String userPhoneKeyword = req.getParameter("uphone");
		if (keyword == null) {
			if (userIdKeyword == null && usernameKeyword == null && userPhoneKeyword == null) {
				keyword = "";
			} else if ("".equals(userIdKeyword) && "".equals(usernameKeyword) && "".equals(userPhoneKeyword)) {
				keyword = "";
			} else if (!"".equals(userIdKeyword)) {
				keyword = userIdKeyword;
			} else {
				keyword = "".equals(usernameKeyword) ? userPhoneKeyword : usernameKeyword;
			}
		}

		PageInfo<User> info = usi.findOnePage(currentUserPage, keyword);
		req.setAttribute("info", info);
		req.setAttribute("keyword",keyword);

		return "forward:/page/admin/backstage.jsp";
	}

	public String add(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		User user = new User();
		String username = req.getParameter("r_username");
		user.setUsername(req.getParameter("r_username"));
		user.setPassword(req.getParameter("r_pwd"));
		user.setPhone(req.getParameter("r_phone"));
		user.setEmail(req.getParameter("r_email"));
		user.setImagePath(req.getParameter("r_img"));
		user.setUserLevel(req.getParameter("r_level"));

		String imgPath = "http://localhost:8080/WoniuShop/images/user/1.jpg";
		Part part = req.getPart("r_img");

		if (part.getSize() == 0) { //有name 但不传文件
			user.setImagePath(imgPath);
		} else {    //有name 传文件
			String fileName = part.getSubmittedFileName();
			String suffix = fileName.substring(fileName.lastIndexOf(".")); // 文件的扩展名
			fileName = "head" + suffix;
			String uploadPath = "D:/MyProgram/Tomcat/nginx-1.18.0/html/upload/" + username;
			File file = new File(uploadPath);
			if (!file.exists()) {
				file.mkdirs(); // 创建用户目录用于存放自己的图片
			}
			uploadPath = uploadPath + File.separator + fileName;
			// 上传到服务器
			part.write(uploadPath);
			imgPath = "http://localhost/upload/" + username + "/" + fileName;
			user.setImagePath(imgPath);
		}
		boolean flag = usi.registerUser(user);
		resp.getWriter().write("<script>alert('" + (flag ? "添加成功" : "添加失败") + "')</script>");
		return "redirect:/page/admin/user?m=page";
	}
}