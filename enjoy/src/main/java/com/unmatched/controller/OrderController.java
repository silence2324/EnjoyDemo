package com.unmatched.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.unmatched.exception.ServiceException;
import com.unmatched.pojo.Users;
import com.unmatched.pojo.order;
import com.unmatched.service.OrderService;
import com.unmatched.vo.JsonResult;

/**
 * 购物车、订单处理类
 * @author WangWei && Libd
 */
@Controller
@RequestMapping("order")
@SessionAttributes("user")
public class OrderController {
	@Autowired
	OrderService orderServiceImps;


	/**
	 * 根据用户id查找所有订单
	 * @param uid 用户id
	 * @return
	 */
	@RequestMapping("findAll")
	@ResponseBody
	public JsonResult findAll(Integer uid) {
//		System.out.println(uid);
		List<order> orderList = orderServiceImps.findAll(uid);
		return new JsonResult(orderList);
	}
	
	/**
	 * 根据item_id获取商品信息，获取用户信息，储存到购物车，state状态为0
	 * @param item_id
	 * @return
	 */
	@RequestMapping("doAddOrder0")
	@ResponseBody
	public JsonResult doAddOrder0(Integer item_id, Integer uid, @ModelAttribute("user")Object user) {
		if (user instanceof Integer) {
		throw new ServiceException("请先登录");
		} if (user instanceof Users) {
			orderServiceImps.doAddOrder0(item_id, uid);
			return new  JsonResult("加入成功");
		} else {
		throw new ServiceException("请先登录");
		}
	}
	
	/**
	 * 加载购物车页面，根据状态获取用户订单信息
	 * @param user
	 * @return
	 */
	@RequestMapping("doLoadCart")
	@ResponseBody
	public JsonResult doLoadCart(@ModelAttribute("user")Users user) {
		Integer uid = user.getUid();
		List<order> cartList = orderServiceImps.findCartById(uid);
		return new JsonResult(cartList);
	}

	/**
	 * 删除购物车、订单
	 * @param oids
	 * @return
	 */
	@RequestMapping("doDeleteCart")
	@ResponseBody
	public JsonResult doDeleteCart(Integer[] oids) {
		int row = orderServiceImps.deleteById(oids);
		return new JsonResult("删除成功");
	}

	/**
	 * 修改订单状态
	 * @param oids
	 * @return
	 */
	@RequestMapping("doOrderChangeState")
	@ResponseBody
	public JsonResult doOrderChangeState(Integer[] oids) {
		System.out.println(Arrays.toString(oids));
		int row = orderServiceImps.changeStateByIds(oids);
		return new JsonResult("结算成功");
	}
}
