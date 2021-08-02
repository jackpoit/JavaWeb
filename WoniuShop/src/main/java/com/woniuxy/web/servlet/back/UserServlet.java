package com.woniuxy.web.servlet.back;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.woniuxy.entity.User;
import com.woniuxy.service.impl.UserServiceImpl;
import com.woniuxy.util.BaseServlet;
import com.woniuxy.util.MD5Util;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.text.SimpleDateFormat;

/**
 * @author: jackpoit
 * @date: 2021/7/28 19:23
 * @description: 后台处理用户所有请求的Servlet
 */
@MultipartConfig
@WebServlet("/page/admin/user")
public class UserServlet extends BaseServlet {

	UserServiceImpl usi = new UserServiceImpl();

	//根据id删除用户
	public String deleteByIds(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String[] uids = req.getParameterValues("uid");
		Integer[] ids = new Integer[uids.length];
		for (int i = 0; i < ids.length; i++) {
			if (uids[i] != null) {
				ids[i] = Integer.parseInt(uids[i]);
			}
		}
		boolean flag = usi.doDelete(ids);
		resp.getWriter().write("<script>alert('" + (flag ? "删除成功" : "删除失败") + "')</script>");
		return "redirect:/page/admin/back";
	}

	//更新用户
	public String edit(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		User user = new User();

		user.setId(Integer.parseInt(req.getParameter("eid")));
		String username = req.getParameter("e_username");
		String password = req.getParameter("e_pwd");
		if (StringUtil.isEmpty(password)) {
			password = "123456";
		}
		user.setPassword(password);
		user.setMd5Code(MD5Util.getMd5(password, "com.woniuxy"));

		user.setMobile(StringUtil.isEmpty(req.getParameter("e_phone")) ? null : req.getParameter("e_phone"));
		user.setEmail(StringUtil.isEmpty(req.getParameter("e_email")) ? null : req.getParameter("e_email"));
		user.setGender(StringUtil.isEmpty(req.getParameter("e_gender")) ? null : req.getParameter("e_gender"));
		user.setRealName(StringUtil.isEmpty(req.getParameter("e_realName")) ? null : req.getParameter("e_realName"));
		user.setIdCard(StringUtil.isEmpty(req.getParameter("e_idCard")) ? null : req.getParameter("e_idCard"));
		String birthday = req.getParameter("e_birthday");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		user.setBirthday(StringUtil.isEmpty(birthday) ? null : sdf.parse(birthday));
		int level = 0;
		if (!StringUtil.isEmpty(req.getParameter("e_level"))) {
			level = Integer.parseInt(req.getParameter("e_level"));
		}
		user.setLevel(level);
		user.setUType(0);
		Part part = req.getPart("e_image");
		if (part.getSize() != 0) {
			String fileName = part.getSubmittedFileName();
			String suffix = fileName.substring(fileName.lastIndexOf(".")); // 文件的扩展名
			fileName = "head" + suffix;
			String uploadPath = "D:/MyProgram/nginx-1.18.0/html/upload/" + username;
			File file = new File(uploadPath);
			if (!file.exists()) {
				file.mkdirs(); // 创建用户目录用于存放自己的图片
			}
			uploadPath = uploadPath + File.separator + fileName;
			// 上传到服务器
			part.write(uploadPath);
			String imgPath = "http://localhost/upload/" + username + "/" + fileName;
			user.setImage(imgPath);
		}

		boolean flag = usi.doUpdate(user);

		resp.getWriter().write("<script>alert('" + (flag ? "更新成功" : "更新失败") + "')</script>");

		return "redirect:/page/admin/back";
	}


	public String page(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		//获取当前页码
		String currentUserPageStr = req.getParameter("currentUserPage");
		int currentUserPage = 1;
		if (!StringUtil.isEmpty(currentUserPageStr)) {
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
		req.setAttribute("keyword", keyword);

		return "forward:/page/admin/backstage.jsp";
	}

	public String add(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		User user = new User();
		String username = req.getParameter("r_username");
		if (!StringUtil.isEmpty(username)) {
			user.setUsername(username);
		}
		String password = req.getParameter("r_pwd");
		if (!StringUtil.isEmpty(password)) {
			user.setPassword(password);
			user.setMd5Code(MD5Util.getMd5(password, "com.woniuxy"));
		}
		user.setMobile(req.getParameter("r_phone"));
		user.setEmail(req.getParameter("r_email"));
		user.setGender(StringUtil.isEmpty(req.getParameter("r_gender")) ? null : req.getParameter("r_gender"));
		user.setRealName(StringUtil.isEmpty(req.getParameter("r_realName")) ? null : req.getParameter("r_realName"));
		user.setIdCard(StringUtil.isEmpty(req.getParameter("r_idCard")) ? null : req.getParameter("r_idCard"));

		String birthday = req.getParameter("r_birthday");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		user.setBirthday(StringUtil.isEmpty(birthday) ? null : sdf.parse(birthday));
		int level = 0;
		if (!StringUtil.isEmpty(req.getParameter("r_level"))) {
			level = Integer.parseInt(req.getParameter("r_level"));
		}
		user.setLevel(level);
		user.setUType(0);

		String imgPath = "http://localhost:8080/WoniuShop/images/user/1.jpg";
		Part part = req.getPart("r_image");

		if (part.getSize() == 0) { //有name 但不传文件
			user.setImage(imgPath);
		} else {    //有name 传文件
			String fileName = part.getSubmittedFileName();
			String suffix = fileName.substring(fileName.lastIndexOf(".")); // 文件的扩展名
			fileName = "head" + suffix;
			String uploadPath = "D:/MyProgram/nginx-1.18.0/html/upload/" + username;
			File file = new File(uploadPath);
			if (!file.exists()) {
				file.mkdirs(); // 创建用户目录用于存放自己的图片
			}
			uploadPath = uploadPath + File.separator + fileName;
			// 上传到服务器
			part.write(uploadPath);
			imgPath = "http://localhost/upload/" + username + "/" + fileName;
			user.setImage(imgPath);
		}
		boolean flag = usi.doRegister(user);
		resp.getWriter().write("<script>alert('" + (flag ? "添加成功" : "添加失败") + "')</script>");
		return "redirect:/page/admin/user?m=page";
	}
}