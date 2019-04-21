package com.unmatched.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.unmatched.pojo.Users;
import com.unmatched.service.ChartsService;

/**
 * 报表查询 
 * @author SiLenCE.YN
 */
@Controller
public class ChartsController {
	@Autowired
	private ChartsService service;
	/*1、查询用户表中的信息，显示用户列表*/
	@RequestMapping("/user_list")
	public String showList(Model model) {
		List<Users> list = service.findAll();
		for(Users user : list) {
			System.out.println(user);
		}
		model.addAttribute("users", list);
		return "/tables";
	}
	
	/* 通用的页面跳转的方法
	 * 如果用户访问的路径为 /index 则page的值就是index
	 * 参数中的几个page都是同一个值*/
	@RequestMapping("/{page}")
	public String page(@PathVariable String page) {
		return page;
	}
}
