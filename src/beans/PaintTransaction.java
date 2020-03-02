package beans;

import java.util.Date;

public class PaintTransaction implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private Integer paintAssetId;
	
	private String stageId;
	private String previousStageId;
	private Integer shellAssetId;
	
	private Date assemblyStartDate;
	private Date assemblyEndDate;
	private Date assemblyDispatchDate;
	private String colorScheme;
	private String remarks;
	private String exitRemarks;
	private String lateReason;
	private Date expectedExitDate;
	private String transEntryBy;
	private String transEntryTime;
	private Integer asignedFlag;
	private Date receiptAtNextStage;
	private String shellType;
	private String furnishingNumber;
	private String coachType;
	
	/* Manoj code start here on 09.01.2020 */
	private Integer intrPaintSipFlag;
	private Integer intrPaintFinalFlag;
	private Integer extrPaintSipFlag;
	private Integer extrPaintFinalFlag;
	private Integer testingClearanceMemoFlag;
	private Date testingClearanceMemoDate;
	private String testingClearanceMemoDocNo;
	private String testingClearanceMemoStatus;
	private String testingClearanceMemoRemark;
	/* Manoj code end here on 09.01.2020 */

public PaintTransaction()
{
	
}

public PaintTransaction(Integer paintAssetId, String stageId, String previousStageId, Integer shellAssetId,
			Date assemblyStartDate, Date assemblyEndDate, Date assemblyDispatchDate, String colorScheme, String remarks,
			String exitRemarks, String lateReason, Date expectedExitDate, String transEntryBy, String transEntryTime,
			Integer asignedFlag, Date receiptAtNextStage, String shellType, String furnishingNumber, String coachType,
			Integer intrPaintSipFlag, Integer intrPaintFinalFlag, Integer extrPaintSipFlag, Integer extrPaintFinalFlag,
			Integer testingClearanceMemoFlag, Date testingClearanceMemoDate, String testingClearanceMemoDocNo,
			String testingClearanceMemoStatus, String testingClearanceMemoRemark) {
		super();
		this.paintAssetId = paintAssetId;
		this.stageId = stageId;
		this.previousStageId = previousStageId;
		this.shellAssetId = shellAssetId;
		this.assemblyStartDate = assemblyStartDate;
		this.assemblyEndDate = assemblyEndDate;
		this.assemblyDispatchDate = assemblyDispatchDate;
		this.colorScheme = colorScheme;
		this.remarks = remarks;
		this.exitRemarks = exitRemarks;
		this.lateReason = lateReason;
		this.expectedExitDate = expectedExitDate;
		this.transEntryBy = transEntryBy;
		this.transEntryTime = transEntryTime;
		this.asignedFlag = asignedFlag;
		this.receiptAtNextStage = receiptAtNextStage;
		this.shellType = shellType;
		this.furnishingNumber = furnishingNumber;
		this.coachType = coachType;
		this.intrPaintSipFlag = intrPaintSipFlag;
		this.intrPaintFinalFlag = intrPaintFinalFlag;
		this.extrPaintSipFlag = extrPaintSipFlag;
		this.extrPaintFinalFlag = extrPaintFinalFlag;
		this.testingClearanceMemoFlag = testingClearanceMemoFlag;
		this.testingClearanceMemoDate = testingClearanceMemoDate;
		this.testingClearanceMemoDocNo = testingClearanceMemoDocNo;
		this.testingClearanceMemoStatus = testingClearanceMemoStatus;
		this.testingClearanceMemoRemark = testingClearanceMemoRemark;
	}





public String getTestingClearanceMemoStatus() {
	return testingClearanceMemoStatus;
}

public void setTestingClearanceMemoStatus(String testingClearanceMemoStatus) {
	this.testingClearanceMemoStatus = testingClearanceMemoStatus;
}

public Integer getIntrPaintSipFlag() {
	return intrPaintSipFlag;
}

public void setIntrPaintSipFlag(Integer intrPaintSipFlag) {
	this.intrPaintSipFlag = intrPaintSipFlag;
}

public Integer getIntrPaintFinalFlag() {
	return intrPaintFinalFlag;
}

public void setIntrPaintFinalFlag(Integer intrPaintFinalFlag) {
	this.intrPaintFinalFlag = intrPaintFinalFlag;
}

public Integer getExtrPaintSipFlag() {
	return extrPaintSipFlag;
}

public void setExtrPaintSipFlag(Integer extrPaintSipFlag) {
	this.extrPaintSipFlag = extrPaintSipFlag;
}

