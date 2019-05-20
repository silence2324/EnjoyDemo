package com.unmatched.service;

import java.util.List;

import com.unmatched.dao.GoodsDao;
import com.unmatched.dao.ImgGoodsDao;
import com.unmatched.dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.unmatched.exception.ArgumentException;
import com.unmatched.exception.ServiceException;
import com.unmatched.pojo.Goods;
import com.unmatched.pojo.Imgs;
import com.unmatched.pojo.order;

/**
 * 购物车和订单业务层
 * @author wangwei
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderDao;
	
	@Autowired
	GoodsDao gooddao;
	
	@Autowired
	ImgGoodsDao imgGoodsDao;
	/**
	 * 根据用户uid获取对应用户订单信息
	 */
	@Override
	public List<order> findAll(Integer uid) {
		if (uid == null ) {
			throw new ArgumentException("查询用户不能为空");
		}
		
		List<order> orderList = orderDao.findAll(uid);
		if(orderList == null || orderList.size() == 0) {
			throw new ServiceException("该用户没有订单");
		}
		return orderList;
	}

    /**
     * 根据订单id删除订单
     * @param oids
     * @return
     */
	@Override
	public int deleteById(Integer[] oids) {
		if(oids == null || oids.length == 0 ) 
			throw new ServiceException("请选择订单~");
		int rows = orderDao.deleteById(oids);
		if(rows == 0) 
			throw new ServiceException("订单删除失败！");
		return rows;
	}
	
	/**
	 * 添加状态为0的订单（购物车订单）
	 */
	@Override
	public int doAddOrder0(Integer item_id, Integer uid) {
		Goods good = gooddao.findImgByGoodsId(item_id);
		Imgs imgs = imgGoodsDao.findImgs(good.getImg_id());
		
		order order = new order();
		order.setGoods_id(good.getItem_id());
		order.setGoods_image(imgs.getImge1());
		order .setGoods_message(good.getSell_point());
		order .setGoods_name(good.getItem_name());
		order .setGoods_num(good.getNum());
		order.setTotal_price(good.getNum());
		order .setState(0);
		order .setUid(uid);
		System.out.println(good);
		int row = orderDao.doAddOrder0(order);
		
		return row;
	}

	/**
	 * 根据id查询购物车订单
	 */
	@Override
	public List<order> findCartById(Integer uid) {
		List<order> cartList = orderDao.findCartById(uid);
		return cartList;
	}

    /**
     * 修改数据库订单字段，o购物车，1订单
     * @param oids
     * @return
     */
	@Override
	public int changeStateByIds(Integer[] oids) {
		int row = orderDao.changeStateByIds(oids);
		return row;
	}

}
