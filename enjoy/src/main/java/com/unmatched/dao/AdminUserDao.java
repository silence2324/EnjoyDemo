package com.unmatched.dao;

import com.unmatched.pojo.Users;

/**
 * 后台管理员持久层
 * @author SiLenCE.YN
 */
public interface AdminUserDao {
    /**根据用户名查询用户*/
    Users findUserByUserName(String username);
    /**新增用户*/
    int userInsert(Users users);
}
