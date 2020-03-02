package beans;

import java.util.Date;

public class ActivityTransaction implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String activityId;
	private String substageId;
	private Integer assetId;
	private String reamrks;
	private Date activityStartDate;
	private Date activityCompletionDate;
	private double timeTaken;
	private String assignedPerson;
	private String delayReason;
	private Date systemEntryTime;
	private String entryBy;
	
	public ActivityTransaction()
	{
		
	}

	public ActivityTransaction(String activityId,String substageId, Integer assetId, String reamrks,Date activityStartDate, Date activityCompletionDate,double timeTaken,String assignedPerson,String delayReason,Date systemEntryTime,String entryBy)
	{
		this.activityId=activityId;
		this.substageId=substageId;
		this.assetId=assetId;
		this.reamrks=reamrks;
		this.activityStartDate=activityStartDate;
		this.activityCompletionDate=activityCompletionDate;
		this.timeTaken=timeTaken;
		this.assignedPerson=assignedPerson;
		this.delayReason=delayReason;
		this.systemEntryTime=systemEntryTime;
		this.entryBy=entryBy;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getSubstageId() {
		return substageId;
	}

	public void setSubstageId(String substageId) {
		this.substageId = substageId;
	}

	

	public Integer getAssetId() {
		return assetId;
	}

	public void setAssetId(Integer assetId) {
		this.assetId = assetId;
	}

	public String getReamrks() {
		return reamrks;
	}

	public void setReamrks(String reamrks) {
		this.reamrks = reamrks;
	}

	public Date getActivityStartDate() {
		return activityStartDate;
	}

	public void setActivityStartDate(Date activityStartDate) {
		this.activityStartDate = activityStartDate;
	}

	public Date getActivityCompletionDate() {
		return activityCompletionDate;
	}

	public void setActivityCompletionDate(Date activityCompletionDate) {
		this.activityCompletionDate = activityCompletionDate;
	}

	public double getTimeTaken() {
		return timeTaken;
	}

	public void setTimeTaken(double timeTaken) {
		this.timeTaken = timeTaken;
	}

	public String getAssignedPerson() {
		return assignedPerson;
	}

	public void setAssignedPerson(String assignedPerson) {
		this.assignedPerson = assignedPerson;
	}

	public String getDelayReason() {
		return delayReason;
	}

	public void setDelayReason(String delayReason) {
		this.delayReason = delayReason;
	}

	

	public Date getSystemEntryTime() {
		return systemEntryTime;
	}

	public void setSystemEntryTime(Date systemEntryTime) {
		this.systemEntryTime = systemEntryTime;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}
	
	
}
