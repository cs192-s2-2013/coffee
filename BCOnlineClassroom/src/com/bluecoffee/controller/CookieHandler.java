package com.bluecoffee.controller;

import org.jasypt.util.text.BasicTextEncryptor;

public class CookieHandler {
	
	public static String[] decryptCookie(String fooCookie){
		
		String[] userdet;
		
		try{
			BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
			textEncryptor.setPassword("nLX9EDbHpxjUnd9NAcf9x2emSexySiSher");
			String decrypted = textEncryptor.decrypt(fooCookie);
			
			userdet = decrypted.split("-");
			
			if(userdet[1].equals("void")){
					return null;
			}
			
			//user = userService.getUserByUserID(Integer.parseInt(userdet[0]));
			//System.out.print("hello");
			//if(userdet[2].contains("ADMIN_CLASS")){ user.setAdmin(true); }
			//else{ user.setAdmin(false); }
			
		}
		catch (Exception e){
			return null;
		}
		
		return userdet;
	}
}
