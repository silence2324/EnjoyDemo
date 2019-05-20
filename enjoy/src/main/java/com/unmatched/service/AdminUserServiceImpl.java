package com.unmatched.service;

import com.unmatched.dao.AdminUserDao;
import com.unmatched.exception.ServiceException;
import com.unmatched.pojo.Users;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.UUID;

/**
 * shiro认证--用户注册
 * @author SiLenCE.YN
 */
@Service
public class AdminUserServiceImpl implements AdminUserService {
    @Autowired
    private AdminUserDao adminUserDao;

    private Logger log = LoggerFactory.getLogger(AdminUserServiceImpl.class);

    /**用户注册(shiro可共用)*/
    @Override
    public int doUserRegister(Users users) {
        //1.验证数据合法性
        if(users==null)
            throw new ServiceException("保存对象不能为空");
        if(StringUtils.isEmpty(users.getUsername())) {
            log.error("username is null");
            throw new ServiceException("用户名不能为空");
        }
        if(StringUtils.isEmpty(users.getPassword()))
            throw new ServiceException("密码不能为空");
        //2.将数据写入数据库
        //2.1加盐值
        String salt = UUID.randomUUID().toString();
        users.setSalt(salt);
        //2.2加密
        //String ps = DigestUtils.md5DigestAsHex((salt+entity.getPassword()).getBytes());//spring默认MD5加密
        SimpleHash sHash = new SimpleHash("MD5",//shiro框架：algorithmName算法名称
                users.getPassword(),//source要加密的值
                salt,//salt盐值(默认盐值加载了密码的前面再加密的)
                1);//hashIterations加密次数
        users.setPassword(sHash.toHex());//十六进制
        int rows = adminUserDao.userInsert(users);
        //3.返回结果
        return rows;
    }
}
