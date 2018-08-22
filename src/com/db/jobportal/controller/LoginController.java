package com.db.jobportal.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cob.db.jobportal.constants.JobPortalConstants;

import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.serviceimpl.RegisterUserServiceImpl;
import com.db.jobportal.utilities.CryptoUtil;
import com.db.jobportal.utilities.EmailStringManipulation;
import com.db.jobportal.utilities.EmailValidator;
import com.db.jobportal.utilities.RandomStringUtility;
import com.db.jobportal.utilities.SendmailUtility;





@Controller
public class LoginController 
{
	@Autowired
	private RegisterUserServiceImpl registeredUserService;
	
	SendmailUtility sm = new SendmailUtility();
	JobPortalConstants jpcs = new JobPortalConstants();
	RandomStringUtility rsu = new RandomStringUtility();
	EmailValidator ev = new EmailValidator();
	EmailStringManipulation esm = new EmailStringManipulation();
	
	
	String customMessage = jpcs.getNewRegisteredUserCustomMessage();
	private static final String CLIENT_ID = "client id here"; 
	private static final String CLIENT_SECRET = "client secret here";
	
	@RequestMapping("/login")
	public ModelAndView welcomeToPortal()
	{
		String message = "";  
        return new ModelAndView("loginpage", "message", message);  
	}
	
	
	
	@RequestMapping("/forgotpassword")
	public ModelAndView Forgotpassword()
	{
		String message = "Enter your Valid Email ID to send the password.";  
        return new ModelAndView("forgotpassword", "message", message);  
	}	
	
	
	@RequestMapping(value="retrievePassword",method=RequestMethod.POST)  
    public ModelAndView retrievePassword(@RequestParam("retrievePasswordEmail") String retrievePasswordEmail) throws Exception  
    {  
	String retrievePEmail =retrievePasswordEmail.toLowerCase();
	Boolean valid = ev.validate(retrievePEmail);
	if(!valid)
	{
	return new ModelAndView("invalidMailAddress","failure","Please Enter Valid EmailAddress!");  
	}
	else if(valid)
	{
		if(registeredUserService.recordExists(retrievePEmail)==0)
		{
		return new ModelAndView("notRegisteredMailAddress","notregistered","Please Register with us");
		}
		else
		{
				String userName = registeredUserService.getUserNameGivenEmail(retrievePEmail);	
				String generatedPassword =rsu.generateRandomPassword(retrievePEmail);
				registeredUserService.updateRegisterUserPassword(CryptoUtil.encrypt(jpcs.getencryptionDecryptionKey(), generatedPassword), retrievePEmail);
				sm.sendMail(retrievePEmail, jpcs.getForgotPasswordMessage().concat(generatedPassword).concat("|User name|").concat(retrievePEmail));
				return new ModelAndView("retrievePassword","success","UserName and Password successfully sent");  
		}
	}
	return null;
	}
	@RequestMapping("/hello")
	public ModelAndView welcomeToPortalForGuest()
	{
		String message = "Welcome";  
        return new ModelAndView("hello", "message", message);  
	}
	
	
//	@RequestMapping("/register")
//	public ModelAndView register(){
//		
//		String message = "Please Register!";
//		return new ModelAndView("register","message",message);
//	}
	
	
	@RequestMapping(value="/register" ,method = RequestMethod.GET)
	public String setupFormForRegisteredUser(Map<String, Object> map){
		
		RegisterUser user = new RegisterUser();
		map.put("RegisteredUser", user);
		map.put("registeredUserList", registeredUserService.getAllRegisteredUsers());
	
		return "RegisteredUser";
	}
	//<input class="btn btn-primary" type="submit" name="action" value="Register" />
	
