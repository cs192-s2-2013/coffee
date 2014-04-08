package com.bluecoffee.services;

import java.util.List;
import com.bluecoffee.domain.ChatConvo;

public interface ChatConvoService {

	public List<ChatConvo> getConvoListByUserID(int userID);

}
