package beans;

import java.util.Date;

public class ShellLavSideWallSipTran implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer shellAssetId;
    private String lavsidewallSipDocNo;
    private String lavsidewallSipShift;
    private Date lavsidewallSipDate;
    private String lavsidewallNo;
    private String lavsidewallShellType;
	private String drawingNo;
    private String  wiNo;
    private String frameWorkByLav1;
    private String  frameJigRoboticsBoLav1;
    private String  frameWorkByLav2;
    private String frameJigRoboticsBoLav2;
    private String  frameWorkByLav3;
    private String frameJigRoboticsBoLav3;
    private String frameWorkByLav4;
    private String  frameJigRoboticsBoLav4;
    private String spotWeldingByLav1;
    private String spotWeldingJigRoboticsBoLav1;
    private String spotWeldingByLav2;
    private String spotWeldingJigRoboticsBoLav2;
    private String spotWeldingByLav3;
    private String spotWeldingJigRoboticsBoLav3;
    private String spotWeldingByLav4;
    private String spotWeldingJigRoboticsBoLav4;
    private String interlockJointByLav1;
    private String interlockJointJigRoboticsBoLav1;
    private String interlockJointByLav2;
    private String interlockJointJigRoboticsBoLav2;
    private String interlockJointByLav3;
    private String interlockJointJigRoboticsBoLav3;
    private String interlockJointByLav4;
    private String interlockJointJigRoboticsBoLav4;
    private String lavsidewallMake1;
    private String lavsidewallMake2;
    private String lavsidewallMake3;
    private String lavsidewallMake4;
    private String observationItemsAsPerDrawingFlag;
    private String observationComplianceWiFlag;
    private String observationWeldingThroatFlag;
    private Double totalheightLav1;
    private Double totalheightLav2;
    private Double totalheightLav3;
    private Double totalheightLav4;
    private Double totalwidthoutsideLav1;
    private Double totalwidthoutsideLav2;
    private Double totalwidthoutsideLav3;
    private Double totalwidthoutsideLav4;
    private Double totalwidthinsideLav1;
    private Double totalwidthinsideLav2;
    private Double totalwidthinsideLav3;
    private Double totalwidthinsideLav4;
    private Double windowcutOutLav1;
    private Double windowcutOutLav2;
    private Double windowcutOutLav3;
    private Double windowcutOutLav4;
    private Double windowcutOutsideLav1;
    private Double windowcutOutsideLav2;
    private Double windowcutOutsideLav3;
    private Double windowcutOutsideLav4;
    private Double pillarheightSheetLav1;
    private Double pillarheightSheetLav2;
    private Double pillarheightSheetLav3;
    private Double pillarheightSheetLav4;
    private String windowprofilecutForExhaustLav1;
    private String windowprofilecutForExhaustLav2;
    private String windowprofilecutForExhaustLav3;
    private String windowprofilecutForExhaustLav4;
    private String lavsidewallFrameAsPerDrawingFlag;
    private String lavsidewallMemberWeldingFlag;
    
	private String conditionLavsidewallMemberJointweldingFlag;
    private String conditionLavsidewallSheetLaserweldingFlag;
    private String detailsOfModification;
    private String detailsOfTrial;
    private String remarks;
    private String lavSidewallTestingStatus;
    private String entryBy;
    private Date entryTime;
   
  public ShellLavSideWallSipTran()
  {
	  
  }



