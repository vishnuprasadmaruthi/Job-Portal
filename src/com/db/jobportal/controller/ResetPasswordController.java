package com.db.jobportal.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResetPasswordController {
	
	
	@RequestMapping("/resetpasswordpage")
	public ModelAndView showResetPasswordPage()
	{
		
		String message = "Reset Password";  
        return new ModelAndView("resetpasswordpage", "message", message);  
	}

}
