package com.woniuxy.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author jackpoit
 * @date: 2021/7/29 19:08
 * @description: 后台欢迎界面导向
 */
@WebServlet("/welcome/admin")
public class WelcomeAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/page/admin/backLogin.jsp").forward(req,resp);
    }
}