public ShellLavSideWallSipTran(Integer shellAssetId, String lavsidewallSipDocNo, String lavsidewallSipShift,
		Date lavsidewallSipDate, String lavsidewallNo, String drawingNo, String wiNo, String frameWorkByLav1,
		String frameJigRoboticsBoLav1, String frameWorkByLav2, String frameJigRoboticsBoLav2, String frameWorkByLav3,
		String frameJigRoboticsBoLav3, String frameWorkByLav4, String frameJigRoboticsBoLav4, String spotWeldingByLav1,
		String spotWeldingJigRoboticsBoLav1, String spotWeldingByLav2, String spotWeldingJigRoboticsBoLav2,
		String spotWeldingByLav3, String spotWeldingJigRoboticsBoLav3, String spotWeldingByLav4,
		String spotWeldingJigRoboticsBoLav4, String interlockJointByLav1, String interlockJointJigRoboticsBoLav1,
		String interlockJointByLav2, String interlockJointJigRoboticsBoLav2, String interlockJointByLav3,
		String interlockJointJigRoboticsBoLav3, String interlockJointByLav4, String interlockJointJigRoboticsBoLav4,
		String lavsidewallMake1, String lavsidewallMake2, String lavsidewallMake3, String lavsidewallMake4,
		String observationItemsAsPerDrawingFlag, String observationComplianceWiFlag,
		String observationWeldingThroatFlag, Double totalheightLav1, Double totalheightLav2, Double totalheightLav3,
		Double totalheightLav4, Double totalwidthoutsideLav1, Double totalwidthoutsideLav2,
		Double totalwidthoutsideLav3, Double totalwidthoutsideLav4, Double totalwidthinsideLav1,
		Double totalwidthinsideLav2, Double totalwidthinsideLav3, Double totalwidthinsideLav4, Double windowcutOutLav1,
		Double windowcutOutLav2, Double windowcutOutLav3, Double windowcutOutLav4, Double windowcutOutsideLav1,
		Double windowcutOutsideLav2, Double windowcutOutsideLav3, Double windowcutOutsideLav4,
		Double pillarheightSheetLav1, Double pillarheightSheetLav2, Double pillarheightSheetLav3,
		Double pillarheightSheetLav4, String windowprofilecutForExhaustLav1, String windowprofilecutForExhaustLav2,
		String windowprofilecutForExhaustLav3, String windowprofilecutForExhaustLav4,
		String lavsidewallFrameAsPerDrawingFlag, String lavsidewallMemberWeldingFlag,
		String conditionLavsidewallMemberJointweldingFlag, String conditionLavsidewallSheetLaserweldingFlag,
		String detailsOfModification, String detailsOfTrial, String remarks, String lavSidewallTestingStatus, String entryBy, Date entryTime) {
	super();
	this.shellAssetId = shellAssetId;
	this.lavsidewallSipDocNo = lavsidewallSipDocNo;
	this.lavsidewallSipShift = lavsidewallSipShift;
	this.lavsidewallSipDate = lavsidewallSipDate;
	this.lavsidewallNo = lavsidewallNo;
	this.drawingNo = drawingNo;
	this.wiNo = wiNo;
	this.frameWorkByLav1 = frameWorkByLav1;
	this.frameJigRoboticsBoLav1 = frameJigRoboticsBoLav1;
	this.frameWorkByLav2 = frameWorkByLav2;
	this.frameJigRoboticsBoLav2 = frameJigRoboticsBoLav2;
	this.frameWorkByLav3 = frameWorkByLav3;
	this.frameJigRoboticsBoLav3 = frameJigRoboticsBoLav3;
	this.frameWorkByLav4 = frameWorkByLav4;
	this.frameJigRoboticsBoLav4 = frameJigRoboticsBoLav4;
	this.spotWeldingByLav1 = spotWeldingByLav1;
	this.spotWeldingJigRoboticsBoLav1 = spotWeldingJigRoboticsBoLav1;
	this.spotWeldingByLav2 = spotWeldingByLav2;
	this.spotWeldingJigRoboticsBoLav2 = spotWeldingJigRoboticsBoLav2;
	this.spotWeldingByLav3 = spotWeldingByLav3;
	this.spotWeldingJigRoboticsBoLav3 = spotWeldingJigRoboticsBoLav3;
	this.spotWeldingByLav4 = spotWeldingByLav4;
	this.spotWeldingJigRoboticsBoLav4 = spotWeldingJigRoboticsBoLav4;
	this.interlockJointByLav1 = interlockJointByLav1;
	this.interlockJointJigRoboticsBoLav1 = interlockJointJigRoboticsBoLav1;
	this.interlockJointByLav2 = interlockJointByLav2;
	this.interlockJointJigRoboticsBoLav2 = interlockJointJigRoboticsBoLav2;
	this.interlockJointByLav3 = interlockJointByLav3;
	this.interlockJointJigRoboticsBoLav3 = interlockJointJigRoboticsBoLav3;
	this.interlockJointByLav4 = interlockJointByLav4;
	this.interlockJointJigRoboticsBoLav4 = interlockJointJigRoboticsBoLav4;
	this.lavsidewallMake1 = lavsidewallMake1;
	this.lavsidewallMake2 = lavsidewallMake2;
	this.lavsidewallMake3 = lavsidewallMake3;
	this.lavsidewallMake4 = lavsidewallMake4;
	this.observationItemsAsPerDrawingFlag = observationItemsAsPerDrawingFlag;
	this.observationComplianceWiFlag = observationComplianceWiFlag;
	this.observationWeldingThroatFlag = observationWeldingThroatFlag;
	this.totalheightLav1 = totalheightLav1;
	this.totalheightLav2 = totalheightLav2;
	this.totalheightLav3 = totalheightLav3;
	this.totalheightLav4 = totalheightLav4;
	this.totalwidthoutsideLav1 = totalwidthoutsideLav1;
	this.totalwidthoutsideLav2 = totalwidthoutsideLav2;
	this.totalwidthoutsideLav3 = totalwidthoutsideLav3;
	this.totalwidthoutsideLav4 = totalwidthoutsideLav4;
	this.totalwidthinsideLav1 = totalwidthinsideLav1;
	this.totalwidthinsideLav2 = totalwidthinsideLav2;
	this.totalwidthinsideLav3 = totalwidthinsideLav3;
	this.totalwidthinsideLav4 = totalwidthinsideLav4;
	this.windowcutOutLav1 = windowcutOutLav1;
	this.windowcutOutLav2 = windowcutOutLav2;
	this.windowcutOutLav3 = windowcutOutLav3;
	this.windowcutOutLav4 = windowcutOutLav4;
	this.windowcutOutsideLav1 = windowcutOutsideLav1;
	this.windowcutOutsideLav2 = windowcutOutsideLav2;
	this.windowcutOutsideLav3 = windowcutOutsideLav3;
	this.windowcutOutsideLav4 = windowcutOutsideLav4;
	this.pillarheightSheetLav1 = pillarheightSheetLav1;
	this.pillarheightSheetLav2 = pillarheightSheetLav2;
	this.pillarheightSheetLav3 = pillarheightSheetLav3;
	this.pillarheightSheetLav4 = pillarheightSheetLav4;
	this.windowprofilecutForExhaustLav1 = windowprofilecutForExhaustLav1;
	this.windowprofilecutForExhaustLav2 = windowprofilecutForExhaustLav2;
	this.windowprofilecutForExhaustLav3 = windowprofilecutForExhaustLav3;
	this.windowprofilecutForExhaustLav4 = windowprofilecutForExhaustLav4;
	this.lavsidewallFrameAsPerDrawingFlag = lavsidewallFrameAsPerDrawingFlag;
	this.lavsidewallMemberWeldingFlag = lavsidewallMemberWeldingFlag;
	this.conditionLavsidewallMemberJointweldingFlag = conditionLavsidewallMemberJointweldingFlag;
	this.conditionLavsidewallSheetLaserweldingFlag = conditionLavsidewallSheetLaserweldingFlag;
	this.detailsOfModification = detailsOfModification;
	this.detailsOfTrial = detailsOfTrial;
	this.remarks = remarks;
	this.lavSidewallTestingStatus=lavSidewallTestingStatus;
	this.entryBy = entryBy;
	this.entryTime = entryTime;
}



