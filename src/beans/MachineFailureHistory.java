package beans;

import java.sql.Timestamp;
import java.util.Date;

public class MachineFailureHistory implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer machineId;
	private Date breakdownDate;
	private Date rectificationDate;
	private String entryBy;
	private Timestamp entryDate;
	
	public MachineFailureHistory()
	{
		
	}

	public MachineFailureHistory(Integer machineId,Date breakdownDate,Date rectificationDate,String entryBy,Timestamp entryDate) {
		super();
		this.machineId=machineId;
		this.breakdownDate=breakdownDate;
		this.rectificationDate=rectificationDate;
		this.entryBy=entryBy;
		this.entryDate=entryDate;
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public Date getBreakdownDate() {
		return breakdownDate;
	}

	public void setBreakdownDate(Date breakdownDate) {
		this.breakdownDate = breakdownDate;
	}

	public Date getRectificationDate() {
		return rectificationDate;
	}

	public void setRectificationDate(Date rectificationDate) {
		this.rectificationDate = rectificationDate;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Timestamp getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Timestamp entryDate) {
		this.entryDate = entryDate;
	}

	
	
	
}