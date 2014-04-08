package com.bluecoffee.dao;

import java.util.List;
import com.bluecoffee.domain.ChatConvo;

public interface ChatConvoDao {

	public List<ChatConvo> getConvoListByUserID(int userID);
	
}
