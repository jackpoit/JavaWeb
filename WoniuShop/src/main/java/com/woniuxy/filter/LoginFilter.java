package com.woniuxy.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(value = {"/page/user/detail.jsp","/page/user/head.jsp","/page/user/menu.jsp","/page/user/order.jsp","/page/user/personal.jsp","/page/user/proList.jsp","/page/user/return_url.jsp","/page/user/shopcart.jsp"})
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req= (HttpServletRequest) servletRequest;
        HttpServletResponse resp= (HttpServletResponse) servletResponse;
        resp.setContentType("text/html;charset=UTF-8");
        HttpSession session=req.getSession(false);
        if(session!=null&& session.getAttribute("sesUser")!=null){
            filterChain.doFilter(req,resp);//放行
        }else{
            resp.getWriter().write("<script>alert('请先登录');window.location.href='../../welcome/user'</script>");
        }
    }

    @Override
    public void destroy() {

    }
}
