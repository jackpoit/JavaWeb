package com.woniuxy.web.servlet;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.util.StringUtil;
import com.mysql.cj.Session;
import com.woniuxy.entity.User;
import com.woniuxy.service.impl.UserServiceImpl;
import com.woniuxy.util.BaseServlet;
import com.woniuxy.util.DBUtil;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.text.SimpleDateFormat;

/**
 * @author: jackpoit
 * @date: 2021/7/29 19:08
 * @description: 用于处理用户所有请求的Servlet
 */
@MultipartConfig
@WebServlet("/user")
public class UserServlet extends BaseServlet {
	UserServiceImpl usi = new UserServiceImpl();

	//检查用户名是否存在
	public void checkName(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String username = req.getParameter("l_username");
		boolean flag = usi.isUserExist(username);
		resp.getWriter().write(flag ? "Y" : "N");
	}

	//登录
	public void login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String username = req.getParameter("l_username");
		String password = req.getParameter("l_pwd");
		//仅登录为普通用户
		User user = usi.doLogin(new User(username, password, 0));
		HttpSession session = req.getSession();
		session.setAttribute("sesUser",user);
		String jsonStr = JSON.toJSONString(user);
		resp.getWriter().write(jsonStr);
	}


	//注册
	public void register(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		User user = new User();
		String username = req.getParameter("r_username");
		if (!StringUtil.isEmpty(username)) {
			user.setUsername(username);
		}
		user.setPassword(req.getParameter("r_pwd"));
		user.setMobile(req.getParameter("r_phone"));
		user.setEmail(req.getParameter("r_email"));
		user.setGender(StringUtil.isEmpty(req.getParameter("r_gender")) ? null : req.getParameter("r_gender"));
		user.setRealName(StringUtil.isEmpty(req.getParameter("r_realName")) ? null : req.getParameter("r_realName"));
		user.setIdCard(StringUtil.isEmpty(req.getParameter("r_idCard")) ? null : req.getParameter("r_idCard"));

		String birthday = req.getParameter("r_birthday");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		user.setBirthday(StringUtil.isEmpty(birthday) ? null : sdf.parse(birthday));
		user.setLevel(0);
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

		resp.getWriter().write(flag ? "Y" : "N");
	}


}


