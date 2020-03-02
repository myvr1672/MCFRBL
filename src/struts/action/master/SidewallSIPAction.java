package struts.action.master;

import dao.DaoShellSip;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import beans.ShellSideWallSipTran;
import beans.ShellTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;
public class SidewallSIPAction {
	
	
	private String shellAssetId;
	private String sidewallDate;
	private String sidewallSipDocNo;
	private String sidewallSipShift;
	private String sidewallType;
	private String drawingNo;
	private String wiNo;
	private String  frameWorkBy;
	private String frameJigRoboticsBo;
	private String spotWeldingBy;
	private String spotWeldingJigRoboticsBo;
	private String interlockJointBy;
	private String interlockJointJigRoboticsBo;
	private String sidewallCarlineMakeLh;
	private String sidewallCarlineMakeRh;
	private String sidewallMakeNoLh;
	private String sidewallMakeNoRh;
	private String observationItemAsPerDrawingFlag;
	private String observationComplianceWiFlag;
	private String observationWeldingThoatLengthFlag;
	private String observationSheetJointLaserFlag;
	private String observationSidewallSheetTorque;
	private String observationSidewallFrameWorkFlag;
	private String observationSidewallConditionSpotWeldingFlag;
	private String observationHorizontalVerticalJointWeldingFlag;
	private String observationRoofFlangeJointFlag;
	private String sidewallSheetLengthLh;
	private String sidewallSheetLengthRh;
	private String sidewallSheetWidth;
	private String sidewallHeightVerticalmemberRoofflange;
	private String spotWeldingCarlinearchFlag;
	private String brazingCarlineSidewallFlag;
	private String windowProfileFlag;
	private String pullBoxDistance;
	private String windowSealLeakageFlag;
	private String windowSealAngleFlag;
	private String distanceCarlinetopVerticalmember;
	private String lengthSidewallCarlineLh;
	private String lengthSidewallCarlineRh;
	private String carlineLeakageFlag;
	private String horizontalVerticalWeldingGrindingFlag; 
	private String distanceBackpieceVerticalmemberTransverse;
	private String distanceBackpieceVerticalmemberSingle;
	private String roofFlangeLength;
	private String widthHatchedDoor;
	private String distanceBerthchannelVerticalchannelLowerLh;
	private String distanceBerthchannelVerticalchannelMiddleLh;
	private String distanceBerthchannelVerticalchannelUpperLh;
	private String distanceBerthchannelVerticalchannelLowerRh;
	private String distanceBerthchannelVerticalchannelUpperRh;
	private String distanceWindowcenterAnglewindowsupport;
	private String distanceWindowedgeChannel;
	private String heightCarline;
	private String lengthSmallcarline;
	private String angleLowerluggageBottomsidewall;
	private String distanceAnglehoneyprtSidewallDoorside1;
	private String distanceAnglehoneyprtSidewallDoorside2;
	private String distanceAnglehoneyprtSidewallDoorside3;
	private String distanceAnglehoneyprtSidewallDoorside4;
	private String distanceAnglehoneyprtSidewallMiddlearea1;
	private String distanceAnglehoneyprtSidewallMiddlearea2;
	private String distanceAnglehoneyprtSidewallMiddlearea3;
	private String distanceAnglehoneyprtSidewallMiddlearea4;
	private String detailsOfModification;
	private String detailsOfTrialItem;
	private String remarks;
	private String shellSidewallTestingStatus;
		
	
	public String saveSidewall(){
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		
		String userID= (String) httpSession.getAttribute("userid");
		
		Timestamp entryTime=new Timestamp(System.currentTimeMillis());
		ShellSideWallSipTran shellSideWallSipTran= new ShellSideWallSipTran();
			
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		shellSideWallSipTran.setShellAssetId(shellAssetIdAsInt);
		if(!"".equals(observationSidewallSheetTorque)){
		Integer observationSidewallSheetTorqueAsInt=Integer.parseInt(observationSidewallSheetTorque);
		shellSideWallSipTran.setObservationSidewallSheetTorque(observationSidewallSheetTorqueAsInt);}
		if(!"".equals(sidewallSheetLengthLh)){
		Integer sidewallSheetLengthLhAsInt=Integer.parseInt(sidewallSheetLengthLh);
		shellSideWallSipTran.setSidewallSheetLengthLh(sidewallSheetLengthLhAsInt);}
		if(!"".equals(sidewallSheetLengthRh)){
		Integer sidewallSheetLengthRhAsInt=Integer.parseInt(sidewallSheetLengthRh);
		shellSideWallSipTran.setSidewallSheetLengthRh(sidewallSheetLengthRhAsInt);}
		if(!"".equals(sidewallSheetWidth)){
		Integer sidewallSheetWidthAsInt=Integer.parseInt(sidewallSheetWidth);
		shellSideWallSipTran.setSidewallSheetWidth(sidewallSheetWidthAsInt);}
		if(!"".equals(sidewallHeightVerticalmemberRoofflange)){
		Integer sidewallHeightVerticalmemberRoofflangeAsInt=Integer.parseInt(sidewallHeightVerticalmemberRoofflange);
		shellSideWallSipTran.setSidewallHeightVerticalmemberRoofflange(sidewallHeightVerticalmemberRoofflangeAsInt);}
		
		shellSideWallSipTran.setPullBoxDistance(pullBoxDistance);
		if(!"".equals(distanceCarlinetopVerticalmember)){
		Integer distanceCarlinetopVerticalmemberAsInt=Integer.parseInt(distanceCarlinetopVerticalmember);
		shellSideWallSipTran.setDistanceCarlinetopVerticalmember(distanceCarlinetopVerticalmemberAsInt);}
		if(!"".equals(lengthSidewallCarlineLh)){
		Integer lengthSidewallCarlineLhAsInt=Integer.parseInt(lengthSidewallCarlineLh);
		shellSideWallSipTran.setLengthSidewallCarlineLh(lengthSidewallCarlineLhAsInt);}
		if(!"".equals(lengthSidewallCarlineRh)){
		Integer lengthSidewallCarlineRhAsInt=Integer.parseInt(lengthSidewallCarlineRh);
		shellSideWallSipTran.setLengthSidewallCarlineRh(lengthSidewallCarlineRhAsInt);}
		if(!"".equals(roofFlangeLength)){
		Integer roofFlangeLengthAsInt=Integer.parseInt(roofFlangeLength);
		shellSideWallSipTran.setRoofFlangeLength(roofFlangeLengthAsInt);}
		if(!"".equals(widthHatchedDoor)){
		Integer widthHatchedDoorAsInt=Integer.parseInt(widthHatchedDoor);
		shellSideWallSipTran.setWidthHatchedDoor(widthHatchedDoorAsInt);}
		if(!"".equals(distanceBerthchannelVerticalchannelLowerLh)){
		Integer distanceBerthchannelVerticalchannelLowerLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelLowerLh);
		shellSideWallSipTran.setDistanceBerthchannelVerticalchannelLowerLh(distanceBerthchannelVerticalchannelLowerLhAsInt);}
		if(!"".equals(distanceBerthchannelVerticalchannelMiddleLh)){
		Integer distanceBerthchannelVerticalchannelMiddleLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelMiddleLh);
		shellSideWallSipTran.setDistanceBerthchannelVerticalchannelMiddleLh(distanceBerthchannelVerticalchannelMiddleLhAsInt);}
		if(!"".equals(distanceBerthchannelVerticalchannelUpperLh)){
		Integer distanceBerthchannelVerticalchannelUpperLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelUpperLh);
		shellSideWallSipTran.setDistanceBerthchannelVerticalchannelUpperLh(distanceBerthchannelVerticalchannelUpperLhAsInt);}
		if(!"".equals(distanceBerthchannelVerticalchannelLowerRh)){
		Integer distanceBerthchannelVerticalchannelLowerRhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelLowerRh);
		shellSideWallSipTran.setDistanceBerthchannelVerticalchannelLowerRh(distanceBerthchannelVerticalchannelLowerRhAsInt);}
		if(!"".equals(distanceBerthchannelVerticalchannelUpperRh)){
		Integer distanceBerthchannelVerticalchannelUpperRhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelUpperRh);
		shellSideWallSipTran.setDistanceBerthchannelVerticalchannelUpperRh(distanceBerthchannelVerticalchannelUpperRhAsInt);}
		if(!"".equals(distanceWindowcenterAnglewindowsupport)){
		Integer distanceWindowcenterAnglewindowsupportAsInt=Integer.parseInt(distanceWindowcenterAnglewindowsupport);
		shellSideWallSipTran.setDistanceWindowcenterAnglewindowsupport(distanceWindowcenterAnglewindowsupportAsInt);}
		if(!"".equals(distanceWindowedgeChannel)){
		Integer distanceWindowedgeChannelAsInt=Integer.parseInt(distanceWindowedgeChannel);
		shellSideWallSipTran.setDistanceWindowedgeChannel(distanceWindowedgeChannelAsInt);}
		if(!"".equals(heightCarline)){
		Integer heightCarlineAsInt=Integer.parseInt(heightCarline);
		shellSideWallSipTran.setHeightCarline(heightCarlineAsInt);}
		if(!"".equals(lengthSmallcarline)){
		Integer lengthSmallcarlineAsInt=Integer.parseInt(lengthSmallcarline);
		shellSideWallSipTran.setLengthSmallcarline(lengthSmallcarlineAsInt);}
		if(!"".equals(angleLowerluggageBottomsidewall)){
		Integer angleLowerluggageBottomsidewallAsInt=Integer.parseInt(angleLowerluggageBottomsidewall);
		shellSideWallSipTran.setAngleLowerluggageBottomsidewall(angleLowerluggageBottomsidewallAsInt);}
		if(!"".equals(distanceAnglehoneyprtSidewallDoorside1)){
		Integer distanceAnglehoneyprtSidewallDoorside1AsInt=Integer.parseInt(distanceAnglehoneyprtSidewallDoorside1);
		shellSideWallSipTran.setDistanceAnglehoneyprtSidewallDoorside1(distanceAnglehoneyprtSidewallDoorside1AsInt);}
		if(!"".equals(distanceAnglehoneyprtSidewallDoorside2)){
		Integer distanceAnglehoneyprtSidewallDoorside2AsInt=Integer.parseInt(distanceAnglehoneyprtSidewallDoorside2);
		shellSideWallSipTran.setDistanceAnglehoneyprtSidewallDoorside2(distanceAnglehoneyprtSidewallDoorside2AsInt);}
		if(!"".equals(distanceAnglehoneyprtSidewallDoorside3)){
		Integer distanceAnglehoneyprtSidewallDoorside3AsInt=Integer.parseInt(distanceAnglehoneyprtSidewallDoorside3);
		shellSideWallSipTran.setDistanceAnglehoneyprtSidewallDoorside3(distanceAnglehoneyprtSidewallDoorside3AsInt);}
		if(!"".equals(distanceAnglehoneyprtSidewallDoorside4)){
		Integer distanceAnglehoneyprtSidewallDoorside4AsInt=Integer.parseInt(distanceAnglehoneyprtSidewallDoorside4);
		shellSideWallSipTran.setDistanceAnglehoneyprtSidewallDoorside4(distanceAnglehoneyprtSidewallDoorside4AsInt);}
		if(!"".equals(distanceAnglehoneyprtSidewallMiddlearea1)){
		Integer distanceAnglehoneyprtSidewallMiddlearea1AsInt=Integer.parseInt(distanceAnglehoneyprtSidewallMiddlearea1);
		shellSideWallSipTran.setDistanceAnglehoneyprtSidewallMiddlearea1(distanceAnglehoneyprtSidewallMiddlearea1AsInt);}
		if(!"".equals(distanceAnglehoneyprtSidewallMiddlearea2)){
		Integer distanceAnglehoneyprtSidewallMiddlearea2AsInt=Integer.parseInt(distanceAnglehoneyprtSidewallMiddlearea2);
		shellSideWallSipTran.setDistanceAnglehoneyprtSidewallMiddlearea2(distanceAnglehoneyprtSidewallMiddlearea2AsInt);}
		if(!"".equals(distanceAnglehoneyprtSidewallMiddlearea3)){
		Integer distanceAnglehoneyprtSidewallMiddlearea3AsInt=Integer.parseInt(distanceAnglehoneyprtSidewallMiddlearea3);
		shellSideWallSipTran.setDistanceAnglehoneyprtSidewallMiddlearea3(distanceAnglehoneyprtSidewallMiddlearea3AsInt);}
		if(!"".equals(distanceAnglehoneyprtSidewallMiddlearea4)){
		Integer distanceAnglehoneyprtSidewallMiddlearea4AsInt=Integer.parseInt(distanceAnglehoneyprtSidewallMiddlearea4);
		shellSideWallSipTran.setDistanceAnglehoneyprtSidewallMiddlearea4(distanceAnglehoneyprtSidewallMiddlearea4AsInt);}
		
		
		
		shellSideWallSipTran.setSidewallSipDocNo(sidewallSipDocNo);
		shellSideWallSipTran.setSidewallSipShift(sidewallSipShift);
		if(!"".equals(sidewallDate)){shellSideWallSipTran.setSidewallSipDate(DateUtil.convertToDate(sidewallDate));}
		shellSideWallSipTran.setSidewallType(sidewallType);
		shellSideWallSipTran.setDrawingNo(drawingNo);
		shellSideWallSipTran.setWiNo(wiNo);
		shellSideWallSipTran.setFrameWorkBy(frameWorkBy);
		shellSideWallSipTran.setFrameJigRoboticsBo(frameJigRoboticsBo);
		shellSideWallSipTran.setSpotWeldingBy(spotWeldingBy);
		shellSideWallSipTran.setSpotWeldingJigRoboticsBo(spotWeldingJigRoboticsBo);
		shellSideWallSipTran.setInterlockJointBy(interlockJointBy);
		shellSideWallSipTran.setInterlockJointJigRoboticsBo(interlockJointJigRoboticsBo);
		shellSideWallSipTran.setSidewallCarlineMakeLh(sidewallCarlineMakeLh);
		shellSideWallSipTran.setSidewallCarlineMakeRh(sidewallCarlineMakeRh);
		//shellSideWallSipTran.setSidewallMakeNoLh(sidewallMakeNoLh);
		//shellSideWallSipTran.setSidewallMakeNoRh(sidewallMakeNoRh);
		shellSideWallSipTran.setObservationItemAsPerDrawingFlag(observationItemAsPerDrawingFlag);
		shellSideWallSipTran.setObservationComplianceWiFlag(observationComplianceWiFlag);
		shellSideWallSipTran.setObservationWeldingThoatLengthFlag(observationWeldingThoatLengthFlag);
		shellSideWallSipTran.setObservationSheetJointLaserFlag(observationSheetJointLaserFlag);
		shellSideWallSipTran.setObservationSidewallFrameWorkFlag(observationSidewallFrameWorkFlag);
		shellSideWallSipTran.setObservationSidewallConditionSpotWeldingFlag(observationSidewallConditionSpotWeldingFlag);
		shellSideWallSipTran.setObservationHorizontalVerticalJointWeldingFlag(observationHorizontalVerticalJointWeldingFlag);
		shellSideWallSipTran.setObservationRoofFlangeJointFlag(observationRoofFlangeJointFlag);
		shellSideWallSipTran.setSpotWeldingCarlinearchFlag(spotWeldingCarlinearchFlag);
		shellSideWallSipTran.setBrazingCarlineSidewallFlag(brazingCarlineSidewallFlag);
		shellSideWallSipTran.setWindowProfileFlag(windowProfileFlag);
		shellSideWallSipTran.setWindowSealLeakageFlag(windowSealLeakageFlag);
		shellSideWallSipTran.setWindowSealAngleFlag(windowSealAngleFlag);
		shellSideWallSipTran.setCarlineLeakageFlag(carlineLeakageFlag);
		shellSideWallSipTran.setHorizontalVerticalWeldingGrindingFlag(horizontalVerticalWeldingGrindingFlag);
		shellSideWallSipTran.setDistanceBackpieceVerticalmemberTransverse(distanceBackpieceVerticalmemberTransverse);
		shellSideWallSipTran.setDistanceBackpieceVerticalmemberSingle(distanceBackpieceVerticalmemberSingle);
		shellSideWallSipTran.setDetailsOfModification(detailsOfModification);
		shellSideWallSipTran.setDetailsOfTrialItem(detailsOfTrialItem);
		shellSideWallSipTran.setRemarks(remarks);
		shellSideWallSipTran.setShellSidewallTestingStatus(shellSidewallTestingStatus);
		shellSideWallSipTran.setEntryBy(userID);
		shellSideWallSipTran.setEntryTime(entryTime);

		
		ShellTransaction shellTran=new ShellTransaction();
		shellTran=	(ShellTransaction) session.get(ShellTransaction.class,shellAssetIdAsInt );
		System.out.println("Shell transaction: "+shellTran.getShellTransactionId());
		
		shellTran.setSideWallMakeNoPp(sidewallMakeNoLh);
		shellTran.setSideWallMakeNoNpp(sidewallMakeNoRh);
	    shellTran.setSidewallSipFlag(1);
		
		try
		{
	
			DaoShellSip dao=new DaoShellSip();
		    dao.saveSideWallData(shellSideWallSipTran,shellTran);
		    System.out.println(shellAssetIdAsInt);
		 
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
	
	public String getSidewallDate() {
		return sidewallDate;
	}
	public void setSidewallDate(String sidewallDate) {
		this.sidewallDate = sidewallDate;
	}
	public String getShellAssetId() {
		return shellAssetId;
	}


	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}


	public String getSidewallSipDocNo() {
		return sidewallSipDocNo;
	}

	public void setSidewallSipDocNo(String sidewallSipDocNo) {
		this.sidewallSipDocNo = sidewallSipDocNo;
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


	public String getSidewallMakeNoLh() {
		return sidewallMakeNoLh;
	}


	public void setSidewallMakeNoLh(String sidewallMakeNoLh) {
		this.sidewallMakeNoLh = sidewallMakeNoLh;
	}


	public String getSidewallMakeNoRh() {
		return sidewallMakeNoRh;
	}


	public void setSidewallMakeNoRh(String sidewallMakeNoRh) {
		this.sidewallMakeNoRh = sidewallMakeNoRh;
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


	public String getObservationSidewallSheetTorque() {
		return observationSidewallSheetTorque;
	}


	public void setObservationSidewallSheetTorque(String observationSidewallSheetTorque) {
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


	public String getSidewallSheetLengthLh() {
		return sidewallSheetLengthLh;
	}


	public void setSidewallSheetLengthLh(String sidewallSheetLengthLh) {
		this.sidewallSheetLengthLh = sidewallSheetLengthLh;
	}


	public String getSidewallSheetLengthRh() {
		return sidewallSheetLengthRh;
	}


	public void setSidewallSheetLengthRh(String sidewallSheetLengthRh) {
		this.sidewallSheetLengthRh = sidewallSheetLengthRh;
	}


	public String getSidewallSheetWidth() {
		return sidewallSheetWidth;
	}


	public void setSidewallSheetWidth(String sidewallSheetWidth) {
		this.sidewallSheetWidth = sidewallSheetWidth;
	}


	public String getSidewallHeightVerticalmemberRoofflange() {
		return sidewallHeightVerticalmemberRoofflange;
	}


	public void setSidewallHeightVerticalmemberRoofflange(String sidewallHeightVerticalmemberRoofflange) {
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


	public String getDistanceCarlinetopVerticalmember() {
		return distanceCarlinetopVerticalmember;
	}


	public void setDistanceCarlinetopVerticalmember(String distanceCarlinetopVerticalmember) {
		this.distanceCarlinetopVerticalmember = distanceCarlinetopVerticalmember;
	}


	public String getLengthSidewallCarlineLh() {
		return lengthSidewallCarlineLh;
	}


	public void setLengthSidewallCarlineLh(String lengthSidewallCarlineLh) {
		this.lengthSidewallCarlineLh = lengthSidewallCarlineLh;
	}


	public String getLengthSidewallCarlineRh() {
		return lengthSidewallCarlineRh;
	}


	public void setLengthSidewallCarlineRh(String lengthSidewallCarlineRh) {
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


	public String getRoofFlangeLength() {
		return roofFlangeLength;
	}


	public void setRoofFlangeLength(String roofFlangeLength) {
		this.roofFlangeLength = roofFlangeLength;
	}


	public String getWidthHatchedDoor() {
		return widthHatchedDoor;
	}


	public void setWidthHatchedDoor(String widthHatchedDoor) {
		this.widthHatchedDoor = widthHatchedDoor;
	}


	public String getDistanceBerthchannelVerticalchannelLowerLh() {
		return distanceBerthchannelVerticalchannelLowerLh;
	}


	public void setDistanceBerthchannelVerticalchannelLowerLh(String distanceBerthchannelVerticalchannelLowerLh) {
		this.distanceBerthchannelVerticalchannelLowerLh = distanceBerthchannelVerticalchannelLowerLh;
	}


	public String getDistanceBerthchannelVerticalchannelMiddleLh() {
		return distanceBerthchannelVerticalchannelMiddleLh;
	}


	public void setDistanceBerthchannelVerticalchannelMiddleLh(String distanceBerthchannelVerticalchannelMiddleLh) {
		this.distanceBerthchannelVerticalchannelMiddleLh = distanceBerthchannelVerticalchannelMiddleLh;
	}


	public String getDistanceBerthchannelVerticalchannelUpperLh() {
		return distanceBerthchannelVerticalchannelUpperLh;
	}


	public void setDistanceBerthchannelVerticalchannelUpperLh(String distanceBerthchannelVerticalchannelUpperLh) {
		this.distanceBerthchannelVerticalchannelUpperLh = distanceBerthchannelVerticalchannelUpperLh;
	}


	public String getDistanceBerthchannelVerticalchannelLowerRh() {
		return distanceBerthchannelVerticalchannelLowerRh;
	}


	public void setDistanceBerthchannelVerticalchannelLowerRh(String distanceBerthchannelVerticalchannelLowerRh) {
		this.distanceBerthchannelVerticalchannelLowerRh = distanceBerthchannelVerticalchannelLowerRh;
	}


	public String getDistanceBerthchannelVerticalchannelUpperRh() {
		return distanceBerthchannelVerticalchannelUpperRh;
	}


	public void setDistanceBerthchannelVerticalchannelUpperRh(String distanceBerthchannelVerticalchannelUpperRh) {
		this.distanceBerthchannelVerticalchannelUpperRh = distanceBerthchannelVerticalchannelUpperRh;
	}


	public String getDistanceWindowcenterAnglewindowsupport() {
		return distanceWindowcenterAnglewindowsupport;
	}


	public void setDistanceWindowcenterAnglewindowsupport(String distanceWindowcenterAnglewindowsupport) {
		this.distanceWindowcenterAnglewindowsupport = distanceWindowcenterAnglewindowsupport;
	}


	public String getDistanceWindowedgeChannel() {
		return distanceWindowedgeChannel;
	}


	public void setDistanceWindowedgeChannel(String distanceWindowedgeChannel) {
		this.distanceWindowedgeChannel = distanceWindowedgeChannel;
	}


	public String getHeightCarline() {
		return heightCarline;
	}


	public void setHeightCarline(String heightCarline) {
		this.heightCarline = heightCarline;
	}


	public String getLengthSmallcarline() {
		return lengthSmallcarline;
	}


	public void setLengthSmallcarline(String lengthSmallcarline) {
		this.lengthSmallcarline = lengthSmallcarline;
	}


	public String getAngleLowerluggageBottomsidewall() {
		return angleLowerluggageBottomsidewall;
	}


	public void setAngleLowerluggageBottomsidewall(String angleLowerluggageBottomsidewall) {
		this.angleLowerluggageBottomsidewall = angleLowerluggageBottomsidewall;
	}


	public String getDistanceAnglehoneyprtSidewallDoorside1() {
		return distanceAnglehoneyprtSidewallDoorside1;
	}


	public void setDistanceAnglehoneyprtSidewallDoorside1(String distanceAnglehoneyprtSidewallDoorside1) {
		this.distanceAnglehoneyprtSidewallDoorside1 = distanceAnglehoneyprtSidewallDoorside1;
	}


	public String getDistanceAnglehoneyprtSidewallDoorside2() {
		return distanceAnglehoneyprtSidewallDoorside2;
	}


	public void setDistanceAnglehoneyprtSidewallDoorside2(String distanceAnglehoneyprtSidewallDoorside2) {
		this.distanceAnglehoneyprtSidewallDoorside2 = distanceAnglehoneyprtSidewallDoorside2;
	}


	public String getDistanceAnglehoneyprtSidewallDoorside3() {
		return distanceAnglehoneyprtSidewallDoorside3;
	}


	public void setDistanceAnglehoneyprtSidewallDoorside3(String distanceAnglehoneyprtSidewallDoorside3) {
		this.distanceAnglehoneyprtSidewallDoorside3 = distanceAnglehoneyprtSidewallDoorside3;
	}


	public String getDistanceAnglehoneyprtSidewallDoorside4() {
		return distanceAnglehoneyprtSidewallDoorside4;
	}


	public void setDistanceAnglehoneyprtSidewallDoorside4(String distanceAnglehoneyprtSidewallDoorside4) {
		this.distanceAnglehoneyprtSidewallDoorside4 = distanceAnglehoneyprtSidewallDoorside4;
	}


	public String getDistanceAnglehoneyprtSidewallMiddlearea1() {
		return distanceAnglehoneyprtSidewallMiddlearea1;
	}


	public void setDistanceAnglehoneyprtSidewallMiddlearea1(String distanceAnglehoneyprtSidewallMiddlearea1) {
		this.distanceAnglehoneyprtSidewallMiddlearea1 = distanceAnglehoneyprtSidewallMiddlearea1;
	}


	public String getDistanceAnglehoneyprtSidewallMiddlearea2() {
		return distanceAnglehoneyprtSidewallMiddlearea2;
	}


	public void setDistanceAnglehoneyprtSidewallMiddlearea2(String distanceAnglehoneyprtSidewallMiddlearea2) {
		this.distanceAnglehoneyprtSidewallMiddlearea2 = distanceAnglehoneyprtSidewallMiddlearea2;
	}


	public String getDistanceAnglehoneyprtSidewallMiddlearea3() {
		return distanceAnglehoneyprtSidewallMiddlearea3;
	}


	public void setDistanceAnglehoneyprtSidewallMiddlearea3(String distanceAnglehoneyprtSidewallMiddlearea3) {
		this.distanceAnglehoneyprtSidewallMiddlearea3 = distanceAnglehoneyprtSidewallMiddlearea3;
	}


	public String getDistanceAnglehoneyprtSidewallMiddlearea4() {
		return distanceAnglehoneyprtSidewallMiddlearea4;
	}


	public void setDistanceAnglehoneyprtSidewallMiddlearea4(String distanceAnglehoneyprtSidewallMiddlearea4) {
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



}
