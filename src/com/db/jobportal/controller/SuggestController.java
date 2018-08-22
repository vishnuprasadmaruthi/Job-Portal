package com.db.jobportal.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cob.db.jobportal.constants.JobPortalConstants;

import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.utilities.CryptoUtil;
import com.db.jobportal.utilities.SendmailUtility;
import com.db.jobportal.utilities.SuggestUsSendMailUtility;


@Controller
public class SuggestController {
	
	JobPortalConstants jc = new JobPortalConstants();
	SendmailUtility sm = new SendmailUtility();
	SuggestUsSendMailUtility suggest = new SuggestUsSendMailUtility();
	@RequestMapping("/suggest")
	public ModelAndView welcomeToPortalForGuest()
	{
	
		String message = "";  
        return new ModelAndView("suggest", "message", message);  
	}
	
	
	
	@RequestMapping(value="gosuggestion",method=RequestMethod.POST)  
    public ModelAndView goSuggestion(@RequestParam("suggestion") String suggestion) throws Exception  
    {  
	
	String sendToEmail =jc.getAdminMailAddress();
	System.out.println("-------------------------------------------------->1"+sendToEmail);
	RegisterUser user = (RegisterUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
   
	String name = user.getUsername(); //get logged in username
	System.out.println("-------------------------------------------------->2"+name);
	String fromDetails = "BY-"+name;
	suggest.sendMail(name, "Thank you for Your Comments.We will get back to you if required.".concat("\n").concat("Job Enablers/Recruiters are requested to stay tuned on Connected for Talented Job Seeker Profiles.").concat("\n").concat("Job Seekers are requested to be in touch with ConnectedIn and Job Enablers for more suitable jobs.").concat("\n").concat("Thank you.").concat("\n").concat("ConnectedIn Team."));
	sm.sendMail(sendToEmail,suggestion.concat("\n").concat("\n").concat(fromDetails));
	return new ModelAndView("commentsuccess","success","Your Comment was sent succesfully.");  
		
	}
	

}
