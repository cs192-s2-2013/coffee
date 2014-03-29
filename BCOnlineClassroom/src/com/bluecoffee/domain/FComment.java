package com.bluecoffee.domain;

import java.util.Date;

public class FComment {
	private int fCommentID;
	private String content;
	private Date commentDate;
	private int fPostID;
	private int userID;
	private  String commenter;
	
	public int getFCommentID(){ return fCommentID; }
	public String getContent(){ return content; }
	public Date getCommentDate(){ return commentDate; }
	public int getFPostID(){ return fPostID; }
	public int getUserID(){ return userID; }
	public String getCommenter(){ return commenter; }
	
	public void setFCommentID(int fCommentID){ this.fCommentID = fCommentID; }
	public void setContent(String content){ this.content = content; }
	public void setCommentDate(Date commentDate){ this.commentDate = commentDate; }
	public void setFPostID(int fPostID){ this.fPostID = fPostID; }
	public void setUserID(int userID){ this.userID = userID; }
	public void setCommenter(String commenter){ this.commenter = commenter; }
}
