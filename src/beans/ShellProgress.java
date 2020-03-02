package beans;

import java.util.Date;

public class ShellProgress implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer assetID;
	private String substageId;
	private String previousStageId;
	private String wheelNumber;
	private String shellNumber;
	private String bogieNumber;
	private String coachNumber;
	private Date entryDate;
	private Date receiptDate;
	private String shellType;
	private Date expectedExitDate;
	private String remarks;
	private Date exitDate;
	private String entryBy;
	private String systemEntryTime;
	private String exitRemark;
	private Integer mergeFunishFlag;
	
	
	
	public ShellProgress() {
	}


	public ShellProgress(Integer assetId, String shellNumber, String substageId, Date entryDate,Date receiptDate, String shellType, Date expectedExitDate,
			String remarks, Date exitDate, String entryBy, String systemEntryTime, String exitRemark, String previousStageId, String wheelNumber,String bogieNumber,String coachNumber,
			Integer mergeFunishFlag) {
		super();
		this.assetID=assetId;
		this.substageId = substageId;
		this.shellNumber = shellNumber;
		this.previousStageId=previousStageId;
		
		this.wheelNumber=wheelNumber;
		this.bogieNumber=bogieNumber;
		this.coachNumber=coachNumber;
		this.entryDate = entryDate;
		this.receiptDate=receiptDate;
		this.shellType = shellType;
		this.expectedExitDate = expectedExitDate;
		this.remarks = remarks;
		this.exitDate = exitDate;
		this.entryBy = entryBy;
		this.systemEntryTime = systemEntryTime;
		this.exitRemark=exitRemark;
		this.mergeFunishFlag=mergeFunishFlag;
	}


	public String getShellNumber() {
		return shellNumber;
	}


	public void setShellNumber(String shellNumber) {
		this.shellNumber = shellNumber;
	}


	public String getSubstageId() {
		return substageId;
	}


	public void setSubstageId(String substageId) {
		this.substageId = substageId;
	}


	public Date getEntryDate() {
		return entryDate;
	}


	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}


	public String getShellType() {
		return shellType;
	}


	public void setShellType(String shellType) {
		this.shellType = shellType;
	}


	public Date getExpectedExitDate() {
		return expectedExitDate;
	}


	public void setExpectedExitDate(Date expectedExitDate) {
		this.expectedExitDate = expectedExitDate;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public Date getExitDate() {
		return exitDate;
	}


	public void setExitDate(Date exitDate) {
		this.exitDate = exitDate;
	}


	public String getEntryBy() {
		return entryBy;
	}


	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}


	public String getSystemEntryTime() {
		return systemEntryTime;
	}


	public void setSystemEntryTime(String systemEntryTime) {
		this.systemEntryTime = systemEntryTime;
	}


	public String getExitRemark() {
		return exitRemark;
	}


	public void setExitRemark(String exitRemark) {
		this.exitRemark = exitRemark;
	}


	public Date getReceiptDate() {
		return receiptDate;
	}


	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
	}


	public String getPreviousStageId() {
		return previousStageId;
	}


	public void setPreviousStageId(String previousStageId) {
		this.previousStageId = previousStageId;
	}


	public Integer getAssetID() {
		return assetID;
	}


	public void setAssetID(Integer assetID) {
		this.assetID = assetID;
	}


	public String getWheelNumber() {
		return wheelNumber;
	}


	public void setWheelNumber(String wheelNumber) {
		this.wheelNumber = wheelNumber;
	}


	public String getBogieNumber() {
		return bogieNumber;
	}


	public void setBogieNumber(String bogieNumber) {
		this.bogieNumber = bogieNumber;
	}


	public String getCoachNumber() {
		return coachNumber;
	}


	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
	}


	public Integer getMergeFunishFlag() {
		return mergeFunishFlag;
	}


	public void setMergeFunishFlag(Integer mergeFunishFlag) {
		this.mergeFunishFlag = mergeFunishFlag;
	}

	
	
}
