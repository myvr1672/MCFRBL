package beans;

public class JobActivityMaster implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String jobActivityId;
	private String subsectionId;
	private String jobActivityDescription;
	
	public JobActivityMaster()
	{
		
	}

	public JobActivityMaster(String jobActivityId, String subsectionId, String jobActivityDescription) {
		super();
		this.jobActivityId = jobActivityId;
		this.subsectionId = subsectionId;
		this.jobActivityDescription = jobActivityDescription;
	}

	public String getJobActivityId() {
		return jobActivityId;
	}

	public void setJobActivityId(String jobActivityId) {
		this.jobActivityId = jobActivityId;
	}

	public String getSubsectionId() {
		return subsectionId;
	}

	public void setSubsectionId(String subsectionId) {
		this.subsectionId = subsectionId;
	}

	public String getJobActivityDescription() {
		return jobActivityDescription;
	}

	public void setJobActivityDescription(String jobActivityDescription) {
		this.jobActivityDescription = jobActivityDescription;
	}

	
}
