package com.shop.interceptor;

import com.shop.pojo.Firm;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

public class FirmLoginInterceptor extends HandlerInterceptorAdapter {
    /*
     * 在处理器处理请求之前调用
     * 如果返回false 退出拦截器 不执行Controller 里的方法
     * 如果返回true 执行被拦截的Controller 的方法
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        HttpSession session = request.getSession();
        String contextPath = session.getServletContext().getContextPath();
        // 存储不需要登录也能访问的路径
        String[] noNeedLoginPage = new String[]{
                "Login",
                "firm_login"
        };
        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);
        if(uri.startsWith("/firm/")){
            String s = StringUtils.substringAfterLast(uri,"/firm/");
            System.out.println(s);
            if(!Arrays.asList(noNeedLoginPage).contains(s)){

                Firm firm = (Firm)session.getAttribute("firm");
                if(null == firm){
                    response.sendRedirect("Login");
                    return false;
                }
            }
        }
        return true;
    }
}
