package com.unmatched.service;

import java.util.UUID;

import com.unmatched.dao.UserDao;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unmatched.exception.ArgumentException;
import com.unmatched.exception.ServiceException;
import com.unmatched.pojo.Users;
import com.unmatched.vo.UserRegister;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;

	/**
	 * 用户注册
	 */
	@Override
	public int douUserRegister(UserRegister userRegister) {
		//验证参数范围
		if (userRegister == null ) {
			throw new ServiceException("保存对象不能为空");
		}
		if (userRegister.getUsername() == null || userRegister.getUsername() == "") {
			throw new ServiceException("用户名不能为空");
		}
		if(userRegister.getPassword() ==null || userRegister.getPassword() == "") {
			throw new ServiceException("密码不能为空");
		}
		
		//MD5加密算法
		String salt = UUID.randomUUID().toString();
		SimpleHash simpleHash = new SimpleHash("MD5", userRegister.getPassword(), salt, 1);
		String hex = simpleHash.toHex();
		System.out.println(hex);
		
		//将用户注册数据分装到Users对象中
		Users users = new Users();
		users.setUsername(userRegister.getUsername());
		users.setPassword(hex);
		users.setSalt(salt);
		users.setEmail(userRegister.getEmail());
		users.setAge(userRegister.getAge());
		users.setGender(userRegister.getGender());
		users.setHeight(userRegister.getHeight());
		users.setWeight(userRegister.getWeight());
		
		//调用dao层，将数据放入数据库
		int row = userDao.userInsert(users);
		if (row == 0) {
			throw new ServiceException("注册失败，请重新填写信息");
		}
		return row;
	}

	/**
	 * 用户登录
	 */
	@Override
	public Users doUserLogin(Users user) {
		//限制参数范围
		if (user == null ){
			throw new ArgumentException("登录用户不能为空");
		}
		if (user.getUsername() == null || user.getUsername() == "") {
			throw new ArgumentException("登录用户名不能为空");
		}
		if (user.getPassword() == null || user.getPassword() == "") {
			throw new ArgumentException("登录密码不能为空");
		}
		
		//根据用户名获取用户信息
		Users userMess = userDao.findUserByName(user.getUsername());
		if (userMess == null || userMess.getUsername() == null || userMess.getUsername() == "") {
			throw new ServiceException("用户名错误");
		}
		
		//使用获取的用户密码和salt进行MD5运算，并且将结果和数据库储存的密码比较，相同则登录成功，不同则失败
		SimpleHash simpleHash = new SimpleHash("MD5", user.getPassword(), userMess.getSalt(), 1);
		String hex = simpleHash.toHex();
		if (hex.equals(userMess.getPassword())) {
		} else {
			throw new ServiceException("密码错误");
		}
		return userMess;
	}

}