	@RequestMapping(value="/registerUser", method=RequestMethod.POST)
	public String doActions(@ModelAttribute RegisterUser registeredUser, BindingResult result, @RequestParam String action,Map<String, Object> map) throws Exception
	{
		Boolean valid = ev.validate(registeredUser.getEmail());
		
		
		RegisterUser user = new RegisterUser();
		if(!valid)
		{
		return "invalidMailAddress"; 
		}
		else if(valid)
		{
			if(registeredUserService.recordExists(registeredUser.getEmail())==1)
			{
			 return "alreadyregistered";
			}
//		 if(registeredUserService.recordExists(registeredUser.getEmail())!=1)
//		{
//			
//			String alreadyRegisteredEmail = registeredUser.getEmail();
//			String alternateMatchEmail ="";
//			String alreadyRegisteredEmailPostfix = esm.getPostfix(alreadyRegisteredEmail);
//			String alreadyRegisteredEmailPrefix = esm.getPrefix(alreadyRegisteredEmail);
//			if(alreadyRegisteredEmailPostfix.equals(esm.POSTFIX_GOOGLE))
//			{
//				alternateMatchEmail = alreadyRegisteredEmailPrefix.concat(esm.POSTFIX_G);
//				if(alternateMatchEmail.equals(alreadyRegisteredEmail))
//				{
//					return "alreadyregistered";
//				}
//			}
//			else if(alreadyRegisteredEmailPostfix.equals(esm.POSTFIX_G))
//			{
//				alternateMatchEmail = alreadyRegisteredEmailPrefix.concat(esm.POSTFIX_GOOGLE);
//				if(alternateMatchEmail.equals(alreadyRegisteredEmail))
//				{
//					return "alreadyregistered";
//				}
//				
//				
//			}
//			
//			
//		}
			else
			{
				 
				String registeredUserName = registeredUser.getUsername();
				if(action.toLowerCase().equals("register"))
				{
					registeredUser.setEmail(registeredUser.getEmail().toLowerCase());
					String val =registeredUserService.add(registeredUser);
					
					if(val!=null || !val.equals("") || !val.equals(null))
					{
						
						String generatedPassword =rsu.generateRandomPassword(registeredUser.getEmail());
						
						String newPAssword = CryptoUtil.decrypt(jpcs.getencryptionDecryptionKey(), registeredUser.getPassword()).concat(generatedPassword);
						registeredUserService.updateRegisterUserPassword(CryptoUtil.encrypt(jpcs.getencryptionDecryptionKey(), newPAssword), registeredUser.getEmail());
						sm.sendMail(registeredUser.getEmail(),customMessage.concat("UserName:").concat(registeredUser.getEmail().concat("Password:").concat(newPAssword)));
					}
					
				
					
				}
			}
			
			
		}
		
//		map.put("RegisteredUser", user);
//		map.put("registeredUserList", registeredUserService.getAllRegisteredUsers());
		return "registrationsuccess";
		
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/signout" ,method = RequestMethod.GET)
	public String logoutDo(HttpServletRequest request,HttpServletResponse response){
	HttpSession session= request.getSession(false);
	SecurityContextHolder.clearContext();
	if(SecurityContextHolder.getContext().getAuthentication() != null &&
			 SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
			 //when Anonymous Authentication is enabled
			 !(SecurityContextHolder.getContext().getAuthentication() 
			          instanceof AnonymousAuthenticationToken) )
	{
		System.out.println("===========================================loggedin..........");
	}
	else
	{
		
		System.out.println("loggedout*********************************************************");
	}
	session= request.getSession(false);
	if(session != null)
	{
	 session.invalidate();
	}

	for(Cookie cookie : request.getCookies()) 

	{
	            
		cookie.setMaxAge(0);

	}
	    
	return "loginpage";
	}
	
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	/*@Secured("ROLE_ADMIN")*/
	public String securedHome(ModelMap model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		RegisterUser user=null;
		if (principal instanceof RegisterUser) {
		user = ((RegisterUser)principal);
		}
		
		
		
	 
	String name = user.getUsername();
	String realName =registeredUserService.getUserNameGivenEmail(name);
	model.addAttribute("username", realName);
	model.addAttribute("message", "Welcome");
	return "home";
	 
	}
	
	
	

}
