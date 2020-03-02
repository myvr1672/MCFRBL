package beans;

import java.sql.Timestamp;
import java.util.Date;

@SuppressWarnings("serial")
public class MachineSpare implements java.io.Serializable{

	
	
	private Integer spareId;
	private String spareDescription;
	private Integer machineId;
	private String entryBy;
	private Timestamp createdDate;
	
	public MachineSpare()
	{
		
	}

	public MachineSpare(Integer spareId, String spareDescription, Integer machineId, 
			String entryBy, Timestamp createdDate) {
		super();
		
		this.spareId = spareId;
		this.spareDescription = spareDescription;
		this.machineId = machineId;
		this.entryBy = entryBy;
		this.createdDate = createdDate;
		
	
	}

	
	public String getSpareDescription() {
		return spareDescription;
	}

	public void setSpareDescription(String spareDescription) {
		this.spareDescription = spareDescription;
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
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

	public Integer getSpareId() {
		return spareId;
	}

	public void setSpareId(Integer spareId) {
		this.spareId = spareId;
	}

	
	
}