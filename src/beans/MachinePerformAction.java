package beans;

import java.util.Date;

public class MachinePerformAction implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer machineId;
	private Integer breakdownId;
	private String actionPerformed;
	private String remarks;
	private String status;
	private String entryBy;
	private Date createdDate; 
    private Date rectificationDate;
    
    public MachinePerformAction()
    {
    	
    }

	public MachinePerformAction( Integer machineId, Integer breakdownId, String actionPerformed, String remarks, String status, String entryBy,
			Date createdDate, Date rectificationDate) {
		super();
	
		this.machineId = machineId;
		this.breakdownId=breakdownId;
		this.actionPerformed = actionPerformed;
		this.remarks = remarks;
		this.status=status;
		this.entryBy = entryBy;
		this.createdDate = createdDate;
		this.rectificationDate = rectificationDate;
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public String getActionPerformed() {
		return actionPerformed;
	}

	public void setActionPerformed(String actionPerformed) {
		this.actionPerformed = actionPerformed;
	}

	public String getRemarks() {
		return remarks;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getRectificationDate() {
		return rectificationDate;
	}

	public void setRectificationDate(Date rectificationDate) {
		this.rectificationDate = rectificationDate;
	}

	public Integer getBreakdownId() {
		return breakdownId;
	}

	public void setBreakdownId(Integer breakdownId) {
		this.breakdownId = breakdownId;
	}
    
    
}
