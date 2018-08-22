package com.db.jobportal.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="REGISTERUSERDOCUMENTS")
public class RegisterUserDocuments implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3362887691253963729L;

	@Id
	@Column
	private Integer id;
	
	@Column
	private String email;
	@Column
	private String filename;
	@Column
	private String description;
	@Column
	private String type;
	@Column
	private byte[] filecont;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public byte[] getFilecont() {
		return filecont;
	}

	public void setFilecont(byte[] filecont) {
		this.filecont = filecont;
	}
	
	

}
