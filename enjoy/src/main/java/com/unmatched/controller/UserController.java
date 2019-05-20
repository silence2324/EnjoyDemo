package com.unmatched.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.unmatched.pojo.Users;
import com.unmatched.service.UserService;
import com.unmatched.vo.JsonResult;
import com.unmatched.vo.UserRegister;


@Controller
@RequestMapping("user")
@SessionAttributes("user")
public class UserController {
	@Autowired
	@Qualifier("userServiceImpl")
	UserService userServiceImps;

	@RequestMapping("doUserRegister")
	@ResponseBody
	public JsonResult doUserRegister(UserRegister userRegister) {
		System.out.println(userRegister);
		userServiceImps.douUserRegister(userRegister);
		return new JsonResult("注册成功，欢迎登录");
	}

	//是否允许用户登录验证判断
	@RequestMapping("doUserLogin")
	@ResponseBody
	public JsonResult doUserLogin(Users users, Model model, HttpServletRequest request) {
		//System.out.println(users);
		Users userMess = userServiceImps.doUserLogin(users);
		
		//修改session中，用户的登录状态
		model.addAttribute("user", userMess);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setMessage("登录成功");
		users.setPassword("0");
		request.getSession().setAttribute("userInfo",userMess);
		jsonResult.setData(userMess);
//		System.out.println(jsonResult);
		return  jsonResult;
	}
	
	//验证用户登录状态
	@RequestMapping("doAuthenLogin")
	@ResponseBody
	public JsonResult doAuthenLogin(@ModelAttribute("user")Object user) {
		JsonResult jsonResult = new JsonResult();
		Users users = null;
		if (user instanceof Integer) {
			jsonResult.setState(0);
		} else {
			users = (Users)user;
			jsonResult.setState(1);
		}
		if (users.getUsername().equals("admin")) {
			users.setPassword("1");
		} else {
			users.setPassword("0");
		}
		jsonResult.setData(user);
//		System.out.println(jsonResult);
		return jsonResult;
	}
	
	//根据登录状态，判断是否有权限访问
	@RequestMapping("doAuthor")
	@ResponseBody
	public JsonResult doAuthor(@ModelAttribute("user")Object user) {
		JsonResult jsonResult = new JsonResult();
		System.out.println(user.getClass().getName());
		if (user instanceof Integer) {
			jsonResult.setState(0);
		} else {
			jsonResult.setState(1);
		}
//		System.out.println("kkkkkkkk");
		return jsonResult;
	}
	
	//退出登录
	@RequestMapping("outLogin")
	@ResponseBody
	public JsonResult outLogin(Model model,HttpServletRequest request){
		model.addAttribute("user", 0);
		request.getSession().invalidate();
		return new JsonResult("退出成功");
	}
	
	@RequestMapping("doTableUI")
	@ResponseBody
	public JsonResult outLogin(@ModelAttribute("user")Object user){
		Users admin = (Users)user;
		JsonResult jsonResult = new JsonResult();
		if(admin.getUsername().equals("admin")){
			jsonResult.setMessage("欢迎管理员");
			return jsonResult;
		} else {
			jsonResult.setMessage("您没有权限");
			jsonResult.setState(0);
			return jsonResult;
		}
	}
}
