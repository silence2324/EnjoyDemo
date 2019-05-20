package com.unmatched.dao;

import com.unmatched.pojo.Users;

public interface UserDao {
	int userInsert(Users users);
	
	Users findUserByName(String username);
}
