package com.shop.interceptor;

import com.shop.pojo.Admin;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {
    /**
     * 在业务处理器处理请求之前调用
     * 如果返回false 退出拦截器 不执行Controller 里的方法
     * 如果返回true 执行被拦截的Controller 的方法
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws IOException
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        HttpSession session = request.getSession();
        String contextPath = session.getServletContext().getContextPath();
        // 存储不需要登录也能访问的路径
        String[] noNeedLoginPage = new String[]{
                "Login",
                "admin_login"
        };
        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);
        if(uri.startsWith("/admin/")){
            String s = StringUtils.substringAfterLast(uri,"/admin/");
            System.out.println(s);
            if(!Arrays.asList(noNeedLoginPage).contains(s)){
                /*
                * 管理员Seession只保存了用户名
                * */
                String name = (String) session.getAttribute("admin");
                if(null == name){
                    response.sendRedirect("Login");
                    return false;
                }
            }
        }
        return true;
    }
}
