package com.db.jobportal.model;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="REGISTERROLES")
public class RegisterRoles {
	@Id
	@Column
	private String roleId;
	
	@Column
	private String roleName;
	
	@Column
	private String userType;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public RegisterRoles(String roleId, String roleName, String userType) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.userType = userType;
	}

	public RegisterRoles() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
