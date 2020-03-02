package beans;

public class ActivityMaster implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	private String activityId;
	private String substageId;
	private String activityDescription;
	private String applicableFor;
	private float standardCompletionTime;
	
	
	public ActivityMaster()
	{
		
	}
	public ActivityMaster(String activityId,String substageId,String activityDescription,String applicableFor, float standardCompletionTime )
	{
		this.activityId=activityId;
		this.substageId=substageId;
		this.activityDescription=activityDescription;
		this.applicableFor=applicableFor;
		this.standardCompletionTime=standardCompletionTime;
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
	public String getActivityDescription() {
		return activityDescription;
	}
	public void setActivityDescription(String activityDescription) {
		this.activityDescription = activityDescription;
	}
	public String getApplicableFor() {
		return applicableFor;
	}
	public void setApplicableFor(String applicableFor) {
		this.applicableFor = applicableFor;
	}
	public float getStandardCompletionTime() {
		return standardCompletionTime;
	}
	public void setStandardCompletionTime(float standardCompletionTime) {
		this.standardCompletionTime = standardCompletionTime;
	}

	
}
