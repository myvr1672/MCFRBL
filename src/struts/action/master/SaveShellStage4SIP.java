package struts.action.master;

import dao.DaoShellStage4;


import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
//import beans.ShellUnderframeSipTrans;
import beans.ShellStage4SipTran;
import beans.ShellTransaction;
import beans.ShellSideWallSipTran;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveShellStage4SIP {
	
	private String shellAssetId;
	private String stage4SipDocNo;
	private String stage4SipShift;
	private String stage4SipDate;
	private String stage4WorkBy;
	private String shellAssembledBy;
	private String jigNo;
	private String underframeCompleteMake;
	private String underFrameNumber;
	private String roofMake;
	private String endwallMakePp;
	private String sideWallMakeNoPp;
	private String endwallMakeNpp;
	private String sideWallMakeNoNpp;
	private String stage4DrawingNo;
	private String stage4WiNo;
	private String distancePartitionFrameSingleLh;
	private String shellAssembly4ObervationRmk;
	private String distancePartitionFrameCabinRh;
	private String widthCorridorPartitionFrame;
	private String distanceDoorcutoutSlidingdoor;
	private String distanceMiddleDoorPullboxbkt;
	private String distancePullboxbktCenterlinePp;
	private String distancePullboxbktCenterlineNpp;
	private String fitmentWatertankbracketBothside;
	private String heightChannelcomplete;
	private String distanceSidewallPartitionpillar;
	private String heightBackpieceLuggageracke;
	private String distanceDestinationBoard;
	private String diatanceSidewallpillarPrtmember;
	private String heightRoofflangeFramepart;
	private String ductInternallogitudinalLateral;
	private String distanceDoorwayCrewcompGenroom;
	private String distanceAuxWatertankbktCentre;
	private String disableLavDoor;
	private String disableLavDoorWidth;
	private String heightBottomroofCrossbracesbottom;
	private String passengerLavArea;
	private String distanceLavPrtframeEnd;
	private String distanceLavPrtframeLavPrtframe;
	private String berthbktLowerLh;
	private String berthbktMiddleLh;
	private String berthbktUpperLh;
	private String berthbktLowerRh;
	private String berthbktUpperRh;
	private String dogBoxArea;
	private String controlRoomArea;
	private String stretcherRoomArea;
	private String distanceSlidingDoorStopper;
	private String distanceLavMountingbkt;
	private String distanceAuxWatertankbkt;
	private String heightBktcompleteRoofflange;
	private String distancePowerpanelmountingCenterline;
	private String distanceCoachcenterlineAuxiliarybkt;
	private String heightLowerberthUpperberth;
	private String distancePullboxPullbox;
	private String distanceLuggagerackRoofflangetop;
	private String distanceDoorAttachmentbkt;
	private String distancePullboxCarlinearch;
	private String heightCrossbraceRoofflange;
	private String mountingangleLowerluggagerackBottomsidewall;
	private String distanceBerthchannelVerticalchannelLowerLh;
	private String distanceBerthchannelVerticalchannelMiddleLh;
	private String distanceBerthchannelVerticalchannelUpperLh;
	private String distanceBerthchannelVerticalchannelLowerRh;
	private String distanceBerthchannelVerticalchannelUpperRh;
	private String fitmentCrossBraces;
	private String fitmentStiffeningPlate;
	private String fitmentPowerPanelFrame;
	private String fitmentWeldingPartitionFrame;
	private String roofbktWireclamping;
	private String detailsModification;
	private String detailsTrialItem;
	private String remarks;
	private String stage4TestingStatus;
	private String entryBy;
	private String entryTime;
	
	public String saveShellStage4SIP()
	{
		
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryTime=new Timestamp(System.currentTimeMillis());
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		ShellStage4SipTran shellStage4SipTran= new ShellStage4SipTran();
		
		ShellSideWallSipTran shellSideWallSipTranNew= new ShellSideWallSipTran();
		ShellSideWallSipTran shellSideWallSipTran= new ShellSideWallSipTran();
		shellSideWallSipTran=(ShellSideWallSipTran) session.get(ShellSideWallSipTran.class, shellAssetIdAsInt);
		if(shellSideWallSipTran!=null)
		{
			if(!"".equals(distanceBerthchannelVerticalchannelLowerLh))
			{
				Integer DistanceBerthchannelVerticalchannelLowerLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelLowerLh);
				shellSideWallSipTran.setDistanceBerthchannelVerticalchannelLowerLh(DistanceBerthchannelVerticalchannelLowerLhAsInt);
				
			}
		
			if(!"".equals(distanceBerthchannelVerticalchannelMiddleLh))
			{
				Integer DistanceBerthchannelVerticalchannelMiddleLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelMiddleLh);
				shellSideWallSipTran.setDistanceBerthchannelVerticalchannelMiddleLh(DistanceBerthchannelVerticalchannelMiddleLhAsInt);
				
			}
		
			if(!"".equals(distanceBerthchannelVerticalchannelUpperLh))
			{
				Integer DistanceBerthchannelVerticalchannelUpperLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelUpperLh);
				shellSideWallSipTran.setDistanceBerthchannelVerticalchannelUpperLh(DistanceBerthchannelVerticalchannelUpperLhAsInt);
				
			}
			
			if(!"".equals(distanceBerthchannelVerticalchannelLowerRh))
			{
				Integer DistanceBerthchannelVerticalchannelLowerRhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelLowerRh);
				shellSideWallSipTran.setDistanceBerthchannelVerticalchannelLowerRh(DistanceBerthchannelVerticalchannelLowerRhAsInt);
				
			}
		
			if(!"".equals(distanceBerthchannelVerticalchannelUpperRh))
			{
				Integer DistanceBerthchannelVerticalchannelUpperRhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelUpperRh);
				shellSideWallSipTran.setDistanceBerthchannelVerticalchannelUpperRh(DistanceBerthchannelVerticalchannelUpperRhAsInt);
				
			}
			
			
		}
		else
		{
		
			shellSideWallSipTranNew.setShellAssetId(shellAssetIdAsInt);
			if(!"".equals(distanceBerthchannelVerticalchannelLowerLh))
			{
				Integer DistanceBerthchannelVerticalchannelLowerLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelLowerLh);
				shellSideWallSipTranNew.setDistanceBerthchannelVerticalchannelLowerLh(DistanceBerthchannelVerticalchannelLowerLhAsInt);
				
			}
		
			if(!"".equals(distanceBerthchannelVerticalchannelMiddleLh))
			{
				Integer DistanceBerthchannelVerticalchannelMiddleLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelMiddleLh);
				shellSideWallSipTranNew.setDistanceBerthchannelVerticalchannelMiddleLh(DistanceBerthchannelVerticalchannelMiddleLhAsInt);
				
			}
		
			if(!"".equals(distanceBerthchannelVerticalchannelUpperLh))
			{
				Integer DistanceBerthchannelVerticalchannelUpperLhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelUpperLh);
				shellSideWallSipTranNew.setDistanceBerthchannelVerticalchannelUpperLh(DistanceBerthchannelVerticalchannelUpperLhAsInt);
				
			}
			
			if(!"".equals(distanceBerthchannelVerticalchannelLowerRh))
			{
				Integer DistanceBerthchannelVerticalchannelLowerRhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelLowerRh);
				shellSideWallSipTranNew.setDistanceBerthchannelVerticalchannelLowerRh(DistanceBerthchannelVerticalchannelLowerRhAsInt);
				
			}
		
			if(!"".equals(distanceBerthchannelVerticalchannelUpperRh))
			{
				Integer DistanceBerthchannelVerticalchannelUpperRhAsInt=Integer.parseInt(distanceBerthchannelVerticalchannelUpperRh);
				shellSideWallSipTranNew.setDistanceBerthchannelVerticalchannelUpperRh(DistanceBerthchannelVerticalchannelUpperRhAsInt);
				
			}

			
		}
		
		shellStage4SipTran.setShellAssetId(shellAssetIdAsInt);
		
		//System.out.println(don);
		
		if(!"".equals(berthbktLowerLh))
		{
			Integer BerthbktLowerLhAsInt=Integer.parseInt(berthbktLowerLh);
			shellStage4SipTran.setBerthbktLowerLh(BerthbktLowerLhAsInt);
			
		}
	
		if(!"".equals(berthbktMiddleLh))
		{
			Integer BerthbktMiddleLhAsInt=Integer.parseInt(berthbktMiddleLh);
			shellStage4SipTran.setBerthbktMiddleLh(BerthbktMiddleLhAsInt);
			
		}
		
		if(!"".equals(berthbktUpperLh))
		{
			Integer BerthbktUpperLhAsInt=Integer.parseInt(berthbktUpperLh);
			shellStage4SipTran.setBerthbktUpperLh(BerthbktUpperLhAsInt);
			
		}
		
		if(!"".equals(berthbktLowerRh))
		{
			Integer BerthbktLowerRhAsInt=Integer.parseInt(berthbktLowerRh);
			shellStage4SipTran.setBerthbktLowerRh(BerthbktLowerRhAsInt);
			
		}
		
		if(!"".equals(berthbktUpperRh))
		{
			Integer BerthbktUpperRhAsInt=Integer.parseInt(berthbktUpperRh);
			shellStage4SipTran.setBerthbktUpperRh(BerthbktUpperRhAsInt);
			
		}	
		System.out.println("hello");
		
		
		
		if(!"".equals(stage4SipDate))
		{
			shellStage4SipTran.setStage4SipDate(DateUtil.convertToDate(stage4SipDate));
		}
		
		
		
		shellStage4SipTran.setStage4SipDocNo(stage4SipDocNo);
		shellStage4SipTran.setStage4SipShift(stage4SipShift);
		shellStage4SipTran.setStage4WorkBy(stage4WorkBy);
		shellStage4SipTran.setStage4DrawingNo(stage4DrawingNo);
		shellStage4SipTran.setStage4WiNo(stage4WiNo);
		shellStage4SipTran.setDistancePartitionFrameSingleLh(distancePartitionFrameSingleLh);
		shellStage4SipTran.setShellAssembly4ObervationRmk(shellAssembly4ObervationRmk);
		shellStage4SipTran.setDistancePartitionFrameCabinRh(distancePartitionFrameCabinRh);
		shellStage4SipTran.setWidthCorridorPartitionFrame(widthCorridorPartitionFrame);
		shellStage4SipTran.setDistanceDoorcutoutSlidingdoor(distanceDoorcutoutSlidingdoor);
		shellStage4SipTran.setDistanceMiddleDoorPullboxbkt(distanceMiddleDoorPullboxbkt);
		shellStage4SipTran.setDistancePullboxbktCenterlinePp(distancePullboxbktCenterlinePp);
		shellStage4SipTran.setDistancePullboxbktCenterlineNpp(distancePullboxbktCenterlineNpp);
		shellStage4SipTran.setFitmentWatertankbracketBothside(fitmentWatertankbracketBothside);
		shellStage4SipTran.setHeightChannelcomplete(heightChannelcomplete);
		shellStage4SipTran.setDistanceSidewallPartitionpillar(distanceSidewallPartitionpillar);
		shellStage4SipTran.setHeightBackpieceLuggageracke(heightBackpieceLuggageracke);
		shellStage4SipTran.setDistanceDestinationBoard(distanceDestinationBoard);
		shellStage4SipTran.setDiatanceSidewallpillarPrtmember(diatanceSidewallpillarPrtmember);
		shellStage4SipTran.setHeightRoofflangeFramepart(heightRoofflangeFramepart);
		shellStage4SipTran.setDuctInternallogitudinalLateral(ductInternallogitudinalLateral);
		shellStage4SipTran.setDistanceDoorwayCrewcompGenroom(distanceDoorwayCrewcompGenroom);
		shellStage4SipTran.setDistanceAuxWatertankbktCentre(distanceAuxWatertankbktCentre);
		shellStage4SipTran.setDisableLavDoor(disableLavDoor);
		shellStage4SipTran.setDisableLavDoorWidth(disableLavDoorWidth);
		shellStage4SipTran.setHeightBottomroofCrossbracesbottom(heightBottomroofCrossbracesbottom);
		shellStage4SipTran.setPassengerLavArea(passengerLavArea);
		shellStage4SipTran.setDistanceLavPrtframeEnd(distanceLavPrtframeEnd);
		shellStage4SipTran.setDistanceLavPrtframeLavPrtframe(distanceLavPrtframeLavPrtframe);
		shellStage4SipTran.setDogBoxArea(dogBoxArea);
		shellStage4SipTran.setControlRoomArea(controlRoomArea);
		shellStage4SipTran.setStretcherRoomArea(stretcherRoomArea);
		shellStage4SipTran.setDistanceSlidingDoorStopper(distanceSlidingDoorStopper);
		shellStage4SipTran.setDistanceLavMountingbkt(distanceLavMountingbkt);
		shellStage4SipTran.setDistanceAuxWatertankbkt(distanceAuxWatertankbkt);
		shellStage4SipTran.setHeightBktcompleteRoofflange(heightBktcompleteRoofflange);
		shellStage4SipTran.setDistancePowerpanelmountingCenterline(distancePowerpanelmountingCenterline);
		shellStage4SipTran.setDistanceCoachcenterlineAuxiliarybkt(distanceCoachcenterlineAuxiliarybkt);
		shellStage4SipTran.setHeightLowerberthUpperberth(heightLowerberthUpperberth);
		shellStage4SipTran.setDistancePullboxPullbox(distancePullboxPullbox);
		shellStage4SipTran.setDistanceLuggagerackRoofflangetop(distanceLuggagerackRoofflangetop);
		shellStage4SipTran.setDistanceDoorAttachmentbkt(distanceDoorAttachmentbkt);
		shellStage4SipTran.setDistancePullboxCarlinearch(distancePullboxCarlinearch);
		shellStage4SipTran.setHeightCrossbraceRoofflange(heightCrossbraceRoofflange);
		shellStage4SipTran.setMountingangleLowerluggagerackBottomsidewall(mountingangleLowerluggagerackBottomsidewall);
		shellStage4SipTran.setFitmentCrossBraces(fitmentCrossBraces);
		shellStage4SipTran.setFitmentStiffeningPlate(fitmentStiffeningPlate);
		shellStage4SipTran.setFitmentPowerPanelFrame(fitmentPowerPanelFrame);
		shellStage4SipTran.setFitmentWeldingPartitionFrame(fitmentWeldingPartitionFrame);
		shellStage4SipTran.setRoofbktWireclamping(roofbktWireclamping);
		shellStage4SipTran.setDetailsModification(detailsModification);
		shellStage4SipTran.setDetailsTrialItem(detailsTrialItem);
		shellStage4SipTran.setRemarks(remarks);
		shellStage4SipTran.setStage4TestingStatus(stage4TestingStatus);
		shellStage4SipTran.setEntryBy(userID);
		shellStage4SipTran.setEntryTime(entryTime);
		
	

		ShellTransaction shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
		shellTran.setShellAssembledBy(shellAssembledBy);
		shellTran.setJigNo(jigNo);
		shellTran.setUnderframeCompleteMake(underframeCompleteMake);
		shellTran.setUnderFrameNumber(underFrameNumber);
		shellTran.setRoofMake(roofMake);
		shellTran.setEndwallMakePp(endwallMakePp);
		shellTran.setEndwallMakeNpp(endwallMakeNpp);
		shellTran.setSideWallMakeNoPp(sideWallMakeNoPp);
		shellTran.setSideWallMakeNoNpp(sideWallMakeNoNpp);
		
		
		shellTran.setStage4SipFlag(1);
		System.out.println("last!!");
		
		try
		{	
			System.out.println(shellAssetIdAsInt);
			DaoShellStage4 dao= new DaoShellStage4();
			dao.saveShellStage4Data(shellStage4SipTran,shellTran,shellSideWallSipTran,shellSideWallSipTranNew);
			//System.out.println(shellAssetIdAsInt);
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

	public String getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getStage4SipDocNo() {
		return stage4SipDocNo;
	}

	public void setStage4SipDocNo(String stage4SipDocNo) {
		this.stage4SipDocNo = stage4SipDocNo;
	}

	public String getStage4SipShift() {
		return stage4SipShift;
	}

	public void setStage4SipShift(String stage4SipShift) {
		this.stage4SipShift = stage4SipShift;
	}

	public String getStage4SipDate() {
		return stage4SipDate;
	}

	public void setStage4SipDate(String stage4SipDate) {
		this.stage4SipDate = stage4SipDate;
	}

	public String getStage4WorkBy() {
		return stage4WorkBy;
	}

	public void setStage4WorkBy(String stage4WorkBy) {
		this.stage4WorkBy = stage4WorkBy;
	}

	public String getShellAssembledBy() {
		return shellAssembledBy;
	}

	public void setShellAssembledBy(String shellAssembledBy) {
		this.shellAssembledBy = shellAssembledBy;
	}

	public String getJigNo() {
		return jigNo;
	}

	public void setJigNo(String jigNo) {
		this.jigNo = jigNo;
	}

	public String getUnderframeCompleteMake() {
		return underframeCompleteMake;
	}

	public void setUnderframeCompleteMake(String underframeCompleteMake) {
		this.underframeCompleteMake = underframeCompleteMake;
	}

	public String getUnderFrameNumber() {
		return underFrameNumber;
	}

	public void setUnderFrameNumber(String underFrameNumber) {
		this.underFrameNumber = underFrameNumber;
	}

	public String getRoofMake() {
		return roofMake;
	}

	public void setRoofMake(String roofMake) {
		this.roofMake = roofMake;
	}

	public String getEndwallMakePp() {
		return endwallMakePp;
	}

	public void setEndwallMakePp(String endwallMakePp) {
		this.endwallMakePp = endwallMakePp;
	}

	public String getSideWallMakeNoPp() {
		return sideWallMakeNoPp;
	}

	public void setSideWallMakeNoPp(String sideWallMakeNoPp) {
		this.sideWallMakeNoPp = sideWallMakeNoPp;
	}

	public String getEndwallMakeNpp() {
		return endwallMakeNpp;
	}

	public void setEndwallMakeNpp(String endwallMakeNpp) {
		this.endwallMakeNpp = endwallMakeNpp;
	}

	public String getSideWallMakeNoNpp() {
		return sideWallMakeNoNpp;
	}

	public void setSideWallMakeNoNpp(String sideWallMakeNoNpp) {
		this.sideWallMakeNoNpp = sideWallMakeNoNpp;
	}

	public String getStage4DrawingNo() {
		return stage4DrawingNo;
	}

	public void setStage4DrawingNo(String stage4DrawingNo) {
		this.stage4DrawingNo = stage4DrawingNo;
	}

	public String getStage4WiNo() {
		return stage4WiNo;
	}

	public void setStage4WiNo(String stage4WiNo) {
		this.stage4WiNo = stage4WiNo;
	}

	public String getDistancePartitionFrameSingleLh() {
		return distancePartitionFrameSingleLh;
	}

	public void setDistancePartitionFrameSingleLh(String distancePartitionFrameSingleLh) {
		this.distancePartitionFrameSingleLh = distancePartitionFrameSingleLh;
	}

	public String getShellAssembly4ObervationRmk() {
		return shellAssembly4ObervationRmk;
	}

	public void setShellAssembly4ObervationRmk(String shellAssembly4ObervationRmk) {
		this.shellAssembly4ObervationRmk = shellAssembly4ObervationRmk;
	}

	public String getDistancePartitionFrameCabinRh() {
		return distancePartitionFrameCabinRh;
	}

	public void setDistancePartitionFrameCabinRh(String distancePartitionFrameCabinRh) {
		this.distancePartitionFrameCabinRh = distancePartitionFrameCabinRh;
	}

	public String getWidthCorridorPartitionFrame() {
		return widthCorridorPartitionFrame;
	}

	public void setWidthCorridorPartitionFrame(String widthCorridorPartitionFrame) {
		this.widthCorridorPartitionFrame = widthCorridorPartitionFrame;
	}

	public String getDistanceDoorcutoutSlidingdoor() {
		return distanceDoorcutoutSlidingdoor;
	}

	public void setDistanceDoorcutoutSlidingdoor(String distanceDoorcutoutSlidingdoor) {
		this.distanceDoorcutoutSlidingdoor = distanceDoorcutoutSlidingdoor;
	}

	public String getDistanceMiddleDoorPullboxbkt() {
		return distanceMiddleDoorPullboxbkt;
	}

	public void setDistanceMiddleDoorPullboxbkt(String distanceMiddleDoorPullboxbkt) {
		this.distanceMiddleDoorPullboxbkt = distanceMiddleDoorPullboxbkt;
	}

	public String getDistancePullboxbktCenterlinePp() {
		return distancePullboxbktCenterlinePp;
	}

	public void setDistancePullboxbktCenterlinePp(String distancePullboxbktCenterlinePp) {
		this.distancePullboxbktCenterlinePp = distancePullboxbktCenterlinePp;
	}

	public String getDistancePullboxbktCenterlineNpp() {
		return distancePullboxbktCenterlineNpp;
	}

	public void setDistancePullboxbktCenterlineNpp(String distancePullboxbktCenterlineNpp) {
		this.distancePullboxbktCenterlineNpp = distancePullboxbktCenterlineNpp;
	}

	public String getFitmentWatertankbracketBothside() {
		return fitmentWatertankbracketBothside;
	}

	public void setFitmentWatertankbracketBothside(String fitmentWatertankbracketBothside) {
		this.fitmentWatertankbracketBothside = fitmentWatertankbracketBothside;
	}

	public String getHeightChannelcomplete() {
		return heightChannelcomplete;
	}

	public void setHeightChannelcomplete(String heightChannelcomplete) {
		this.heightChannelcomplete = heightChannelcomplete;
	}

	public String getDistanceSidewallPartitionpillar() {
		return distanceSidewallPartitionpillar;
	}

	public void setDistanceSidewallPartitionpillar(String distanceSidewallPartitionpillar) {
		this.distanceSidewallPartitionpillar = distanceSidewallPartitionpillar;
	}

	public String getHeightBackpieceLuggageracke() {
		return heightBackpieceLuggageracke;
	}

	public void setHeightBackpieceLuggageracke(String heightBackpieceLuggageracke) {
		this.heightBackpieceLuggageracke = heightBackpieceLuggageracke;
	}

	public String getDistanceDestinationBoard() {
		return distanceDestinationBoard;
	}

	public void setDistanceDestinationBoard(String distanceDestinationBoard) {
		this.distanceDestinationBoard = distanceDestinationBoard;
	}

	public String getDiatanceSidewallpillarPrtmember() {
		return diatanceSidewallpillarPrtmember;
	}

	public void setDiatanceSidewallpillarPrtmember(String diatanceSidewallpillarPrtmember) {
		this.diatanceSidewallpillarPrtmember = diatanceSidewallpillarPrtmember;
	}

	public String getHeightRoofflangeFramepart() {
		return heightRoofflangeFramepart;
	}

	public void setHeightRoofflangeFramepart(String heightRoofflangeFramepart) {
		this.heightRoofflangeFramepart = heightRoofflangeFramepart;
	}

	public String getDuctInternallogitudinalLateral() {
		return ductInternallogitudinalLateral;
	}

	public void setDuctInternallogitudinalLateral(String ductInternallogitudinalLateral) {
		this.ductInternallogitudinalLateral = ductInternallogitudinalLateral;
	}

	public String getDistanceDoorwayCrewcompGenroom() {
		return distanceDoorwayCrewcompGenroom;
	}

	public void setDistanceDoorwayCrewcompGenroom(String distanceDoorwayCrewcompGenroom) {
		this.distanceDoorwayCrewcompGenroom = distanceDoorwayCrewcompGenroom;
	}

	public String getDistanceAuxWatertankbktCentre() {
		return distanceAuxWatertankbktCentre;
	}

	public void setDistanceAuxWatertankbktCentre(String distanceAuxWatertankbktCentre) {
		this.distanceAuxWatertankbktCentre = distanceAuxWatertankbktCentre;
	}

	public String getDisableLavDoor() {
		return disableLavDoor;
	}

	public void setDisableLavDoor(String disableLavDoor) {
		this.disableLavDoor = disableLavDoor;
	}

	public String getDisableLavDoorWidth() {
		return disableLavDoorWidth;
	}

	public void setDisableLavDoorWidth(String disableLavDoorWidth) {
		this.disableLavDoorWidth = disableLavDoorWidth;
	}

	public String getHeightBottomroofCrossbracesbottom() {
		return heightBottomroofCrossbracesbottom;
	}

	public void setHeightBottomroofCrossbracesbottom(String heightBottomroofCrossbracesbottom) {
		this.heightBottomroofCrossbracesbottom = heightBottomroofCrossbracesbottom;
	}

	public String getPassengerLavArea() {
		return passengerLavArea;
	}

	public void setPassengerLavArea(String passengerLavArea) {
		this.passengerLavArea = passengerLavArea;
	}

	public String getDistanceLavPrtframeEnd() {
		return distanceLavPrtframeEnd;
	}

	public void setDistanceLavPrtframeEnd(String distanceLavPrtframeEnd) {
		this.distanceLavPrtframeEnd = distanceLavPrtframeEnd;
	}

	public String getDistanceLavPrtframeLavPrtframe() {
		return distanceLavPrtframeLavPrtframe;
	}

	public void setDistanceLavPrtframeLavPrtframe(String distanceLavPrtframeLavPrtframe) {
		this.distanceLavPrtframeLavPrtframe = distanceLavPrtframeLavPrtframe;
	}

	public String getBerthbktLowerLh() {
		return berthbktLowerLh;
	}

	public void setBerthbktLowerLh(String berthbktLowerLh) {
		this.berthbktLowerLh = berthbktLowerLh;
	}

	public String getBerthbktMiddleLh() {
		return berthbktMiddleLh;
	}

	public void setBerthbktMiddleLh(String berthbktMiddleLh) {
		this.berthbktMiddleLh = berthbktMiddleLh;
	}

	public String getBerthbktUpperLh() {
		return berthbktUpperLh;
	}

	public void setBerthbktUpperLh(String berthbktUpperLh) {
		this.berthbktUpperLh = berthbktUpperLh;
	}

	public String getBerthbktLowerRh() {
		return berthbktLowerRh;
	}

	public void setBerthbktLowerRh(String berthbktLowerRh) {
		this.berthbktLowerRh = berthbktLowerRh;
	}

	public String getBerthbktUpperRh() {
		return berthbktUpperRh;
	}

	public void setBerthbktUpperRh(String berthbktUpperRh) {
		this.berthbktUpperRh = berthbktUpperRh;
	}

	public String getDogBoxArea() {
		return dogBoxArea;
	}

	public void setDogBoxArea(String dogBoxArea) {
		this.dogBoxArea = dogBoxArea;
	}

	public String getControlRoomArea() {
		return controlRoomArea;
	}

	public void setControlRoomArea(String controlRoomArea) {
		this.controlRoomArea = controlRoomArea;
	}

	public String getStretcherRoomArea() {
		return stretcherRoomArea;
	}

	public void setStretcherRoomArea(String stretcherRoomArea) {
		this.stretcherRoomArea = stretcherRoomArea;
	}

	public String getDistanceSlidingDoorStopper() {
		return distanceSlidingDoorStopper;
	}

	public void setDistanceSlidingDoorStopper(String distanceSlidingDoorStopper) {
		this.distanceSlidingDoorStopper = distanceSlidingDoorStopper;
	}

	public String getDistanceLavMountingbkt() {
		return distanceLavMountingbkt;
	}

	public void setDistanceLavMountingbkt(String distanceLavMountingbkt) {
		this.distanceLavMountingbkt = distanceLavMountingbkt;
	}

	public String getDistanceAuxWatertankbkt() {
		return distanceAuxWatertankbkt;
	}

	public void setDistanceAuxWatertankbkt(String distanceAuxWatertankbkt) {
		this.distanceAuxWatertankbkt = distanceAuxWatertankbkt;
	}

	public String getHeightBktcompleteRoofflange() {
		return heightBktcompleteRoofflange;
	}

	public void setHeightBktcompleteRoofflange(String heightBktcompleteRoofflange) {
		this.heightBktcompleteRoofflange = heightBktcompleteRoofflange;
	}

	public String getDistancePowerpanelmountingCenterline() {
		return distancePowerpanelmountingCenterline;
	}

	public void setDistancePowerpanelmountingCenterline(String distancePowerpanelmountingCenterline) {
		this.distancePowerpanelmountingCenterline = distancePowerpanelmountingCenterline;
	}

	public String getDistanceCoachcenterlineAuxiliarybkt() {
		return distanceCoachcenterlineAuxiliarybkt;
	}

	public void setDistanceCoachcenterlineAuxiliarybkt(String distanceCoachcenterlineAuxiliarybkt) {
		this.distanceCoachcenterlineAuxiliarybkt = distanceCoachcenterlineAuxiliarybkt;
	}

	public String getHeightLowerberthUpperberth() {
		return heightLowerberthUpperberth;
	}

	public void setHeightLowerberthUpperberth(String heightLowerberthUpperberth) {
		this.heightLowerberthUpperberth = heightLowerberthUpperberth;
	}

	public String getDistancePullboxPullbox() {
		return distancePullboxPullbox;
	}

	public void setDistancePullboxPullbox(String distancePullboxPullbox) {
		this.distancePullboxPullbox = distancePullboxPullbox;
	}

	public String getDistanceLuggagerackRoofflangetop() {
		return distanceLuggagerackRoofflangetop;
	}

	public void setDistanceLuggagerackRoofflangetop(String distanceLuggagerackRoofflangetop) {
		this.distanceLuggagerackRoofflangetop = distanceLuggagerackRoofflangetop;
	}

	public String getDistanceDoorAttachmentbkt() {
		return distanceDoorAttachmentbkt;
	}

	public void setDistanceDoorAttachmentbkt(String distanceDoorAttachmentbkt) {
		this.distanceDoorAttachmentbkt = distanceDoorAttachmentbkt;
	}

	public String getDistancePullboxCarlinearch() {
		return distancePullboxCarlinearch;
	}

	public void setDistancePullboxCarlinearch(String distancePullboxCarlinearch) {
		this.distancePullboxCarlinearch = distancePullboxCarlinearch;
	}

	public String getHeightCrossbraceRoofflange() {
		return heightCrossbraceRoofflange;
	}

	public void setHeightCrossbraceRoofflange(String heightCrossbraceRoofflange) {
		this.heightCrossbraceRoofflange = heightCrossbraceRoofflange;
	}

	public String getMountingangleLowerluggagerackBottomsidewall() {
		return mountingangleLowerluggagerackBottomsidewall;
	}

	public void setMountingangleLowerluggagerackBottomsidewall(String mountingangleLowerluggagerackBottomsidewall) {
		this.mountingangleLowerluggagerackBottomsidewall = mountingangleLowerluggagerackBottomsidewall;
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

	public String getFitmentCrossBraces() {
		return fitmentCrossBraces;
	}

	public void setFitmentCrossBraces(String fitmentCrossBraces) {
		this.fitmentCrossBraces = fitmentCrossBraces;
	}

	public String getFitmentStiffeningPlate() {
		return fitmentStiffeningPlate;
	}

	public void setFitmentStiffeningPlate(String fitmentStiffeningPlate) {
		this.fitmentStiffeningPlate = fitmentStiffeningPlate;
	}

	public String getFitmentPowerPanelFrame() {
		return fitmentPowerPanelFrame;
	}

	public void setFitmentPowerPanelFrame(String fitmentPowerPanelFrame) {
		this.fitmentPowerPanelFrame = fitmentPowerPanelFrame;
	}

	public String getFitmentWeldingPartitionFrame() {
		return fitmentWeldingPartitionFrame;
	}

	public void setFitmentWeldingPartitionFrame(String fitmentWeldingPartitionFrame) {
		this.fitmentWeldingPartitionFrame = fitmentWeldingPartitionFrame;
	}

	public String getRoofbktWireclamping() {
		return roofbktWireclamping;
	}

	public void setRoofbktWireclamping(String roofbktWireclamping) {
		this.roofbktWireclamping = roofbktWireclamping;
	}

	public String getDetailsModification() {
		return detailsModification;
	}

	public void setDetailsModification(String detailsModification) {
		this.detailsModification = detailsModification;
	}

	public String getDetailsTrialItem() {
		return detailsTrialItem;
	}

	public void setDetailsTrialItem(String detailsTrialItem) {
		this.detailsTrialItem = detailsTrialItem;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStage4TestingStatus() {
		return stage4TestingStatus;
	}

	public void setStage4TestingStatus(String stage4TestingStatus) {
		this.stage4TestingStatus = stage4TestingStatus;
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
