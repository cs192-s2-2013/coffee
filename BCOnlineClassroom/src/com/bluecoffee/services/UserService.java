package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.User;

public interface UserService {
	
	public User getUserByUserID(int id);
	
	public User getUserByUsername(String username);

}