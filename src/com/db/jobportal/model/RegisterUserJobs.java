package com.db.jobportal.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="REGISTERUSERJOBS")
public class RegisterUserJobs implements Serializable{

	
	private static final long serialVersionUID = 8948782567409726455L;
	
	@Column
	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	@Column
	private String title;
	@Column
	private String jobdescription;
	@Column
	private String industry;
	@Column
	private String functionalarea;
	
	@Column
	private String experiencerequired;
	@Column
	private String qualificationrequired;
	@Column
	private String joblocation;
	@Column
	private String organization;
	@Column
	private String keyskillsrequired;
	@Column
	private String postedby;
	@Column
	
	private String postedon;
	@Column
	private String salary;
	@Column
	private Integer vacancies;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getJobdescription() {
		return jobdescription;
	}

	public void setJobdescription(String jobdescription) {
		this.jobdescription = jobdescription;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getFunctionalarea() {
		return functionalarea;
	}

	public void setFunctionalarea(String functionalarea) {
		this.functionalarea = functionalarea;
	}

	public String getExperiencerequired() {
		return experiencerequired;
	}

	public void setExperiencerequired(String experiencerequired) {
		this.experiencerequired = experiencerequired;
	}

	public String getQualificationrequired() {
		return qualificationrequired;
	}

	public void setQualificationrequired(String qualificationrequired) {
		this.qualificationrequired = qualificationrequired;
	}

	public String getJoblocation() {
		return joblocation;
	}

	public void setJoblocation(String joblocation) {
		this.joblocation = joblocation;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public String getKeyskillsrequired() {
		return keyskillsrequired;
	}

	public void setKeyskillsrequired(String keyskillsrequired) {
		this.keyskillsrequired = keyskillsrequired;
	}

	public String getPostedby() {
		return postedby;
	}

	public void setPostedby(String postedby) {
		this.postedby = postedby;
	}

	

	

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public Integer getVacancies() {
		return vacancies;
	}

	public void setVacancies(Integer vacancies) {
		this.vacancies = vacancies;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public RegisterUserJobs(Integer id, String title, String jobdescription,
			String industry, String functionalarea, String experiencerequired,
			String qualificationrequired, String joblocation,
			String organization, String keyskillsrequired, String postedby,
			String postedon, String salary, Integer vacancies) {
		super();
		this.id = id;
		this.title = title;
		this.jobdescription = jobdescription;
		this.industry = industry;
		this.functionalarea = functionalarea;
		this.experiencerequired = experiencerequired;
		this.qualificationrequired = qualificationrequired;
		this.joblocation = joblocation;
		this.organization = organization;
		this.keyskillsrequired = keyskillsrequired;
		this.postedby = postedby;
		this.postedon = postedon;
		this.salary = salary;
		this.vacancies = vacancies;
	}

	public String getPostedon() {
		return postedon;
	}

	public void setPostedon(String postedon) {
		this.postedon = postedon;
	}

	public RegisterUserJobs() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
