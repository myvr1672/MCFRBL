package model;

import java.util.Date;


public class User implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	String userid;
	String pwd;
	String userType;
	String userName;
	String email;
	String telephone;
	String designation;
	String dept;
	Date createdate;
	String roles;
	String coachtypes;
	
	
	public User(){
		//default Constructor
	}
	
	public User(String userid,String pwd,String userType,String userName,String email, String telephone,String designation,String dept,Date createdate, String role, String coachtypes){
		this.userid = userid;
		this.pwd=pwd;
		this.userType=userType;
		this.userName = userName;
		this.email=email;
		this.telephone=telephone;
		this.designation = designation;
		this.dept = dept;	
		this.createdate = createdate;
		this.roles=role;
		this.coachtypes=coachtypes;
		}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
		
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String role) {
		this.roles = role;
	}

	public String getCoachtypes() {
		return coachtypes;
	}

	public void setCoachtypes(String coachtypes) {
		this.coachtypes = coachtypes;
	}
	
	
	
	
}