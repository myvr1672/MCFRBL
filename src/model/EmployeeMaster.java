package model;

import java.util.Date;

public class EmployeeMaster implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
	private String emp_no;
	private String emp_name;
	private String shop;
	private String section;
	private String subSection;
	private Date validFrom;
	private Date validTo;
	private String status;
	private String designation;
	
	public EmployeeMaster(){
		//default Constructor
	}

	public EmployeeMaster(String emp_no, String emp_name, String shop, String section, String subSection,
			Date validFrom, Date validTo, String status, String designation) {
		super();
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.shop = shop;
		this.section = section;
		this.subSection = subSection;
		this.validFrom = validFrom;
		this.validTo = validTo;
		this.status=status;
		this.designation=designation;
	}

	public String getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getSubSection() {
		return subSection;
	}

	public void setSubSection(String subSection) {
		this.subSection = subSection;
	}

	public Date getValidFrom() {
		return validFrom;
	}

	public void setValidFrom(Date validFrom) {
		this.validFrom = validFrom;
	}

	public Date getValidTo() {
		return validTo;
	}

	public void setValidTo(Date validTo) {
		this.validTo = validTo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	
	

	
}