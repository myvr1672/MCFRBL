package beans;

import java.util.Date;

public class ShellSideWallSipTran  implements java.io.Serializable{
	private Integer shellAssetId;
	private String sidewallSipDocNo;
	private String sidewallSipShift;
	private String sidewallType;
	private Date sidewallSipDate;
	private String drawingNo;
	private String wiNo;
	private String frameWorkBy;
	private String frameJigRoboticsBo;
	private String spotWeldingBy;
	private String spotWeldingJigRoboticsBo;
	private String interlockJointBy;
	private String interlockJointJigRoboticsBo;
	private String sidewallCarlineMakeLh;
	private String sidewallCarlineMakeRh;
	//private String sidewallMakeNoLh;
	//private String sidewallMakeNoRh;
	private String observationItemAsPerDrawingFlag;
	private String observationComplianceWiFlag;
	private String observationWeldingThoatLengthFlag;
	private String observationSheetJointLaserFlag;
	private Integer observationSidewallSheetTorque;
	private String observationSidewallFrameWorkFlag;
	private String observationSidewallConditionSpotWeldingFlag;
	private String observationHorizontalVerticalJointWeldingFlag;
	private String observationRoofFlangeJointFlag;
	private Integer sidewallSheetLengthLh;
	private Integer sidewallSheetLengthRh;
	private Integer sidewallSheetWidth;
	private Integer sidewallHeightVerticalmemberRoofflange; 
	private String spotWeldingCarlinearchFlag;
	private String brazingCarlineSidewallFlag;
	private String windowProfileFlag;
	private String pullBoxDistance;
	private String windowSealLeakageFlag;
	private String windowSealAngleFlag;
	private Integer distanceCarlinetopVerticalmember;
	private Integer lengthSidewallCarlineLh;
	private Integer lengthSidewallCarlineRh;
	private String carlineLeakageFlag;
	private String horizontalVerticalWeldingGrindingFlag; 
	private String distanceBackpieceVerticalmemberTransverse;
	private String distanceBackpieceVerticalmemberSingle;
	private Integer roofFlangeLength;
	private Integer widthHatchedDoor;
	private Integer distanceBerthchannelVerticalchannelLowerLh;
	private Integer distanceBerthchannelVerticalchannelMiddleLh;
	private Integer distanceBerthchannelVerticalchannelUpperLh;
	private Integer distanceBerthchannelVerticalchannelLowerRh;
	private Integer distanceBerthchannelVerticalchannelUpperRh;
	private Integer distanceWindowcenterAnglewindowsupport;
	private Integer distanceWindowedgeChannel;
	private Integer heightCarline;
	private Integer lengthSmallcarline;
	private Integer angleLowerluggageBottomsidewall;
	private Integer distanceAnglehoneyprtSidewallDoorside1;
	private Integer distanceAnglehoneyprtSidewallDoorside2;
	private Integer distanceAnglehoneyprtSidewallDoorside3;
	private Integer distanceAnglehoneyprtSidewallDoorside4;
	private Integer distanceAnglehoneyprtSidewallMiddlearea1;
	private Integer distanceAnglehoneyprtSidewallMiddlearea2;
	private Integer distanceAnglehoneyprtSidewallMiddlearea3;
	private Integer distanceAnglehoneyprtSidewallMiddlearea4;
	private String detailsOfModification;
	private String detailsOfTrialItem;
	private String shellSidewallTestingStatus;
	private String remarks;
	private String entryBy;
	private Date entryTime;
	
	public ShellSideWallSipTran()
	{
		
	}

	public String getSidewallSipDocNo() {
		return sidewallSipDocNo;
	}

	public void setSidewallSipDocNo(String sidewallSipDocNo) {
		this.sidewallSipDocNo = sidewallSipDocNo;
	}

