package beans;

import java.util.Date;

public class JobTransaction implements java.io.Serializable{
 
	private static final long serialVersionUID = 1L;
	private Integer jobSeqNo;
	private String jobDescription;
	private String shop;
	private String section;
	private String subSection;
	private Float qty;
	private String unit;
	private Date startDate;
	private Date expectedCompletionDate;
	private Date completionDate;
	private String status;
	private String jobId;
	private String activityId;
	private String inspectionStatus;
	private String remarks;
	private Integer machineId;
	
	
	public JobTransaction()
	{
		
	}
    
	

	public JobTransaction(Integer jobSeqNo, String jobDescription, String shop, String section, String subSection,
			Float qty, String unit, Date startDate, Date expectedCompletionDate, Date completionDate, String status,
			String jobId, String activityId, String inspectionStatus, String remarks,Integer machineId) {
		super();
		this.jobSeqNo = jobSeqNo;
		this.jobDescription = jobDescription;
		this.shop = shop;
		this.section = section;
		this.subSection = subSection;
		this.qty = qty;
		this.unit = unit;
		this.startDate = startDate;
		this.expectedCompletionDate = expectedCompletionDate;
		this.completionDate = completionDate;
		this.status = status;
		this.jobId = jobId;
		this.activityId = activityId;
		this.inspectionStatus = inspectionStatus;
		this.remarks=remarks;
		this.machineId=machineId;
	}



	public String getJobId() {
		return jobId;
	}



	public void setJobId(String jobId) {
		this.jobId = jobId;
	}



	public String getActivityId() {
		return activityId;
	}



	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}



	public String getInspectionStatus() {
		return inspectionStatus;
	}



	public void setInspectionStatus(String inspectionStatus) {
		this.inspectionStatus = inspectionStatus;
	}



	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getSubSection() {
		return subSection;
	}

	public void setSubSection(String subSection) {
		this.subSection = subSection;
	}



	public Float getQty() {
		return qty;
	}



	public void setQty(Float qty) {
		this.qty = qty;
	}



	public String getUnit() {
		return unit;
	}



	public void setUnit(String unit) {
		this.unit = unit;
	}



	public Date getStartDate() {
		return startDate;
	}



	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}



	public Date getExpectedCompletionDate() {
		return expectedCompletionDate;
	}



	public void setExpectedCompletionDate(Date expectedCompletionDate) {
		this.expectedCompletionDate = expectedCompletionDate;
	}



	public Date getCompletionDate() {
		return completionDate;
	}



	public void setCompletionDate(Date completionDate) {
		this.completionDate = completionDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	


	public Integer getJobSeqNo() {
		return jobSeqNo;
	}



	public void setJobSeqNo(Integer jobSeqNo) {
		this.jobSeqNo = jobSeqNo;
	}



	public String getRemarks() {
		return remarks;
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}



	public Integer getMachineId() {
		return machineId;
	}



	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}
	
}
