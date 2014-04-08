package com.bluecoffee.domain;

public class ChatConvo {

	private int chatConvoID;
	private String title;
	
	public int getChatConvoID(){ return chatConvoID; }
	public String getTitle(){ return title; }
	
	public void setChatConvoID(int chatConvoID){ this.chatConvoID = chatConvoID; }
	public void setTitle(String title){ this.title = title; }
}
