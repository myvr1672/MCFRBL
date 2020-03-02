package beans;

import java.util.Date;

public class FurnishingTransaction implements java.io.Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private Integer furnishingAssetId;
	private String stageId;
	private String previousStageId;
	private Integer shellAssetId;
	private String shellType;
	private Integer paintAssetId;
	private Integer bogiePpSideAssetId;
	private Integer bogieNppSideAssetId;
	private Date assemblyStartDate;
	private Date expectedExitDate;
	private Date assemblyEndDate;
	private Date assemblyDispatchDate;
	private String transactionDate;
	private String transactionUser;
	private String remarks;
	private String exitRemarks;
	private String lateRemarks;
	private Integer asignedFlag;
	private Date receiptAtNextStage;
	private String coachNumber;
	private String coachType;
	private String productionBy;
	private String vendorAllotted;
	private Date vendorAllottedDate;
	private Integer airBrakeTestingFlag;
	private Integer plumbingTestingFlag;
	private Integer cbcTestingFlag;
	private Integer electricalTestingFlag;
	private Integer dgLoadTestingFlag;
	private String exitRemarkFurnishing;
	private String lateReasonFurnishing;
	private Date dispatchDateInQuality;
	private Date receiptDateAtQuality;
	private Integer assignedFlagQuality;
	private Integer showerTestingFlag;
	private Integer cctvTestingFlag;
	private Integer fibaTestingFlag;
	private String fibaPPMake;
	private String fibaPPSerial;
	private Date fibaPPMfgDate;
	private String fibaNPPMake;
	private String fibaNPPSerial;
	private Date fibaNPPMfgDate;
	private String indicatorPPMake;
	private String indicatorPPSerial;
	private Date indicatorPPMfgDate;
	private String indicatorNPPMake;
	private String indicatorNPPSerial;
	private Date indicatorNPPMfgDate;
	
	private String biotankLavatoryMake_1;
	private String biotankLavatoryMake_2;
	private String biotankLavatoryMake_3;
	private String biotankLavatoryMake_4;
	
	private String biotankBacteriaType;
	private String biotankBacteriaMake;
	private Date biotankBacteriaFeedingDate;
	private String brakePanelMake;
	private String brakePanelSrno;
	private String distributorValveMake;
	private String distributorValveSrno;
	private String pullBoxMake;
	private String pullBoxNo;
	private String handBrakeMake;
	private String handBrakeNo;
	private Integer biotankTestingFlag;
	private String yawDamperPPVertical;
	private String yawDamperPPHorizontal;
	private String yawDamperNPPVertical;
	private String yawDamperNPPHorizontal;
	private Integer fireSmokeTestingFlag;
	private String bufferMake;
	private String bufferSrno;
	private Integer electricalStage3Flag;
	private Integer electricalStage3aFlag;
	private Integer electricalStage9Flag;
	private Integer electricalAirDeliveryFlag;
	//electrical_air_delivery_flag
	public FurnishingTransaction()
	{
		
	}

	public FurnishingTransaction(Integer furnishingAssetId, String stageId, String previousStageId,
			Integer shellAssetId, String shellType, Integer paintAssetId, Integer bogiePpSideAssetId,
			Integer bogieNppSideAssetId, Date assemblyStartDate, Date expectedExitDate, Date assemblyEndDate,
			Date assemblyDispatchDate, String transactionDate, String transactionUser, String remarks,
			String exitRemarks, String lateRemarks, Integer asignedFlag, Date receiptAtNextStage, String coachNumber,
			String coachType, String productionBy, String vendorAllotted, Date vendorAllottedDate,
			Integer airBrakeTestingFlag, Integer plumbingTestingFlag, Integer cbcTestingFlag,
			Integer electricalTestingFlag, Integer dgLoadTestingFlag, String exitRemarkFurnishing,
			String lateReasonFurnishing, Date dispatchDateInQuality, Date receiptDateAtQuality,
			Integer assignedFlagQuality, Integer showerTestingFlag, Integer cctvTestingFlag, Integer fibaTestingFlag,
			String fibaPPMake, String fibaPPSerial, Date fibaPPMfgDate, String fibaNPPMake, String fibaNPPSerial,
			Date fibaNPPMfgDate, String indicatorPPMake, String indicatorPPSerial, Date indicatorPPMfgDate,
			String indicatorNPPMake, String indicatorNPPSerial, Date indicatorNPPMfgDate, String biotankLavatoryMake_1,
			String biotankLavatoryMake_2, String biotankLavatoryMake_3, String biotankLavatoryMake_4,
			String biotankBacteriaType, String biotankBacteriaMake, Date biotankBacteriaFeedingDate,
			String brakePanelMake, String brakePanelSrno, String distributorValveMake, String distributorValveSrno,
			String pullBoxMake, String pullBoxNo, String handBrakeMake, String handBrakeNo, Integer biotankTestingFlag,
			String yawDamperPPVertical, String yawDamperPPHorizontal, String yawDamperNPPVertical,
			String yawDamperNPPHorizontal, Integer fireSmokeTestingFlag, String bufferMake, String bufferSrno, Integer electricalStage3Flag,Integer electricalStage3aFlag,
			Integer electricalStage9Flag, Integer electricalAirDeliveryFlag) {
		super();
		this.furnishingAssetId = furnishingAssetId;
		this.stageId = stageId;
		this.previousStageId = previousStageId;
		this.shellAssetId = shellAssetId;
		this.shellType = shellType;
		this.paintAssetId = paintAssetId;
		this.bogiePpSideAssetId = bogiePpSideAssetId;
		this.bogieNppSideAssetId = bogieNppSideAssetId;
		this.assemblyStartDate = assemblyStartDate;
		this.expectedExitDate = expectedExitDate;
		this.assemblyEndDate = assemblyEndDate;
		this.assemblyDispatchDate = assemblyDispatchDate;
		this.transactionDate = transactionDate;
		this.transactionUser = transactionUser;
		this.remarks = remarks;
		this.exitRemarks = exitRemarks;
		this.lateRemarks = lateRemarks;
		this.asignedFlag = asignedFlag;
		this.receiptAtNextStage = receiptAtNextStage;
		this.coachNumber = coachNumber;
		this.coachType = coachType;
		this.productionBy = productionBy;
		this.vendorAllotted = vendorAllotted;
		this.vendorAllottedDate = vendorAllottedDate;
		this.airBrakeTestingFlag = airBrakeTestingFlag;
		this.plumbingTestingFlag = plumbingTestingFlag;
		this.cbcTestingFlag = cbcTestingFlag;
		this.electricalTestingFlag = electricalTestingFlag;
		this.dgLoadTestingFlag = dgLoadTestingFlag;
		this.exitRemarkFurnishing = exitRemarkFurnishing;
		this.lateReasonFurnishing = lateReasonFurnishing;
		this.dispatchDateInQuality = dispatchDateInQuality;
		this.receiptDateAtQuality = receiptDateAtQuality;
		this.assignedFlagQuality = assignedFlagQuality;
		this.showerTestingFlag = showerTestingFlag;
		this.cctvTestingFlag = cctvTestingFlag;
		this.fibaTestingFlag = fibaTestingFlag;
		this.fibaPPMake = fibaPPMake;
		this.fibaPPSerial = fibaPPSerial;
		this.fibaPPMfgDate = fibaPPMfgDate;
		this.fibaNPPMake = fibaNPPMake;
		this.fibaNPPSerial = fibaNPPSerial;
		this.fibaNPPMfgDate = fibaNPPMfgDate;
		this.indicatorPPMake = indicatorPPMake;
		this.indicatorPPSerial = indicatorPPSerial;
		this.indicatorPPMfgDate = indicatorPPMfgDate;
		this.indicatorNPPMake = indicatorNPPMake;
		this.indicatorNPPSerial = indicatorNPPSerial;
		this.indicatorNPPMfgDate = indicatorNPPMfgDate;
		this.biotankLavatoryMake_1 = biotankLavatoryMake_1;
		this.biotankLavatoryMake_2 = biotankLavatoryMake_2;
		this.biotankLavatoryMake_3 = biotankLavatoryMake_3;
		this.biotankLavatoryMake_4 = biotankLavatoryMake_4;
		this.biotankBacteriaType = biotankBacteriaType;
		this.biotankBacteriaMake = biotankBacteriaMake;
		this.biotankBacteriaFeedingDate = biotankBacteriaFeedingDate;
		this.brakePanelMake = brakePanelMake;
		this.brakePanelSrno = brakePanelSrno;
		this.distributorValveMake = distributorValveMake;
		this.distributorValveSrno = distributorValveSrno;
		this.pullBoxMake = pullBoxMake;
		this.pullBoxNo = pullBoxNo;
		this.handBrakeMake = handBrakeMake;
		this.handBrakeNo = handBrakeNo;
		this.biotankTestingFlag = biotankTestingFlag;
		this.yawDamperPPVertical = yawDamperPPVertical;
		this.yawDamperPPHorizontal = yawDamperPPHorizontal;
		this.yawDamperNPPVertical = yawDamperNPPVertical;
		this.yawDamperNPPHorizontal = yawDamperNPPHorizontal;
		this.fireSmokeTestingFlag=fireSmokeTestingFlag;
		this.bufferMake=bufferMake;
		this.bufferSrno=bufferSrno;
		this.electricalStage3aFlag=electricalStage3Flag;
		this.electricalStage3aFlag=electricalStage3aFlag;
		this.electricalStage9Flag=electricalStage9Flag;
		this.electricalAirDeliveryFlag=electricalAirDeliveryFlag;
	}










	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}



	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
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



	public String getShellType() {
		return shellType;
	}



	public void setShellType(String shellType) {
		this.shellType = shellType;
	}



	public Integer getPaintAssetId() {
		return paintAssetId;
	}



	public void setPaintAssetId(Integer paintAssetId) {
		this.paintAssetId = paintAssetId;
	}



	public Integer getBogiePpSideAssetId() {
		return bogiePpSideAssetId;
	}



	public void setBogiePpSideAssetId(Integer bogiePpSideAssetId) {
		this.bogiePpSideAssetId = bogiePpSideAssetId;
	}



	public Integer getBogieNppSideAssetId() {
		return bogieNppSideAssetId;
	}



	public void setBogieNppSideAssetId(Integer bogieNppSideAssetId) {
		this.bogieNppSideAssetId = bogieNppSideAssetId;
	}



	public Date getAssemblyStartDate() {
		return assemblyStartDate;
	}



	public void setAssemblyStartDate(Date assemblyStartDate) {
		this.assemblyStartDate = assemblyStartDate;
	}



	public Date getExpectedExitDate() {
		return expectedExitDate;
	}



	public void setExpectedExitDate(Date expectedExitDate) {
		this.expectedExitDate = expectedExitDate;
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



	public String getTransactionDate() {
		return transactionDate;
	}



	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}



	public String getTransactionUser() {
		return transactionUser;
	}



	public void setTransactionUser(String transactionUser) {
		this.transactionUser = transactionUser;
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



	public String getLateRemarks() {
		return lateRemarks;
	}



	public void setLateRemarks(String lateRemarks) {
		this.lateRemarks = lateRemarks;
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

	public String getCoachNumber() {
		return coachNumber;
	}

	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public String getProductionBy() {
		return productionBy;
	}

	public void setProductionBy(String productionBy) {
		this.productionBy = productionBy;
	}

	public String getVendorAllotted() {
		return vendorAllotted;
	}

	public void setVendorAllotted(String vendorAllotted) {
		this.vendorAllotted = vendorAllotted;
	}

	public Date getVendorAllottedDate() {
		return vendorAllottedDate;
	}

	public void setVendorAllottedDate(Date vendorAllottedDate) {
		this.vendorAllottedDate = vendorAllottedDate;
	}



	public Integer getAirBrakeTestingFlag() {
		return airBrakeTestingFlag;
	}



	public void setAirBrakeTestingFlag(Integer airBrakeTestingFlag) {
		this.airBrakeTestingFlag = airBrakeTestingFlag;
	}



	public Integer getPlumbingTestingFlag() {
		return plumbingTestingFlag;
	}



	public void setPlumbingTestingFlag(Integer plumbingTestingFlag) {
		this.plumbingTestingFlag = plumbingTestingFlag;
	}



	public Integer getCbcTestingFlag() {
		return cbcTestingFlag;
	}



	public void setCbcTestingFlag(Integer cbcTestingFlag) {
		this.cbcTestingFlag = cbcTestingFlag;
	}



	public Integer getElectricalTestingFlag() {
		return electricalTestingFlag;
	}



	public void setElectricalTestingFlag(Integer electricalTestingFlag) {
		this.electricalTestingFlag = electricalTestingFlag;
	}



	public Integer getDgLoadTestingFlag() {
		return dgLoadTestingFlag;
	}



	public void setDgLoadTestingFlag(Integer dgLoadTestingFlag) {
		this.dgLoadTestingFlag = dgLoadTestingFlag;
	}



	public String getExitRemarkFurnishing() {
		return exitRemarkFurnishing;
	}



	public void setExitRemarkFurnishing(String exitRemarkFurnishing) {
		this.exitRemarkFurnishing = exitRemarkFurnishing;
	}



	public String getLateReasonFurnishing() {
		return lateReasonFurnishing;
	}



	public void setLateReasonFurnishing(String lateReasonFurnishing) {
		this.lateReasonFurnishing = lateReasonFurnishing;
	}



	public Date getReceiptDateAtQuality() {
		return receiptDateAtQuality;
	}



	public void setReceiptDateAtQuality(Date receiptDateAtQuality) {
		this.receiptDateAtQuality = receiptDateAtQuality;
	}



	public Integer getAssignedFlagQuality() {
		return assignedFlagQuality;
	}



	public void setAssignedFlagQuality(Integer assignedFlagQuality) {
		this.assignedFlagQuality = assignedFlagQuality;
	}



	public Date getDispatchDateInQuality() {
		return dispatchDateInQuality;
	}



	public void setDispatchDateInQuality(Date dispatchDateInQuality) {
		this.dispatchDateInQuality = dispatchDateInQuality;
	}



	public Integer getShowerTestingFlag() {
		return showerTestingFlag;
	}



	public void setShowerTestingFlag(Integer showerTestingFlag) {
		this.showerTestingFlag = showerTestingFlag;
	}



	public Integer getCctvTestingFlag() {
		return cctvTestingFlag;
	}



	public void setCctvTestingFlag(Integer cctvTestingFlag) {
		this.cctvTestingFlag = cctvTestingFlag;
	}



	public Integer getFibaTestingFlag() {
		return fibaTestingFlag;
	}



	public void setFibaTestingFlag(Integer fibaTestingFlag) {
		this.fibaTestingFlag = fibaTestingFlag;
	}





	public String getFibaPPMake() {
		return fibaPPMake;
	}





	public void setFibaPPMake(String fibaPPMake) {
		this.fibaPPMake = fibaPPMake;
	}





	public String getFibaPPSerial() {
		return fibaPPSerial;
	}





	public void setFibaPPSerial(String fibaPPSerial) {
		this.fibaPPSerial = fibaPPSerial;
	}





	public Date getFibaPPMfgDate() {
		return fibaPPMfgDate;
	}





	public void setFibaPPMfgDate(Date fibaPPMfgDate) {
		this.fibaPPMfgDate = fibaPPMfgDate;
	}





	public String getFibaNPPMake() {
		return fibaNPPMake;
	}





	public void setFibaNPPMake(String fibaNPPMake) {
		this.fibaNPPMake = fibaNPPMake;
	}





	public String getFibaNPPSerial() {
		return fibaNPPSerial;
	}





	public void setFibaNPPSerial(String fibaNPPSerial) {
		this.fibaNPPSerial = fibaNPPSerial;
	}





	public Date getFibaNPPMfgDate() {
		return fibaNPPMfgDate;
	}





	public void setFibaNPPMfgDate(Date fibaNPPMfgDate) {
		this.fibaNPPMfgDate = fibaNPPMfgDate;
	}





	public String getIndicatorPPMake() {
		return indicatorPPMake;
	}





	public void setIndicatorPPMake(String indicatorPPMake) {
		this.indicatorPPMake = indicatorPPMake;
	}





	public String getIndicatorPPSerial() {
		return indicatorPPSerial;
	}





	public void setIndicatorPPSerial(String indicatorPPSerial) {
		this.indicatorPPSerial = indicatorPPSerial;
	}





	public Date getIndicatorPPMfgDate() {
		return indicatorPPMfgDate;
	}





	public void setIndicatorPPMfgDate(Date indicatorPPMfgDate) {
		this.indicatorPPMfgDate = indicatorPPMfgDate;
	}





	public String getIndicatorNPPMake() {
		return indicatorNPPMake;
	}





	public void setIndicatorNPPMake(String indicatorNPPMake) {
		this.indicatorNPPMake = indicatorNPPMake;
	}





	public String getIndicatorNPPSerial() {
		return indicatorNPPSerial;
	}





	public void setIndicatorNPPSerial(String indicatorNPPSerial) {
		this.indicatorNPPSerial = indicatorNPPSerial;
	}





	public Date getIndicatorNPPMfgDate() {
		return indicatorNPPMfgDate;
	}





	public void setIndicatorNPPMfgDate(Date indicatorNPPMfgDate) {
		this.indicatorNPPMfgDate = indicatorNPPMfgDate;
	}





	public String getBiotankLavatoryMake_1() {
		return biotankLavatoryMake_1;
	}





	public void setBiotankLavatoryMake_1(String biotankLavatoryMake_1) {
		this.biotankLavatoryMake_1 = biotankLavatoryMake_1;
	}





	public String getBiotankLavatoryMake_2() {
		return biotankLavatoryMake_2;
	}





	public void setBiotankLavatoryMake_2(String biotankLavatoryMake_2) {
		this.biotankLavatoryMake_2 = biotankLavatoryMake_2;
	}





	public String getBiotankLavatoryMake_3() {
		return biotankLavatoryMake_3;
	}





	public void setBiotankLavatoryMake_3(String biotankLavatoryMake_3) {
		this.biotankLavatoryMake_3 = biotankLavatoryMake_3;
	}





	public String getBiotankLavatoryMake_4() {
		return biotankLavatoryMake_4;
	}





	public void setBiotankLavatoryMake_4(String biotankLavatoryMake_4) {
		this.biotankLavatoryMake_4 = biotankLavatoryMake_4;
	}





	public String getBiotankBacteriaType() {
		return biotankBacteriaType;
	}





	public void setBiotankBacteriaType(String biotankBacteriaType) {
		this.biotankBacteriaType = biotankBacteriaType;
	}





	public String getBiotankBacteriaMake() {
		return biotankBacteriaMake;
	}





	public void setBiotankBacteriaMake(String biotankBacteriaMake) {
		this.biotankBacteriaMake = biotankBacteriaMake;
	}





	public Date getBiotankBacteriaFeedingDate() {
		return biotankBacteriaFeedingDate;
	}





	public void setBiotankBacteriaFeedingDate(Date biotankBacteriaFeedingDate) {
		this.biotankBacteriaFeedingDate = biotankBacteriaFeedingDate;
	}





	public String getBrakePanelMake() {
		return brakePanelMake;
	}





	public void setBrakePanelMake(String brakePanelMake) {
		this.brakePanelMake = brakePanelMake;
	}





	public String getBrakePanelSrno() {
		return brakePanelSrno;
	}





	public void setBrakePanelSrno(String brakePanelSrno) {
		this.brakePanelSrno = brakePanelSrno;
	}





	public String getDistributorValveMake() {
		return distributorValveMake;
	}





	public void setDistributorValveMake(String distributorValveMake) {
		this.distributorValveMake = distributorValveMake;
	}





	public String getDistributorValveSrno() {
		return distributorValveSrno;
	}





	public void setDistributorValveSrno(String distributorValveSrno) {
		this.distributorValveSrno = distributorValveSrno;
	}





	public String getPullBoxMake() {
		return pullBoxMake;
	}





	public void setPullBoxMake(String pullBoxMake) {
		this.pullBoxMake = pullBoxMake;
	}





	public String getPullBoxNo() {
		return pullBoxNo;
	}





	public void setPullBoxNo(String pullBoxNo) {
		this.pullBoxNo = pullBoxNo;
	}





	public String getHandBrakeMake() {
		return handBrakeMake;
	}





	public void setHandBrakeMake(String handBrakeMake) {
		this.handBrakeMake = handBrakeMake;
	}





	public String getHandBrakeNo() {
		return handBrakeNo;
	}





	public void setHandBrakeNo(String handBrakeNo) {
		this.handBrakeNo = handBrakeNo;
	}





	public Integer getBiotankTestingFlag() {
		return biotankTestingFlag;
	}





	public void setBiotankTestingFlag(Integer biotankTestingFlag) {
		this.biotankTestingFlag = biotankTestingFlag;
	}

	public String getYawDamperPPVertical() {
		return yawDamperPPVertical;
	}

	public void setYawDamperPPVertical(String yawDamperPPVertical) {
		this.yawDamperPPVertical = yawDamperPPVertical;
	}

	public String getYawDamperPPHorizontal() {
		return yawDamperPPHorizontal;
	}

	public void setYawDamperPPHorizontal(String yawDamperPPHorizontal) {
		this.yawDamperPPHorizontal = yawDamperPPHorizontal;
	}

	public String getYawDamperNPPVertical() {
		return yawDamperNPPVertical;
	}

	public void setYawDamperNPPVertical(String yawDamperNPPVertical) {
		this.yawDamperNPPVertical = yawDamperNPPVertical;
	}

	public String getYawDamperNPPHorizontal() {
		return yawDamperNPPHorizontal;
	}

	public void setYawDamperNPPHorizontal(String yawDamperNPPHorizontal) {
		this.yawDamperNPPHorizontal = yawDamperNPPHorizontal;
	}

	public Integer getFireSmokeTestingFlag() {
		return fireSmokeTestingFlag;
	}

	public void setFireSmokeTestingFlag(Integer fireSmokeTestingFlag) {
		this.fireSmokeTestingFlag = fireSmokeTestingFlag;
	}

	public String getBufferMake() {
		return bufferMake;
	}

	public void setBufferMake(String bufferMake) {
		this.bufferMake = bufferMake;
	}

	public String getBufferSrno() {
		return bufferSrno;
	}

	public void setBufferSrno(String bufferSrno) {
		this.bufferSrno = bufferSrno;
	}

	public Integer getElectricalStage3Flag() {
		return electricalStage3Flag;
	}

	public void setElectricalStage3Flag(Integer electricalStage3Flag) {
		this.electricalStage3Flag = electricalStage3Flag;
	}

	public Integer getElectricalStage3aFlag() {
		return electricalStage3aFlag;
	}

	public void setElectricalStage3aFlag(Integer electricalStage3aFlag) {
		this.electricalStage3aFlag = electricalStage3aFlag;
	}

	public Integer getElectricalStage9Flag() {
		return electricalStage9Flag;
	}

	public void setElectricalStage9Flag(Integer electricalStage9Flag) {
		this.electricalStage9Flag = electricalStage9Flag;
	}

	public Integer getElectricalAirDeliveryFlag() {
		return electricalAirDeliveryFlag;
	}

	public void setElectricalAirDeliveryFlag(Integer electricalAirDeliveryFlag) {
		this.electricalAirDeliveryFlag = electricalAirDeliveryFlag;
	}
}
