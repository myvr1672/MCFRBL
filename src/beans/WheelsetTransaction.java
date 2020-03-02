package beans;

import java.util.Date;

public class WheelsetTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer wheelsetAssetId;
	private String wheelsetTransactionId;
	private String substageId;
	private String previousStageId;
	private String wheeldiscLeftNo;
	private String ctrbLeftNo;
	private String ctrbLeftMake;
	private String wheeldiscLeftMake;
	private String leftBrakeDiscMake;
	private float leftWheelDiscTon;
	private String wheeldiscRightNo;
	private String ctrbRightNo;
	private String ctrbRightMake;
	private String wheeldiscRightMake;
	private String rightBrakeDiscMake;
	private float rightWheelDiscTon;
	private String axleNumber;
	private String axleMake;
	private Date assemblyStartDate;
	private Date assemblyEndDate;
	private Date assemblyDispatchDate;
	private String remarks;
	//private String exitRemarks;
	//private String lateReason;
//	private Date expectedExitDate;
//	private String qualityStatus;
	private String transEntryBy;
	private String transEntryTime;
	
	private Integer asignedFlag;
	private Date receiptAtNextStage;
	private String dispatchTo;
	private String customer;
	private Double journalDiaLeft;
	private Double journalDiaRight;
	private Double collarDiaLeft;
	private Double collarDiaRight;
	private Double wheelDiaLeft;
	private Double wheelDiaRight;
	private Double distanceBetweenWheel;
	private Double distanceBetweenWheelfaceDiscface;
	private Integer brakeDiscPressureLeft;
	private Integer brakeDiscPressureRight;
	private Integer wheelDiscPressureLeft;
	private Integer wheelDiscPressureRight;
	private Integer wheelBalancingWeightLeft;
	private Integer wheelBalancingWeightRight;
	private Integer wheelUnbalanceWeightLeft;
	private Integer wheelUnbalanceWeightRight;
	private String wheelDiscType;
	private Integer sipWheelAssemblyFlag;
	private Integer sipWheelCtrbFlag;
	private Integer testingClearanceMemoFlag;
	private Date testingClearanceMemoDate;
	private String testingClearanceMemoStatus;
	private String testingClearanceMemoRemark;
	private String lateralClearanceLeftCTRB;
	private String lateralClearanceRightCTRB;
	private String pressingPressureLeftCTRB;
	private String pressingPressureRightCTRB;
	private String wheelSetType;
	
	public WheelsetTransaction() {
	}

	public WheelsetTransaction(Integer wheelsetAssetId, String wheelsetTransactionId, String substageId,
			String previousStageId, String wheeldiscLeftNo, String ctrbLeftNo, String ctrbLeftMake,
			String wheeldiscLeftMake, String leftBrakeDiscMake, float leftWheelDiscTon, String wheeldiscRightNo,
			String ctrbRightNo, String ctrbRightMake, String wheeldiscRightMake, String rightBrakeDiscMake,
			float rightWheelDiscTon, String axleNumber, String axleMake, Date assemblyStartDate, Date assemblyEndDate,
			Date assemblyDispatchDate, String remarks, String transEntryBy, String transEntryTime, Integer asignedFlag,
			Date receiptAtNextStage, String dispatchTo, String customer, Double journalDiaLeft, Double journalDiaRight,
			Double collarDiaLeft, Double collarDiaRight, Double wheelDiaLeft, Double wheelDiaRight,
			Double distanceBetweenWheel, Double distanceBetweenWheelfaceDiscface, Integer brakeDiscPressureLeft,
			Integer brakeDiscPressureRight, Integer wheelDiscPressureLeft, Integer wheelDiscPressureRight,
			Integer wheelBalancingWeightLeft, Integer wheelBalancingWeightRight, Integer wheelUnbalanceWeightLeft,
			Integer wheelUnbalanceWeightRight, String wheelDiscType, Integer sipWheelAssemblyFlag,
			Integer sipWheelCtrbFlag, Integer testingClearanceMemoFlag, Date testingClearanceMemoDate,String testingClearanceMemoStatus,
			String testingClearanceMemoRemark, String lateralClearanceLeftCTRB, String lateralClearanceRightCTRB,
			String pressingPressureLeftCTRB, String pressingPressureRightCTRB, String wheelSetType) {
		super();
		this.wheelsetAssetId = wheelsetAssetId;
		this.wheelsetTransactionId = wheelsetTransactionId;
		this.substageId = substageId;
		this.previousStageId = previousStageId;
		this.wheeldiscLeftNo = wheeldiscLeftNo;
		this.ctrbLeftNo = ctrbLeftNo;
		this.ctrbLeftMake = ctrbLeftMake;
		this.wheeldiscLeftMake = wheeldiscLeftMake;
		this.leftBrakeDiscMake = leftBrakeDiscMake;
		this.leftWheelDiscTon = leftWheelDiscTon;
		this.wheeldiscRightNo = wheeldiscRightNo;
		this.ctrbRightNo = ctrbRightNo;
		this.ctrbRightMake = ctrbRightMake;
		this.wheeldiscRightMake = wheeldiscRightMake;
		this.rightBrakeDiscMake = rightBrakeDiscMake;
		this.rightWheelDiscTon = rightWheelDiscTon;
		this.axleNumber = axleNumber;
		this.axleMake = axleMake;
		this.assemblyStartDate = assemblyStartDate;
		this.assemblyEndDate = assemblyEndDate;
		this.assemblyDispatchDate = assemblyDispatchDate;
		this.remarks = remarks;
		this.transEntryBy = transEntryBy;
		this.transEntryTime = transEntryTime;
		this.asignedFlag = asignedFlag;
		this.receiptAtNextStage = receiptAtNextStage;
		this.dispatchTo = dispatchTo;
		this.customer = customer;
		this.journalDiaLeft = journalDiaLeft;
		this.journalDiaRight = journalDiaRight;
		this.collarDiaLeft = collarDiaLeft;
		this.collarDiaRight = collarDiaRight;
		this.wheelDiaLeft = wheelDiaLeft;
		this.wheelDiaRight = wheelDiaRight;
		this.distanceBetweenWheel = distanceBetweenWheel;
		this.distanceBetweenWheelfaceDiscface = distanceBetweenWheelfaceDiscface;
		this.brakeDiscPressureLeft = brakeDiscPressureLeft;
		this.brakeDiscPressureRight = brakeDiscPressureRight;
		this.wheelDiscPressureLeft = wheelDiscPressureLeft;
		this.wheelDiscPressureRight = wheelDiscPressureRight;
		this.wheelBalancingWeightLeft = wheelBalancingWeightLeft;
		this.wheelBalancingWeightRight = wheelBalancingWeightRight;
		this.wheelUnbalanceWeightLeft = wheelUnbalanceWeightLeft;
		this.wheelUnbalanceWeightRight = wheelUnbalanceWeightRight;
		this.wheelDiscType = wheelDiscType;
		this.sipWheelAssemblyFlag = sipWheelAssemblyFlag;
		this.sipWheelCtrbFlag = sipWheelCtrbFlag;
		this.testingClearanceMemoFlag = testingClearanceMemoFlag;
		this.testingClearanceMemoDate = testingClearanceMemoDate;
		this.testingClearanceMemoStatus=testingClearanceMemoStatus;
		this.testingClearanceMemoRemark = testingClearanceMemoRemark;
		this.lateralClearanceLeftCTRB = lateralClearanceLeftCTRB;
		this.lateralClearanceRightCTRB = lateralClearanceRightCTRB;
		this.pressingPressureLeftCTRB = pressingPressureLeftCTRB;
		this.pressingPressureRightCTRB = pressingPressureRightCTRB;
		this.wheelSetType = wheelSetType;
	}

	public Integer getWheelsetAssetId() {
		return wheelsetAssetId;
	}

	public void setWheelsetAssetId(Integer wheelsetAssetId) {
		this.wheelsetAssetId = wheelsetAssetId;
	}

	public String getWheelsetTransactionId() {
		return wheelsetTransactionId;
	}

	public void setWheelsetTransactionId(String wheelsetTransactionId) {
		this.wheelsetTransactionId = wheelsetTransactionId;
	}

	public String getSubstageId() {
		return substageId;
	}

	public void setSubstageId(String substageId) {
		this.substageId = substageId;
	}

	public String getPreviousStageId() {
		return previousStageId;
	}

	public void setPreviousStageId(String previousStageId) {
		this.previousStageId = previousStageId;
	}

	public String getWheeldiscLeftNo() {
		return wheeldiscLeftNo;
	}

	public void setWheeldiscLeftNo(String wheeldiscLeftNo) {
		this.wheeldiscLeftNo = wheeldiscLeftNo;
	}

	public String getCtrbLeftNo() {
		return ctrbLeftNo;
	}

	public void setCtrbLeftNo(String ctrbLeftNo) {
		this.ctrbLeftNo = ctrbLeftNo;
	}

	public String getCtrbLeftMake() {
		return ctrbLeftMake;
	}

	public void setCtrbLeftMake(String ctrbLeftMake) {
		this.ctrbLeftMake = ctrbLeftMake;
	}

	public String getWheeldiscLeftMake() {
		return wheeldiscLeftMake;
	}

	public void setWheeldiscLeftMake(String wheeldiscLeftMake) {
		this.wheeldiscLeftMake = wheeldiscLeftMake;
	}

	public String getLeftBrakeDiscMake() {
		return leftBrakeDiscMake;
	}

	public void setLeftBrakeDiscMake(String leftBrakeDiscMake) {
		this.leftBrakeDiscMake = leftBrakeDiscMake;
	}

	public float getLeftWheelDiscTon() {
		return leftWheelDiscTon;
	}

	public void setLeftWheelDiscTon(float leftWheelDiscTon) {
		this.leftWheelDiscTon = leftWheelDiscTon;
	}

	public String getWheeldiscRightNo() {
		return wheeldiscRightNo;
	}

	public void setWheeldiscRightNo(String wheeldiscRightNo) {
		this.wheeldiscRightNo = wheeldiscRightNo;
	}

	public String getCtrbRightNo() {
		return ctrbRightNo;
	}

	public void setCtrbRightNo(String ctrbRightNo) {
		this.ctrbRightNo = ctrbRightNo;
	}

	public String getCtrbRightMake() {
		return ctrbRightMake;
	}

	public void setCtrbRightMake(String ctrbRightMake) {
		this.ctrbRightMake = ctrbRightMake;
	}

	public String getWheeldiscRightMake() {
		return wheeldiscRightMake;
	}

	public void setWheeldiscRightMake(String wheeldiscRightMake) {
		this.wheeldiscRightMake = wheeldiscRightMake;
	}

	public String getRightBrakeDiscMake() {
		return rightBrakeDiscMake;
	}

	public void setRightBrakeDiscMake(String rightBrakeDiscMake) {
		this.rightBrakeDiscMake = rightBrakeDiscMake;
	}

	public float getRightWheelDiscTon() {
		return rightWheelDiscTon;
	}

	public void setRightWheelDiscTon(float rightWheelDiscTon) {
		this.rightWheelDiscTon = rightWheelDiscTon;
	}

	public String getAxleNumber() {
		return axleNumber;
	}

	public void setAxleNumber(String axleNumber) {
		this.axleNumber = axleNumber;
	}

	public String getAxleMake() {
		return axleMake;
	}

	public void setAxleMake(String axleMake) {
		this.axleMake = axleMake;
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

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public String getDispatchTo() {
		return dispatchTo;
	}

	public void setDispatchTo(String dispatchTo) {
		this.dispatchTo = dispatchTo;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public Double getJournalDiaLeft() {
		return journalDiaLeft;
	}

	public void setJournalDiaLeft(Double journalDiaLeft) {
		this.journalDiaLeft = journalDiaLeft;
	}

	public Double getJournalDiaRight() {
		return journalDiaRight;
	}

	public void setJournalDiaRight(Double journalDiaRight) {
		this.journalDiaRight = journalDiaRight;
	}

	public Double getCollarDiaLeft() {
		return collarDiaLeft;
	}

	public void setCollarDiaLeft(Double collarDiaLeft) {
		this.collarDiaLeft = collarDiaLeft;
	}

	public Double getCollarDiaRight() {
		return collarDiaRight;
	}

	public void setCollarDiaRight(Double collarDiaRight) {
		this.collarDiaRight = collarDiaRight;
	}

	public Double getWheelDiaLeft() {
		return wheelDiaLeft;
	}

	public void setWheelDiaLeft(Double wheelDiaLeft) {
		this.wheelDiaLeft = wheelDiaLeft;
	}

	public Double getWheelDiaRight() {
		return wheelDiaRight;
	}

	public void setWheelDiaRight(Double wheelDiaRight) {
		this.wheelDiaRight = wheelDiaRight;
	}

	public Double getDistanceBetweenWheel() {
		return distanceBetweenWheel;
	}

	public void setDistanceBetweenWheel(Double distanceBetweenWheel) {
		this.distanceBetweenWheel = distanceBetweenWheel;
	}

	public Double getDistanceBetweenWheelfaceDiscface() {
		return distanceBetweenWheelfaceDiscface;
	}

	public void setDistanceBetweenWheelfaceDiscface(Double distanceBetweenWheelfaceDiscface) {
		this.distanceBetweenWheelfaceDiscface = distanceBetweenWheelfaceDiscface;
	}

	public Integer getBrakeDiscPressureLeft() {
		return brakeDiscPressureLeft;
	}

	public void setBrakeDiscPressureLeft(Integer brakeDiscPressureLeft) {
		this.brakeDiscPressureLeft = brakeDiscPressureLeft;
	}

	public Integer getBrakeDiscPressureRight() {
		return brakeDiscPressureRight;
	}

	public void setBrakeDiscPressureRight(Integer brakeDiscPressureRight) {
		this.brakeDiscPressureRight = brakeDiscPressureRight;
	}

	public Integer getWheelDiscPressureLeft() {
		return wheelDiscPressureLeft;
	}

	public void setWheelDiscPressureLeft(Integer wheelDiscPressureLeft) {
		this.wheelDiscPressureLeft = wheelDiscPressureLeft;
	}

	public Integer getWheelDiscPressureRight() {
		return wheelDiscPressureRight;
	}

	public void setWheelDiscPressureRight(Integer wheelDiscPressureRight) {
		this.wheelDiscPressureRight = wheelDiscPressureRight;
	}

	public Integer getWheelBalancingWeightLeft() {
		return wheelBalancingWeightLeft;
	}

	public void setWheelBalancingWeightLeft(Integer wheelBalancingWeightLeft) {
		this.wheelBalancingWeightLeft = wheelBalancingWeightLeft;
	}

	public Integer getWheelBalancingWeightRight() {
		return wheelBalancingWeightRight;
	}

	public void setWheelBalancingWeightRight(Integer wheelBalancingWeightRight) {
		this.wheelBalancingWeightRight = wheelBalancingWeightRight;
	}

	public Integer getWheelUnbalanceWeightLeft() {
		return wheelUnbalanceWeightLeft;
	}

	public void setWheelUnbalanceWeightLeft(Integer wheelUnbalanceWeightLeft) {
		this.wheelUnbalanceWeightLeft = wheelUnbalanceWeightLeft;
	}

	public Integer getWheelUnbalanceWeightRight() {
		return wheelUnbalanceWeightRight;
	}

	public void setWheelUnbalanceWeightRight(Integer wheelUnbalanceWeightRight) {
		this.wheelUnbalanceWeightRight = wheelUnbalanceWeightRight;
	}

	public String getWheelDiscType() {
		return wheelDiscType;
	}

	public void setWheelDiscType(String wheelDiscType) {
		this.wheelDiscType = wheelDiscType;
	}

	public Integer getSipWheelAssemblyFlag() {
		return sipWheelAssemblyFlag;
	}

	public void setSipWheelAssemblyFlag(Integer sipWheelAssemblyFlag) {
		this.sipWheelAssemblyFlag = sipWheelAssemblyFlag;
	}

	public Integer getSipWheelCtrbFlag() {
		return sipWheelCtrbFlag;
	}

	public void setSipWheelCtrbFlag(Integer sipWheelCtrbFlag) {
		this.sipWheelCtrbFlag = sipWheelCtrbFlag;
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

	public String getTestingClearanceMemoRemark() {
		return testingClearanceMemoRemark;
	}

	public void setTestingClearanceMemoRemark(String testingClearanceMemoRemark) {
		this.testingClearanceMemoRemark = testingClearanceMemoRemark;
	}

	public String getLateralClearanceLeftCTRB() {
		return lateralClearanceLeftCTRB;
	}

	public void setLateralClearanceLeftCTRB(String lateralClearanceLeftCTRB) {
		this.lateralClearanceLeftCTRB = lateralClearanceLeftCTRB;
	}

	public String getLateralClearanceRightCTRB() {
		return lateralClearanceRightCTRB;
	}

	public void setLateralClearanceRightCTRB(String lateralClearanceRightCTRB) {
		this.lateralClearanceRightCTRB = lateralClearanceRightCTRB;
	}

	public String getPressingPressureLeftCTRB() {
		return pressingPressureLeftCTRB;
	}

	public void setPressingPressureLeftCTRB(String pressingPressureLeftCTRB) {
		this.pressingPressureLeftCTRB = pressingPressureLeftCTRB;
	}

	public String getPressingPressureRightCTRB() {
		return pressingPressureRightCTRB;
	}

	public void setPressingPressureRightCTRB(String pressingPressureRightCTRB) {
		this.pressingPressureRightCTRB = pressingPressureRightCTRB;
	}

	public String getWheelSetType() {
		return wheelSetType;
	}

	public void setWheelSetType(String wheelSetType) {
		this.wheelSetType = wheelSetType;
	}

	public String getTestingClearanceMemoStatus() {
		return testingClearanceMemoStatus;
	}

	public void setTestingClearanceMemoStatus(String testingClearanceMemoStatus) {
		this.testingClearanceMemoStatus = testingClearanceMemoStatus;
	}

	
}
