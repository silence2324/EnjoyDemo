package com.unmatched.service;

import com.unmatched.dao.AdminUserDao;
import com.unmatched.exception.ServiceException;
import com.unmatched.pojo.Users;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * shiro认证--后台报表管理员登陆认证
 * @author SiLenCE.YN
 */
@Service
public class ShiroUserRealm extends AuthorizingRealm {
    @Autowired
    private AdminUserDao adminUserDao;
    /**
     * 设置凭证匹配器(此方法用于告诉认证管理器与用户添加操作使用相同的加密算法)
     */
    @Override
    public void setCredentialsMatcher(CredentialsMatcher credentialsMatcher) {
        /*构建凭证匹配对象*/
        HashedCredentialsMatcher cMatcher = new HashedCredentialsMatcher();
        /*设置加密算法*/
        cMatcher.setHashAlgorithmName("MD5");
        /*设置加密次数，默认1次*/
        cMatcher.setHashIterations(1);
        super.setCredentialsMatcher(cMatcher);
    }

    /**
     * 通过此方法完成认证数据的获取及封装,系统
     * 底层会将认证数据传递认证管理器，由认证
     * 管理器完成认证操作。
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //1.从token中获取用户名(前端用户页面输入)
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String username = upToken.getUsername();
        //2.基于用户名查询用户信息
        Users user = adminUserDao.findUserByUserName(username);
        System.err.println(user.getUsername());
        //3.判定用户是否有权登陆
        if(!user.getUsername().equals("admin"))
            throw new AuthenticationException();
        if(user==null)
            throw new UnknownAccountException();
        //4.封装用户信息
        ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user,user.getPassword(),credentialsSalt,getName());
        //5.返回封装结果
        return info;//返回值会传递给认证管理器(后续认证管理器会通过此信息完成认证操作)
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }
}
