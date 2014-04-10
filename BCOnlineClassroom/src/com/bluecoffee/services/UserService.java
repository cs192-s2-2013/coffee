package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.User;

public interface UserService {
	
	public User getUserByUserID(int id);
	public User getUserByUsername(String username);
	public List<User> getChatOnline();
	public List<User> getChatUser();
	public List<User> getChatMembers(int chatConvoID);
}