public Integer getShellAssetId() {
	return shellAssetId;
}



public void setShellAssetId(Integer shellAssetId) {
	this.shellAssetId = shellAssetId;
}



public String getLavsidewallSipDocNo() {
	return lavsidewallSipDocNo;
}



public void setLavsidewallSipDocNo(String lavsidewallSipDocNo) {
	this.lavsidewallSipDocNo = lavsidewallSipDocNo;
}



public String getLavsidewallSipShift() {
	return lavsidewallSipShift;
}



public void setLavsidewallSipShift(String lavsidewallSipShift) {
	this.lavsidewallSipShift = lavsidewallSipShift;
}



public Date getLavsidewallSipDate() {
	return lavsidewallSipDate;
}



public void setLavsidewallSipDate(Date lavsidewallSipDate) {
	this.lavsidewallSipDate = lavsidewallSipDate;
}



public String getLavsidewallNo() {
	return lavsidewallNo;
}



public void setLavsidewallNo(String lavsidewallNo) {
	this.lavsidewallNo = lavsidewallNo;
}



public String getDrawingNo() {
	return drawingNo;
}



public void setDrawingNo(String drawingNo) {
	this.drawingNo = drawingNo;
}



public String getWiNo() {
	return wiNo;
}



public void setWiNo(String wiNo) {
	this.wiNo = wiNo;
}



