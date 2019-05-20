package com.unmatched.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unmatched.dao.ChartsDao;
import com.unmatched.pojo.Users;

/**
 * 报表详情
 * @author SiLenCE.YN
 */
@Service
public class ChartsServiceImpl implements ChartsService {
	@Autowired
    ChartsDao mapper;
	/**查询用户表中的信息，显示用户列表*/
	@Override
	public List<Users> findAll() {
		List<Users> list = mapper.findAll();
		return list;
	}
	
	/**查询每月新增用户数据*/
	@Override
	public List<Integer> countAdd() {
		List<Integer> addList = mapper.countAdd();
		return addList;
	}

	/**查询排名前五的热销商品*/
	@Override
	public List<Integer> hotGoods() {
		List<Integer> hotGoodsList = mapper.hotGoods();
		return hotGoodsList;
	}

	/**年龄段分布查询*/
	@Override
	public List<Map<String, Object>> agePie() {
		//List<Map<String,Object>> agePieList = mapper.agePie();
		List<Map<String,Object>> agePieList = mapper.agePie();
		return agePieList;
	}

}
