package beans;

import java.sql.Timestamp;
import java.util.Date;

public class MachineFailure implements java.io.Serializable{
	
	private Integer breakdownId;
	private Integer machineId;
	private Date breakdownDate;
	private String failureDescription;
	private String remarks;
	private Date machineDispatchDate;
	private String entryBy;
	private Timestamp createdDate;
	private String failureCode;

	public MachineFailure()
	{
		
	}

	public MachineFailure(Integer breakdownId, Integer machineId, Date breakdownDate, String failureDescription,
			String remarks, Date machineDispatchDate, String entryBy, Timestamp createdDate, String failureCode) {
		super();
		this.breakdownId = breakdownId;
		this.machineId = machineId;
		this.breakdownDate = breakdownDate;
		this.failureDescription = failureDescription;
		this.remarks = remarks;
		this.machineDispatchDate = machineDispatchDate;
		this.entryBy = entryBy;
		this.createdDate = createdDate;
		this.failureCode = failureCode;
	}

	public Integer getBreakdownId() {
		return breakdownId;
	}

	public void setBreakdownId(Integer breakdownId) {
		this.breakdownId = breakdownId;
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

	public String getFailureDescription() {
		return failureDescription;
	}

	public void setFailureDescription(String failureDescription) {
		this.failureDescription = failureDescription;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getMachineDispatchDate() {
		return machineDispatchDate;
	}

	public void setMachineDispatchDate(Date machineDispatchDate) {
		this.machineDispatchDate = machineDispatchDate;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public String getFailureCode() {
		return failureCode;
	}

	public void setFailureCode(String failureCode) {
		this.failureCode = failureCode;
	}
	
	
	
}
