package com.dsc.service;

import com.dsc.entity.Roles;
import com.dsc.entity.Users;

public interface UserService {

	void saveLastLoginDate(String username);

	Users getUser(String username);

	void saveUser(Users user);
	
	void saveRole(Roles role);
	
	Roles getRole(int id);
}