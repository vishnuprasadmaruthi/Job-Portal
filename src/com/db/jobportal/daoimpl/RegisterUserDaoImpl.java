package com.db.jobportal.daoimpl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cob.db.jobportal.constants.JobPortalConstants;
import cob.db.jobportal.constants.RolesConstants;

import com.db.jobportal.dao.RegisterUserDao;
import com.db.jobportal.model.RegisterUser;
import com.db.jobportal.model.RegisterUserDocuments;
import com.db.jobportal.model.RegisterUserInformation;
import com.db.jobportal.model.RegisterUserJobs;
import com.db.jobportal.model.Role;




@Repository
public class RegisterUserDaoImpl implements RegisterUserDao{
	
	RolesConstants rc = new RolesConstants();
	public RegisterUserDaoImpl(){
		
	}
	
	@Autowired
	private SessionFactory session;

	@Override
	public String add(RegisterUser registeredUser) {
		
		return (String) session.getCurrentSession().save(registeredUser);
	}

	@Override
	public List getAllRegisteredUsers() {
		
		return session.getCurrentSession().createQuery("from RegisterUser").list();
	}

	@Transactional
	 public RegisterUser loadUserByUsername(final String username) {
		
		
		RegisterUser user =(RegisterUser)session.getCurrentSession().get(RegisterUser.class, username);
		
		RegisterUser userToconfirm = new RegisterUser();
		 	
		 	if(user==null)
		 	{
		 		return null;
		 	}
		 	
	   
		 	userToconfirm.setUsername(user.getEmail());
		 	userToconfirm.setContactno(user.getContactno());
		 	userToconfirm.setUsertype(user.getUsername());
		 	try {
				userToconfirm.setPassword(com.db.jobportal.utilities.CryptoUtil.decrypt("ezeon8547", user.getPassword()));
			} catch (InvalidKeyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvalidAlgorithmParameterException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalBlockSizeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (BadPaddingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 	Role r = new Role();
		 	String userType = user.getUsertype();
		 	if(userType.equals("JOB_SEEKER"))
		 	{
		 		r.setName(rc.getRoleSeeker());
		 	}
		 	if(userType.equals("EMPLOYER"))
		 	{
		 		r.setName(rc.getRoleEmployer());
		 	}
		 	if(userType.equals("ADMIN"))
		 	{
		 		r.setName(rc.getRoleAdmin());
		 	}
	    //    r.setName("EMPLOYER");
	        List<Role> roles = new ArrayList<Role>();
	        roles.add(r);
	        userToconfirm.setAuthorities(roles);
	        return userToconfirm;
	    }

	@Transactional
	public String getUserNameGivenEmail(String email) {
		RegisterUser user = (RegisterUser) session.getCurrentSession().createQuery("from  RegisterUser r  where r.email=:email").setParameter("email", email).uniqueResult();
		String userName  = user.getUsername();
		
		return userName;
		
	}

	@Transactional
	public void updateRegisterUserPassword(String newPassword,String email) 
	{
	int result=	session.getCurrentSession().createQuery("update RegisterUser r set password=:password   where r.email=:email").setParameter("password", newPassword).setParameter("email", email).executeUpdate();
		System.out.println(result);
	}

	@Transactional
	public Long recordExists(String email)
	{
		return  (Long) session.getCurrentSession().createQuery("select count(*) from RegisterUser r where r.email=:email").
		setParameter("email",email).uniqueResult();
	}

	@Transactional
	public Integer add(RegisterUserInformation registerUserInformation) {
		return (Integer) session.getCurrentSession().save(registerUserInformation);
		
	}

	@Override
	public List getAllRegisteredUsersInfo() {
		return session.getCurrentSession().createQuery("from RegisterUserInformation").list();
	}

	@Transactional
	public Long recordExistsInReUseInfo(String email) {
		return  (Long) session.getCurrentSession().createQuery("select count(*) from RegisterUserInformation r where r.email=:email").
				setParameter("email",email).uniqueResult();
	}

	@Override
	public List getAllJobs() {
		return session.getCurrentSession().createQuery("from RegisterUserJobs").list();
	}

	@Override
	public List getRegisteredUserInfoObject(String email) {
		// TODO Auto-generated method stub
		return   session.getCurrentSession().createQuery("from RegisterUserInformation ru where ru.email=:email").setParameter("email", email).list();
	}

	@Override
	public void saveRegisterUserDocuments(
			RegisterUserDocuments registerUserDocuments) {
		  session.getCurrentSession().save(registerUserDocuments);
		
	}

	@Override
	public RegisterUserDocuments findById(String email,Integer id) {
		
		return   (RegisterUserDocuments) session.getCurrentSession().createQuery("from RegisterUserDocuments rd where rd.email=:email and  rd.id=:id").setParameter("email", email).setParameter("id", id).uniqueResult();
	}

	@Override
	public List listAll(String email) {
		return  session.getCurrentSession().createQuery("from RegisterUserDocuments rd where rd.email=:email").setParameter("email", email).list();
		
	}

	@Override
	public void deleteRegisterUserDocuments(String email,Integer id) {
		RegisterUserDocuments rdObj = (RegisterUserDocuments) findById(email,id);
		
		session.getCurrentSession().delete(rdObj);
		
	}

	@Override
	public RegisterUserJobs getJobDetails(Integer id) {
		return   (RegisterUserJobs) session.getCurrentSession().createQuery("from RegisterUserJobs ruj where  ruj.id=:id").setParameter("id", id).uniqueResult();
	}

	@Override
	public RegisterUserInformation getSeekerDetails(String email) {
		
		return   (RegisterUserInformation) session.getCurrentSession().createQuery("from RegisterUserInformation rui where  rui.email=:email").setParameter("email", email).uniqueResult();
	}

	@Override
	public Integer add(RegisterUserJobs registerUserJobs) {
		return (Integer) session.getCurrentSession().save(registerUserJobs);
	}

	@Override
	public List getJobsPostedBy(String postedby) {
		return session.getCurrentSession().createQuery("from RegisterUserJobs  ruj where  ruj.postedby=:postedby").setParameter("postedby", postedby).list();
	}
	
	
	
	
	
	
	@Override
	public RegisterUserJobs findJobById(String postedby,Integer id) {
		
		return   (RegisterUserJobs) session.getCurrentSession().createQuery("from RegisterUserJobs ruj where ruj.postedby=:postedby and  ruj.id=:id").setParameter("postedby", postedby).setParameter("id", id).uniqueResult();
	}

	@Override
	public void deletejobSelected(String postedby, Integer id) {
		
		RegisterUserJobs ruj = (RegisterUserJobs)findJobById(postedby, id);
		session.getCurrentSession().delete(ruj);
	}

	@Override
	public void update(RegisterUserInformation registerUserInformation) {
		String lastName = registerUserInformation.getLastname();
		String email = registerUserInformation.getEmail();
		String firstname = registerUserInformation.getFirstname();
		String title = registerUserInformation.getTitle();
		String housenumber = registerUserInformation.getHousenumber();
		String street = registerUserInformation.getStreet();
		String city = registerUserInformation.getCity();
		String country = registerUserInformation.getCountry();
		String postcode = registerUserInformation.getPostcode();
		String nationality = registerUserInformation.getNationality();
		String contactnumber = registerUserInformation.getContactnumber();
		String highesteduqual = registerUserInformation.getHighesteduqual();
		String experience = registerUserInformation.getExperience();
		String primaryskill = registerUserInformation.getPrimaryskill();
		String interests = registerUserInformation.getInterests();
		String strengths = registerUserInformation.getStrengths();
		String weaknesses = registerUserInformation.getWeaknesses();
		String nativelanguage = registerUserInformation.getNativelanguage();
		String intlangkn = registerUserInformation.getIntlangkn();
		String aboutself = registerUserInformation.getAboutself();
		String specgrad = registerUserInformation.getSpecgrad();
		String gradfrom = registerUserInformation.getGradfrom();
		String gradyear = registerUserInformation.getGradyear();
		String cgpgrad = registerUserInformation.getCgpgrad();
		String specinter = registerUserInformation.getSpecinter();
		String interfrom = registerUserInformation.getInterfrom();
		String interyear = registerUserInformation.getInteryear();
		String cgpinter = registerUserInformation.getCgpinter();
		String specschool =registerUserInformation.getSpecschool();
		String schoolfrom = registerUserInformation.getSchoolfrom();
		String schoolyear = registerUserInformation.getSchoolyear();
		String cgpschool = registerUserInformation.getCgpschool();
		String certifications= registerUserInformation.getCertifications();
		String recentemp = registerUserInformation.getRecentemp();
		String lastdesig = registerUserInformation.getLastdesig();
		String lastdomain = registerUserInformation.getLastdomain();
		String lasttoolsused = registerUserInformation.getLasttoolsused();
		String lastresps = registerUserInformation.getLastresps();
		String currentctc = registerUserInformation.getCurrentctc();
		String expectedctc = registerUserInformation.getExpectedctc();
		String achievements =registerUserInformation.getAchievements();
		String expectedwork = registerUserInformation.getExpectedwork();
		int result=	session.getCurrentSession().createQuery("update RegisterUserInformation rui set lastname=:lastname , housenumber=:housenumber , street=:street , city=:city , country=:country , postcode=:postcode , nationality=:nationality , contactnumber=:contactnumber , highesteduqual=:highesteduqual , experience=:experience ,primaryskill=:primaryskill , interests=:interests,strengths=:strengths , weaknesses=:weaknesses , nativelanguage=:nativelanguage ,intlangkn=:intlangkn, aboutself=:aboutself ,specgrad=:specgrad , gradfrom=:gradfrom ,gradyear=:gradyear , cgpgrad=:cgpgrad , specinter=:specinter, interfrom=:interfrom , interyear=:interyear , cgpinter=:cgpinter , specschool=:specschool,schoolfrom=:schoolfrom , schoolyear=:schoolyear , cgpschool=:cgpschool , certifications=:certifications , recentemp=:recentemp , lastdesig=:lastdesig,lastdomain=:lastdomain , lasttoolsused=:lasttoolsused , lastresps=:lastresps , currentctc=:currentctc , expectedctc=:expectedctc , achievements=:achievements,expectedwork=:expectedwork where rui.email=:email").setParameter("lastname", lastName).
				
				
				
				
				
				setParameter("housenumber",housenumber).
				setParameter("street", street).
				setParameter("city",city).
				setParameter("country",country).
				setParameter("postcode", postcode).
				setParameter("nationality", nationality).
				setParameter("contactnumber", contactnumber).
				setParameter("highesteduqual",highesteduqual).
				setParameter("experience", experience).
				setParameter("primaryskill", primaryskill).
				setParameter("interests", interests).
				setParameter("strengths", strengths).
				setParameter("weaknesses", weaknesses).
				setParameter("nativelanguage", nativelanguage).
				setParameter("intlangkn", intlangkn).
				setParameter("aboutself", aboutself).
				setParameter("specgrad", specgrad).
				setParameter("gradfrom", gradfrom).
				setParameter("gradyear", gradyear).
				
				
				setParameter("cgpgrad",cgpgrad).
				setParameter("specinter", specinter).
				setParameter("interfrom",interfrom).
				setParameter("interyear",interyear).
				setParameter("cgpinter", cgpinter).
				setParameter("specschool", specschool).
				setParameter("schoolfrom", schoolfrom).
				setParameter("schoolyear",schoolyear).
				setParameter("cgpschool", cgpschool).
				setParameter("certifications", certifications).
				setParameter("recentemp", recentemp).
				setParameter("lastdesig", lastdesig).
				setParameter("lastdomain", lastdomain).
				setParameter("lasttoolsused", lasttoolsused).
				setParameter("lastresps", lastresps).
				setParameter("currentctc", currentctc).
				setParameter("expectedctc", expectedctc).
				setParameter("achievements", achievements).
				setParameter("expectedwork", expectedwork).
				
				
				setParameter("email", email).
				
				
				
				
				
				
				
				executeUpdate();
		System.out.println(result);
		//session.getCurrentSession().update(registerUserInformation);
	}

	@Override
	public RegisterUser getUserByEmail(String email) {
		
		return   (RegisterUser) session.getCurrentSession().createQuery("from RegisterUser ru where ru.email=:email").setParameter("email", email).uniqueResult();
	}

	@Override
	public RegisterUserDocuments getPhoto(String email, String description) {
		return   (RegisterUserDocuments) session.getCurrentSession().createQuery("from RegisterUserDocuments rud where rud.email=:email and rud.description=:description").setParameter("email",email).setParameter("description",description).uniqueResult();
	}
	
	
	
	
	


	
	
	
	
	

}
