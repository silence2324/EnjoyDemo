package com.unmatched.listener;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.SessionException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 重写框架的logout判定
 * @author SiLenCE.YN
 */
public class LogoutFilterIntercepter extends LogoutFilter {

    private static int count = 0;
    @Override
    protected boolean preHandle(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        String redirectUrl = getRedirectUrl(servletRequest, servletResponse, subject);
        String path = redirectUrl+"adminLogout";
        try {
            subject.logout();
        } catch (SessionException ise) {
            ise.printStackTrace();
        }
        if("/adminLogout".equals(path) && count>0){
            return true;
        }
        count++;
        issueRedirect(servletRequest, servletResponse, path);
        //返回false表示不执行后续的过滤器，直接返回跳转到登录页面
        return false;
    }
}
