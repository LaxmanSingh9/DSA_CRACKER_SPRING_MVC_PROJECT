package com.saransh.dao;

import com.saransh.entity.Roles;
import com.saransh.entity.Users;

public interface UserDao {
	
	
	public Users findById(String username);
	public void save(Users username);
	public Roles getRole(int id);
	public  void saveRole(Roles role);
	
}