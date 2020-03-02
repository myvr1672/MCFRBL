package beans;

import java.util.Date;

public class ShiftRoasterTransaction implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private String empId;
	private String shiftId;
	private Date validityFrom;
	private String entryDate;
	private String entryBy;
	
	public ShiftRoasterTransaction()
	{
		
	}

	public ShiftRoasterTransaction(String empId, String shiftId, Date validityFrom, String entryDate, String entryBy) {
		super();
		this.empId = empId;
		this.shiftId = shiftId;
		this.validityFrom = validityFrom;
		this.entryDate = entryDate;
		this.entryBy = entryBy;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getShiftId() {
		return shiftId;
	}

	public void setShiftId(String shiftId) {
		this.shiftId = shiftId;
	}

	public Date getValidityFrom() {
		return validityFrom;
	}

	public void setValidityFrom(Date validityFrom) {
		this.validityFrom = validityFrom;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}
	

}
