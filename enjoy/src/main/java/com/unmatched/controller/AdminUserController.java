package com.unmatched.controller;

import com.unmatched.service.AdminUserService;
import com.unmatched.vo.JsonResult;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 后台管理员登陆shiro认证
 * @author SiLenCE.YN
 */
@Controller
public class AdminUserController {

    @Autowired
    private AdminUserService adminUserService;

    /**报表admin账号登陆(shiro)*/
    @RequestMapping("/adminLogin")
    @ResponseBody
    public JsonResult adminLogin(String username,String password){
        //1.获取Subject对象
        Subject subject = SecurityUtils.getSubject();
        //2.通过Subject提交用户信息,交给shiro框架进行认证操作
        //2.1对用户进行封装
        UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        //2.2对用户信息进行身份认证
        subject.login(token);
        return new JsonResult("login ok");
    }

}
