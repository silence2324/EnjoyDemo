package com.unmatched.service;

import java.util.List;
import java.util.Map;

import com.unmatched.pojo.Users;

/**
 * 报表详情
 * @author SiLenCE.YN
 */
public interface ChartsService {
	
	/**查询用户表中的信息，显示用户列表*/
	public List<Users> findAll();

	/**查询每月新增用户数据*/
	public List<Integer> countAdd();

	/**查询排名前五的热销商品*/
    public List<Integer> hotGoods();

	/**年龄段分布查询*/
    public List<Map<String,Object>> agePie();
}
