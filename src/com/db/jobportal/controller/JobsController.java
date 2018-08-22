package com.db.jobportal.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.model.RegisterUserDocuments;
import com.db.jobportal.model.RegisterUserJobs;
import com.db.jobportal.serviceimpl.RegisterUserServiceImpl;
import com.db.jobportal.utilities.ApplyJobSendMailUtility;
import com.db.jobportal.utilities.GetLoggedInUserUtil;
import com.db.jobportal.utilities.SendmailUtility;


@Controller
public class JobsController {
	
	ApplyJobSendMailUtility smu = new ApplyJobSendMailUtility();
	GetLoggedInUserUtil gliu = new GetLoggedInUserUtil();
	
	@Autowired
	private RegisterUserServiceImpl registeredUserService;
	
	@RequestMapping("/jobs")
	public String welcomeToJobsPage(@ModelAttribute RegisterUserJobs registerUserJobs, BindingResult result,Map<String, Object> map)
	{
		RegisterUserJobs ruj = new RegisterUserJobs();
		map.put("RegisterUserJobs", ruj);
		map.put("registerUserJobsList", registeredUserService.getAllJobs());
		
        return "jobgrid";
	}
	@RequestMapping("/otherjobs")
	public ModelAndView welcomeToPortalForGuest()
	{
		String message = "otherjobs";  
        return new ModelAndView("otherjobs", "message", message);  
	}
	
	
	
	
@RequestMapping(value = {"view-job-{registeredUserJobId}"}, method = RequestMethod.GET)
public String  viewJob(@PathVariable Integer  registeredUserJobId,Map<String, Object> map,HttpServletResponse response) throws IOException
{
	
	RegisterUserJobs ruj = new RegisterUserJobs(); 
	map.put("RegisterUserJobs", ruj);
	map.put("selectedJob",registeredUserService.getJobDetails(registeredUserJobId));
	return "viewjobselected";
	    	
}

@RequestMapping(value = {"apply-job-{registeredUserJobId}"}, method = RequestMethod.GET)
public String  applyJob(@PathVariable Integer  registeredUserJobId,Map<String, Object> map,HttpServletResponse response) throws IOException
{
	
	
	RegisterUserJobs ruj = new RegisterUserJobs(); 
	ruj=registeredUserService.getJobDetails(registeredUserJobId);
	String appliedBy = gliu.getTheLoggedInUser().getUsername();
	smu.sendMail(ruj.getPostedby(),"Job Seeker with Email Id-".concat("|"+appliedBy+"|").concat("-has shown interest in the Job with id-").concat(ruj.getId().toString()).concat("\n").concat("Job Seeker's contact Details are as follows:").concat(gliu.getTheLoggedInUser().getContactno()).concat("\n").concat("We Request you to take the initiative to help the Job Seeker with more information.").concat("\n").concat("Thank you,").concat("\n").concat("The Connected In Team.")); 
	System.out.println("succcess..");
	return "appliedsuccessfully";
}


	
	@ResponseBody
	@RequestMapping(value="/allpostedjobs" , method=RequestMethod.GET , headers="Accept=application/json")
	public List<RegisterUserJobs> getAllPostedJobs(){
		
		List<RegisterUserJobs> registerUsersJobsList = registeredUserService.getAllJobs();
		
		return registerUsersJobsList;
		
		
		
	}

}