public String getFrameWorkByLav1() {
	return frameWorkByLav1;
}



public void setFrameWorkByLav1(String frameWorkByLav1) {
	this.frameWorkByLav1 = frameWorkByLav1;
}



public String getFrameJigRoboticsBoLav1() {
	return frameJigRoboticsBoLav1;
}



public void setFrameJigRoboticsBoLav1(String frameJigRoboticsBoLav1) {
	this.frameJigRoboticsBoLav1 = frameJigRoboticsBoLav1;
}



public String getFrameWorkByLav2() {
	return frameWorkByLav2;
}



public void setFrameWorkByLav2(String frameWorkByLav2) {
	this.frameWorkByLav2 = frameWorkByLav2;
}



public String getFrameJigRoboticsBoLav2() {
	return frameJigRoboticsBoLav2;
}



public void setFrameJigRoboticsBoLav2(String frameJigRoboticsBoLav2) {
	this.frameJigRoboticsBoLav2 = frameJigRoboticsBoLav2;
}



public String getFrameWorkByLav3() {
	return frameWorkByLav3;
}



public void setFrameWorkByLav3(String frameWorkByLav3) {
	this.frameWorkByLav3 = frameWorkByLav3;
}



public String getFrameJigRoboticsBoLav3() {
	return frameJigRoboticsBoLav3;
}



public void setFrameJigRoboticsBoLav3(String frameJigRoboticsBoLav3) {
	this.frameJigRoboticsBoLav3 = frameJigRoboticsBoLav3;
}



public String getFrameWorkByLav4() {
	return frameWorkByLav4;
}



public void setFrameWorkByLav4(String frameWorkByLav4) {
	this.frameWorkByLav4 = frameWorkByLav4;
}



public String getFrameJigRoboticsBoLav4() {
	return frameJigRoboticsBoLav4;
}



public void setFrameJigRoboticsBoLav4(String frameJigRoboticsBoLav4) {
	this.frameJigRoboticsBoLav4 = frameJigRoboticsBoLav4;
}



public String getSpotWeldingByLav1() {
	return spotWeldingByLav1;
}



public void setSpotWeldingByLav1(String spotWeldingByLav1) {
	this.spotWeldingByLav1 = spotWeldingByLav1;
}



public String getSpotWeldingJigRoboticsBoLav1() {
	return spotWeldingJigRoboticsBoLav1;
}



public void setSpotWeldingJigRoboticsBoLav1(String spotWeldingJigRoboticsBoLav1) {
	this.spotWeldingJigRoboticsBoLav1 = spotWeldingJigRoboticsBoLav1;
}



public String getSpotWeldingByLav2() {
	return spotWeldingByLav2;
}



public void setSpotWeldingByLav2(String spotWeldingByLav2) {
	this.spotWeldingByLav2 = spotWeldingByLav2;
}



public String getSpotWeldingJigRoboticsBoLav2() {
	return spotWeldingJigRoboticsBoLav2;
}



public void setSpotWeldingJigRoboticsBoLav2(String spotWeldingJigRoboticsBoLav2) {
	this.spotWeldingJigRoboticsBoLav2 = spotWeldingJigRoboticsBoLav2;
}



public String getSpotWeldingByLav3() {
	return spotWeldingByLav3;
}



public void setSpotWeldingByLav3(String spotWeldingByLav3) {
	this.spotWeldingByLav3 = spotWeldingByLav3;
}



public String getSpotWeldingJigRoboticsBoLav3() {
	return spotWeldingJigRoboticsBoLav3;
}



public void setSpotWeldingJigRoboticsBoLav3(String spotWeldingJigRoboticsBoLav3) {
	this.spotWeldingJigRoboticsBoLav3 = spotWeldingJigRoboticsBoLav3;
}



public String getSpotWeldingByLav4() {
	return spotWeldingByLav4;
}



public void setSpotWeldingByLav4(String spotWeldingByLav4) {
	this.spotWeldingByLav4 = spotWeldingByLav4;
}



public String getSpotWeldingJigRoboticsBoLav4() {
	return spotWeldingJigRoboticsBoLav4;
}



