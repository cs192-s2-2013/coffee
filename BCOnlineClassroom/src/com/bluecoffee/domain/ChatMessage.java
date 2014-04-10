package com.bluecoffee.domain;

import java.util.Date;

public class ChatMessage {

	private int chatMessageID;
	private String message;
	private Date messageDate;
	private int userID;
	private int chatConvoID;
	
	private String sender;
	
	public int getChatMessageID(){ return chatMessageID; }
	public String getMessage(){ return message; }
	public Date getMessageDate(){ return messageDate; }
	public int getUserID(){ return userID; }
	public int getChatConvoID(){ return chatConvoID; }
	
	public String getSender(){ return sender; }
	
	public void setChatMessageID(int chatMessageID){ this.chatMessageID = chatMessageID; }
	public void setMessage(String message){ this.message = message; }
	public void setMessageDate(Date messageDate){ this.messageDate = messageDate; }
	public void setUserID(int userID){ this.userID = userID; }
	public void setChatConvoID(int chatConvoID){ this.chatConvoID = chatConvoID; }
	
	public void setSender(String sender){ this.sender = sender; }
}
