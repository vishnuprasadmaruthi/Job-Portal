package com.db.jobportal.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.db.jobportal.model.RegisterUserInformation;
import com.db.jobportal.model.RegisterUserJobs;
import com.db.jobportal.serviceimpl.RegisterUserServiceImpl;
import com.db.jobportal.utilities.GetLoggedInUserUtil;


@Controller
public class ProfileViewByController {
	
	GetLoggedInUserUtil gliu = new GetLoggedInUserUtil();
	
	@Autowired
	private RegisterUserServiceImpl registeredUserService;
	
	@RequestMapping("/viewby")
	public ModelAndView welcomeToPortalForGuest()
	{
		String message = "About You";  
        return new ModelAndView("profileviewby", "message", message);  
	}
	
	@RequestMapping("/mailUser")
	public ModelAndView mailUser()
	{
		String message = "";  
        return new ModelAndView("mailUser", "message", message);  
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/regUserInfo" , method=RequestMethod.GET, headers="Accept=application/json")
	public List<RegisterUserInformation> getRegisterUserInfoObj()
	{
		String email =gliu.getTheLoggedInUser().getUsername();
		String contact = gliu.getTheLoggedInUser().getContactno();
		String firstname = gliu.getTheLoggedInUser().getUsertype();
		String test = gliu.getTheLoggedInUser().getEmail();
		System.out.println("JUST TESTING..."+contact+"-"+firstname+"-"+"-"+test);
		List<RegisterUserInformation> registerUsersInfoList =  new ArrayList<RegisterUserInformation>();
		registerUsersInfoList=registeredUserService.getRegisteredUserInfoObject(email);
		return registerUsersInfoList ;
		
		
		
		
	}

}
