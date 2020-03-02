package beans;

import java.sql.Timestamp;

public class MachineActivityScheduleLinking implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer machineScheduleLinkId;
	private Integer machineId;
	private String scheduleType;
    private String activityId;
    private Timestamp entryDate;
    private String entryBy;
    
    
    public MachineActivityScheduleLinking()
    {
    	
    }


	public MachineActivityScheduleLinking(Integer machineScheduleLinkId, Integer machineId, String scheduleType,
			String activityId, Timestamp entryDate, String entryBy) {
		super();
		this.machineScheduleLinkId = machineScheduleLinkId;
		this.machineId = machineId;
		this.scheduleType = scheduleType;
		this.activityId = activityId;
		this.entryDate = entryDate;
		this.entryBy = entryBy;
	}


	public Integer getMachineScheduleLinkId() {
		return machineScheduleLinkId;
	}


	public void setMachineScheduleLinkId(Integer machineScheduleLinkId) {
		this.machineScheduleLinkId = machineScheduleLinkId;
	}


	public Integer getMachineId() {
		return machineId;
	}


	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}


	public String getScheduleType() {
		return scheduleType;
	}


	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}


	public String getActivityId() {
		return activityId;
	}


	public void setActivityId(String activityId) {
		this.activityId = activityId;
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
