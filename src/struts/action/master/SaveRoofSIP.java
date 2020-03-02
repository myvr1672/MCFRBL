package struts.action.master;
import dao.DaoShellRoofSip;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import beans.ShellRoofTransaction;
import beans.ShellTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveRoofSIP {
	private String shellAssetId;
    private String	roofSipDocNo;              							
    private String roofSipShift;
	private String roofSipDate;
	private String roofType;
	private String roofMake; 
	private String applicableDrawingNo;
	private String applicableWiNo;                   							
	private String machineSpotWeild;              							
	private String observationItemAsPerDrawing;
	private String observationComplianceWi;                   							
	private String observationWeildingThroatLength;              							
	private String lengthRoof;
	private String lengthRoofsheet;
	private String widthRoofsheet;
	private String roofArchPositionPp;
	private String roofArchPositionNpp;
	private String roofArchCompletePp;
	private String roofArchCompleteNpp;
	private String crossBraceHeight;
	private String roofArchWidth;
	private String distanceRoofcenterlineFanbkt;
	private String distanceRoofcenterlineCenterlinebkt;
	private String distanceRoofcenterlineBerthsuspensionbkt;
	private String trayAreaLength;
	private String distanceRoofcenterlineFanbktNppPp;
	private String distanceRoofcenterlineTerminalboardbktNppPp;
	private String distanceRoofcenterlineChannelLhRh;
	private String distanceCrossBraceBracket;
	private String checkedDimensionRemark;
	private String distanceCenterlineroofCenterlineflbkts;
	private String conditionRoofSheetJoint;
	private String roofSheetJointLeakage;
	private String conditionRoofSheetArch;
	private String distanceRoofcenterlineCenterlineelbkt;
	private String fittmentLstiffener;
	private String distanceRoofcenterlineSpeakerbkt;
	private String distanceRoofcenterlineElbkt;
	private String noCrossBracesFitted;
	private String detailsOfModification;
	private String detailsOfTrial;
	private String remarks;
	private String shellRoofSipTestingStatus;
	private String entryBy;
	private String entryTime;
	
	
	
	
	



	public String saveRoof()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		
		ShellRoofTransaction shellRoofTransaction=new ShellRoofTransaction();
		
		
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		shellRoofTransaction.setShellAssetId(shellAssetIdAsInt);
		shellRoofTransaction.setRoofSipDocNo(roofSipDocNo);
		shellRoofTransaction.setRoofSipShift(roofSipShift);
		if(!"".equals(roofSipDate))	{shellRoofTransaction.setRoofSipDate(DateUtil.convertToDate(roofSipDate));}
		shellRoofTransaction.setRoofMake(roofMake);
		shellRoofTransaction.setRoofType(roofType);
		shellRoofTransaction.setApplicableWiNo(applicableWiNo);
		shellRoofTransaction.setApplicableDrawingNo(applicableDrawingNo);
		shellRoofTransaction.setMachineSpotWeild(machineSpotWeild);
		shellRoofTransaction.setObservationItemAsPerDrawing(observationItemAsPerDrawing);
		shellRoofTransaction.setObservationComplianceWi(observationComplianceWi);
		shellRoofTransaction.setObservationWeildingThroatLength(observationWeildingThroatLength);
		if(!"".equals(lengthRoof)){Integer lengthRoofAsInt=Integer.parseInt(lengthRoof);
		shellRoofTransaction.setLengthRoof( lengthRoofAsInt);}
		if(!"".equals(lengthRoofsheet)){Integer lengthRoofsheetAsInt=Integer.parseInt(lengthRoofsheet);
		shellRoofTransaction.setLengthRoofsheet(lengthRoofsheetAsInt);}
		if(!"".equals(widthRoofsheet)){Integer widthRoofsheetAsInt=Integer.parseInt(widthRoofsheet);
		shellRoofTransaction.setWidthRoofsheet(widthRoofsheetAsInt);}
		if(!"".equals(roofArchPositionPp)){Integer roofArchPositionPpAsInt=Integer.parseInt(roofArchPositionPp);
		shellRoofTransaction.setRoofArchPositionPp(roofArchPositionPpAsInt);}
		if(!"".equals(roofArchPositionNpp)){Integer roofArchPositionNppAsInt=Integer.parseInt(roofArchPositionNpp);
		shellRoofTransaction.setRoofArchPositionNpp(roofArchPositionNppAsInt);}
		if(!"".equals(roofArchCompletePp)){Integer roofArchCompletePpAsInt=Integer.parseInt(roofArchCompletePp);
		shellRoofTransaction.setRoofArchCompletePp(roofArchCompletePpAsInt);}
		if(!"".equals(roofArchCompleteNpp)){Integer roofArchCompleteNppAsInt=Integer.parseInt(roofArchCompleteNpp);
		shellRoofTransaction.setRoofArchCompleteNpp(roofArchCompleteNppAsInt);}
		if(!"".equals(crossBraceHeight)){Integer crossBraceHeightAsInt=Integer.parseInt(crossBraceHeight);
		shellRoofTransaction.setCrossBraceHeight(crossBraceHeightAsInt);}
		if(!"".equals(roofArchWidth)){Integer roofArchWidthAsInt=Integer.parseInt(roofArchWidth);
		shellRoofTransaction.setRoofArchWidth(roofArchWidthAsInt);}
		shellRoofTransaction.setDistanceRoofcenterlineFanbkt(distanceRoofcenterlineFanbkt);
		shellRoofTransaction.setDistanceRoofcenterlineCenterlinebkt(distanceRoofcenterlineCenterlinebkt);
		shellRoofTransaction.setDistanceRoofcenterlineBerthsuspensionbkt(distanceRoofcenterlineBerthsuspensionbkt);
		shellRoofTransaction.setTrayAreaLength(trayAreaLength);
		shellRoofTransaction.setDistanceRoofcenterlineFanbktNppPp(distanceRoofcenterlineFanbktNppPp);
		shellRoofTransaction.setDistanceRoofcenterlineTerminalboardbktNppPp(distanceRoofcenterlineTerminalboardbktNppPp);
		shellRoofTransaction.setDistanceRoofcenterlineChannelLhRh(distanceRoofcenterlineChannelLhRh);
		shellRoofTransaction.setDistanceCrossBraceBracket(distanceCrossBraceBracket);
		shellRoofTransaction.setCheckedDimensionRemark(checkedDimensionRemark);
		shellRoofTransaction.setDistanceCenterlineroofCenterlineflbkts(distanceCenterlineroofCenterlineflbkts);
		shellRoofTransaction.setConditionRoofSheetJoint(conditionRoofSheetJoint);
		shellRoofTransaction.setRoofSheetJointLeakage(roofSheetJointLeakage);
		shellRoofTransaction.setConditionRoofSheetArch(conditionRoofSheetArch);
		shellRoofTransaction.setDistanceRoofcenterlineCenterlineelbkt(distanceRoofcenterlineCenterlineelbkt);
		shellRoofTransaction.setFittmentLstiffener(fittmentLstiffener);
		shellRoofTransaction.setDistanceRoofcenterlineSpeakerbkt(distanceRoofcenterlineSpeakerbkt);
		shellRoofTransaction.setDistanceRoofcenterlineElbkt(distanceRoofcenterlineElbkt);
		shellRoofTransaction.setNoCrossBracesFitted(noCrossBracesFitted);
		shellRoofTransaction.setDetailsOfModification(detailsOfModification);
		shellRoofTransaction.setDetailsOfTrial(detailsOfTrial);
		shellRoofTransaction.setRemarks(remarks);
		shellRoofTransaction.setShellRoofSipTestingStatus(shellRoofSipTestingStatus);
		shellRoofTransaction.setEntryBy(userID);
		Timestamp entryTime =new Timestamp(System.currentTimeMillis()) ;
		shellRoofTransaction.setEntryTime(entryTime);
		
		
			
			ShellTransaction shellTran=(ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
		    shellTran.setRoofSipFlag(1);
		    try
		    {
		    	DaoShellRoofSip dao=new DaoShellRoofSip();
		    dao.saveRoofData(shellRoofTransaction,shellTran);
		 System.out.println(shellRoofSipTestingStatus);
		    
		    return "success";
		   }
		catch(Exception ex)
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








	public String getRoofSipDocNo() {
		return roofSipDocNo;
	}








	public void setRoofSipDocNo(String roofSipDocNo) {
		this.roofSipDocNo = roofSipDocNo;
	}








	public String getRoofSipShift() {
		return roofSipShift;
	}








	public void setRoofSipShift(String roofSipShift) {
		this.roofSipShift = roofSipShift;
	}








	public String getRoofSipDate() {
		return roofSipDate;
	}








	public void setRoofSipDate(String roofSipDate) {
		this.roofSipDate = roofSipDate;
	}








	public String getRoofType() {
		return roofType;
	}








	public void setRoofType(String roofType) {
		this.roofType = roofType;
	}








	public String getRoofMake() {
		return roofMake;
	}








	public void setRoofMake(String roofMake) {
		this.roofMake = roofMake;
	}








	public String getApplicableDrawingNo() {
		return applicableDrawingNo;
	}








	public void setApplicableDrawingNo(String applicableDrawingNo) {
		this.applicableDrawingNo = applicableDrawingNo;
	}








	public String getApplicableWiNo() {
		return applicableWiNo;
	}








	public void setApplicableWiNo(String applicableWiNo) {
		this.applicableWiNo = applicableWiNo;
	}








	public String getMachineSpotWeild() {
		return machineSpotWeild;
	}








	public void setMachineSpotWeild(String machineSpotWeild) {
		this.machineSpotWeild = machineSpotWeild;
	}








	public String getObservationItemAsPerDrawing() {
		return observationItemAsPerDrawing;
	}








	public void setObservationItemAsPerDrawing(String observationItemAsPerDrawing) {
		this.observationItemAsPerDrawing = observationItemAsPerDrawing;
	}








	public String getObservationComplianceWi() {
		return observationComplianceWi;
	}








	public void setObservationComplianceWi(String observationComplianceWi) {
		this.observationComplianceWi = observationComplianceWi;
	}








	public String getObservationWeildingThroatLength() {
		return observationWeildingThroatLength;
	}








	public void setObservationWeildingThroatLength(String observationWeildingThroatLength) {
		this.observationWeildingThroatLength = observationWeildingThroatLength;
	}








	public String getLengthRoof() {
		return lengthRoof;
	}








	public void setLengthRoof(String lengthRoof) {
		this.lengthRoof = lengthRoof;
	}








	public String getLengthRoofsheet() {
		return lengthRoofsheet;
	}








	public void setLengthRoofsheet(String lengthRoofsheet) {
		this.lengthRoofsheet = lengthRoofsheet;
	}








	public String getWidthRoofsheet() {
		return widthRoofsheet;
	}








	public void setWidthRoofsheet(String widthRoofsheet) {
		this.widthRoofsheet = widthRoofsheet;
	}








	public String getRoofArchPositionPp() {
		return roofArchPositionPp;
	}








	public void setRoofArchPositionPp(String roofArchPositionPp) {
		this.roofArchPositionPp = roofArchPositionPp;
	}








	public String getRoofArchPositionNpp() {
		return roofArchPositionNpp;
	}








	public void setRoofArchPositionNpp(String roofArchPositionNpp) {
		this.roofArchPositionNpp = roofArchPositionNpp;
	}








	public String getRoofArchCompletePp() {
		return roofArchCompletePp;
	}








	public void setRoofArchCompletePp(String roofArchCompletePp) {
		this.roofArchCompletePp = roofArchCompletePp;
	}








	public String getRoofArchCompleteNpp() {
		return roofArchCompleteNpp;
	}








	public void setRoofArchCompleteNpp(String roofArchCompleteNpp) {
		this.roofArchCompleteNpp = roofArchCompleteNpp;
	}








	public String getCrossBraceHeight() {
		return crossBraceHeight;
	}








	public void setCrossBraceHeight(String crossBraceHeight) {
		this.crossBraceHeight = crossBraceHeight;
	}








	public String getRoofArchWidth() {
		return roofArchWidth;
	}








	public void setRoofArchWidth(String roofArchWidth) {
		this.roofArchWidth = roofArchWidth;
	}








	public String getDistanceRoofcenterlineFanbkt() {
		return distanceRoofcenterlineFanbkt;
	}








	public void setDistanceRoofcenterlineFanbkt(String distanceRoofcenterlineFanbkt) {
		this.distanceRoofcenterlineFanbkt = distanceRoofcenterlineFanbkt;
	}








	public String getDistanceRoofcenterlineCenterlinebkt() {
		return distanceRoofcenterlineCenterlinebkt;
	}








	public void setDistanceRoofcenterlineCenterlinebkt(String distanceRoofcenterlineCenterlinebkt) {
		this.distanceRoofcenterlineCenterlinebkt = distanceRoofcenterlineCenterlinebkt;
	}








	public String getDistanceRoofcenterlineBerthsuspensionbkt() {
		return distanceRoofcenterlineBerthsuspensionbkt;
	}








	public void setDistanceRoofcenterlineBerthsuspensionbkt(String distanceRoofcenterlineBerthsuspensionbkt) {
		this.distanceRoofcenterlineBerthsuspensionbkt = distanceRoofcenterlineBerthsuspensionbkt;
	}








	public String getTrayAreaLength() {
		return trayAreaLength;
	}








	public void setTrayAreaLength(String trayAreaLength) {
		this.trayAreaLength = trayAreaLength;
	}








	public String getDistanceRoofcenterlineFanbktNppPp() {
		return distanceRoofcenterlineFanbktNppPp;
	}








	public void setDistanceRoofcenterlineFanbktNppPp(String distanceRoofcenterlineFanbktNppPp) {
		this.distanceRoofcenterlineFanbktNppPp = distanceRoofcenterlineFanbktNppPp;
	}








	public String getDistanceRoofcenterlineTerminalboardbktNppPp() {
		return distanceRoofcenterlineTerminalboardbktNppPp;
	}








	public void setDistanceRoofcenterlineTerminalboardbktNppPp(String distanceRoofcenterlineTerminalboardbktNppPp) {
		this.distanceRoofcenterlineTerminalboardbktNppPp = distanceRoofcenterlineTerminalboardbktNppPp;
	}








	public String getDistanceRoofcenterlineChannelLhRh() {
		return distanceRoofcenterlineChannelLhRh;
	}








	public void setDistanceRoofcenterlineChannelLhRh(String distanceRoofcenterlineChannelLhRh) {
		this.distanceRoofcenterlineChannelLhRh = distanceRoofcenterlineChannelLhRh;
	}








	public String getDistanceCrossBraceBracket() {
		return distanceCrossBraceBracket;
	}








	public void setDistanceCrossBraceBracket(String distanceCrossBraceBracket) {
		this.distanceCrossBraceBracket = distanceCrossBraceBracket;
	}








	public String getCheckedDimensionRemark() {
		return checkedDimensionRemark;
	}








	public void setCheckedDimensionRemark(String checkedDimensionRemark) {
		this.checkedDimensionRemark = checkedDimensionRemark;
	}








	public String getDistanceCenterlineroofCenterlineflbkts() {
		return distanceCenterlineroofCenterlineflbkts;
	}








	public void setDistanceCenterlineroofCenterlineflbkts(String distanceCenterlineroofCenterlineflbkts) {
		this.distanceCenterlineroofCenterlineflbkts = distanceCenterlineroofCenterlineflbkts;
	}








	public String getConditionRoofSheetJoint() {
		return conditionRoofSheetJoint;
	}








	public void setConditionRoofSheetJoint(String conditionRoofSheetJoint) {
		this.conditionRoofSheetJoint = conditionRoofSheetJoint;
	}








	public String getRoofSheetJointLeakage() {
		return roofSheetJointLeakage;
	}








	public void setRoofSheetJointLeakage(String roofSheetJointLeakage) {
		this.roofSheetJointLeakage = roofSheetJointLeakage;
	}








	public String getConditionRoofSheetArch() {
		return conditionRoofSheetArch;
	}








	public void setConditionRoofSheetArch(String conditionRoofSheetArch) {
		this.conditionRoofSheetArch = conditionRoofSheetArch;
	}








	public String getDistanceRoofcenterlineCenterlineelbkt() {
		return distanceRoofcenterlineCenterlineelbkt;
	}








	public void setDistanceRoofcenterlineCenterlineelbkt(String distanceRoofcenterlineCenterlineelbkt) {
		this.distanceRoofcenterlineCenterlineelbkt = distanceRoofcenterlineCenterlineelbkt;
	}








	public String getFittmentLstiffener() {
		return fittmentLstiffener;
	}








	public void setFittmentLstiffener(String fittmentLstiffener) {
		this.fittmentLstiffener = fittmentLstiffener;
	}








	public String getDistanceRoofcenterlineSpeakerbkt() {
		return distanceRoofcenterlineSpeakerbkt;
	}








	public void setDistanceRoofcenterlineSpeakerbkt(String distanceRoofcenterlineSpeakerbkt) {
		this.distanceRoofcenterlineSpeakerbkt = distanceRoofcenterlineSpeakerbkt;
	}








	public String getDistanceRoofcenterlineElbkt() {
		return distanceRoofcenterlineElbkt;
	}








	public void setDistanceRoofcenterlineElbkt(String distanceRoofcenterlineElbkt) {
		this.distanceRoofcenterlineElbkt = distanceRoofcenterlineElbkt;
	}








	public String getNoCrossBracesFitted() {
		return noCrossBracesFitted;
	}








	public void setNoCrossBracesFitted(String noCrossBracesFitted) {
		this.noCrossBracesFitted = noCrossBracesFitted;
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








	public String getShellRoofSipTestingStatus() {
		return shellRoofSipTestingStatus;
	}








	public void setShellRoofSipTestingStatus(String shellRoofSipTestingStatus) {
		this.shellRoofSipTestingStatus = shellRoofSipTestingStatus;
	}








	public String getEntryBy() {
		return entryBy;
	}








	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}








	public String getEntryTime() {
		return entryTime;
	}








	public void setEntryTime(String entryTime) {
		this.entryTime = entryTime;
	}




}
