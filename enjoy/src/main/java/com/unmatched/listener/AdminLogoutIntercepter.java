package com.unmatched.listener;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.springframework.util.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author SiLenCE.YN
 * @create 2019-05-18 17:00
 * @desc 鉴权请求URL访问权限拦截器
 */
public class AdminLogoutIntercepter extends AccessControlFilter {

    /**
     * 表示是否允许访问 ，如果允许访问返回true，否则false；
     *
     * @param servletRequest
     * @param servletResponse
     * @param o 表示写在拦截器中括号里面的字符串 mappedValue 就是 [urls] 配置中拦截器参数部分
     * @return
     * @throws Exception
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //1.获取前端发过来的请求地址
        String requestPath = request.getRequestURI();
        Subject subject = SecurityUtils.getSubject();
        //如果注销了 用户对象肯定为null
        Object userInfo = subject.getPrincipal();
        if ((!StringUtils.isEmpty(requestPath) && requestPath.indexOf("adminLogout") != -1) ) {
            if (userInfo != null) {
                subject.logout();
            }
            response.sendRedirect("adminLoginUI");
            return false;
        }
//        Subject subject = getSubject(servletRequest,servletResponse);
//        String url = getPathWithinApplication(servletRequest);
//        System.out.println("当前用户正在访问的 url => " + url);
//        return subject.isPermitted(url);

        return true;

    }

    /**
     * onAccessDenied：表示当访问拒绝时是否已经处理了；
     * 如果返回 true 表示需要继续处理；
     * 如果返回 false 表示该拦截器实例已经处理了，将直接返回即可。
     *
     * @param servletRequest
     * @param servletResponse
     * @return
     * @throws Exception
     */
    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        return false;
    }
}