package com.bluecoffee.services;

import java.util.List;
import com.bluecoffee.domain.ChatConvo;

public interface ChatConvoService {

	public List<ChatConvo> getConvoListByUserID(int userID);
	public int insertData(String title);
	public void insertMember(int chatConvoID, int userID);
	public void deleteMember(int chatConvoID, int userID);
}
