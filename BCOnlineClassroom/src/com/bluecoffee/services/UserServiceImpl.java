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
	
	@Override
	public List<User> getChatOnline(){
		return userdao.getChatOnline();
	}
	
	@Override
	public List<User> getChatUser(){
		return userdao.getChatUser();
	}
	
	public List<User> getUserListByUsername(String username){
        return userdao.getUserListByUsername(username);
	}
	
	public List<User> getChatMembers(int chatConvoID){
		return userdao.getChatMembers(chatConvoID);
	}

}