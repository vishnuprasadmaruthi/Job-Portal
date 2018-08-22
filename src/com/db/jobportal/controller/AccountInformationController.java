package com.db.jobportal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.db.jobportal.model.JobId;
import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.model.RegisterUserInformation;
import com.db.jobportal.model.UniqueUserId;
import com.db.jobportal.model.User;
import com.db.jobportal.serviceimpl.RegisterUserServiceImpl;
import com.db.jobportal.utilities.RandomUniqueIdUtility;
import com.db.jobportal.utilities.RandomUniqueUserIdUtility;

@Controller
public class AccountInformationController 
{
	@Autowired
	private RegisterUserServiceImpl registeredUserService;

	@RequestMapping("/account")
	public ModelAndView welcomeToPortal()
	{
		
		String message = "Profile Information";  
       return new ModelAndView("account", "message", message);  
        
	}
	
	@RequestMapping("/acknowledge")
	public ModelAndView educationalinformationPage()
	{
		
		String message = "Acknowledge";  
       return new ModelAndView("acknowledge", "message", message);  
        
	}

	
	@RequestMapping(value="/insertAccountInformation" ,  method=RequestMethod.POST)
	public String insertAccountInfo(@ModelAttribute RegisterUserInformation registeredUserInformation)
	{
		
		
		
		Integer val =registeredUserService.add(registeredUserInformation);
		System.out.println(val);
		return "accountinfoinsertsuccess";
	}
	
	
	@RequestMapping(value="/getLoggedInMailAdd" , method=RequestMethod.GET , produces = "application/json")
	public @ResponseBody User getLoggedInMailAdd(){
	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	RegisterUser user=null;
	if (principal instanceof RegisterUser) {
	user = ((RegisterUser)principal);
	}
 
	String name = user.getUsername();
	String contactnumber = user.getContactno();
	String firstname=user.getUsertype();
	User user1 = new User();
	user1.setUsername(name);
	user1.setContactnumber(contactnumber);
	user1.setFirstname(firstname);
	return user1;
	
	}
	@ResponseBody
	@RequestMapping(value="/allusersinfo" , method=RequestMethod.GET , headers="Accept=application/json")
	public List<RegisterUserInformation> getAllUsersInfo(){
		
		List<RegisterUserInformation> registerUsersInfoList = registeredUserService.getAllRegisteredUsersInfo();
		
		return registerUsersInfoList;
		
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/create" , method=RequestMethod.POST , headers="Accept=application/json")
	public ResponseEntity<Void> saveUsersInfo(@RequestBody RegisterUserInformation registerUserInformation
			, UriComponentsBuilder ucBuilder){
//		List<RegisterUserInformation> registerUsersInfoList =null;
//		if(registeredUserService.recordExists(registerUserInformation.getEmail())==1 && registeredUserService.recordExists(registerUserInformation.getEmail())==1)
//		{
//			
//		}
//		
//		if(registeredUserService.recordExists(registerUserInformation.getEmail())!=1 && registeredUserService.recordExists(registerUserInformation.getEmail())==1)
//		{
//			Integer result = registeredUserService.add(registerUserInformation);
//			registerUsersInfoList = registeredUserService.getAllRegisteredUsersInfo();
//			
//			return registerUsersInfoList;
//		}
//		return null;
		
		
		if (registeredUserService.recordExistsInReUseInfo(registerUserInformation.getEmail())>=1) {
            System.out.println("A User with name ::" + registerUserInformation.getEmail() + " already exist");
            ResponseEntity re =  new ResponseEntity<Void>(HttpStatus.CONFLICT);
            System.out.println(re);
            return re;
        }
		Integer result = registeredUserService.add(registerUserInformation);
		 HttpHeaders headers = new HttpHeaders();
	     headers.setLocation(ucBuilder.path("/create").buildAndExpand(registerUserInformation.getId()).toUri());
	     ResponseEntity re = new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	    
		 return re;
  
		
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/updateAccountInformation" , method=RequestMethod.PUT , headers="Accept=application/json")
	public ResponseEntity<Void> updateUsersInfo(@RequestBody RegisterUserInformation registerUserInformation
			, UriComponentsBuilder ucBuilder){

		registeredUserService.update(registerUserInformation);
		 HttpHeaders headers = new HttpHeaders();
	     headers.setLocation(ucBuilder.path("/updateAccountInformation").buildAndExpand(registerUserInformation.getId()).toUri());
	     ResponseEntity re = new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	     System.out.println(re);
		 return re;
  
		
		
	}
	
	@RequestMapping(value="/getNewUserId" , method=RequestMethod.GET , produces = "application/json")
	public @ResponseBody UniqueUserId getNewUserId(){
	
		UniqueUserId uusId = new UniqueUserId();
		uusId.setUniqueUserId(new RandomUniqueUserIdUtility().getRandomUid());
		return uusId;
	
	
	}
	
	
	
	
	
	
}
