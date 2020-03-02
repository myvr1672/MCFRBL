package beans;

import java.util.Date;

public class ShiftRoasterHistory implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String empId;
	private String shiftId;
	private Date validityFrom;
	private Date validityTo;
	
	public ShiftRoasterHistory()
	{
		
	}

	public ShiftRoasterHistory(String empId, String shiftId, Date validityFrom, Date validityTo) {
		super();
		this.empId = empId;
		this.shiftId = shiftId;
		this.validityFrom = validityFrom;
		this.validityTo = validityTo;
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

	public Date getValidityTo() {
		return validityTo;
	}

	public void setValidityTo(Date validityTo) {
		this.validityTo = validityTo;
	}
	
}
