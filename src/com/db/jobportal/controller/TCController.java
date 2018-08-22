package com.db.jobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TCController {

	

	@RequestMapping("/tc")
	public ModelAndView welcomeToPortalForGuest()
	{
		String message = "Terms and Conditions";  
        return new ModelAndView("tc", "message", message);  
	}
	
}
