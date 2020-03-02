package struts.action.master;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import beans.ShellSideWallSipTran;
import beans.ShellStage2Sip;
import beans.ShellTransaction;
import common.DateUtil;
import dao.DaoShellSip;
import dao.DaoShellStage2Sip;
import hibernateConnect.HibernateConfig;

public class Stage2SIPAction {
	private String shellAssetId;
	private String stage2SipDocNo;
	private String stage2SipShift;
	private String stage2SipDate;
	private String stage2WorkBy;
	private String stage2DrawingNo;
	private String stage2WiNo;
	private String stage2JigNo;
	private String stage2ShellAssemblyBy;
	private String stage2UnderframeMake;
	private String stage2RoofMake;
	private String stage2EndWallMakePP;
	private String stage2SideWallMakeLH;
	private String stage2EndWallMakeNPP;
	private String stage2SideWallMakeRH;
	private String itemFittedAsDrawingFlag;
	private String complianceWiFlag;
	private String weldingThroatLengthFlag;
	private String weldingEndwallFlag;
	private String weldingSidewallSolebarFlag;
	private String insideOutsideGrindingFlag;
	private String grindSpotweldingSidewallFlag;
	private String fitWeldPartitionframeFlag;
	private String detailsOfModification;
	private String detailsOfTrial;
	private String remarks;
	private String stage2TestingStatus;
	
	
	
	public String saveStage2(){
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		
		String userID= (String) httpSession.getAttribute("userid");
		
		Timestamp entryTime=new Timestamp(System.currentTimeMillis());
		ShellStage2Sip shellStage2Sip=new ShellStage2Sip();
				
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		shellStage2Sip.setShellAssetId(shellAssetIdAsInt);
		if(!"".equals(stage2SipDate)){shellStage2Sip.setStage2SipDate(DateUtil.convertToDate(stage2SipDate));}
		
		
		
		shellStage2Sip.setStage2SipDocNo(stage2SipDocNo);
		shellStage2Sip.setStage2SipShift(stage2SipShift);
		shellStage2Sip.setStage2WorkBy(stage2WorkBy);
		shellStage2Sip.setStage2DrawingNo(stage2DrawingNo);
		shellStage2Sip.setStage2WiNo(stage2WiNo);
    	shellStage2Sip.setItemFittedAsDrawingFlag(itemFittedAsDrawingFlag);
		shellStage2Sip.setComplianceWiFlag(complianceWiFlag);
		shellStage2Sip.setWeldingThroatLengthFlag(weldingThroatLengthFlag);
		shellStage2Sip.setWeldingEndwallFlag(weldingEndwallFlag);
		shellStage2Sip.setWeldingSidewallSolebarFlag(weldingSidewallSolebarFlag);
		shellStage2Sip.setInsideOutsideGrindingFlag(insideOutsideGrindingFlag);
		shellStage2Sip.setGrindSpotweldingSidewallFlag(grindSpotweldingSidewallFlag);
		shellStage2Sip.setFitWeldPartitionframeFlag(fitWeldPartitionframeFlag);
		shellStage2Sip.setDetailsOfModification(detailsOfModification);
		shellStage2Sip.setDetailsOfTrial(detailsOfTrial);
		shellStage2Sip.setRemarks(remarks);
		shellStage2Sip.setStage2TestingStatus(stage2TestingStatus);
		shellStage2Sip.setEntryBy(userID);
		shellStage2Sip.setEntryTime(entryTime);
		// update shell_tran
             ShellTransaction shellTran=new ShellTransaction();
		
		shellTran=(ShellTransaction) session.get(ShellTransaction.class,shellAssetIdAsInt);
		shellTran.setJigNo(stage2JigNo);
		shellTran.setShellAssembledBy(stage2ShellAssemblyBy);
		shellTran.setUnderframeCompleteMake(stage2UnderframeMake);
		shellTran.setRoofMake(stage2RoofMake);
		shellTran.setEndwallMakePp(stage2EndWallMakePP);
		shellTran.setEndwallMakeNpp(stage2EndWallMakeNPP);
		shellTran.setSideWallMakeNoPp(stage2SideWallMakeLH);
		shellTran.setSideWallMakeNoNpp(stage2SideWallMakeRH);
		shellTran.setStage2SipFlag(1);
		
		//update sidewallsip
          ShellSideWallSipTran shellSideWallSipTran=null;
       shellSideWallSipTran=	 (ShellSideWallSipTran) session.get(ShellSideWallSipTran.class, shellAssetIdAsInt);
		if(shellSideWallSipTran!=null)
		{
		
		}
		try
		{
	
			DaoShellStage2Sip dao=new DaoShellStage2Sip();
		    dao.saveStage2(shellSideWallSipTran,shellTran,shellStage2Sip);
		    System.out.println(shellAssetIdAsInt);
		    System.out.println("Shell transaction: "+shellTran.getShellTransactionId());
		    System.out.println(shellStage2Sip.getItemFittedAsDrawingFlag());
		 
			return "success";
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}


	public String getShellAssetId() {
		return shellAssetId;
	}


	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}


	public String getStage2SipDocNo() {
		return stage2SipDocNo;
	}


	public void setStage2SipDocNo(String stage2SipDocNo) {
		this.stage2SipDocNo = stage2SipDocNo;
	}


	public String getStage2SipShift() {
		return stage2SipShift;
	}


	public void setStage2SipShift(String stage2SipShift) {
		this.stage2SipShift = stage2SipShift;
	}