	public ShellSideWallSipTran(Integer shellAssetId, String sidewallSipDocNo, String sidewallSipShift,
			String sidewallType, Date sidewallSipDate, String drawingNo, String wiNo, String frameWorkBy,
			String frameJigRoboticsBo, String spotWeldingBy, String spotWeldingJigRoboticsBo, String interlockJointBy,
			String interlockJointJigRoboticsBo, String sidewallCarlineMakeLh, String sidewallCarlineMakeRh,
			 String observationItemAsPerDrawingFlag,
			String observationComplianceWiFlag, String observationWeldingThoatLengthFlag,
			String observationSheetJointLaserFlag, Integer observationSidewallSheetTorque,
			String observationSidewallFrameWorkFlag, String observationSidewallConditionSpotWeldingFlag,
			String observationHorizontalVerticalJointWeldingFlag, String observationRoofFlangeJointFlag,
			Integer sidewallSheetLengthLh, Integer sidewallSheetLengthRh, Integer sidewallSheetWidth,
			Integer sidewallHeightVerticalmemberRoofflange, String spotWeldingCarlinearchFlag,
			String brazingCarlineSidewallFlag, String windowProfileFlag, String pullBoxDistance,
			String windowSealLeakageFlag, String windowSealAngleFlag, Integer distanceCarlinetopVerticalmember,
			Integer lengthSidewallCarlineLh, Integer lengthSidewallCarlineRh, String carlineLeakageFlag,
			String horizontalVerticalWeldingGrindingFlag, String distanceBackpieceVerticalmemberTransverse,
			String distanceBackpieceVerticalmemberSingle, Integer roofFlangeLength, Integer widthHatchedDoor,
			Integer distanceBerthchannelVerticalchannelLowerLh, Integer distanceBerthchannelVerticalchannelMiddleLh,
			Integer distanceBerthchannelVerticalchannelUpperLh, Integer distanceBerthchannelVerticalchannelLowerRh,
			Integer distanceBerthchannelVerticalchannelUpperRh, Integer distanceWindowcenterAnglewindowsupport,
			Integer distanceWindowedgeChannel, Integer heightCarline, Integer lengthSmallcarline,
			Integer angleLowerluggageBottomsidewall, Integer distanceAnglehoneyprtSidewallDoorside1,
			Integer distanceAnglehoneyprtSidewallDoorside2, Integer distanceAnglehoneyprtSidewallDoorside3,
			Integer distanceAnglehoneyprtSidewallDoorside4, Integer distanceAnglehoneyprtSidewallMiddlearea1,
			Integer distanceAnglehoneyprtSidewallMiddlearea2, Integer distanceAnglehoneyprtSidewallMiddlearea3,
			Integer distanceAnglehoneyprtSidewallMiddlearea4, String detailsOfModification, String detailsOfTrialItem,
			String remarks,String shellSidewallTestingStatus, String entryBy, Date entryTime) {
		super();
		this.shellAssetId = shellAssetId;
		this.sidewallSipDocNo = sidewallSipDocNo;
		this.sidewallSipShift = sidewallSipShift;
		this.sidewallType = sidewallType;
		this.sidewallSipDate = sidewallSipDate;
		this.drawingNo = drawingNo;
		this.wiNo = wiNo;
		this.frameWorkBy = frameWorkBy;
		this.frameJigRoboticsBo = frameJigRoboticsBo;
		this.spotWeldingBy = spotWeldingBy;
		this.spotWeldingJigRoboticsBo = spotWeldingJigRoboticsBo;
		this.interlockJointBy = interlockJointBy;
		this.interlockJointJigRoboticsBo = interlockJointJigRoboticsBo;
		this.sidewallCarlineMakeLh = sidewallCarlineMakeLh;
		this.sidewallCarlineMakeRh = sidewallCarlineMakeRh;
	//	this.sidewallMakeNoLh = sidewallMakeNoLh;
		//this.sidewallMakeNoRh = sidewallMakeNoRh;
		this.observationItemAsPerDrawingFlag = observationItemAsPerDrawingFlag;
		this.observationComplianceWiFlag = observationComplianceWiFlag;
		this.observationWeldingThoatLengthFlag = observationWeldingThoatLengthFlag;
		this.observationSheetJointLaserFlag = observationSheetJointLaserFlag;
		this.observationSidewallSheetTorque = observationSidewallSheetTorque;
		this.observationSidewallFrameWorkFlag = observationSidewallFrameWorkFlag;
		this.observationSidewallConditionSpotWeldingFlag = observationSidewallConditionSpotWeldingFlag;
		this.observationHorizontalVerticalJointWeldingFlag = observationHorizontalVerticalJointWeldingFlag;
		this.observationRoofFlangeJointFlag = observationRoofFlangeJointFlag;
		this.sidewallSheetLengthLh = sidewallSheetLengthLh;
		this.sidewallSheetLengthRh = sidewallSheetLengthRh;
		this.sidewallSheetWidth = sidewallSheetWidth;
		this.sidewallHeightVerticalmemberRoofflange = sidewallHeightVerticalmemberRoofflange;
		this.spotWeldingCarlinearchFlag = spotWeldingCarlinearchFlag;
		this.brazingCarlineSidewallFlag = brazingCarlineSidewallFlag;
		this.windowProfileFlag = windowProfileFlag;
		this.pullBoxDistance = pullBoxDistance;
		this.windowSealLeakageFlag = windowSealLeakageFlag;
		this.windowSealAngleFlag = windowSealAngleFlag;
		this.distanceCarlinetopVerticalmember = distanceCarlinetopVerticalmember;
		this.lengthSidewallCarlineLh = lengthSidewallCarlineLh;
		this.lengthSidewallCarlineRh = lengthSidewallCarlineRh;
		this.carlineLeakageFlag = carlineLeakageFlag;
		this.horizontalVerticalWeldingGrindingFlag = horizontalVerticalWeldingGrindingFlag;
		this.distanceBackpieceVerticalmemberTransverse = distanceBackpieceVerticalmemberTransverse;
		this.distanceBackpieceVerticalmemberSingle = distanceBackpieceVerticalmemberSingle;
		this.roofFlangeLength = roofFlangeLength;
		this.widthHatchedDoor = widthHatchedDoor;
		this.distanceBerthchannelVerticalchannelLowerLh = distanceBerthchannelVerticalchannelLowerLh;
		this.distanceBerthchannelVerticalchannelMiddleLh = distanceBerthchannelVerticalchannelMiddleLh;
		this.distanceBerthchannelVerticalchannelUpperLh = distanceBerthchannelVerticalchannelUpperLh;
		this.distanceBerthchannelVerticalchannelLowerRh = distanceBerthchannelVerticalchannelLowerRh;
		this.distanceBerthchannelVerticalchannelUpperRh = distanceBerthchannelVerticalchannelUpperRh;
		this.distanceWindowcenterAnglewindowsupport = distanceWindowcenterAnglewindowsupport;
		this.distanceWindowedgeChannel = distanceWindowedgeChannel;
		this.heightCarline = heightCarline;
		this.lengthSmallcarline = lengthSmallcarline;
		this.angleLowerluggageBottomsidewall = angleLowerluggageBottomsidewall;
		this.distanceAnglehoneyprtSidewallDoorside1 = distanceAnglehoneyprtSidewallDoorside1;
		this.distanceAnglehoneyprtSidewallDoorside2 = distanceAnglehoneyprtSidewallDoorside2;
		this.distanceAnglehoneyprtSidewallDoorside3 = distanceAnglehoneyprtSidewallDoorside3;
		this.distanceAnglehoneyprtSidewallDoorside4 = distanceAnglehoneyprtSidewallDoorside4;
		this.distanceAnglehoneyprtSidewallMiddlearea1 = distanceAnglehoneyprtSidewallMiddlearea1;
		this.distanceAnglehoneyprtSidewallMiddlearea2 = distanceAnglehoneyprtSidewallMiddlearea2;
		this.distanceAnglehoneyprtSidewallMiddlearea3 = distanceAnglehoneyprtSidewallMiddlearea3;
		this.distanceAnglehoneyprtSidewallMiddlearea4 = distanceAnglehoneyprtSidewallMiddlearea4;
		this.detailsOfModification = detailsOfModification;
		this.detailsOfTrialItem = detailsOfTrialItem;
		this.shellSidewallTestingStatus=shellSidewallTestingStatus;
		this.remarks = remarks;
		this.entryBy = entryBy;
		this.entryTime = entryTime;
	}


