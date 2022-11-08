package com.dsc.dao;

import com.dsc.entity.Roles;
import com.dsc.entity.Users;

public interface UserDao {
	public Users findById(String username);
	public void save(Users username);
	public Roles getRole(int id);
	public  void saveRole(Roles role);
	
}