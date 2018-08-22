package com.db.jobportal.utilities;

import org.springframework.security.core.context.SecurityContextHolder;

import com.db.jobportal.model.RegisterUser;



public class GetLoggedInUserUtil {
	
	public static RegisterUser getTheLoggedInUser()
	{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		RegisterUser user=null;
		if (principal instanceof RegisterUser) {
		user = ((RegisterUser)principal);
		}
	String name = user.getUsername();
	return user;
	}
	
	

}