public void setSpotWeldingJigRoboticsBoLav4(String spotWeldingJigRoboticsBoLav4) {
	this.spotWeldingJigRoboticsBoLav4 = spotWeldingJigRoboticsBoLav4;
}



public String getInterlockJointByLav1() {
	return interlockJointByLav1;
}



public void setInterlockJointByLav1(String interlockJointByLav1) {
	this.interlockJointByLav1 = interlockJointByLav1;
}



public String getInterlockJointJigRoboticsBoLav1() {
	return interlockJointJigRoboticsBoLav1;
}



public void setInterlockJointJigRoboticsBoLav1(String interlockJointJigRoboticsBoLav1) {
	this.interlockJointJigRoboticsBoLav1 = interlockJointJigRoboticsBoLav1;
}



public String getInterlockJointByLav2() {
	return interlockJointByLav2;
}



public void setInterlockJointByLav2(String interlockJointByLav2) {
	this.interlockJointByLav2 = interlockJointByLav2;
}



public String getInterlockJointJigRoboticsBoLav2() {
	return interlockJointJigRoboticsBoLav2;
}



public void setInterlockJointJigRoboticsBoLav2(String interlockJointJigRoboticsBoLav2) {
	this.interlockJointJigRoboticsBoLav2 = interlockJointJigRoboticsBoLav2;
}



public String getInterlockJointByLav3() {
	return interlockJointByLav3;
}



public void setInterlockJointByLav3(String interlockJointByLav3) {
	this.interlockJointByLav3 = interlockJointByLav3;
}



public String getInterlockJointJigRoboticsBoLav3() {
	return interlockJointJigRoboticsBoLav3;
}



public void setInterlockJointJigRoboticsBoLav3(String interlockJointJigRoboticsBoLav3) {
	this.interlockJointJigRoboticsBoLav3 = interlockJointJigRoboticsBoLav3;
}



public String getInterlockJointByLav4() {
	return interlockJointByLav4;
}



public void setInterlockJointByLav4(String interlockJointByLav4) {
	this.interlockJointByLav4 = interlockJointByLav4;
}



public String getInterlockJointJigRoboticsBoLav4() {
	return interlockJointJigRoboticsBoLav4;
}



public void setInterlockJointJigRoboticsBoLav4(String interlockJointJigRoboticsBoLav4) {
	this.interlockJointJigRoboticsBoLav4 = interlockJointJigRoboticsBoLav4;
}



public String getLavsidewallMake1() {
	return lavsidewallMake1;
}



public void setLavsidewallMake1(String lavsidewallMake1) {
	this.lavsidewallMake1 = lavsidewallMake1;
}



public String getLavsidewallMake2() {
	return lavsidewallMake2;
}



public void setLavsidewallMake2(String lavsidewallMake2) {
	this.lavsidewallMake2 = lavsidewallMake2;
}



public String getLavsidewallMake3() {
	return lavsidewallMake3;
}



public void setLavsidewallMake3(String lavsidewallMake3) {
	this.lavsidewallMake3 = lavsidewallMake3;
}



public String getLavsidewallMake4() {
	return lavsidewallMake4;
}



public void setLavsidewallMake4(String lavsidewallMake4) {
	this.lavsidewallMake4 = lavsidewallMake4;
}



public String getObservationItemsAsPerDrawingFlag() {
	return observationItemsAsPerDrawingFlag;
}



public void setObservationItemsAsPerDrawingFlag(String observationItemsAsPerDrawingFlag) {
	this.observationItemsAsPerDrawingFlag = observationItemsAsPerDrawingFlag;
}



public String getObservationComplianceWiFlag() {
	return observationComplianceWiFlag;
}



public void setObservationComplianceWiFlag(String observationComplianceWiFlag) {
	this.observationComplianceWiFlag = observationComplianceWiFlag;
}



public String getObservationWeldingThroatFlag() {
	return observationWeldingThroatFlag;
}



public void setObservationWeldingThroatFlag(String observationWeldingThroatFlag) {
	this.observationWeldingThroatFlag = observationWeldingThroatFlag;
}



public Double getTotalheightLav1() {
	return totalheightLav1;
}



public void setTotalheightLav1(Double totalheightLav1) {
	this.totalheightLav1 = totalheightLav1;
}



