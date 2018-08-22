package com.db.jobportal.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

import cob.db.jobportal.constants.JobPortalConstants;

import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.model.RegisterUserInformation;
import com.db.jobportal.serviceimpl.RegisterUserServiceImpl;
import com.db.jobportal.utilities.CryptoUtil;


@Controller
public class HomeController {
	@Autowired
	private RegisterUserServiceImpl registeredUserService;
	JobPortalConstants jpcs = new JobPortalConstants();
	
	@ResponseBody
	@RequestMapping(value="/userByMail" , method=RequestMethod.GET , headers="Accept=application/json")
	public RegisterUser getUserByEmail(){
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		RegisterUser user=null;
		if (principal instanceof RegisterUser) {
		user = ((RegisterUser)principal);
		}
	 
		String email = user.getUsername();
		RegisterUser registerUserByEmail = registeredUserService.getUserByEmail(email);
		
		return registerUserByEmail;
		
		
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/updateToCustomPassword" , method=RequestMethod.PUT , headers="Accept=application/json")
	public ResponseEntity<Void> updateToCustomPassword(@RequestBody RegisterUser registerUser
			, UriComponentsBuilder ucBuilder) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException{
		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		RegisterUser user=null;
		if (principal instanceof RegisterUser) {
		user = ((RegisterUser)principal);
		}
	 
		String email = user.getUsername();
		String newPassword=registerUser.getPassword();
		
		
		 registeredUserService.updateRegisterUserPassword(CryptoUtil.encrypt(jpcs.getencryptionDecryptionKey(), newPassword), email);
		 HttpHeaders headers = new HttpHeaders();
	     headers.setLocation(ucBuilder.path("/updateToCustomPassword").buildAndExpand(registerUser.getEmail()).toUri());
	     ResponseEntity re = new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	     System.out.println(re);
	     SecurityContextHolder.clearContext();
		 return re;
  
		
		
	}
	
	
	@RequestMapping(value="/getUserImage" , method = RequestMethod.GET)
	public void getUserImage(HttpServletResponse response) throws IOException{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		RegisterUser user=null;
		if (principal instanceof RegisterUser) {
		user = ((RegisterUser)principal);
		}
		String email=user.getUsername();
		String description="Myphoto";
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(registeredUserService.getPhoto(email, description).getFilecont());


	    response.getOutputStream().close();
	//  byte[] buffer = registeredUserService.getPhoto(email, description).getFilecont();
	 // InputStream in1 = new ByteArrayInputStream(buffer);
	 // IOUtils.copy(in1, response.getOutputStream());        
	}
	
	
	
	
	
	

}
