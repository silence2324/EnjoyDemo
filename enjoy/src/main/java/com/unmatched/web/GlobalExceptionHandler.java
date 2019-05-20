package com.unmatched.web;

import com.unmatched.vo.JsonResult;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 全局异常处理类
 */
@ControllerAdvice
public class GlobalExceptionHandler {


    //标准日志接口
    private Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);
    /**
     * @ExceptionHandler：注解修饰的方法为异常处理的方法,通过反射，交给spring管理（在spring-web.xml中增加扫描包），查找之前定义的有参构造
     * @param e
     * @return
     */
    @ExceptionHandler(value=ShiroException.class)//JDK中的自带的日志API
    @ResponseBody
    public JsonResult doHandleRuntimeException(ShiroException e) {
        log.error("shiro"+e.getMessage());
//		e.printStackTrace();
        JsonResult r=new JsonResult();
        r.setState(0);
        if(e instanceof UnknownAccountException) {
            r.setMessage("账户不存在");
        }else if(e instanceof LockedAccountException) {
            r.setMessage("账户已被禁用");
        }else if(e instanceof IncorrectCredentialsException) {
            r.setMessage("密码不正确");
        }else if(e instanceof AuthorizationException) {
            r.setMessage("没有此操作权限");
        }else if (e instanceof AuthenticationException){
            r.setMessage("抱歉，您使用的账号未授权");
        }else {
            r.setMessage("系统维护中");
        }
        e.printStackTrace();//也可以写日志
        return r;//封装异常信息
    }


    /**
     * @ExceptionHandler：注解修饰的方法为异常处理的方法,通过反射，交给spring管理（在spring-web.xml中增加扫描包），查找之前定义的有参构造
     * @param e
     * @return
     */
    @ExceptionHandler(RuntimeException.class)//JDK中的自带的日志API
    @ResponseBody
    public JsonResult doHandleRuntimeException(RuntimeException e) {
        e.printStackTrace();//也可以写日志
        JsonResult r=new JsonResult();
        r.setMessage(e.getMessage());
        r.setState(0);
        return r;
    }
}
