package com.unmatched.service;

import java.util.List;

import com.unmatched.pojo.Users;

public interface ChartsService {
	
	/*1、查询用户表中的信息，显示用户列表*/
	public List<Users> findAll();
}
