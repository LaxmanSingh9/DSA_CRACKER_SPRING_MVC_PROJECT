package com.saransh.service;

import com.saransh.entity.Roles;
import com.saransh.entity.Users;


/**
 * @author bytestree
 *
 */
public interface UserService {

	void saveLastLoginDate(String username);

	Users getUser(String username);

	void saveUser(Users user);
	
	void saveRole(Roles role);
	
	Roles getRole(int id);
}