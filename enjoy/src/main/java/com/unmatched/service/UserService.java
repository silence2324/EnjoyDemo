package com.unmatched.service;

import com.unmatched.pojo.Users;
import com.unmatched.vo.UserRegister;

public interface UserService {
	int douUserRegister(UserRegister userRegister);
	
	Users doUserLogin(Users userMess);
}
