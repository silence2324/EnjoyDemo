package com.unmatched.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /*查询用户表中的信息，显示用户列表，返回tables.jsp*/
    @RequestMapping("/user_list")
    public String showList(Model model) {
        List<Users> list = service.findAll();
//		for(Users user : list) {
//			System.out.println(user);
//		}
        model.addAttribute("users", list);
        return "/tables";
    }

    /*查询用户表中的信息，显示用户列表，返回admin.jsp*/
    @RequestMapping("/adminIndex")
    public String showAdminList(Model model) {
        List<Users> list = service.findAll();
//		for(Users user : list) {
//			System.out.println(user);
//		}
        model.addAttribute("users", list);
        /*查询每月新增用户数据，返回admin.jsp*/
        List<Integer> addList = service.countAdd();
        model.addAttribute("count", addList.toString());
//		System.out.println(addList);
        return "/admin";
    }

    /*1、查询每月新增用户数据，2、查询排名前五的热销商品返回 charts.jsp*/
    @RequestMapping("/showCharts")
    public String showCharts(Model model) {
        /*查询每月新增用户数据*/
        List<Integer> addList = service.countAdd();
        model.addAttribute("count", addList.toString());
        /*查询排名前五的热销商品*/
        List<Integer> hotGoodsList = service.hotGoods();
        model.addAttribute("hotGoods", hotGoodsList.toString());
        /*年龄段分布查询*/
        List<Map<String, Object>> agePieList = service.agePie();
        model.addAttribute("agePie",agePieList.toString());
        System.out.println(addList);
        System.out.println(hotGoodsList);
        System.out.println(agePieList);
        return "/charts";
    }

    /* 通用的页面跳转的方法
     * 如果用户访问的路径为 /index 则page的值就是index
     * 参数中的几个page都是同一个值*/
    @RequestMapping("/{page}")
    public String page(@PathVariable String page) {
        return page;
    }
}
