package com.unmatched.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.unmatched.pojo.order;

/**
 * 购物车和订单业务层
 * @author wangwei
 */
public interface OrderService {
	/**
	 * 根据用户id查找所有订单
	 * @param uid 用户ID
	 * @return
	 */
	List<order> findAll(Integer uid);
	/**
	 * 删除订单
	 * @param oids
	 * @return
	 */
	int deleteById(Integer[] oids);

	/**
	 * 从商品表查找加入购物车
	 * @param item_id
	 * @param uid
	 * @return
	 */
	int doAddOrder0(Integer item_id, Integer uid);
	/**
	 * 查找购物车订单
	 * @param uid
	 * @return
	 */
	List<order> findCartById(Integer uid);
	/**
	 * 改变数据库字断，o购物车，1订单
	 * @param oids
	 * @return
	 */
	int changeStateByIds(@Param("oids") Integer[] oids); 
}
