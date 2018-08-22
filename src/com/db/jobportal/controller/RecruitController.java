package com.db.jobportal.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.db.jobportal.model.JobId;
import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.model.RegisterUserDocuments;
import com.db.jobportal.model.RegisterUserInformation;
import com.db.jobportal.model.RegisterUserJobs;
import com.db.jobportal.model.User;
import com.db.jobportal.serviceimpl.RegisterUserServiceImpl;
import com.db.jobportal.utilities.GetLoggedInUserUtil;
import com.db.jobportal.utilities.PingJobSeekerSendMailUtility;
import com.db.jobportal.utilities.RandomUniqueIdUtility;

@Controller
public class RecruitController {
	@Autowired
	private RegisterUserServiceImpl registeredUserService;
	
	PingJobSeekerSendMailUtility smu = new PingJobSeekerSendMailUtility();
	GetLoggedInUserUtil gliu = new GetLoggedInUserUtil();
	
	@RequestMapping("/recruit")
	public String welcomeToPortalForGuest(@ModelAttribute RegisterUserInformation registerUserInformation, BindingResult result,Map<String, Object> map)
	{
		RegisterUserInformation rui = new RegisterUserInformation();
		map.put("RegisterUserInformation", rui);
		map.put("registerUserInformationList", registeredUserService.getAllRegisteredUsersInfo());
		
        return "talentedusersgrid";
		
		  
	}

	
	  
	
	
	
	@RequestMapping(value = {"view-seeker-{registerUserInformationEmail:.+}"}, method = RequestMethod.GET)
	public String  viewJobSeeker(@PathVariable String  registerUserInformationEmail,Map<String, Object> map,HttpServletResponse response) throws IOException
	{
		
		
		RegisterUserInformation rui = new RegisterUserInformation(); 
		map.put("RegisterUserInformation", rui);
		map.put("selectedJobSeeker",registeredUserService.getSeekerDetails(registerUserInformationEmail));
		//--------------------------------------------------------------------
		RegisterUserDocuments rud = new RegisterUserDocuments();
    	map.put("RegisterUserDocuments", rud);
		map.put("registeredUserDocumentList", registeredUserService.listAll(registerUserInformationEmail));
		return "viewjobseekerProfile";
		    	
	}
	
	@RequestMapping(value = {"show-interest-{email:.+}"}, method = RequestMethod.GET)
	public String  pingJobSeeker(@PathVariable String  email,Map<String, Object> map,HttpServletResponse response) throws IOException
	{
		
		
		RegisterUserInformation rui = new RegisterUserInformation(); 
		rui=registeredUserService.getSeekerDetails(email);
		String jobenablersEmailId = gliu.getTheLoggedInUser().getUsername();
		smu.sendMail(email,"Job Enabler with Email Id-".concat("|"+jobenablersEmailId+"|").concat("-has shown interest in your profile.").concat("\n").concat("Mail back Job Enabler for more information and help.")); 
		
		return "pingedsuccessfully";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/alltalent" , method=RequestMethod.GET , headers="Accept=application/json")
	public List<RegisterUser> getAllTalents(){
		
		List<RegisterUser> registerUsersList = registeredUserService.getAllRegisteredUsers();
		
		return registerUsersList;
		
		
		
	}
	
	
	@RequestMapping("/postjobs")
	public ModelAndView postNewJobs()
	{
		
		String message = "New Jobs";  
       return new ModelAndView("postjobs", "message", message);  
        
	}
	
	@RequestMapping(value="viewjobspostedbyme",method=RequestMethod.GET)
	public String  viewJobsPostedByMe(@ModelAttribute RegisterUserJobs registerUserJobs,Map<String, Object> map)
	{
		
		RegisterUserJobs ruj = new RegisterUserJobs();
		map.put("RegisterUserJobs", ruj);
		System.out.println("--------------------------first"+registeredUserService.getJobsPostedBy(gliu.getTheLoggedInUser().getUsername()));
		map.put("registerUserJobsList", registeredUserService.getJobsPostedBy(gliu.getTheLoggedInUser().getUsername()));
	 
        
		return "viewjobspostedbyme";
		
	}
	
	
	 @RequestMapping(value = { "/delete-job-{postedby}-{jobid}" }, method = RequestMethod.GET)
	    public String deleteDocument(@ModelAttribute RegisterUserJobs registerUserJobs,@PathVariable String postedby, @PathVariable int jobid,Map<String, Object> map) {
		 System.out.println("-------->"+postedby+"========="+jobid);
	    	registeredUserService.deletejobSelected(postedby, jobid);
	    	RegisterUserJobs ruj = new RegisterUserJobs();
			map.put("RegisterUserJobs", ruj);
			map.put("registerUserJobsList", registeredUserService.getJobsPostedBy(gliu.getTheLoggedInUser().getUsername()));
		 
	        
			return "viewjobspostedbyme";
	       
	    }
	      
		
	
	
	@ResponseBody
	@RequestMapping(value="/createJob" , method=RequestMethod.POST , headers="Accept=application/json")
	public ResponseEntity<Void> saveJobInfo(@RequestBody RegisterUserJobs registerUserJobs
			, UriComponentsBuilder ucBuilder){

		
		
		Integer result = registeredUserService.add(registerUserJobs);
		 HttpHeaders headers = new HttpHeaders();
	     headers.setLocation(ucBuilder.path("/createJob").buildAndExpand(registerUserJobs.getId()).toUri());
	     ResponseEntity re = new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	     System.out.println(re);
		 return re;
  
		
		
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/getNewJobId" , method=RequestMethod.GET , produces = "application/json")
	public @ResponseBody JobId getNewJobId(){
	
	JobId jobId = new JobId();
	jobId.setJobId(new RandomUniqueIdUtility().getRandomUid());
	return jobId;
	
	
	}
	
	
	
	
	
	
	
	
	
	
}