public Double getTotalheightLav2() {
	return totalheightLav2;
}



public void setTotalheightLav2(Double totalheightLav2) {
	this.totalheightLav2 = totalheightLav2;
}



public Double getTotalheightLav3() {
	return totalheightLav3;
}



public void setTotalheightLav3(Double totalheightLav3) {
	this.totalheightLav3 = totalheightLav3;
}



public Double getTotalheightLav4() {
	return totalheightLav4;
}



public void setTotalheightLav4(Double totalheightLav4) {
	this.totalheightLav4 = totalheightLav4;
}



public Double getTotalwidthoutsideLav1() {
	return totalwidthoutsideLav1;
}



public void setTotalwidthoutsideLav1(Double totalwidthoutsideLav1) {
	this.totalwidthoutsideLav1 = totalwidthoutsideLav1;
}



public Double getTotalwidthoutsideLav2() {
	return totalwidthoutsideLav2;
}



public void setTotalwidthoutsideLav2(Double totalwidthoutsideLav2) {
	this.totalwidthoutsideLav2 = totalwidthoutsideLav2;
}



public Double getTotalwidthoutsideLav3() {
	return totalwidthoutsideLav3;
}



public void setTotalwidthoutsideLav3(Double totalwidthoutsideLav3) {
	this.totalwidthoutsideLav3 = totalwidthoutsideLav3;
}



public Double getTotalwidthoutsideLav4() {
	return totalwidthoutsideLav4;
}



public void setTotalwidthoutsideLav4(Double totalwidthoutsideLav4) {
	this.totalwidthoutsideLav4 = totalwidthoutsideLav4;
}



public Double getTotalwidthinsideLav1() {
	return totalwidthinsideLav1;
}



public void setTotalwidthinsideLav1(Double totalwidthinsideLav1) {
	this.totalwidthinsideLav1 = totalwidthinsideLav1;
}



public Double getTotalwidthinsideLav2() {
	return totalwidthinsideLav2;
}



public void setTotalwidthinsideLav2(Double totalwidthinsideLav2) {
	this.totalwidthinsideLav2 = totalwidthinsideLav2;
}



public Double getTotalwidthinsideLav3() {
	return totalwidthinsideLav3;
}



public void setTotalwidthinsideLav3(Double totalwidthinsideLav3) {
	this.totalwidthinsideLav3 = totalwidthinsideLav3;
}



public Double getTotalwidthinsideLav4() {
	return totalwidthinsideLav4;
}



public void setTotalwidthinsideLav4(Double totalwidthinsideLav4) {
	this.totalwidthinsideLav4 = totalwidthinsideLav4;
}



public Double getWindowcutOutLav1() {
	return windowcutOutLav1;
}



public void setWindowcutOutLav1(Double windowcutOutLav1) {
	this.windowcutOutLav1 = windowcutOutLav1;
}



public Double getWindowcutOutLav2() {
	return windowcutOutLav2;
}



public void setWindowcutOutLav2(Double windowcutOutLav2) {
	this.windowcutOutLav2 = windowcutOutLav2;
}



public Double getWindowcutOutLav3() {
	return windowcutOutLav3;
}



public void setWindowcutOutLav3(Double windowcutOutLav3) {
	this.windowcutOutLav3 = windowcutOutLav3;
}



public Double getWindowcutOutLav4() {
	return windowcutOutLav4;
}



public void setWindowcutOutLav4(Double windowcutOutLav4) {
	this.windowcutOutLav4 = windowcutOutLav4;
}



public Double getWindowcutOutsideLav1() {
	return windowcutOutsideLav1;
}



public void setWindowcutOutsideLav1(Double windowcutOutsideLav1) {
	this.windowcutOutsideLav1 = windowcutOutsideLav1;
}



public Double getWindowcutOutsideLav2() {
	return windowcutOutsideLav2;
}



public void setWindowcutOutsideLav2(Double windowcutOutsideLav2) {
	this.windowcutOutsideLav2 = windowcutOutsideLav2;
}



public Double getWindowcutOutsideLav3() {
	return windowcutOutsideLav3;
}



public void setWindowcutOutsideLav3(Double windowcutOutsideLav3) {
	this.windowcutOutsideLav3 = windowcutOutsideLav3;
}



public Double getWindowcutOutsideLav4() {
	return windowcutOutsideLav4;
}



