package com.db.jobportal.serviceimpl;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cob.db.jobportal.constants.JobPortalConstants;

import com.db.jobportal.daoimpl.RegisterUserDaoImpl;
import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.model.RegisterUserDocuments;
import com.db.jobportal.model.RegisterUserInformation;
import com.db.jobportal.model.RegisterUserJobs;
import com.db.jobportal.service.RegisterUserService;
import com.db.jobportal.utilities.CryptoUtil;
import com.db.jobportal.utilities.SendmailUtility;


@Service
public class RegisterUserServiceImpl implements RegisterUserService,UserDetailsService
{
	
	public RegisterUserServiceImpl(){
		
	}
	JobPortalConstants jpc = new JobPortalConstants();
	String key=jpc.getencryptionDecryptionKey();  
	
	String customMessage = jpc.getNewRegisteredUserCustomMessage();
	
	@Autowired
	private RegisterUserDaoImpl registerUserDao;
	
	
	
	
	SendmailUtility sm = new SendmailUtility();

	@Transactional
	public String add(RegisterUser user) {
		
		

		String enc = null;
		try {
			enc = CryptoUtil.encrypt(key, user.getPassword());
		} catch (InvalidKeyException | NoSuchAlgorithmException
				| InvalidKeySpecException | NoSuchPaddingException
				| InvalidAlgorithmParameterException
				| UnsupportedEncodingException | IllegalBlockSizeException
				| BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setPassword(enc);
		return registerUserDao.add(user);
	}

	@Transactional
	public List getAllRegisteredUsers() {
		
		
		return registerUserDao.getAllRegisteredUsers();
	}

//	@Override
//	public UserDetails loadUserByUsername(String username)
//			throws UsernameNotFoundException {
//		
//		return loadByUserName(username);
//	}

	
	public RegisterUser loadByUserName(String username)
	{
		
		
		try {
			return registerUserDao.loadUserByUsername(username);
		} catch (Exception e) 
		{
			
		}
		return null;
		
		
	}

	@Transactional
	public String getUserNameGivenEmail(String email) {
		
		return registerUserDao.getUserNameGivenEmail(email);
	}

	@Transactional
	public void updateRegisterUserPassword(String newPassword, String email) {
		registerUserDao.updateRegisterUserPassword(newPassword, email);
		
	}

	@Transactional
	public Long recordExists(String email) {
		return registerUserDao.recordExists(email);
	}

	@Override
	public RegisterUser loadUserByUsername(String username) {
		return loadByUserName(username);
	}

	@Transactional
	public Integer add(RegisterUserInformation registerUserInformation) {
		// TODO Auto-generated method stub
		return registerUserDao.add(registerUserInformation);
	}

	@Transactional
	public List getAllRegisteredUsersInfo() {
		// TODO Auto-generated method stub
		return registerUserDao.getAllRegisteredUsersInfo();
	}

	@Transactional
	public Long recordExistsInReUseInfo(String email) {
		// TODO Auto-generated method stub
		return registerUserDao.recordExistsInReUseInfo(email);
	}

	@Transactional
	public List getAllJobs() {
		// TODO Auto-generated method stub
		return registerUserDao.getAllJobs();
	}

	@Transactional
	public List getRegisteredUserInfoObject(String email) {
		// TODO Auto-generated method stub
		return registerUserDao.getRegisteredUserInfoObject(email);
	}

	@Transactional
	public void saveRegisterUserDocuments(
			RegisterUserDocuments registerUserDocuments) {
		registerUserDao.saveRegisterUserDocuments(registerUserDocuments);
		
	}

	@Transactional
	public RegisterUserDocuments findById(String email,Integer id) {
		// TODO Auto-generated method stub
		return registerUserDao.findById(email,id);
	}

	@Transactional
	public List listAll(String email) {
		
		return registerUserDao.listAll(email);
	}

	@Transactional
	public void deleteRegisterUserDocuments(String email,Integer id) {
		
		registerUserDao.deleteRegisterUserDocuments(email,id);
	}

	@Transactional
	public RegisterUserJobs getJobDetails(Integer id) {
		return registerUserDao.getJobDetails(id);
	}

	@Transactional
	public RegisterUserInformation getSeekerDetails(String email) {
		
		return registerUserDao.getSeekerDetails(email);
	}

	@Transactional
	public Integer add(RegisterUserJobs registerUserJobs) {
		// TODO Auto-generated method stub
		return registerUserDao.add(registerUserJobs);
	}

	@Transactional
	public List getJobsPostedBy(String postedby) {
		// TODO Auto-generated method stub
		return registerUserDao.getJobsPostedBy(postedby);
	}

	@Transactional
	public void deletejobSelected(String postedby, Integer id) {
		
		registerUserDao.deletejobSelected(postedby, id);
	}

	@Transactional
	public RegisterUserJobs findJobById(String postedby, Integer id) {
		
		return registerUserDao.findJobById(postedby, id);
	}

	@Transactional
	public void update(RegisterUserInformation registerUserInformation) {
		registerUserDao.update(registerUserInformation);
		
	}

	@Transactional
	public RegisterUser getUserByEmail(String email) {
	
		return registerUserDao.getUserByEmail(email);
	}

	@Transactional
	public RegisterUserDocuments getPhoto(String email, String description) {
		// TODO Auto-generated method stub
		return registerUserDao.getPhoto(email, description);
	}

	


	 

}
