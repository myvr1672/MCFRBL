package beans;

import java.util.Date;

public class FinishingTransaction implements java.io.Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private Integer finishingAssetId;
	
	private String stageId;
	private String previousStageId;
	private Integer furnishingAssetId;
	private Integer shellAssetId;
	private Integer bogiePpSideAssetId;
	private Integer bogieNppSideAssetId;
	private String coachNumber;
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
	
	
	
	public FinishingTransaction()
	{
		
	}


	public FinishingTransaction(Integer finishingAssetId, Integer furnishingAssetId, String stageId,
			String previousStageId, Integer shellAssetId, Integer bogiePpSideAssetId, Integer bogieNppSideAssetId,
			String coachNumber, Date assemblyStartDate, Date expectedExitDate, Date assemblyEndDate,
			Date assemblyDispatchDate, String transactionDate, String transactionUser, String remarks,
			String exitRemarks, String lateRemarks, Integer asignedFlag, Date receiptAtNextStage) {
		super();
		this.finishingAssetId = finishingAssetId;
		this.furnishingAssetId = furnishingAssetId;
		this.stageId = stageId;
		this.previousStageId = previousStageId;
		this.shellAssetId = shellAssetId;
		this.bogiePpSideAssetId = bogiePpSideAssetId;
		this.bogieNppSideAssetId = bogieNppSideAssetId;
		this.coachNumber = coachNumber;
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
	}




	public Integer getFinishingAssetId() {
		return finishingAssetId;
	}




	public void setFinishingAssetId(Integer finishingAssetId) {
		this.finishingAssetId = finishingAssetId;
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




	public String getCoachNumber() {
		return coachNumber;
	}




	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
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


}