public void setWindowcutOutsideLav4(Double windowcutOutsideLav4) {
	this.windowcutOutsideLav4 = windowcutOutsideLav4;
}



public Double getPillarheightSheetLav1() {
	return pillarheightSheetLav1;
}



public void setPillarheightSheetLav1(Double pillarheightSheetLav1) {
	this.pillarheightSheetLav1 = pillarheightSheetLav1;
}



public Double getPillarheightSheetLav2() {
	return pillarheightSheetLav2;
}



public void setPillarheightSheetLav2(Double pillarheightSheetLav2) {
	this.pillarheightSheetLav2 = pillarheightSheetLav2;
}



public Double getPillarheightSheetLav3() {
	return pillarheightSheetLav3;
}



public void setPillarheightSheetLav3(Double pillarheightSheetLav3) {
	this.pillarheightSheetLav3 = pillarheightSheetLav3;
}



public Double getPillarheightSheetLav4() {
	return pillarheightSheetLav4;
}



public void setPillarheightSheetLav4(Double pillarheightSheetLav4) {
	this.pillarheightSheetLav4 = pillarheightSheetLav4;
}



public String getWindowprofilecutForExhaustLav1() {
	return windowprofilecutForExhaustLav1;
}



public void setWindowprofilecutForExhaustLav1(String windowprofilecutForExhaustLav1) {
	this.windowprofilecutForExhaustLav1 = windowprofilecutForExhaustLav1;
}



public String getWindowprofilecutForExhaustLav2() {
	return windowprofilecutForExhaustLav2;
}



public void setWindowprofilecutForExhaustLav2(String windowprofilecutForExhaustLav2) {
	this.windowprofilecutForExhaustLav2 = windowprofilecutForExhaustLav2;
}



public String getWindowprofilecutForExhaustLav3() {
	return windowprofilecutForExhaustLav3;
}



public void setWindowprofilecutForExhaustLav3(String windowprofilecutForExhaustLav3) {
	this.windowprofilecutForExhaustLav3 = windowprofilecutForExhaustLav3;
}



public String getWindowprofilecutForExhaustLav4() {
	return windowprofilecutForExhaustLav4;
}



public void setWindowprofilecutForExhaustLav4(String windowprofilecutForExhaustLav4) {
	this.windowprofilecutForExhaustLav4 = windowprofilecutForExhaustLav4;
}



public String getLavsidewallFrameAsPerDrawingFlag() {
	return lavsidewallFrameAsPerDrawingFlag;
}



public void setLavsidewallFrameAsPerDrawingFlag(String lavsidewallFrameAsPerDrawingFlag) {
	this.lavsidewallFrameAsPerDrawingFlag = lavsidewallFrameAsPerDrawingFlag;
}



public String getLavsidewallMemberWeldingFlag() {
	return lavsidewallMemberWeldingFlag;
}



public void setLavsidewallMemberWeldingFlag(String lavsidewallMemberWeldingFlag) {
	this.lavsidewallMemberWeldingFlag = lavsidewallMemberWeldingFlag;
}



public String getConditionLavsidewallMemberJointweldingFlag() {
	return conditionLavsidewallMemberJointweldingFlag;
}



public void setConditionLavsidewallMemberJointweldingFlag(String conditionLavsidewallMemberJointweldingFlag) {
	this.conditionLavsidewallMemberJointweldingFlag = conditionLavsidewallMemberJointweldingFlag;
}



public String getConditionLavsidewallSheetLaserweldingFlag() {
	return conditionLavsidewallSheetLaserweldingFlag;
}



public void setConditionLavsidewallSheetLaserweldingFlag(String conditionLavsidewallSheetLaserweldingFlag) {
	this.conditionLavsidewallSheetLaserweldingFlag = conditionLavsidewallSheetLaserweldingFlag;
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



public String getLavsidewallShellType() {
	return lavsidewallShellType;
}



public void setLavsidewallShellType(String lavsidewallShellType) {
	this.lavsidewallShellType = lavsidewallShellType;
}



public String getLavSidewallTestingStatus() {
	return lavSidewallTestingStatus;
}



public void setLavSidewallTestingStatus(String lavSidewallTestingStatus) {
	this.lavSidewallTestingStatus = lavSidewallTestingStatus;
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
  
    
    
    
    



