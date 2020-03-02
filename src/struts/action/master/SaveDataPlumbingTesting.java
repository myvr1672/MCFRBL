package struts.action.master;

import dao.DaoPlumbingTesting;

import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import beans.PlumbingTestingTransaction;
import beans.FurnishingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;


public class SaveDataPlumbingTesting {
	
	private String furnishingAssetId;
	private String plumbingDocNo;
	private String plumbingShift;
	private String plumbingDate;
	private String sealingPipeJointsFlag;
	private String  sealingLavatoryFlag;
	private String  sealingDoorWayGangFlag;
	private String  waterFlowLotahFlag;
	private String  waterFlowInsideWashbasinFlag;
	private String  flushingArrangementFlag;
	private String  waterFlowLavatoryFlag;
	private String  waterFlowCommodeFlag;
	private String  waterFlowOusideWashbasinFlag;
	private String  sealingSTrapFlag;
	private String  waterFlowFlexibleFaucetFlag;
	private String  modificationDetails;
	private String  trialItemsDetails;
	private String  remarks;
	private String testingStatusPlumbing;
	private String entryBy;
	private String entryDate;
	
	
	public String saveDataPlumbing()
	{
		
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryDate=new Timestamp(System.currentTimeMillis());
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		PlumbingTestingTransaction plumbingTestingTransaction= new PlumbingTestingTransaction();
		if(!"".equals(plumbingDate))
		{
			plumbingTestingTransaction.setDateOfTesting(DateUtil.convertToDate(plumbingDate));
		}
		plumbingTestingTransaction.setFurnishingAssetId(furnishingAssetIdAsInt);
		plumbingTestingTransaction.setDocNo(plumbingDocNo);
		plumbingTestingTransaction.setShift(plumbingShift);
		plumbingTestingTransaction.setSealingPipeJointsFlag(sealingPipeJointsFlag);
		plumbingTestingTransaction.setSealingLavatoryFlag(sealingLavatoryFlag);
		plumbingTestingTransaction.setSealingDoorWayGangFlag(sealingDoorWayGangFlag);
		plumbingTestingTransaction.setWaterFlowLotahFlag(waterFlowLotahFlag);
		plumbingTestingTransaction.setWaterFlowInsideWashbasinFlag(waterFlowInsideWashbasinFlag);
		plumbingTestingTransaction.setFlushingArrangementFlag(flushingArrangementFlag);
		plumbingTestingTransaction.setWaterFlowLavatoryFlag(waterFlowLavatoryFlag);
		plumbingTestingTransaction.setWaterFlowCommodeFlag(waterFlowCommodeFlag);
		plumbingTestingTransaction.setWaterFlowOusideWashbasinFlag(waterFlowOusideWashbasinFlag);
		plumbingTestingTransaction.setSealingSTrapFlag(sealingSTrapFlag);
		plumbingTestingTransaction.setWaterFlowFlexibleFaucetFlag(waterFlowFlexibleFaucetFlag);
		plumbingTestingTransaction.setModificationDetails(modificationDetails);
		plumbingTestingTransaction.setTrialItemsDetails(trialItemsDetails);
		plumbingTestingTransaction.setRemarks(remarks);
		plumbingTestingTransaction.setTestingStatusPlumbing(testingStatusPlumbing);
		plumbingTestingTransaction.setEntryBy(userID);
		plumbingTestingTransaction.setEntryDate(entryDate);
		FurnishingTransaction furnishingTran= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		
		furnishingTran.setPlumbingTestingFlag(1);
		System.out.println("last!!");
		
		
		
		try
		{	
			System.out.println(furnishingAssetIdAsInt);
			DaoPlumbingTesting dao= new DaoPlumbingTesting ();
			dao.saveTesting(plumbingTestingTransaction, furnishingTran);
			//System.out.println(shellAssetIdAsInt);
			System.out.println("new"+furnishingAssetIdAsInt);
			return "success";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		
	}


	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}


	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}


	public String getPlumbingDocNo() {
		return plumbingDocNo;
	}


	public void setPlumbingDocNo(String plumbingDocNo) {
		this.plumbingDocNo = plumbingDocNo;
	}


	public String getPlumbingShift() {
		return plumbingShift;
	}


	public void setPlumbingShift(String plumbingShift) {
		this.plumbingShift = plumbingShift;
	}


	public String getPlumbingDate() {
		return plumbingDate;
	}


	public void setPlumbingDate(String plumbingDate) {
		this.plumbingDate = plumbingDate;
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


	public String getTestingStatusPlumbing() {
		return testingStatusPlumbing;
	}


	public void setTestingStatusPlumbing(String testingStatusPlumbing) {
		this.testingStatusPlumbing = testingStatusPlumbing;
	}


	public String getEntryBy() {
		return entryBy;
	}


	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}


	public String getEntryDate() {
		return entryDate;
	}


	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}


	

}
