package com.db.jobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutController {
	
	@RequestMapping("/about")
	public ModelAndView welcomeToPortalForGuest()
	{
		String message = "About Dayalbagh";  
        return new ModelAndView("about", "message", message);  
	}
	
	@RequestMapping("/instructions")
	public ModelAndView getInstructionsGuide()
	{
		String message = "Instructions Guide";  
        return new ModelAndView("instructions", "message", message);  
	}

}
