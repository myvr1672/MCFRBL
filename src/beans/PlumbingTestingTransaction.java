package beans;

import java.util.Date;

public class PlumbingTestingTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer furnishingAssetId;
    private String docNo;
    private Date dateOfTesting;
    private String shift;
    private String sealingPipeJointsFlag;
    private String sealingLavatoryFlag;
    private String sealingDoorWayGangFlag;
    private String waterFlowLotahFlag;
    private String waterFlowInsideWashbasinFlag;
    private String flushingArrangementFlag;
    private String waterFlowLavatoryFlag;
    private String waterFlowCommodeFlag;
    private String waterFlowOusideWashbasinFlag;
    private String sealingSTrapFlag;
    private String waterFlowFlexibleFaucetFlag;
    private String modificationDetails;
    private String trialItemsDetails;
    private String remarks;
    private String entryBy ;
    private Date entryDate;
    private String testingStatusPlumbing;
	
    
    public PlumbingTestingTransaction()
    {
    	
    }


	public PlumbingTestingTransaction(Integer furnishingAssetId, String docNo, Date dateOfTesting, String shift,
			String sealingPipeJointsFlag, String sealingLavatoryFlag, String sealingDoorWayGangFlag,
			String waterFlowLotahFlag, String waterFlowInsideWashbasinFlag, String flushingArrangementFlag,
			String waterFlowLavatoryFlag, String waterFlowCommodeFlag, String waterFlowOusideWashbasinFlag,
			String sealingSTrapFlag, String waterFlowFlexibleFaucetFlag, String modificationDetails,
			String trialItemsDetails, String remarks, String entryBy, Date entryDate,String testingStatusPlumbing) {
		super();
		this.furnishingAssetId = furnishingAssetId;
		this.docNo = docNo;
		this.dateOfTesting = dateOfTesting;
		this.shift = shift;
		this.sealingPipeJointsFlag = sealingPipeJointsFlag;
		this.sealingLavatoryFlag = sealingLavatoryFlag;
		this.sealingDoorWayGangFlag = sealingDoorWayGangFlag;
		this.waterFlowLotahFlag = waterFlowLotahFlag;
		this.waterFlowInsideWashbasinFlag = waterFlowInsideWashbasinFlag;
		this.flushingArrangementFlag = flushingArrangementFlag;
		this.waterFlowLavatoryFlag = waterFlowLavatoryFlag;
		this.waterFlowCommodeFlag = waterFlowCommodeFlag;
		this.waterFlowOusideWashbasinFlag = waterFlowOusideWashbasinFlag;
		this.sealingSTrapFlag = sealingSTrapFlag;
		this.waterFlowFlexibleFaucetFlag = waterFlowFlexibleFaucetFlag;
		this.modificationDetails = modificationDetails;
		this.trialItemsDetails = trialItemsDetails;
		this.remarks = remarks;
		this.entryBy = entryBy;
		this.entryDate = entryDate;
		this.testingStatusPlumbing=testingStatusPlumbing;
	}


	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}


	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}


	public String getDocNo() {
		return docNo;
	}


	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}


	public Date getDateOfTesting() {
		return dateOfTesting;
	}


	public void setDateOfTesting(Date dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}


	public String getShift() {
		return shift;
	}


	public void setShift(String shift) {
		this.shift = shift;
	}


	public String getSealingPipeJointsFlag() {
		return sealingPipeJointsFlag;
	}


	public void setSealingPipeJointsFlag(String sealingPipeJointsFlag) {
		this.sealingPipeJointsFlag = sealingPipeJointsFlag;
	}


	public String getSealingLavatoryFlag() {
		return sealingLavatoryFlag;
	}


	public void setSealingLavatoryFlag(String sealingLavatoryFlag) {
		this.sealingLavatoryFlag = sealingLavatoryFlag;
	}


	public String getSealingDoorWayGangFlag() {
		return sealingDoorWayGangFlag;
	}


	public void setSealingDoorWayGangFlag(String sealingDoorWayGangFlag) {
		this.sealingDoorWayGangFlag = sealingDoorWayGangFlag;
	}


	public String getWaterFlowLotahFlag() {
		return waterFlowLotahFlag;
	}


	public void setWaterFlowLotahFlag(String waterFlowLotahFlag) {
		this.waterFlowLotahFlag = waterFlowLotahFlag;
	}


	public String getWaterFlowInsideWashbasinFlag() {
		return waterFlowInsideWashbasinFlag;
	}


	public void setWaterFlowInsideWashbasinFlag(String waterFlowInsideWashbasinFlag) {
		this.waterFlowInsideWashbasinFlag = waterFlowInsideWashbasinFlag;
	}


	public String getFlushingArrangementFlag() {
		return flushingArrangementFlag;
	}


	public void setFlushingArrangementFlag(String flushingArrangementFlag) {
		this.flushingArrangementFlag = flushingArrangementFlag;
	}


	public String getWaterFlowLavatoryFlag() {
		return waterFlowLavatoryFlag;
	}


	public void setWaterFlowLavatoryFlag(String waterFlowLavatoryFlag) {
		this.waterFlowLavatoryFlag = waterFlowLavatoryFlag;
	}


	public String getWaterFlowCommodeFlag() {
		return waterFlowCommodeFlag;
	}


	public void setWaterFlowCommodeFlag(String waterFlowCommodeFlag) {
		this.waterFlowCommodeFlag = waterFlowCommodeFlag;
	}


	public String getWaterFlowOusideWashbasinFlag() {
		return waterFlowOusideWashbasinFlag;
	}


	public void setWaterFlowOusideWashbasinFlag(String waterFlowOusideWashbasinFlag) {
		this.waterFlowOusideWashbasinFlag = waterFlowOusideWashbasinFlag;
	}

	public String getSealingSTrapFlag() {
		return sealingSTrapFlag;
	}


	public void setSealingSTrapFlag(String sealingSTrapFlag) {
		this.sealingSTrapFlag = sealingSTrapFlag;
	}


	public String getWaterFlowFlexibleFaucetFlag() {
		return waterFlowFlexibleFaucetFlag;
	}


	public void setWaterFlowFlexibleFaucetFlag(String waterFlowFlexibleFaucetFlag) {
		this.waterFlowFlexibleFaucetFlag = waterFlowFlexibleFaucetFlag;
	}


	public String getModificationDetails() {
		return modificationDetails;
	}


	public void setModificationDetails(String modificationDetails) {
		this.modificationDetails = modificationDetails;
	}


	public String getTrialItemsDetails() {
		return trialItemsDetails;
	}


	public void setTrialItemsDetails(String trialItemsDetails) {
		this.trialItemsDetails = trialItemsDetails;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public String getEntryBy() {
		return entryBy;
	}


	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}


	public Date getEntryDate() {
		return entryDate;
	}


	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}


	public String getTestingStatusPlumbing() {
		return testingStatusPlumbing;
	}


	public void setTestingStatusPlumbing(String testingStatusPlumbing) {
		this.testingStatusPlumbing = testingStatusPlumbing;
	}
    
    
}