	public Integer getShellAssetId() {
		return shellAssetId;
	}


	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getSidewallSipShift() {
		return sidewallSipShift;
	}

	public void setSidewallSipShift(String sidewallSipShift) {
		this.sidewallSipShift = sidewallSipShift;
	}

	public String getSidewallType() {
		return sidewallType;
	}

	public void setSidewallType(String sidewallType) {
		this.sidewallType = sidewallType;
	}

	public Date getSidewallSipDate() {
		return sidewallSipDate;
	}

	public void setSidewallSipDate(Date sidewallSipDate) {
		this.sidewallSipDate = sidewallSipDate;
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

	public String getFrameWorkBy() {
		return frameWorkBy;
	}

	public void setFrameWorkBy(String frameWorkBy) {
		this.frameWorkBy = frameWorkBy;
	}

	public String getFrameJigRoboticsBo() {
		return frameJigRoboticsBo;
	}

	public void setFrameJigRoboticsBo(String frameJigRoboticsBo) {
		this.frameJigRoboticsBo = frameJigRoboticsBo;
	}

	public String getSpotWeldingBy() {
		return spotWeldingBy;
	}

	public void setSpotWeldingBy(String spotWeldingBy) {
		this.spotWeldingBy = spotWeldingBy;
	}

	

	public String getSpotWeldingJigRoboticsBo() {
		return spotWeldingJigRoboticsBo;
	}

	public void setSpotWeldingJigRoboticsBo(String spotWeldingJigRoboticsBo) {
		this.spotWeldingJigRoboticsBo = spotWeldingJigRoboticsBo;
	}

	

	public String getInterlockJointBy() {
		return interlockJointBy;
	}



	public void setInterlockJointBy(String interlockJointBy) {
		this.interlockJointBy = interlockJointBy;
	}



	public String getInterlockJointJigRoboticsBo() {
		return interlockJointJigRoboticsBo;
	}

	public void setInterlockJointJigRoboticsBo(String interlockJointJigRoboticsBo) {
		this.interlockJointJigRoboticsBo = interlockJointJigRoboticsBo;
	}

	public String getSidewallCarlineMakeLh() {
		return sidewallCarlineMakeLh;
	}

	public void setSidewallCarlineMakeLh(String sidewallCarlineMakeLh) {
		this.sidewallCarlineMakeLh = sidewallCarlineMakeLh;
	}

	

	public String getSidewallCarlineMakeRh() {
		return sidewallCarlineMakeRh;
	}

	public void setSidewallCarlineMakeRh(String sidewallCarlineMakeRh) {
		this.sidewallCarlineMakeRh = sidewallCarlineMakeRh;
	}


	
	public String getObservationItemAsPerDrawingFlag() {
		return observationItemAsPerDrawingFlag;
	}

	public void setObservationItemAsPerDrawingFlag(String observationItemAsPerDrawingFlag) {
		this.observationItemAsPerDrawingFlag = observationItemAsPerDrawingFlag;
	}

	public String getObservationComplianceWiFlag() {
		return observationComplianceWiFlag;
	}

	public void setObservationComplianceWiFlag(String observationComplianceWiFlag) {
		this.observationComplianceWiFlag = observationComplianceWiFlag;
	}

	public String getObservationWeldingThoatLengthFlag() {
		return observationWeldingThoatLengthFlag;
	}

	public void setObservationWeldingThoatLengthFlag(String observationWeldingThoatLengthFlag) {
		this.observationWeldingThoatLengthFlag = observationWeldingThoatLengthFlag;
	}

	public String getObservationSheetJointLaserFlag() {
		return observationSheetJointLaserFlag;
	}

	public void setObservationSheetJointLaserFlag(String observationSheetJointLaserFlag) {
		this.observationSheetJointLaserFlag = observationSheetJointLaserFlag;
	}

	public Integer getObservationSidewallSheetTorque() {
		return observationSidewallSheetTorque;
	}

	public void setObservationSidewallSheetTorque(Integer observationSidewallSheetTorque) {
		this.observationSidewallSheetTorque = observationSidewallSheetTorque;
	}

	public String getObservationSidewallFrameWorkFlag() {
		return observationSidewallFrameWorkFlag;
	}

	public void setObservationSidewallFrameWorkFlag(String observationSidewallFrameWorkFlag) {
		this.observationSidewallFrameWorkFlag = observationSidewallFrameWorkFlag;
	}

	public String getObservationSidewallConditionSpotWeldingFlag() {
		return observationSidewallConditionSpotWeldingFlag;
	}

	public void setObservationSidewallConditionSpotWeldingFlag(String observationSidewallConditionSpotWeldingFlag) {
		this.observationSidewallConditionSpotWeldingFlag = observationSidewallConditionSpotWeldingFlag;
	}

	public String getObservationHorizontalVerticalJointWeldingFlag() {
		return observationHorizontalVerticalJointWeldingFlag;
	}

	public void setObservationHorizontalVerticalJointWeldingFlag(String observationHorizontalVerticalJointWeldingFlag) {
		this.observationHorizontalVerticalJointWeldingFlag = observationHorizontalVerticalJointWeldingFlag;
	}

	public String getObservationRoofFlangeJointFlag() {
		return observationRoofFlangeJointFlag;
	}

	public void setObservationRoofFlangeJointFlag(String observationRoofFlangeJointFlag) {
		this.observationRoofFlangeJointFlag = observationRoofFlangeJointFlag;
	}

	public Integer getSidewallSheetLengthLh() {
		return sidewallSheetLengthLh;
	}

	public void setSidewallSheetLengthLh(Integer sidewallSheetLengthLh) {
		this.sidewallSheetLengthLh = sidewallSheetLengthLh;
	}

	public Integer getSidewallSheetLengthRh() {
		return sidewallSheetLengthRh;
	}

	public void setSidewallSheetLengthRh(Integer sidewallSheetLengthRh) {
		this.sidewallSheetLengthRh = sidewallSheetLengthRh;
	}

	public Integer getSidewallSheetWidth() {
		return sidewallSheetWidth;
	}

	public void setSidewallSheetWidth(Integer sidewallSheetWidth) {
		this.sidewallSheetWidth = sidewallSheetWidth;
	}

	public Integer getSidewallHeightVerticalmemberRoofflange() {
		return sidewallHeightVerticalmemberRoofflange;
	}

	public void setSidewallHeightVerticalmemberRoofflange(Integer sidewallHeightVerticalmemberRoofflange) {
		this.sidewallHeightVerticalmemberRoofflange = sidewallHeightVerticalmemberRoofflange;
	}

	public String getSpotWeldingCarlinearchFlag() {
		return spotWeldingCarlinearchFlag;
	}

	public void setSpotWeldingCarlinearchFlag(String spotWeldingCarlinearchFlag) {
		this.spotWeldingCarlinearchFlag = spotWeldingCarlinearchFlag;
	}

	public String getBrazingCarlineSidewallFlag() {
		return brazingCarlineSidewallFlag;
	}

	public void setBrazingCarlineSidewallFlag(String brazingCarlineSidewallFlag) {
		this.brazingCarlineSidewallFlag = brazingCarlineSidewallFlag;
	}

	public String getWindowProfileFlag() {
		return windowProfileFlag;
	}

	public void setWindowProfileFlag(String windowProfileFlag) {
		this.windowProfileFlag = windowProfileFlag;
	}

	public String getPullBoxDistance() {
		return pullBoxDistance;
	}

	public void setPullBoxDistance(String pullBoxDistance) {
		this.pullBoxDistance = pullBoxDistance;
	}

	public String getWindowSealLeakageFlag() {
		return windowSealLeakageFlag;
	}

	public void setWindowSealLeakageFlag(String windowSealLeakageFlag) {
		this.windowSealLeakageFlag = windowSealLeakageFlag;
	}

	public String getWindowSealAngleFlag() {
		return windowSealAngleFlag;
	}

	public void setWindowSealAngleFlag(String windowSealAngleFlag) {
		this.windowSealAngleFlag = windowSealAngleFlag;
	}

	public Integer getDistanceCarlinetopVerticalmember() {
		return distanceCarlinetopVerticalmember;
	}

	public void setDistanceCarlinetopVerticalmember(Integer distanceCarlinetopVerticalmember) {
		this.distanceCarlinetopVerticalmember = distanceCarlinetopVerticalmember;
	}

	public Integer getLengthSidewallCarlineLh() {
		return lengthSidewallCarlineLh;
	}

	public void setLengthSidewallCarlineLh(Integer lengthSidewallCarlineLh) {
		this.lengthSidewallCarlineLh = lengthSidewallCarlineLh;
	}

	public Integer getLengthSidewallCarlineRh() {
		return lengthSidewallCarlineRh;
	}

	public void setLengthSidewallCarlineRh(Integer lengthSidewallCarlineRh) {
		this.lengthSidewallCarlineRh = lengthSidewallCarlineRh;
	}

	public String getCarlineLeakageFlag() {
		return carlineLeakageFlag;
	}

	public void setCarlineLeakageFlag(String carlineLeakageFlag) {
		this.carlineLeakageFlag = carlineLeakageFlag;
	}

	public String getHorizontalVerticalWeldingGrindingFlag() {
		return horizontalVerticalWeldingGrindingFlag;
	}

	public void setHorizontalVerticalWeldingGrindingFlag(String horizontalVerticalWeldingGrindingFlag) {
		this.horizontalVerticalWeldingGrindingFlag = horizontalVerticalWeldingGrindingFlag;
	}

	public String getDistanceBackpieceVerticalmemberTransverse() {
		return distanceBackpieceVerticalmemberTransverse;
	}

	public void setDistanceBackpieceVerticalmemberTransverse(String distanceBackpieceVerticalmemberTransverse) {
		this.distanceBackpieceVerticalmemberTransverse = distanceBackpieceVerticalmemberTransverse;
	}

	public String getDistanceBackpieceVerticalmemberSingle() {
		return distanceBackpieceVerticalmemberSingle;
	}

	public void setDistanceBackpieceVerticalmemberSingle(String distanceBackpieceVerticalmemberSingle) {
		this.distanceBackpieceVerticalmemberSingle = distanceBackpieceVerticalmemberSingle;
	}

	public Integer getRoofFlangeLength() {
		return roofFlangeLength;
	}

	public void setRoofFlangeLength(Integer roofFlangeLength) {
		this.roofFlangeLength = roofFlangeLength;
	}

	public Integer getWidthHatchedDoor() {
		return widthHatchedDoor;
	}

	public void setWidthHatchedDoor(Integer widthHatchedDoor) {
		this.widthHatchedDoor = widthHatchedDoor;
	}

	public Integer getDistanceBerthchannelVerticalchannelLowerLh() {
		return distanceBerthchannelVerticalchannelLowerLh;
	}

	public void setDistanceBerthchannelVerticalchannelLowerLh(Integer distanceBerthchannelVerticalchannelLowerLh) {
		this.distanceBerthchannelVerticalchannelLowerLh = distanceBerthchannelVerticalchannelLowerLh;
	}

	public Integer getDistanceBerthchannelVerticalchannelMiddleLh() {
		return distanceBerthchannelVerticalchannelMiddleLh;
	}

	public void setDistanceBerthchannelVerticalchannelMiddleLh(Integer distanceBerthchannelVerticalchannelMiddleLh) {
		this.distanceBerthchannelVerticalchannelMiddleLh = distanceBerthchannelVerticalchannelMiddleLh;
	}

	public Integer getDistanceBerthchannelVerticalchannelUpperLh() {
		return distanceBerthchannelVerticalchannelUpperLh;
	}

	public void setDistanceBerthchannelVerticalchannelUpperLh(Integer distanceBerthchannelVerticalchannelUpperLh) {
		this.distanceBerthchannelVerticalchannelUpperLh = distanceBerthchannelVerticalchannelUpperLh;
	}

	public Integer getDistanceBerthchannelVerticalchannelLowerRh() {
		return distanceBerthchannelVerticalchannelLowerRh;
	}

	public void setDistanceBerthchannelVerticalchannelLowerRh(Integer distanceBerthchannelVerticalchannelLowerRh) {
		this.distanceBerthchannelVerticalchannelLowerRh = distanceBerthchannelVerticalchannelLowerRh;
	}

	public Integer getDistanceBerthchannelVerticalchannelUpperRh() {
		return distanceBerthchannelVerticalchannelUpperRh;
	}

	public void setDistanceBerthchannelVerticalchannelUpperRh(Integer distanceBerthchannelVerticalchannelUpperRh) {
		this.distanceBerthchannelVerticalchannelUpperRh = distanceBerthchannelVerticalchannelUpperRh;
	}

	public Integer getDistanceWindowcenterAnglewindowsupport() {
		return distanceWindowcenterAnglewindowsupport;
	}

	public void setDistanceWindowcenterAnglewindowsupport(Integer distanceWindowcenterAnglewindowsupport) {
		this.distanceWindowcenterAnglewindowsupport = distanceWindowcenterAnglewindowsupport;
	}

	public Integer getDistanceWindowedgeChannel() {
		return distanceWindowedgeChannel;
	}

	public void setDistanceWindowedgeChannel(Integer distanceWindowedgeChannel) {
		this.distanceWindowedgeChannel = distanceWindowedgeChannel;
	}

	public Integer getHeightCarline() {
		return heightCarline;
	}

	public void setHeightCarline(Integer heightCarline) {
		this.heightCarline = heightCarline;
	}

	public Integer getLengthSmallcarline() {
		return lengthSmallcarline;
	}

	public void setLengthSmallcarline(Integer lengthSmallcarline) {
		this.lengthSmallcarline = lengthSmallcarline;
	}

	public Integer getAngleLowerluggageBottomsidewall() {
		return angleLowerluggageBottomsidewall;
	}

	public void setAngleLowerluggageBottomsidewall(Integer angleLowerluggageBottomsidewall) {
		this.angleLowerluggageBottomsidewall = angleLowerluggageBottomsidewall;
	}

	public Integer getDistanceAnglehoneyprtSidewallDoorside1() {
		return distanceAnglehoneyprtSidewallDoorside1;
	}

	public void setDistanceAnglehoneyprtSidewallDoorside1(Integer distanceAnglehoneyprtSidewallDoorside1) {
		this.distanceAnglehoneyprtSidewallDoorside1 = distanceAnglehoneyprtSidewallDoorside1;
	}

	public Integer getDistanceAnglehoneyprtSidewallDoorside2() {
		return distanceAnglehoneyprtSidewallDoorside2;
	}

	public void setDistanceAnglehoneyprtSidewallDoorside2(Integer distanceAnglehoneyprtSidewallDoorside2) {
		this.distanceAnglehoneyprtSidewallDoorside2 = distanceAnglehoneyprtSidewallDoorside2;
	}

	public Integer getDistanceAnglehoneyprtSidewallDoorside3() {
		return distanceAnglehoneyprtSidewallDoorside3;
	}

	public void setDistanceAnglehoneyprtSidewallDoorside3(Integer distanceAnglehoneyprtSidewallDoorside3) {
		this.distanceAnglehoneyprtSidewallDoorside3 = distanceAnglehoneyprtSidewallDoorside3;
	}

	public Integer getDistanceAnglehoneyprtSidewallDoorside4() {
		return distanceAnglehoneyprtSidewallDoorside4;
	}

	public void setDistanceAnglehoneyprtSidewallDoorside4(Integer distanceAnglehoneyprtSidewallDoorside4) {
		this.distanceAnglehoneyprtSidewallDoorside4 = distanceAnglehoneyprtSidewallDoorside4;
	}

	public Integer getDistanceAnglehoneyprtSidewallMiddlearea1() {
		return distanceAnglehoneyprtSidewallMiddlearea1;
	}

	public void setDistanceAnglehoneyprtSidewallMiddlearea1(Integer distanceAnglehoneyprtSidewallMiddlearea1) {
		this.distanceAnglehoneyprtSidewallMiddlearea1 = distanceAnglehoneyprtSidewallMiddlearea1;
	}

	public Integer getDistanceAnglehoneyprtSidewallMiddlearea2() {
		return distanceAnglehoneyprtSidewallMiddlearea2;
	}

	public void setDistanceAnglehoneyprtSidewallMiddlearea2(Integer distanceAnglehoneyprtSidewallMiddlearea2) {
		this.distanceAnglehoneyprtSidewallMiddlearea2 = distanceAnglehoneyprtSidewallMiddlearea2;
	}

	public Integer getDistanceAnglehoneyprtSidewallMiddlearea3() {
		return distanceAnglehoneyprtSidewallMiddlearea3;
	}

	public void setDistanceAnglehoneyprtSidewallMiddlearea3(Integer distanceAnglehoneyprtSidewallMiddlearea3) {
		this.distanceAnglehoneyprtSidewallMiddlearea3 = distanceAnglehoneyprtSidewallMiddlearea3;
	}

	public Integer getDistanceAnglehoneyprtSidewallMiddlearea4() {
		return distanceAnglehoneyprtSidewallMiddlearea4;
	}

	public void setDistanceAnglehoneyprtSidewallMiddlearea4(Integer distanceAnglehoneyprtSidewallMiddlearea4) {
		this.distanceAnglehoneyprtSidewallMiddlearea4 = distanceAnglehoneyprtSidewallMiddlearea4;
	}

	public String getDetailsOfModification() {
		return detailsOfModification;
	}

	public void setDetailsOfModification(String detailsOfModification) {
		this.detailsOfModification = detailsOfModification;
	}

	

	public String getDetailsOfTrialItem() {
		return detailsOfTrialItem;
	}


	public void setDetailsOfTrialItem(String detailsOfTrialItem) {
		this.detailsOfTrialItem = detailsOfTrialItem;
	}


	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getShellSidewallTestingStatus() {
		return shellSidewallTestingStatus;
	}

	public void setShellSidewallTestingStatus(String shellSidewallTestingStatus) {
		this.shellSidewallTestingStatus = shellSidewallTestingStatus;
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


