package beans;

import java.util.Date;

public class BogiesetTransaction implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer bogieAssetId;
	private String bogiesetTrxId;
	private String substageId;
	private String prevStageId;
	private Integer leftWheelAssetId;
	private Integer rightWheelAssetId;
	private Date assemblyStartDate;
	private String frameNo;
	private Date frameReceiptDate;
	private String bolsNo;
	private Date bolsReceiptDate;
	private Date assemblyEndDate;
	private Date assemblyExpectedExtDate;
	private Date assemblyExitDate;
	private String productionBy;
	private String remarks;
	private String lateRemark;
	private String trxUser;
	private String trxDate;
	private Integer asignedFlag;
	private String exitRemarks;
	private Date receiptAtNextStage;
	private String bogieNumber;
	private String bogieType;
	private String dispatchTo;
	private String customer;
	private String frameManufacturedBy;
	private String bolsterManufacturedBy;
	private String frameMake;
    private String bolsterMake;
    private String brakeCylinderNo1 ;
    private String brakeCylinderNo2 ;
    private String brakeCylinderNo3;
    private String brakeCylinderNo4;
    private String brakeCaliperNo1;
    private String brakeCaliperNo2;
    private String brakeCaliperNo3;
    private String brakeCaliperNo4;
    private String vsaAtPrimarySuspNo;
    private String vsaAtPrimarySuspMake;
    private String vsaAtSecondarySuspNo;
    private String vsaAtSecondarySuspMake;
    private String lateralShockAbsorberNo;
    private String lateralShockAbsorberMake;
    private String secAirSpringNo1;
    private String secAirSpringNo2;
    private Integer staticSipBogieFlag;
    private Integer sipFinalFlag;
    private String testingClearanceMemoDocNo;
    private Integer testingClearanceMemoFlag;
    private Date testingClearanceMemoDate;
    private String testingClearanceMemoStatus;
    private String testingClearanceMemoRemark;
	public BogiesetTransaction() {
		
	}


	public BogiesetTransaction(Integer bogieAssetId, String bogiesetTrxId, String substageId, String prevStageId,
			Integer leftWheelAssetId, Integer rightWheelAssetId, Date assemblyStartDate, String frameNo,
			Date frameReceiptDate, String bolsNo, Date bolsReceiptDate, Date assemblyEndDate,
			Date assemblyExpectedExtDate, Date assemblyExitDate, String productionBy, String remarks, String lateRemark,
			String trxUser, String trxDate, Integer asignedFlag, String exitRemarks, Date receiptAtNextStage,
			String bogieNumber, String bogieType, String dispatchTo, String customer, String frameManufacturedBy,
			String bolsterManufacturedBy, String frameMake, String bolsterMake, String brakeCylinderNo1,
			String brakeCylinderNo2, String brakeCylinderNo3, String brakeCylinderNo4, String brakeCaliperNo1,
			String brakeCaliperNo2, String brakeCaliperNo3, String brakeCaliperNo4, String vsaAtPrimarySuspNo,
			String vsaAtPrimarySuspMake, String vsaAtSecondarySuspNo, String vsaAtSecondarySuspMake,
			String lateralShockAbsorberNo, String lateralShockAbsorberMake, String secAirSpringNo1,
			String secAirSpringNo2, Integer staticSipBogieFlag, Integer sipFinalFlag,String testingClearanceMemoDocNo, Integer testingClearanceMemoFlag,
			Date testingClearanceMemoDate, String testingClearanceMemoStatus, String testingClearanceMemoRemark) {
		super();
		this.bogieAssetId = bogieAssetId;
		this.bogiesetTrxId = bogiesetTrxId;
		this.substageId = substageId;
		this.prevStageId = prevStageId;
		this.leftWheelAssetId = leftWheelAssetId;
		this.rightWheelAssetId = rightWheelAssetId;
		this.assemblyStartDate = assemblyStartDate;
		this.frameNo = frameNo;
		this.frameReceiptDate = frameReceiptDate;
		this.bolsNo = bolsNo;
		this.bolsReceiptDate = bolsReceiptDate;
		this.assemblyEndDate = assemblyEndDate;
		this.assemblyExpectedExtDate = assemblyExpectedExtDate;
		this.assemblyExitDate = assemblyExitDate;
		this.productionBy = productionBy;
		this.remarks = remarks;
		this.lateRemark = lateRemark;
		this.trxUser = trxUser;
		this.trxDate = trxDate;
		this.asignedFlag = asignedFlag;
		this.exitRemarks = exitRemarks;
		this.receiptAtNextStage = receiptAtNextStage;
		this.bogieNumber = bogieNumber;
		this.bogieType = bogieType;
		this.dispatchTo = dispatchTo;
		this.customer = customer;
		this.frameManufacturedBy = frameManufacturedBy;
		this.bolsterManufacturedBy = bolsterManufacturedBy;
		this.frameMake = frameMake;
		this.bolsterMake = bolsterMake;
		this.brakeCylinderNo1 = brakeCylinderNo1;
		this.brakeCylinderNo2 = brakeCylinderNo2;
		this.brakeCylinderNo3 = brakeCylinderNo3;
		this.brakeCylinderNo4 = brakeCylinderNo4;
		this.brakeCaliperNo1 = brakeCaliperNo1;
		this.brakeCaliperNo2 = brakeCaliperNo2;
		this.brakeCaliperNo3 = brakeCaliperNo3;
		this.brakeCaliperNo4 = brakeCaliperNo4;
		this.vsaAtPrimarySuspNo = vsaAtPrimarySuspNo;
		this.vsaAtPrimarySuspMake = vsaAtPrimarySuspMake;
		this.vsaAtSecondarySuspNo = vsaAtSecondarySuspNo;
		this.vsaAtSecondarySuspMake = vsaAtSecondarySuspMake;
		this.lateralShockAbsorberNo = lateralShockAbsorberNo;
		this.lateralShockAbsorberMake = lateralShockAbsorberMake;
		this.secAirSpringNo1 = secAirSpringNo1;
		this.secAirSpringNo2 = secAirSpringNo2;
		this.staticSipBogieFlag = staticSipBogieFlag;
		this.sipFinalFlag = sipFinalFlag;
		this.testingClearanceMemoDocNo=testingClearanceMemoDocNo;
		this.testingClearanceMemoFlag = testingClearanceMemoFlag;
		this.testingClearanceMemoDate = testingClearanceMemoDate;
		this.testingClearanceMemoStatus = testingClearanceMemoStatus;
		this.testingClearanceMemoRemark = testingClearanceMemoRemark;
	}


	public Integer getBogieAssetId() {
		return bogieAssetId;
	}

	public void setBogieAssetId(Integer bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}

	public String getBogiesetTrxId() {
		return bogiesetTrxId;
	}

	public void setBogiesetTrxId(String bogiesetTrxId) {
		this.bogiesetTrxId = bogiesetTrxId;
	}

	public String getSubstageId() {
		return substageId;
	}

	public void setSubstageId(String substageId) {
		this.substageId = substageId;
	}

	public String getPrevStageId() {
		return prevStageId;
	}

	public void setPrevStageId(String prevStageId) {
		this.prevStageId = prevStageId;
	}

	public Integer getLeftWheelAssetId() {
		return leftWheelAssetId;
	}

	public void setLeftWheelAssetId(Integer leftWheelAssetId) {
		this.leftWheelAssetId = leftWheelAssetId;
	}

	public Integer getRightWheelAssetId() {
		return rightWheelAssetId;
	}

	public void setRightWheelAssetId(Integer rightWheelAssetId) {
		this.rightWheelAssetId = rightWheelAssetId;
	}

	

	public Date getAssemblyStartDate() {
		return assemblyStartDate;
	}

	public void setAssemblyStartDate(Date assemblyStartDate) {
		this.assemblyStartDate = assemblyStartDate;
	}

	public String getFrameNo() {
		return frameNo;
	}

	public void setFrameNo(String frameNo) {
		this.frameNo = frameNo;
	}

	public Date getFrameReceiptDate() {
		return frameReceiptDate;
	}

	public void setFrameReceiptDate(Date frameReceiptDate) {
		this.frameReceiptDate = frameReceiptDate;
	}

	public String getBolsNo() {
		return bolsNo;
	}

	public void setBolsNo(String bolsNo) {
		this.bolsNo = bolsNo;
	}

	public Date getBolsReceiptDate() {
		return bolsReceiptDate;
	}

	public void setBolsReceiptDate(Date bolsReceiptDate) {
		this.bolsReceiptDate = bolsReceiptDate;
	}

	public Date getAssemblyEndDate() {
		return assemblyEndDate;
	}

	public void setAssemblyEndDate(Date assemblyEndDate) {
		this.assemblyEndDate = assemblyEndDate;
	}

	public Date getAssemblyExpectedExtDate() {
		return assemblyExpectedExtDate;
	}

	public void setAssemblyExpectedExtDate(Date assemblyExpectedExtDate) {
		this.assemblyExpectedExtDate = assemblyExpectedExtDate;
	}

	public Date getAssemblyExitDate() {
		return assemblyExitDate;
	}

	public void setAssemblyExitDate(Date assemblyExitDate) {
		this.assemblyExitDate = assemblyExitDate;
	}

	public String getProductionBy() {
		return productionBy;
	}

	public void setProductionBy(String productionBy) {
		this.productionBy = productionBy;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getLateRemark() {
		return lateRemark;
	}

	public void setLateRemark(String lateRemark) {
		this.lateRemark = lateRemark;
	}

	public String getTrxUser() {
		return trxUser;
	}

	public void setTrxUser(String trxUser) {
		this.trxUser = trxUser;
	}

	public String getTrxDate() {
		return trxDate;
	}

	public void setTrxDate(String trxDate) {
		this.trxDate = trxDate;
	}

	public Integer getAsignedFlag() {
		return asignedFlag;
	}

	public void setAsignedFlag(Integer asignedFlag) {
		this.asignedFlag = asignedFlag;
	}

	public String getExitRemarks() {
		return exitRemarks;
	}

	public void setExitRemarks(String exitRemarks) {
		this.exitRemarks = exitRemarks;
	}

	public Date getReceiptAtNextStage() {
		return receiptAtNextStage;
	}

	public void setReceiptAtNextStage(Date receiptAtNextStage) {
		this.receiptAtNextStage = receiptAtNextStage;
	}

	public String getBogieNumber() {
		return bogieNumber;
	}

	public void setBogieNumber(String bogieNumber) {
		this.bogieNumber = bogieNumber;
	}

	public String getBogieType() {
		return bogieType;
	}

	public void setBogieType(String bogieType) {
		this.bogieType = bogieType;
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

	public String getFrameManufacturedBy() {
		return frameManufacturedBy;
	}

	public void setFrameManufacturedBy(String frameManufacturedBy) {
		this.frameManufacturedBy = frameManufacturedBy;
	}

	public String getBolsterManufacturedBy() {
		return bolsterManufacturedBy;
	}

	public void setBolsterManufacturedBy(String bolsterManufacturedBy) {
		this.bolsterManufacturedBy = bolsterManufacturedBy;
	}


	public String getFrameMake() {
		return frameMake;
	}


	public void setFrameMake(String frameMake) {
		this.frameMake = frameMake;
	}


	public String getBolsterMake() {
		return bolsterMake;
	}


	public void setBolsterMake(String bolsterMake) {
		this.bolsterMake = bolsterMake;
	}


	public String getBrakeCylinderNo1() {
		return brakeCylinderNo1;
	}


	public void setBrakeCylinderNo1(String brakeCylinderNo1) {
		this.brakeCylinderNo1 = brakeCylinderNo1;
	}


	public String getBrakeCylinderNo2() {
		return brakeCylinderNo2;
	}


	public void setBrakeCylinderNo2(String brakeCylinderNo2) {
		this.brakeCylinderNo2 = brakeCylinderNo2;
	}


	public String getBrakeCylinderNo3() {
		return brakeCylinderNo3;
	}


	public void setBrakeCylinderNo3(String brakeCylinderNo3) {
		this.brakeCylinderNo3 = brakeCylinderNo3;
	}


	public String getBrakeCylinderNo4() {
		return brakeCylinderNo4;
	}


	public void setBrakeCylinderNo4(String brakeCylinderNo4) {
		this.brakeCylinderNo4 = brakeCylinderNo4;
	}


	public String getBrakeCaliperNo1() {
		return brakeCaliperNo1;
	}


	public void setBrakeCaliperNo1(String brakeCaliperNo1) {
		this.brakeCaliperNo1 = brakeCaliperNo1;
	}


	public String getBrakeCaliperNo2() {
		return brakeCaliperNo2;
	}


	public void setBrakeCaliperNo2(String brakeCaliperNo2) {
		this.brakeCaliperNo2 = brakeCaliperNo2;
	}


	public String getBrakeCaliperNo3() {
		return brakeCaliperNo3;
	}


	public void setBrakeCaliperNo3(String brakeCaliperNo3) {
		this.brakeCaliperNo3 = brakeCaliperNo3;
	}


	public String getBrakeCaliperNo4() {
		return brakeCaliperNo4;
	}


	public void setBrakeCaliperNo4(String brakeCaliperNo4) {
		this.brakeCaliperNo4 = brakeCaliperNo4;
	}


	public String getVsaAtPrimarySuspNo() {
		return vsaAtPrimarySuspNo;
	}


	public void setVsaAtPrimarySuspNo(String vsaAtPrimarySuspNo) {
		this.vsaAtPrimarySuspNo = vsaAtPrimarySuspNo;
	}


	public String getVsaAtPrimarySuspMake() {
		return vsaAtPrimarySuspMake;
	}


	public void setVsaAtPrimarySuspMake(String vsaAtPrimarySuspMake) {
		this.vsaAtPrimarySuspMake = vsaAtPrimarySuspMake;
	}


	public String getVsaAtSecondarySuspNo() {
		return vsaAtSecondarySuspNo;
	}


	public void setVsaAtSecondarySuspNo(String vsaAtSecondarySuspNo) {
		this.vsaAtSecondarySuspNo = vsaAtSecondarySuspNo;
	}


	public String getVsaAtSecondarySuspMake() {
		return vsaAtSecondarySuspMake;
	}


	public void setVsaAtSecondarySuspMake(String vsaAtSecondarySuspMake) {
		this.vsaAtSecondarySuspMake = vsaAtSecondarySuspMake;
	}


	public String getLateralShockAbsorberNo() {
		return lateralShockAbsorberNo;
	}


	public void setLateralShockAbsorberNo(String lateralShockAbsorberNo) {
		this.lateralShockAbsorberNo = lateralShockAbsorberNo;
	}


	public String getLateralShockAbsorberMake() {
		return lateralShockAbsorberMake;
	}


	public void setLateralShockAbsorberMake(String lateralShockAbsorberMake) {
		this.lateralShockAbsorberMake = lateralShockAbsorberMake;
	}


	public String getSecAirSpringNo1() {
		return secAirSpringNo1;
	}


	public void setSecAirSpringNo1(String secAirSpringNo1) {
		this.secAirSpringNo1 = secAirSpringNo1;
	}


	public String getSecAirSpringNo2() {
		return secAirSpringNo2;
	}


	public void setSecAirSpringNo2(String secAirSpringNo2) {
		this.secAirSpringNo2 = secAirSpringNo2;
	}


	public Integer getStaticSipBogieFlag() {
		return staticSipBogieFlag;
	}


	public void setStaticSipBogieFlag(Integer staticSipBogieFlag) {
		this.staticSipBogieFlag = staticSipBogieFlag;
	}


	public Integer getSipFinalFlag() {
		return sipFinalFlag;
	}


	public void setSipFinalFlag(Integer sipFinalFlag) {
		this.sipFinalFlag = sipFinalFlag;
	}


	public String getTestingClearanceMemoDocNo() {
		return testingClearanceMemoDocNo;
	}


	public void setTestingClearanceMemoDocNo(String testingClearanceMemoDocNo) {
		this.testingClearanceMemoDocNo = testingClearanceMemoDocNo;
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


	public String getTestingClearanceMemoStatus() {
		return testingClearanceMemoStatus;
	}


	public void setTestingClearanceMemoStatus(String testingClearanceMemoStatus) {
		this.testingClearanceMemoStatus = testingClearanceMemoStatus;
	}


	public String getTestingClearanceMemoRemark() {
		return testingClearanceMemoRemark;
	}


	public void setTestingClearanceMemoRemark(String testingClearanceMemoRemark) {
		this.testingClearanceMemoRemark = testingClearanceMemoRemark;
	}

	
	
	
}
