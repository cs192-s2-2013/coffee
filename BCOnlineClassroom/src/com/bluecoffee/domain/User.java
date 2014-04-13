package com.bluecoffee.domain;

public class User {

	private int userID;
	private String username;
	private String lastName;
	private String firstName;
	private String email;
	private boolean admin;
	
	public int getUserID(){ return userID; }
	public String getUsername(){ return username; }
	public String getLastName(){ return lastName; }
	public String getFirstName(){ return firstName; }
	public String getEmail(){ return email; }
	public boolean getAdmin(){ return admin; }
	
	public void setUserID(int userID){ this.userID = userID; }
	public void setUsername(String username){ this.username = username; }
	public void setLastName(String lastName){ this.lastName = lastName; }
	public void setFirstName(String firstName){ this.firstName = firstName; }
	public void setEmail(String email){ this.email = email; }
	public void setAdmin(boolean admin){ this.admin = admin; }
}