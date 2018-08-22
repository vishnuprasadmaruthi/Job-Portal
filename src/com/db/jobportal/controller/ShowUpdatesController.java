package com.db.jobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShowUpdatesController {
	
	@RequestMapping("/showupdatespage")
	public ModelAndView welcomeToPortalForGuest()
	{
		String message = "All Updates posted on the portal";  
        return new ModelAndView("showupdatespage", "message", message);  
	}
	

}
