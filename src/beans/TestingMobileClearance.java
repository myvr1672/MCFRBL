package beans;

import java.util.Date;

public class TestingMobileClearance implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer furnishingAssetId;
	private String substageId;
	private String substageDescription;
	
	private String testingStatus;
	private String remark;
	private String notificationStage;
	private Date testingStartDate;
	private Date testingEndDate;
	private Date testingFailedDate;
	
	
	public TestingMobileClearance()
	{
		
	}

	
	public TestingMobileClearance(Integer furnishingAssetId, String substageId, String substageDescription,
			 String testingStatus, String remark, String notificationStage,
			Date testingStartDate, Date testingEndDate, Date testingFailedDate) {
		super();
		this.furnishingAssetId = furnishingAssetId;
		this.substageId = substageId;
		this.substageDescription = substageDescription;
		
		this.testingStatus = testingStatus;
		this.remark = remark;
		this.notificationStage = notificationStage;
		this.testingStartDate = testingStartDate;
		this.testingEndDate = testingEndDate;
		this.testingFailedDate = testingFailedDate;
	}


	
	

	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}


	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}


	public String getNotificationStage() {
		return notificationStage;
	}


	public void setNotificationStage(String notificationStage) {
		this.notificationStage = notificationStage;
	}


	public Date getTestingStartDate() {
		return testingStartDate;
	}


	public void setTestingStartDate(Date testingStartDate) {
		this.testingStartDate = testingStartDate;
	}


	public Date getTestingEndDate() {
		return testingEndDate;
	}


	public void setTestingEndDate(Date testingEndDate) {
		this.testingEndDate = testingEndDate;
	}


	public Date getTestingFailedDate() {
		return testingFailedDate;
	}


	public void setTestingFailedDate(Date testingFailedDate) {
		this.testingFailedDate = testingFailedDate;
	}


	public String getSubstageId() {
		return substageId;
	}


	public void setSubstageId(String substageId) {
		this.substageId = substageId;
	}

	public String getSubstageDescription() {
		return substageDescription;
	}

	public void setSubstageDescription(String substageDescription) {
		this.substageDescription = substageDescription;
	}

	public String getTestingStatus() {
		return testingStatus;
	}

	public void setTestingStatus(String testingStatus) {
		this.testingStatus = testingStatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	

}
