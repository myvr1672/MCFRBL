package beans;

import java.util.Date;

public class ShellRoofTransaction implements java.io.Serializable
{
	
	private Integer shellAssetId;
	private String roofSipDocNo;
	private String roofSipShift;
	private Date roofSipDate;
	private String roofType;
	private String roofMake;
	private String applicableDrawingNo;
	private String applicableWiNo;
	private String machineSpotWeild;
	private String observationItemAsPerDrawing;
	private String observationComplianceWi;
	private String observationWeildingThroatLength;
	private Integer lengthRoof;
	private Integer lengthRoofsheet;
	private Integer widthRoofsheet;
	private Integer roofArchPositionPp;
	private Integer roofArchPositionNpp;
	private Integer roofArchCompletePp;
	private Integer roofArchCompleteNpp;
	private Integer crossBraceHeight;
	private Integer roofArchWidth;
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
	private Date entryTime;
	
	
	
	public ShellRoofTransaction()
	{
		
	}




	public ShellRoofTransaction(Integer shellAssetId, String roofSipDocNo, String roofSipShift, Date roofSipDate,
			String roofType, String roofMake, String applicableDrawingNo, String applicableWiNo,
			String machineSpotWeild, String observationItemAsPerDrawing, String observationComplianceWi,
			String observationWeildingThroatLength, Integer lengthRoof, Integer lengthRoofsheet, Integer widthRoofsheet,
			Integer roofArchPositionPp, Integer roofArchPositionNpp, Integer roofArchCompletePp,
			Integer roofArchCompleteNpp, Integer crossBraceHeight, Integer roofArchWidth,
			String distanceRoofcenterlineFanbkt, String distanceRoofcenterlineCenterlinebkt,
			String distanceRoofcenterlineBerthsuspensionbkt, String trayAreaLength,
			String distanceRoofcenterlineFanbktNppPp, String distanceRoofcenterlineTerminalboardbktNppPp,
			String distanceRoofcenterlineChannelLhRh, String distanceCrossBraceBracket, String checkedDimensionRemark,
			String distanceCenterlineroofCenterlineflbkts, String conditionRoofSheetJoint, String roofSheetJointLeakage,
			String conditionRoofSheetArch, String distanceRoofcenterlineCenterlineelbkt, String fittmentLstiffener,
			String distanceRoofcenterlineSpeakerbkt, String distanceRoofcenterlineElbkt, String noCrossBracesFitted,
			String detailsOfModification, String detailsOfTrial, String remarks, String shellRoofSipTestingStatus,
			String entryBy, Date entryTime) {
		super();
		this.shellAssetId = shellAssetId;
		this.roofSipDocNo = roofSipDocNo;
		this.roofSipShift = roofSipShift;
		this.roofSipDate = roofSipDate;
		this.roofType = roofType;
		this.roofMake = roofMake;
		this.applicableDrawingNo = applicableDrawingNo;
		this.applicableWiNo = applicableWiNo;
		this.machineSpotWeild = machineSpotWeild;
		this.observationItemAsPerDrawing = observationItemAsPerDrawing;
		this.observationComplianceWi = observationComplianceWi;
		this.observationWeildingThroatLength = observationWeildingThroatLength;
		this.lengthRoof = lengthRoof;
		this.lengthRoofsheet = lengthRoofsheet;
		this.widthRoofsheet = widthRoofsheet;
		this.roofArchPositionPp = roofArchPositionPp;
		this.roofArchPositionNpp = roofArchPositionNpp;
		this.roofArchCompletePp = roofArchCompletePp;
		this.roofArchCompleteNpp = roofArchCompleteNpp;
		this.crossBraceHeight = crossBraceHeight;
		this.roofArchWidth = roofArchWidth;
		this.distanceRoofcenterlineFanbkt = distanceRoofcenterlineFanbkt;
		this.distanceRoofcenterlineCenterlinebkt = distanceRoofcenterlineCenterlinebkt;
		this.distanceRoofcenterlineBerthsuspensionbkt = distanceRoofcenterlineBerthsuspensionbkt;
		this.trayAreaLength = trayAreaLength;
		this.distanceRoofcenterlineFanbktNppPp = distanceRoofcenterlineFanbktNppPp;
		this.distanceRoofcenterlineTerminalboardbktNppPp = distanceRoofcenterlineTerminalboardbktNppPp;
		this.distanceRoofcenterlineChannelLhRh = distanceRoofcenterlineChannelLhRh;
		this.distanceCrossBraceBracket = distanceCrossBraceBracket;
		this.checkedDimensionRemark = checkedDimensionRemark;
		this.distanceCenterlineroofCenterlineflbkts = distanceCenterlineroofCenterlineflbkts;
		this.conditionRoofSheetJoint = conditionRoofSheetJoint;
		this.roofSheetJointLeakage = roofSheetJointLeakage;
		this.conditionRoofSheetArch = conditionRoofSheetArch;
		this.distanceRoofcenterlineCenterlineelbkt = distanceRoofcenterlineCenterlineelbkt;
		this.fittmentLstiffener = fittmentLstiffener;
		this.distanceRoofcenterlineSpeakerbkt = distanceRoofcenterlineSpeakerbkt;
		this.distanceRoofcenterlineElbkt = distanceRoofcenterlineElbkt;
		this.noCrossBracesFitted = noCrossBracesFitted;
		this.detailsOfModification = detailsOfModification;
		this.detailsOfTrial = detailsOfTrial;
		this.remarks = remarks;
		this.shellRoofSipTestingStatus = shellRoofSipTestingStatus;
		this.entryBy = entryBy;
		this.entryTime = entryTime;
	}




