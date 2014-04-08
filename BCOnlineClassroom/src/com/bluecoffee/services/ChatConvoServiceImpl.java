package com.bluecoffee.services;

import java.util.List;
import com.bluecoffee.domain.ChatConvo;
import com.bluecoffee.dao.ChatConvoDao;
import org.springframework.beans.factory.annotation.Autowired;

public class ChatConvoServiceImpl implements ChatConvoService {

	@Autowired ChatConvoDao chatConvoDao;
	
	@Override
	public List<ChatConvo> getConvoListByUserID(int userID){
		return chatConvoDao.getConvoListByUserID(userID);
	}

}
