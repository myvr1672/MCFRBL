package beans;

import java.sql.Timestamp;

public class SafetyTransaction implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer safetyInstructionId;
	private Integer machineId;
	private String safetyFlag;
	private Timestamp entryDate;
	private String entryBy;
	public SafetyTransaction()
	{
		
	}
	

	public SafetyTransaction(Integer safetyInstructionId, Integer machineId, String safetyFlag, Timestamp entryDate,
			String entryBy) {
		super();
		this.safetyInstructionId = safetyInstructionId;
		this.machineId = machineId;
		this.safetyFlag = safetyFlag;
		this.entryDate = entryDate;
		this.entryBy = entryBy;
		
	}


	public Integer getSafetyInstructionId() {
		return safetyInstructionId;
	}


	public void setSafetyInstructionId(Integer safetyInstructionId) {
		this.safetyInstructionId = safetyInstructionId;
	}


	public Integer getMachineId() {
		return machineId;
	}


	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}


	public String getSafetyFlag() {
		return safetyFlag;
	}


	public void setSafetyFlag(String safetyFlag) {
		this.safetyFlag = safetyFlag;
	}


	public Timestamp getEntryDate() {
		return entryDate;
	}


	public void setEntryDate(Timestamp entryDate) {
		this.entryDate = entryDate;
	}


	public String getEntryBy() {
		return entryBy;
	}


	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	
	

}