	public String getStage2SipDate() {
		return stage2SipDate;
	}


	public void setStage2SipDate(String stage2SipDate) {
		this.stage2SipDate = stage2SipDate;
	}


	public String getStage2WorkBy() {
		return stage2WorkBy;
	}


	public void setStage2WorkBy(String stage2WorkBy) {
		this.stage2WorkBy = stage2WorkBy;
	}


	public String getStage2DrawingNo() {
		return stage2DrawingNo;
	}


	public void setStage2DrawingNo(String stage2DrawingNo) {
		this.stage2DrawingNo = stage2DrawingNo;
	}


	public String getStage2WiNo() {
		return stage2WiNo;
	}


	public void setStage2WiNo(String stage2WiNo) {
		this.stage2WiNo = stage2WiNo;
	}


	public String getStage2JigNo() {
		return stage2JigNo;
	}


	public void setStage2JigNo(String stage2JigNo) {
		this.stage2JigNo = stage2JigNo;
	}


	public String getStage2ShellAssemblyBy() {
		return stage2ShellAssemblyBy;
	}


	public void setStage2ShellAssemblyBy(String stage2ShellAssemblyBy) {
		this.stage2ShellAssemblyBy = stage2ShellAssemblyBy;
	}


	public String getStage2UnderframeMake() {
		return stage2UnderframeMake;
	}


	public void setStage2UnderframeMake(String stage2UnderframeMake) {
		this.stage2UnderframeMake = stage2UnderframeMake;
	}


	public String getStage2RoofMake() {
		return stage2RoofMake;
	}


	public void setStage2RoofMake(String stage2RoofMake) {
		this.stage2RoofMake = stage2RoofMake;
	}


	public String getStage2EndWallMakePP() {
		return stage2EndWallMakePP;
	}


	public void setStage2EndWallMakePP(String stage2EndWallMakePP) {
		this.stage2EndWallMakePP = stage2EndWallMakePP;
	}


	public String getStage2SideWallMakeLH() {
		return stage2SideWallMakeLH;
	}


	public void setStage2SideWallMakeLH(String stage2SideWallMakeLH) {
		this.stage2SideWallMakeLH = stage2SideWallMakeLH;
	}


	public String getStage2EndWallMakeNPP() {
		return stage2EndWallMakeNPP;
	}


	public void setStage2EndWallMakeNPP(String stage2EndWallMakeNPP) {
		this.stage2EndWallMakeNPP = stage2EndWallMakeNPP;
	}


	public String getStage2SideWallMakeRH() {
		return stage2SideWallMakeRH;
	}


	public void setStage2SideWallMakeRH(String stage2SideWallMakeRH) {
		this.stage2SideWallMakeRH = stage2SideWallMakeRH;
	}


	public String getItemFittedAsDrawingFlag() {
		return itemFittedAsDrawingFlag;
	}


	public void setItemFittedAsDrawingFlag(String itemFittedAsDrawingFlag) {
		this.itemFittedAsDrawingFlag = itemFittedAsDrawingFlag;
	}


	public String getComplianceWiFlag() {
		return complianceWiFlag;
	}


	public void setComplianceWiFlag(String complianceWiFlag) {
		this.complianceWiFlag = complianceWiFlag;
	}


	public String getWeldingThroatLengthFlag() {
		return weldingThroatLengthFlag;
	}


	public void setWeldingThroatLengthFlag(String weldingThroatLengthFlag) {
		this.weldingThroatLengthFlag = weldingThroatLengthFlag;
	}


	public String getWeldingEndwallFlag() {
		return weldingEndwallFlag;
	}


	public void setWeldingEndwallFlag(String weldingEndwallFlag) {
		this.weldingEndwallFlag = weldingEndwallFlag;
	}


	public String getWeldingSidewallSolebarFlag() {
		return weldingSidewallSolebarFlag;
	}


	public void setWeldingSidewallSolebarFlag(String weldingSidewallSolebarFlag) {
		this.weldingSidewallSolebarFlag = weldingSidewallSolebarFlag;
	}


	public String getInsideOutsideGrindingFlag() {
		return insideOutsideGrindingFlag;
	}


	public void setInsideOutsideGrindingFlag(String insideOutsideGrindingFlag) {
		this.insideOutsideGrindingFlag = insideOutsideGrindingFlag;
	}


	public String getGrindSpotweldingSidewallFlag() {
		return grindSpotweldingSidewallFlag;
	}


	public void setGrindSpotweldingSidewallFlag(String grindSpotweldingSidewallFlag) {
		this.grindSpotweldingSidewallFlag = grindSpotweldingSidewallFlag;
	}


	public String getFitWeldPartitionframeFlag() {
		return fitWeldPartitionframeFlag;
	}


	public void setFitWeldPartitionframeFlag(String fitWeldPartitionframeFlag) {
		this.fitWeldPartitionframeFlag = fitWeldPartitionframeFlag;
	}


	public String getDetailsOfModification() {
		return detailsOfModification;
	}


	public void setDetailsOfModification(String detailsOfModification) {
		this.detailsOfModification = detailsOfModification;
	}


	public String getDetailsOfTrial() {
		return detailsOfTrial;
	}


	public void setDetailsOfTrial(String detailsOfTrial) {
		this.detailsOfTrial = detailsOfTrial;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public String getStage2TestingStatus() {
		return stage2TestingStatus;
	}


	public void setStage2TestingStatus(String stage2TestingStatus) {
		this.stage2TestingStatus = stage2TestingStatus;
	}


		

}
