package com.unmatched.config;

import com.unmatched.listener.AdminLogoutIntercepter;
import com.unmatched.listener.LogoutFilterIntercepter;
import com.unmatched.service.ShiroUserRealm;
import org.apache.shiro.cache.MemoryConstrainedCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;

import javax.servlet.Filter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * shiro框架注解方式
 * @author SiLenCE.YN
 */

@Configuration
public class SpringShiroConfig {
    @Bean("securityManager")
    public SecurityManager newSecurityManager(ShiroUserRealm realm){
        DefaultWebSecurityManager sm = new DefaultWebSecurityManager();
        sm.setRealm(realm);
        return sm;
    }

    @Bean("shiroFilterFactory")
    public ShiroFilterFactoryBean newShiroFilterFactoryBean(SecurityManager securityManager){
        //1.构建ShiroFilterFactoryBean对象(负责创建ShiroFilter工厂对象)
        ShiroFilterFactoryBean fBean = new ShiroFilterFactoryBean();
        //2.设置安全管理器
        fBean.setSecurityManager(securityManager);
        //3.设置登录页面对应的url(非认证用户要跳转到此url对应的页面)
        fBean.setLoginUrl("/adminLoginUI");
        //4.设置过滤规则(哪些允许匿名访问，哪些需要认证访问)
        Map<String,String> filterMap = new LinkedHashMap<String,String>();
        filterMap.put("/build/**","anon");
        //filterMap.put("/index", "anon");
        filterMap.put("/adminLogin", "anon");
        filterMap.put("/adminIndex","authc");
       // filterMap.put("/adminLogout","logout");
        Map<String, Filter> cuFilterMap = new HashMap<String, Filter>(2);
        cuFilterMap.put("adminLogoutIntercepter", new AdminLogoutIntercepter());
       // cuFilterMap.put("logout",new LogoutFilterIntercepter());
        filterMap.put("/**","adminLogoutIntercepter");

        fBean.setFilterChainDefinitionMap(filterMap);
        fBean.setFilters(cuFilterMap);
        return fBean;
    }
    //=======授权管理======
    //@Bean注解没有指定名字时，默认bean的方法名
    //配置bean对象的生命周期管理
    @Bean("lifecycleBeanPostProcessor")
    public LifecycleBeanPostProcessor newLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    //通过此配置要为目标业务对象创建代理对象
    @DependsOn("lifecycleBeanPostProcessor")//相当于属性值depends-on
    @Bean
    public DefaultAdvisorAutoProxyCreator newDefaultAdvisorAutoProxyCreator() {
        return new DefaultAdvisorAutoProxyCreator();
    }

    //授权属性的Advisor配置
    @Bean
    public AuthorizationAttributeSourceAdvisor newAuthorizationAttributeSourceAdvisor(SecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
        advisor.setSecurityManager(securityManager);
        return advisor;
    }

    //缓存管理器(可以缓存用户的权限信息)
    @Bean("cacheManager")
    public MemoryConstrainedCacheManager newMemoryConstrainedCacheManager() {
        return new MemoryConstrainedCacheManager();
    }

    //记住我配置
    @Bean
    public CookieRememberMeManager newCookieManager() {
        CookieRememberMeManager cookieManager = new CookieRememberMeManager();
        SimpleCookie cookie = new SimpleCookie("rememberMe");
        cookie.setMaxAge(7 * 24 * 60 * 60);
        cookieManager.setCookie(cookie);
        return cookieManager;
    }

    //session配置
    public DefaultWebSessionManager newDefaultWebSessionManager() {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setGlobalSessionTimeout(21600000);
        sessionManager.setDeleteInvalidSessions(true);
        sessionManager.setSessionValidationSchedulerEnabled(true);
        return sessionManager;
    }

}
