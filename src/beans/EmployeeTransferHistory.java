package beans;

import java.util.Date;

public class EmployeeTransferHistory implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
private String empNo;
private String sectionId;
private Date validFrom;
private Date validTo;


public EmployeeTransferHistory()
{
	
}


public EmployeeTransferHistory(String empNo, String sectionId, Date validFrom, Date validTo) {
	super();
	this.empNo = empNo;
	this.sectionId = sectionId;
	this.validFrom = validFrom;
	this.validTo = validTo;
}


public String getEmpNo() {
	return empNo;
}


public void setEmpNo(String empNo) {
	this.empNo = empNo;
}


public String getSectionId() {
	return sectionId;
}


public void setSectionId(String sectionId) {
	this.sectionId = sectionId;
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




}
