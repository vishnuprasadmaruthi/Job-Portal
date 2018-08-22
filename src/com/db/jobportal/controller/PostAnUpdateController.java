package com.db.jobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostAnUpdateController {
	
	
	
	@RequestMapping("/postanupdatepage")
	public ModelAndView postAnUpdate()
	{
		String message = "Post an Update";  
        return new ModelAndView("postanupdatepage", "message", message);  
	}

}
