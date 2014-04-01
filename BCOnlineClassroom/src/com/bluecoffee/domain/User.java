package com.bluecoffee.domain;
import org.springframework.stereotype.Component;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

@Component
@Scope("session")
/*@Component
@Scope(value="session", proxyMode=ScopedProxyMode.TARGET_CLASS)*/
public class User {

	private int userID;
	private String username;
	private String lastName;
	private String firstName;
	private String email;
	
	public int getUserID(){ return userID; }
	public String getUsername(){ return username; }
	public String getLastName(){ return lastName; }
	public String getFirstName(){ return firstName; }
	public String getEmail(){ return email; }
	
	public void setUserID(int userID){ this.userID = userID; }
	public void setUsername(String username){ this.username = username; }
	public void setLastName(String lastName){ this.lastName = lastName; }
	public void setFirstName(String firstName){ this.firstName = firstName; }
	public void setEmail(String email){ this.email = email; }

}