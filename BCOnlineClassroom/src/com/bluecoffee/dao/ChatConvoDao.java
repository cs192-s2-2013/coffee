package com.bluecoffee.dao;

import java.util.List;

import com.bluecoffee.domain.ChatConvo;

public interface ChatConvoDao {

	public List<ChatConvo> getConvoListByUserID(int userID);
	public void insertData(String title);
	public String getTitleByID(int chatConvoID);
	public void insertMember(int chatConvoID, int userID);
	public void deleteMember(int chatConvoID, int userID);
	public List<ChatConvo> getConvoByChatMember(int chatConvoID, int userID);
	public int getChatConvoID(String title);
	
}
