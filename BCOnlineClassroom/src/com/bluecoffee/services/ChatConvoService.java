package com.bluecoffee.services;

import java.util.List;

import com.bluecoffee.domain.ChatConvo;

public interface ChatConvoService {

	public String getTitleByID(int chatConvoID);
	public int insertData(String title);
	public List<ChatConvo> getConvoListByUserID(int userID);
	public void insertMember(int chatConvoID, int userID);
	public boolean isMemberInConvo(int chatConvoID, int userID);
	public void deleteMember(int chatConvoID, int userID);
}
