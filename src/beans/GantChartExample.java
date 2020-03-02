package beans;

import java.util.Date;

public class GantChartExample implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private String taskId;
	private String taskName;
	private Date startDate;
	private Date endDate;
	private Integer progressStatus;
	private String dependsOn;
	
	public GantChartExample()
	{
		
	}

	public GantChartExample(String taskId, String taskName, Date startDate, Date endDate, Integer progressStatus,
			String dependsOn) {
		super();
		this.taskId = taskId;
		this.taskName = taskName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.progressStatus = progressStatus;
		this.dependsOn = dependsOn;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getProgressStatus() {
		return progressStatus;
	}

	public void setProgressStatus(Integer progressStatus) {
		this.progressStatus = progressStatus;
	}

	public String getDependsOn() {
		return dependsOn;
	}

	public void setDependsOn(String dependsOn) {
		this.dependsOn = dependsOn;
	}

}
