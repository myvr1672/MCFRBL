package beans;

import java.sql.Timestamp;
import java.util.Date;



public class MachineBreakdown implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
    private Integer breakdownId;
    private Integer machineId;
    private Date breakdownDate;
    private String failureCode;
    private String breakdownDetails;
    private String remarks;
    private Date dispatchDateForRepair;
    private String entryBy;
    private Timestamp createdDate;
    private Date completionDate;
    
    public MachineBreakdown()
    {
    	
    }

	public MachineBreakdown(Integer breakdownId, Integer machineId, Date breakdownDate,String failureCode, String breakdownDetails,
			String remarks, Date dispatchDateForRepair,String entryBy,Timestamp createdDate, Date completionDate) {
		super();
		this.breakdownId = breakdownId;
		this.machineId = machineId;
		this.breakdownDate = breakdownDate;
		this.failureCode=failureCode;
		this.breakdownDetails = breakdownDetails;
		this.remarks = remarks;
		this.dispatchDateForRepair = dispatchDateForRepair;
		this.entryBy=entryBy;
		this.createdDate=createdDate;
		this.completionDate=completionDate;
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

	public String getFailureCode() {
		return failureCode;
	}

	public void setFailureCode(String failureCode) {
		this.failureCode = failureCode;
	}

	public String getBreakdownDetails() {
		return breakdownDetails;
	}

	public void setBreakdownDetails(String breakdownDetails) {
		this.breakdownDetails = breakdownDetails;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getDispatchDateForRepair() {
		return dispatchDateForRepair;
	}

	public void setDispatchDateForRepair(Date dispatchDateForRepair) {
		this.dispatchDateForRepair = dispatchDateForRepair;
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

	public Date getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}
	
	
    
}
