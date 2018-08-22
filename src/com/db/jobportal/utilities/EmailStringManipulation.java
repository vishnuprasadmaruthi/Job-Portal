package com.db.jobportal.utilities;

public class EmailStringManipulation {
	

	
		
		public static String email = "urwithdhanu@googlemail.com";
		public static String POSTFIX_G = "gmail.com";
		public static String POSTFIX_GOOGLE = "googlemail.com";
		
			
public static String getPrefix(String email)
		
		{
			email=email;
			int indexAtR = email.indexOf('@');
			String prefixemail = email.substring(0, indexAtR);
			return prefixemail;
			
		}
		public static String getPostfix(String email)
		{
			int indexAtR = email.indexOf('@');
			String postfixemail = email.substring(indexAtR+1,email.length());
			return postfixemail;
		}
		
		
		
		
		
		


}
