package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.User;

public interface UserDao {

	public User getUserByUserID(int id);
	public User getUserByUsername(String username);
	public List<User> getChatOnline();
	public List<User> getChatUser();
	public List<User> getUserListByUsername(String username);
	public List<User> getChatMembers(int chatConvoID);
}