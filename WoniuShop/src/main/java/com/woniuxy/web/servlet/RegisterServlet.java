package com.woniuxy.web.servlet;

import com.woniuxy.entity.User;
import com.woniuxy.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;


@MultipartConfig
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	UserServiceImpl usi = new UserServiceImpl();


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
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

		if (part != null) {     //后台界面的
			if (part.getSize() == 0) { //有name 但不传文件
				user.setImagePath(imgPath);
			} else {	//有name 传文件
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
			resp.setHeader("refresh", "0;url=" + req.getContextPath() + "/page/admin/page");
		} else {  //无name  index登录界面的
			user.setImagePath(imgPath);
			boolean flag = usi.registerUser(user);

			if (flag) {
				req.setAttribute("registerFlag", "true");
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			} else {
				resp.getWriter().write("<script>alert('注册失败')</script>");
				resp.setHeader("refresh", "0;url=" + req.getContextPath() + "/index.jsp");
			}
		}


	}
}