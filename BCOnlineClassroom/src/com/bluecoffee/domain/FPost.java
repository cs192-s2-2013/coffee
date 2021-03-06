package com.bluecoffee.domain;

import java.util.Date;

public class FPost {
	private int fPostID;
	private String title;
	private String content;
	private int commentCount;
	private Date postDate;
	private int userID;
	private String poster;
	private String tag;
	private int fCategoryID;
	private String uploader;
	
	public int getFPostID(){ return fPostID; }
	public String getTitle(){ return title; }
	public String getContent(){ return content; }
	public int getCommentCount(){ return commentCount; }
	public Date getPostDate(){ return postDate; }
	public int getUserID(){ return userID; }
	public String getPoster(){ return poster; }
	public String getTag(){ return tag; }
	public int getFCategoryID(){ return fCategoryID; }
	public String getUploader(){ return uploader; }
	
	
	
	public void setFPostID(int fPostID){ this.fPostID = fPostID; }
	public void setTitle(String title){ this.title = title; }
	public void setContent(String content){ this.content = content; }
	public void setCommentCount(int commentCount){ this.commentCount = commentCount; }
	public void setPostDate(Date postDate){ this.postDate = postDate; }
	public void setUserID(int userID){ this.userID = userID; }
	public void setPoster(String poster){ this.poster = poster; }
	public void setTag(String tag){ this.tag = tag; }
	public void setFCategoryID(int fCategoryID){ this.fCategoryID = fCategoryID; }
	public void setUploader(String uploader){ this.uploader = uploader; }
}
