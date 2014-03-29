package com.bluecoffee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluecoffee.dao.UserDao;
import com.bluecoffee.domain.User;

public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userdao;
	
	@Override
	public User getUserByUserID(int id){
		return userdao.getUserByUserID(id);
	}
	
	@Override
	public User getUserByUsername(String username){
		
		return userdao.getUserByUsername(username);
	}
}