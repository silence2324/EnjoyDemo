package com.unmatched.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unmatched.dao.ChartsMapper;
import com.unmatched.pojo.Users;

@Service
public class ChartsServiceImps implements ChartsService {
	@Autowired
	ChartsMapper mapper;
	/*1、查询用户表中的信息，显示用户列表*/
	@Override
	public List<Users> findAll() {
		List<Users> list = mapper.findAll();
		return list;
	}

}
