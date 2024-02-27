package com.dao;

import com.entity.User;

public interface UserDAo {
	public boolean userRegister(User us);
	
	public User login(String email, String pass);
	
	public boolean checkPassword(int id, String ps);
	
	public boolean updateProfile(User us);
	
	public boolean checkUser(String em);
}
