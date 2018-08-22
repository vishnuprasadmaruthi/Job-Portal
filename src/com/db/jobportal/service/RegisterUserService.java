package com.db.jobportal.service;

import java.util.List;

import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.model.RegisterUserDocuments;
import com.db.jobportal.model.RegisterUserInformation;
import com.db.jobportal.model.RegisterUserJobs;

public interface RegisterUserService {

	public String add(RegisterUser user);
	public List getAllRegisteredUsers();
	public List getAllRegisteredUsersInfo(); 
	public List getAllJobs();
	public RegisterUserJobs getJobDetails(Integer id);
	public List getRegisteredUserInfoObject(String email); 
	public RegisterUser loadByUserName(String username);
	public String getUserNameGivenEmail(String email);
	public void updateRegisterUserPassword(String newPassword,String email);
	public Long recordExists(String email);
	public RegisterUser loadUserByUsername(String username);
	public Integer add(RegisterUserInformation registerUserInformation);
	public void update(RegisterUserInformation registerUserInformation);
	public Integer add(RegisterUserJobs registerUserJobs);
	public Long recordExistsInReUseInfo(String email);
	//-----------------------------------------------------------
		public void saveRegisterUserDocuments(RegisterUserDocuments registerUserDocuments);
		public RegisterUserDocuments findById(String  email,Integer id);
		public List listAll(String email);
		public void deleteRegisterUserDocuments(String email,Integer id);
		//------------------------------------------------
		public RegisterUserInformation getSeekerDetails(String email);
		public List getJobsPostedBy(String postedby);
		public void deletejobSelected(String postedby,Integer id);
		public RegisterUserJobs findJobById(String postedby,Integer id);
		
		public RegisterUser getUserByEmail(String email);
		
		
		public RegisterUserDocuments getPhoto(String email ,String description);
}