public Integer getExtrPaintFinalFlag() {
	return extrPaintFinalFlag;
}

public void setExtrPaintFinalFlag(Integer extrPaintFinalFlag) {
	this.extrPaintFinalFlag = extrPaintFinalFlag;
}

public Integer getTestingClearanceMemoFlag() {
	return testingClearanceMemoFlag;
}

public void setTestingClearanceMemoFlag(Integer testingClearanceMemoFlag) {
	this.testingClearanceMemoFlag = testingClearanceMemoFlag;
}

public Date getTestingClearanceMemoDate() {
	return testingClearanceMemoDate;
}

public void setTestingClearanceMemoDate(Date testingClearanceMemoDate) {
	this.testingClearanceMemoDate = testingClearanceMemoDate;
}

public String getTestingClearanceMemoDocNo() {
	return testingClearanceMemoDocNo;
}

public void setTestingClearanceMemoDocNo(String testingClearanceMemoDocNo) {
	this.testingClearanceMemoDocNo = testingClearanceMemoDocNo;
}

public String getTestingClearanceMemoRemark() {
	return testingClearanceMemoRemark;
}

public void setTestingClearanceMemoRemark(String testingClearanceMemoRemark) {
	this.testingClearanceMemoRemark = testingClearanceMemoRemark;
}

public Integer getPaintAssetId() {
	return paintAssetId;
}

public void setPaintAssetId(Integer paintAssetId) {
	this.paintAssetId = paintAssetId;
}

public String getStageId() {
	return stageId;
}

public void setStageId(String stageId) {
	this.stageId = stageId;
}

public String getPreviousStageId() {
	return previousStageId;
}

public void setPreviousStageId(String previousStageId) {
	this.previousStageId = previousStageId;
}

public Integer getShellAssetId() {
	return shellAssetId;
}

public void setShellAssetId(Integer shellAssetId) {
	this.shellAssetId = shellAssetId;
}

public Date getAssemblyStartDate() {
	return assemblyStartDate;
}

public void setAssemblyStartDate(Date assemblyStartDate) {
	this.assemblyStartDate = assemblyStartDate;
}

public Date getAssemblyEndDate() {
	return assemblyEndDate;
}

public void setAssemblyEndDate(Date assemblyEndDate) {
	this.assemblyEndDate = assemblyEndDate;
}

public Date getAssemblyDispatchDate() {
	return assemblyDispatchDate;
}

public void setAssemblyDispatchDate(Date assemblyDispatchDate) {
	this.assemblyDispatchDate = assemblyDispatchDate;
}

public String getColorScheme() {
	return colorScheme;
}

public void setColorScheme(String colorScheme) {
	this.colorScheme = colorScheme;
}

public String getRemarks() {
	return remarks;
}

public void setRemarks(String remarks) {
	this.remarks = remarks;
}

public String getExitRemarks() {
	return exitRemarks;
}

public void setExitRemarks(String exitRemarks) {
	this.exitRemarks = exitRemarks;
}

public String getLateReason() {
	return lateReason;
}

public void setLateReason(String lateReason) {
	this.lateReason = lateReason;
}

public Date getExpectedExitDate() {
	return expectedExitDate;
}

public void setExpectedExitDate(Date expectedExitDate) {
	this.expectedExitDate = expectedExitDate;
}

public String getTransEntryBy() {
	return transEntryBy;
}

public void setTransEntryBy(String transEntryBy) {
	this.transEntryBy = transEntryBy;
}

public String getTransEntryTime() {
	return transEntryTime;
}

public void setTransEntryTime(String transEntryTime) {
	this.transEntryTime = transEntryTime;
}

public Integer getAsignedFlag() {
	return asignedFlag;
}

public void setAsignedFlag(Integer asignedFlag) {
	this.asignedFlag = asignedFlag;
}

public Date getReceiptAtNextStage() {
	return receiptAtNextStage;
}

public void setReceiptAtNextStage(Date receiptAtNextStage) {
	this.receiptAtNextStage = receiptAtNextStage;
}

public String getShellType() {
	return shellType;
}

public void setShellType(String shellType) {
	this.shellType = shellType;
}

public String getFurnishingNumber() {
	return furnishingNumber;
}

public void setFurnishingNumber(String furnishingNumber) {
	this.furnishingNumber = furnishingNumber;
}

public String getCoachType() {
	return coachType;
}

public void setCoachType(String coachType) {
	this.coachType = coachType;
}


}
