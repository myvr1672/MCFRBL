package beans;

import java.sql.Timestamp;

public class MachineScheduleActivity implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
 private String activityNo;
 private String activityDescription;
 private Timestamp entryDate;
private String entryBy;
 
	public MachineScheduleActivity(){
		//default Constructor
	}
	
	public MachineScheduleActivity(String activityNo,String activityDescription,Timestamp entryDate,String entryBy){
		
		this.activityNo = activityNo;
		this.activityDescription=activityDescription;
		this.entryBy=entryBy;
		this.entryDate=entryDate;
		
	}

	public String getActivityNo() {
		return activityNo;
	}

	public void setActivityNo(String activityNo) {
		this.activityNo = activityNo;
	}

	public String getActivityDescription() {
		return activityDescription;
	}

	public void setActivityDescription(String activityDescription) {
		this.activityDescription = activityDescription;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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
	

	

	

	

}