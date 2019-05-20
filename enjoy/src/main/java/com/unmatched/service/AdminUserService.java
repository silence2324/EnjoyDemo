package com.unmatched.service;

import com.unmatched.pojo.Users;
import org.springframework.stereotype.Service;

/**
 * shiro认证--用户注册
 * @author SiLenCE.YN
 */
public interface AdminUserService {
    /**用户注册(shiro备用)*/
    int doUserRegister(Users users);
}
