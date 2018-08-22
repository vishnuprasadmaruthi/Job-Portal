package com.db.jobportal.authentication;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.serviceimpl.RegisterUserServiceImpl;



@Component
public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	public CustomAuthenticationProvider(){
		
	}
	
	@Autowired
	private RegisterUserServiceImpl registeredUserService;

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {
			String username = authentication.getName().toLowerCase();
			
			String password = (String) authentication.getCredentials();
			if(registeredUserService.recordExists(username)==0)
			{
				 throw new BadCredentialsException("Please Register if not Registered already,otherwise reset password");
			}
			
	        RegisterUser user = (RegisterUser) registeredUserService.loadUserByUsername(username);
	        
	        if (user == null || !user.getUsername().equalsIgnoreCase(username)) {
	            throw new BadCredentialsException("Username not found");
	        }
	 
	        if (!password.equals(user.getPassword())) {
	            throw new BadCredentialsException("Password is case-sensitive,Please try again with Correct Credentials");
	        }
	 
	        Collection<? extends GrantedAuthority> authorities = user.getAuthorities();
	        StringBuilder sb = new StringBuilder();
	        sb.append(new UsernamePasswordAuthenticationToken(user, password, authorities));
	        System.out.println("Authentication token...................."+sb.toString());
	        
	        return new UsernamePasswordAuthenticationToken(user, password, authorities);
	}

	@Override
	public boolean supports(Class<? extends Object> authentication) {
		return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
	}

}
