package beans;


import java.sql.Timestamp;
import java.util.Date;

public class MachineAction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer machineId;
	private Integer breakdownId;
	private String actionPerformed;
	private String remarks;
	private String status;
	private Timestamp createdDate;
	private String entryBy;
	private Date rectificationDate;
	
	public MachineAction(){
		//default Constructor
	}
	
	public MachineAction(Integer machineId,Integer breakdownId,String actionPerformed,
			String remarks,String status,Timestamp createdDate,String entryBy,
			Date rectificationDate){
		this.machineId=machineId;
		this.breakdownId= breakdownId;
		this.actionPerformed=actionPerformed;
		this.remarks=remarks;
		this.status=status;
			
		this.createdDate= createdDate;
		this.entryBy=entryBy;
		this.rectificationDate=rectificationDate;
		
		
		
		
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public Integer getBreakdownId() {
		return breakdownId;
	}

	public void setBreakdownId(Integer breakdownId) {
		this.breakdownId = breakdownId;
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

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Date getRectificationDate() {
		return rectificationDate;
	}

	public void setRectificationDate(Date rectificationDate) {
		this.rectificationDate = rectificationDate;
	}

	

	
	
}