	public Integer getShellAssetId() {
		return shellAssetId;
	}



	public void setShellAssetId(Integer shellAssetId) {
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



	public Date getRoofSipDate() {
		return roofSipDate;
	}



	public void setRoofSipDate(Date roofSipDate) {
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



	public Integer getLengthRoof() {
		return lengthRoof;
	}



	public void setLengthRoof(Integer lengthRoof) {
		this.lengthRoof = lengthRoof;
	}



	public Integer getLengthRoofsheet() {
		return lengthRoofsheet;
	}



	public void setLengthRoofsheet(Integer lengthRoofsheet) {
		this.lengthRoofsheet = lengthRoofsheet;
	}



	public Integer getWidthRoofsheet() {
		return widthRoofsheet;
	}



	public void setWidthRoofsheet(Integer widthRoofsheet) {
		this.widthRoofsheet = widthRoofsheet;
	}



	public Integer getRoofArchPositionPp() {
		return roofArchPositionPp;
	}



	public void setRoofArchPositionPp(Integer roofArchPositionPp) {
		this.roofArchPositionPp = roofArchPositionPp;
	}



	public Integer getRoofArchPositionNpp() {
		return roofArchPositionNpp;
	}



	public void setRoofArchPositionNpp(Integer roofArchPositionNpp) {
		this.roofArchPositionNpp = roofArchPositionNpp;
	}



	public Integer getRoofArchCompletePp() {
		return roofArchCompletePp;
	}



	public void setRoofArchCompletePp(Integer roofArchCompletePp) {
		this.roofArchCompletePp = roofArchCompletePp;
	}



	public Integer getRoofArchCompleteNpp() {
		return roofArchCompleteNpp;
	}



	public void setRoofArchCompleteNpp(Integer roofArchCompleteNpp) {
		this.roofArchCompleteNpp = roofArchCompleteNpp;
	}



	public Integer getCrossBraceHeight() {
		return crossBraceHeight;
	}



	public void setCrossBraceHeight(Integer crossBraceHeight) {
		this.crossBraceHeight = crossBraceHeight;
	}



	public Integer getRoofArchWidth() {
		return roofArchWidth;
	}



	public void setRoofArchWidth(Integer roofArchWidth) {
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



	public Date getEntryTime() {
		return entryTime;
	}



	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}


}
