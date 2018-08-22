package com.db.jobportal.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="REGISTERUSERINFORMATION")
public class RegisterUserInformation implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6533162835386784588L;


	/**
	 * 
	 */
	


	@Id
	@Column
	private Integer id;
	
	
	@Column
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Column
	private String title;
	@Column
	private String firstname;
	@Column
	private String lastname;
	@Column
	private String housenumber;
	@Column
	private String street;
	@Column
	private String city;
	@Column
	private String country;
	@Column
	private String postcode;
	@Column
	private String nationality;
	@Column
	private String contactnumber;
	@Column
	private String highesteduqual;
	@Column
	private String experience;
	@Column
	private String primaryskill;
	@Column
	private String interests;
	@Column
	private String strengths;
	@Column
	private String weaknesses;
	@Column
	private String nativelanguage;
	@Column
	private String intlangkn;
	@Column
	private String aboutself;
	
	@Column
	private String specgrad;
	
	@Column
	private String gradfrom;
	
	@Column
	private String gradyear;
	
	@Column
	private String cgpgrad;
	
	@Column
	private String specinter;
	
	@Column
	private String interfrom;
	
	@Column
	private String interyear;
	
	@Column
	private String cgpinter;
	
	
	@Column
	private String specschool;
	
	@Column
	private String schoolfrom;
	
	@Column
	private String schoolyear;
	
	@Column
	private String cgpschool;
	
	@Column
	private String certifications;
	
	@Column
	private String recentemp;
	
	@Column
	private String lastdesig;
	
	@Column
	private String lastdomain;
	
	@Column
	private String lasttoolsused;
	
	
	@Column
	private String lastresps;
	
	@Column
	private String currentctc;
	
	@Column
	private String expectedctc;
	
	
	@Column
	private String achievements;
	
	@Column
	private String expectedwork;
	
	
	
	
	public String getSpecgrad() {
		return specgrad;
	}
	public void setSpecgrad(String specgrad) {
		this.specgrad = specgrad;
	}
	public String getGradfrom() {
		return gradfrom;
	}
	public void setGradfrom(String gradfrom) {
		this.gradfrom = gradfrom;
	}
	public String getGradyear() {
		return gradyear;
	}
	public void setGradyear(String gradyear) {
		this.gradyear = gradyear;
	}
	public String getCgpgrad() {
		return cgpgrad;
	}
	public void setCgpgrad(String cgpgrad) {
		this.cgpgrad = cgpgrad;
	}
	public String getSpecinter() {
		return specinter;
	}
	public void setSpecinter(String specinter) {
		this.specinter = specinter;
	}
	public String getInterfrom() {
		return interfrom;
	}
	public void setInterfrom(String interfrom) {
		this.interfrom = interfrom;
	}
	public String getInteryear() {
		return interyear;
	}
	public void setInteryear(String interyear) {
		this.interyear = interyear;
	}
	public String getCgpinter() {
		return cgpinter;
	}
	public void setCgpinter(String cgpinter) {
		this.cgpinter = cgpinter;
	}
	public String getSpecschool() {
		return specschool;
	}
	public void setSpecschool(String specschool) {
		this.specschool = specschool;
	}
	public String getSchoolfrom() {
		return schoolfrom;
	}
	public void setSchoolfrom(String schoolfrom) {
		this.schoolfrom = schoolfrom;
	}
	public String getSchoolyear() {
		return schoolyear;
	}
	public void setSchoolyear(String schoolyear) {
		this.schoolyear = schoolyear;
	}
	public String getCgpschool() {
		return cgpschool;
	}
	public void setCgpschool(String cgpschool) {
		this.cgpschool = cgpschool;
	}
	public String getCertifications() {
		return certifications;
	}
	public void setCertifications(String certifications) {
		this.certifications = certifications;
	}
	public String getRecentemp() {
		return recentemp;
	}
	public void setRecentemp(String recentemp) {
		this.recentemp = recentemp;
	}
	public String getLastdesig() {
		return lastdesig;
	}
	public void setLastdesig(String lastdesig) {
		this.lastdesig = lastdesig;
	}
	public String getLastdomain() {
		return lastdomain;
	}
	public void setLastdomain(String lastdomain) {
		this.lastdomain = lastdomain;
	}
	
	public String getLasttoolsused() {
		return lasttoolsused;
	}
	public void setLasttoolsused(String lasttoolsused) {
		this.lasttoolsused = lasttoolsused;
	}
	public String getLastresps() {
		return lastresps;
	}
	public void setLastresps(String lastresps) {
		this.lastresps = lastresps;
	}
	public String getCurrentctc() {
		return currentctc;
	}
	public void setCurrentctc(String currentctc) {
		this.currentctc = currentctc;
	}
	public String getExpectedctc() {
		return expectedctc;
	}
	public void setExpectedctc(String expectedctc) {
		this.expectedctc = expectedctc;
	}
	public String getAchievements() {
		return achievements;
	}
	public void setAchievements(String achievements) {
		this.achievements = achievements;
	}
	public String getExpectedwork() {
		return expectedwork;
	}
	public void setExpectedwork(String expectedwork) {
		this.expectedwork = expectedwork;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getIntlangkn() {
		return intlangkn;
	}
	public void setIntlangkn(String intlangkn) {
		this.intlangkn = intlangkn;
	}

	
	
	public String getHighesteduqual() {
		return highesteduqual;
	}
	public void setHighesteduqual(String highesteduqual) {
		this.highesteduqual = highesteduqual;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContactnumber() {
		return contactnumber;
	}
	public void setContactnumber(String contactnumber) {
		this.contactnumber = contactnumber;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getHousenumber() {
		return housenumber;
	}
	public void setHousenumber(String housenumber) {
		this.housenumber = housenumber;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	
	
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getPrimaryskill() {
		return primaryskill;
	}
	public void setPrimaryskill(String primaryskill) {
		this.primaryskill = primaryskill;
	}
	public String getInterests() {
		return interests;
	}
	public void setInterests(String interests) {
		this.interests = interests;
	}
	public String getStrengths() {
		return strengths;
	}
	public void setStrengths(String strengths) {
		this.strengths = strengths;
	}
	public String getWeaknesses() {
		return weaknesses;
	}
	public void setWeaknesses(String weaknesses) {
		this.weaknesses = weaknesses;
	}
	public String getNativelanguage() {
		return nativelanguage;
	}
	public void setNativelanguage(String nativelanguage) {
		this.nativelanguage = nativelanguage;
	}
	
	public String getAboutself() {
		return aboutself;
	}
	public void setAboutself(String aboutself) {
		this.aboutself = aboutself;
	}
	public RegisterUserInformation(String title, String firstname,
			String lastname, String housenumber, String street, String city,
			String country, String postcode, String nationality,
			String contactnumber, String highesteducationalqualification,
			String experience, String primaryskill, String interests,
			String strengths, String weaknesses, String nativelanguage,
			String internationallanguagesknown, String aboutself) {
		super();
		this.title = title;
		this.firstname = firstname;
		this.lastname = lastname;
		this.housenumber = housenumber;
		this.street = street;
		this.city = city;
		this.country = country;
		this.postcode = postcode;
		this.nationality = nationality;
		this.contactnumber = contactnumber;
		this.highesteduqual = highesteducationalqualification;
		this.experience = experience;
		this.primaryskill = primaryskill;
		this.interests = interests;
		this.strengths = strengths;
		this.weaknesses = weaknesses;
		this.nativelanguage = nativelanguage;
		this.intlangkn = intlangkn;
		this.aboutself = aboutself;
	}
	public RegisterUserInformation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
