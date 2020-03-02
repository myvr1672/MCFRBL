package struts.action.master;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import hibernateConnect.HibernateConfig;
import java.sql.Timestamp;

import common.DateUtil;
import beans.ShellTransaction;
import beans.ShellSideWallSipTran;
import beans.ShellStage1SipTran;
import beans.ShellEndwallSipTran;
import dao.DaoShellStage1SIP;

public class SaveShellAssemblyStage1 {
	public String shellAssetId;
             							
	private String stage1SipDocNo;
	private String shellType;
	private String shellNumber;
	private String stage1SipShift; 
	private String stage1WorkBy;
	private String	stage1SipDate; 
	private String shellAssembledBy;
    private String jigNo;
	private String underframeCompleteMake;
	private String roofMake;
    private String endwallMakePp; 
    private String	sideWallMakeNoPp;              							
    private String endwallMakeNpp;
    private String sideWallMakeNoNpp;
	private String stage1DrawingNo;
	private String stage1WiNo; 
	private String sideDoorMakeNoLeft;
	private String	sideDoorMakeNoRight;              							
    private String roofAcAssemblyMakeNoPp;
	private String roofAcAssemblyMakeNoNpp;
	private String wtccMakeNoPp;
    private String wtccMakeNoNpp; 
    private String	slidingDoorMakeNoLeft;              							
    private String slidingDoorMakeNoRight;
	private String itemAsPerDrawingFlag;
	private String complianceWiFlag;
	private String weldingThroatLengthFlag; 
	private String levelingCenteringUnderframeFlag;
	private String	noOfLevelTrestle;              							
    private String grindingCleaningSolebarFlag;
	private String weildablePrimerSolebarFlag;
	private String lengthOverBodyLh;
    private String lengthOverBodyRh; 
	private String sidewallSheetLengthLh;
	private String	sidewallSheetLengthRh;              							
    private String sidewallSheetWidth;
	private String sidewallHeightVerticalmemberRoofflange;
	private String shellWidthPp;
	private String shellWidthNpp; 
	private String shellWidthCenter;
	private String	endwallWidthPp;              							
	private String	endwallWidthNpp;              							
    private String lateralWidthAcTroughPp;
	private String lateralWidthAcTroughNpp;
	private String longitudinalWidthAcTroughPp;
	private String longitudinalWidthAcTroughNpp; 
	private String distanceVestibuleUchannelPp;
	private String	distanceVestibuleUchannelNpp;            
    private String diagonalWidthEntranceDoor1;
	private String diagonalWidthEntranceDoor2;
	private String diagonalWidthEntranceDoor3;
	private String diagonalWidthEntranceDoor4; 
	private String diagonalWidthEntranceDoor5;
	private String	diagonalWidthEntranceDoor6;     
    private String heightEntranceDoor1;
	private String heightEntranceDoor2;
	private String heightEntranceDoor3;
	private String heightEntranceDoor4; 
	private String heightEntranceDoor5;
	private String	heightEntranceDoor6;              							
	private String	widthEntranceDoor1;              							
    private String widthEntranceDoor2;
	private String widthEntranceDoor3;
	private String widthEntranceDoor4;
	private String widthEntranceDoor5; 
	private String widthEntranceDoor6;
	private String	heightTopTroughfloorToRoofsheetBottomPp;              							
    private String heightTopTroughfloorToRoofsheetBottomNpp;
	private String heightTopPillarsupportToBottomCrossbraceSingleside1;
	private String heightTopPillarsupportToBottomCrossbraceCabinside1;
	private String heightTopPillarsupportToBottomCrossbraceSingleside2; 
	private String heightTopPillarsupportToBottomCrossbraceCabinside2;
	private String	heightTopPillarsupportToBottomCrossbraceSingleside3;              							
    private String heightTopPillarsupportToBottomCrossbraceCabinside3;
	private String heightTopPillarsupportToBottomCrossbraceSingleside4;
	private String heightTopPillarsupportToBottomCrossbraceCabinside4;
	private String heightTopPillarsupportToBottomCrossbraceSingleside5; 
	private String heightTopPillarsupportToBottomCrossbraceCabinside5;
	private String	heightTopPillarsupportToBottomCrossbraceSingleside6;  
	private String	heightTopPillarsupportToBottomCrossbraceCabinside6;              							
    private String heightCrossbracePartitionpillerSingelside1;
	private String heightCrossbracePartitionpillerCabinside1;
	private String heightCrossbracePartitionpillerSingelside2;
	private String heightCrossbracePartitionpillerCabinside2; 
	private String heightCrossbracePartitionpillerSingelside3;
	private String	heightCrossbracePartitionpillerCabinside3;              							
    private String heightCrossbracePartitionpillerSingelside4;
	private String heightCrossbracePartitionpillerCabinside4;
	private String heightCrossbracePartitionpillerSingelside5;
	private String heightCrossbracePartitionpillerCabinside5; 
	private String heightCrossbracePartitionpillerSingelside6;
	private String	heightCrossbracePartitionpillerCabinside6;
	private String heightVestibuleplateEndwallPp;
	private String heightVestibuleplateEndwallNpp;
	private String heightWtccPp;
	private String heightWtccNpp; 
	private String widthWtccPp;
	private String	widthWtccNpp;              							
    private String heightTopThroughfloorBottomRoofArchPp;
	private String heightTopThroughfloorBottomRoofArchNpp;
	private String heightFloorpillerbracketToRoofSingle1;
	private String heightFloorpillerbracketToRoofSingle7; 
	private String heightFloorpillerbracketToRoofSingle2;
	private String	heightFloorpillerbracketToRoofSingle8;              							
    private String heightFloorpillerbracketToRoofSingle3;
	private String heightFloorpillerbracketToRoofSingle9;
	private String heightFloorpillerbracketToRoofSingle4;
	private String heightFloorpillerbracketToRoofSingle10; 
	private String heightFloorpillerbracketToRoofSingle5;
	private String heightFloorpillerbracketToRoofSingle11;                   							
	private String heightFloorpillerbracketToRoofSingle6;     
	private String heightFloorpillerbracketToRoofCabin1;
	private String heightFloorpillerbracketToRoofCabin7;                   							
	private String heightFloorpillerbracketToRoofCabin2;              							
	private String heightFloorpillerbracketToRoofCabin8;
	private String heightFloorpillerbracketToRoofCabin3;
	private String heightFloorpillerbracketToRoofCabin9;
	private String heightFloorpillerbracketToRoofCabin4;
	private String heightFloorpillerbracketToRoofCabin10;
	private String heightFloorpillerbracketToRoofCabin5;
	private String heightFloorpillerbracketToRoofCabin11;
	private String heightFloorpillerbracketToRoofCabin6;
	private String slidingDoorHeightLh;
	private String slidingDoorHeightRh;
	private String slidingDoorWidthLh;
	private String slidingDoorWidthRh;
	private String distanceRoofEndwallPp;
	private String distanceRoofEndwallNpp;
	private String roofElementShellSocketHoleDiePp;
	private String roofElementShellSocketHoleDieNpp;
	private String roofElementStudDiagonalPp;
	private String roofElementStudDiagonalNpp;
	private String checkedDimenRemarks;
	private String alignmentSidewallRoofarchFlag;
	private String weldingSidewallLavsidewallFlag;
	private String weldingRoofarchSidewallCarlineFlag;
	private String weldingCompletedoorframeFlag;
	private String weldingCompleteendwallFinalroofelementFlag;
	private String weldingRoofSidewallCarlineFlag;
	private String grindHorizontalVerticalJointFlag;
	private String alignmentBothSidewallUnderframeFlag;
	private String detailsOfModification;
	private String detailsOfTrial;
	private String remarks;
	private String stage1TestingStatus;
	private String entryBy;
	private String entryTime;
	
	
	
	
	
	
	public String saveStage1()
{
	

		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		ShellEndwallSipTran sewallSIP=new ShellEndwallSipTran();
		ShellSideWallSipTran sswallSIP= new ShellSideWallSipTran ();
		
		ShellStage1SipTran shellStage1SipTran=new ShellStage1SipTran();
		
		//shellassetid
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		shellStage1SipTran.setShellAssetId(shellAssetIdAsInt);
		//update ShellStage1SipTran
		
		
		
	
		
		shellStage1SipTran.setStage1SipDocNo(stage1SipDocNo);
		shellStage1SipTran.setStage1SipShift(stage1SipShift);
		shellStage1SipTran.setStage1WorkBy(stage1WorkBy);
		
		//date conversion
		if(!"".equals(stage1SipDate))	{shellStage1SipTran.setStage1SipDate(DateUtil.convertToDate(stage1SipDate));}
		
		shellStage1SipTran.setStage1DrawingNo(stage1DrawingNo);
		shellStage1SipTran.setStage1WiNo(stage1WiNo);
		shellStage1SipTran.setItemAsPerDrawingFlag(itemAsPerDrawingFlag);
		shellStage1SipTran.setComplianceWiFlag(complianceWiFlag);
		shellStage1SipTran.setWeldingThroatLengthFlag(weldingThroatLengthFlag);
		shellStage1SipTran.setLevelingCenteringUnderframeFlag(levelingCenteringUnderframeFlag);
		
		if(!"".equals(noOfLevelTrestle)){Integer noOfLevelTrestleAsInt=Integer.parseInt(noOfLevelTrestle);
		shellStage1SipTran.setNoOfLevelTrestle( noOfLevelTrestleAsInt);}
		
	//	if(!"".equals(noOfLevelTrestle)){Integer noOfLevelTrestleAsInt=Integer.parseInt(noOfLevelTrestle);
		//shellStage1SipTran.setNoOfLevelTrestle(noOfLevelTrestleAsInt);}
		
		shellStage1SipTran.setGrindingCleaningSolebarFlag(grindingCleaningSolebarFlag);
		shellStage1SipTran.setWeildablePrimerSolebarFlag(weildablePrimerSolebarFlag);
		if(!"".equals(lengthOverBodyLh)){Integer lengthOverBodyLhAsInt=Integer.parseInt(lengthOverBodyLh);
		shellStage1SipTran.setLengthOverBodyLh(lengthOverBodyLhAsInt);}
		if(!"".equals(lengthOverBodyRh)){Integer lengthOverBodyRhAsInt=Integer.parseInt(lengthOverBodyRh);
		shellStage1SipTran.setLengthOverBodyRh(lengthOverBodyRhAsInt);}
		if(!"".equals(shellWidthPp)){Integer shellWidthPpAsInt=Integer.parseInt(shellWidthPp);
		shellStage1SipTran.setShellWidthPp(shellWidthPpAsInt);}
		if(!"".equals(shellWidthNpp)){Integer shellWidthNppAsInt=Integer.parseInt(shellWidthNpp);
		shellStage1SipTran.setShellWidthNpp(shellWidthNppAsInt);}
		
		if(!"".equals(shellWidthCenter)){Integer shellWidthCenterAsInt=Integer.parseInt(shellWidthCenter);
		shellStage1SipTran.setShellWidthCenter(shellWidthCenterAsInt);}
		if(!"".equals(lateralWidthAcTroughPp)){Integer lateralWidthAcTroughPpAsInt=Integer.parseInt(lateralWidthAcTroughPp);
		shellStage1SipTran.setLateralWidthAcTroughPp(lateralWidthAcTroughPpAsInt);}
		if(!"".equals(lateralWidthAcTroughNpp)){Integer lateralWidthAcTroughNppAsInt=Integer.parseInt(lateralWidthAcTroughNpp);
		shellStage1SipTran.setLateralWidthAcTroughNpp(lateralWidthAcTroughNppAsInt);}
		if(!"".equals(longitudinalWidthAcTroughPp)){Integer longitudinalWidthAcTroughPpAsInt=Integer.parseInt(longitudinalWidthAcTroughPp);
		shellStage1SipTran.setLongitudinalWidthAcTroughPp(longitudinalWidthAcTroughPpAsInt);}
		if(!"".equals(longitudinalWidthAcTroughNpp)){Integer longitudinalWidthAcTroughNppAsInt=Integer.parseInt(longitudinalWidthAcTroughNpp);
		shellStage1SipTran.setLongitudinalWidthAcTroughNpp(longitudinalWidthAcTroughNppAsInt);}
		if(!"".equals(diagonalWidthEntranceDoor1)){Integer diagonalWidthEntranceDoor1AsInt=Integer.parseInt(diagonalWidthEntranceDoor1);
		shellStage1SipTran.setDiagonalWidthEntranceDoor1(diagonalWidthEntranceDoor1AsInt);}
		if(!"".equals(diagonalWidthEntranceDoor2)){Integer diagonalWidthEntranceDoor2AsInt=Integer.parseInt(diagonalWidthEntranceDoor2);
		shellStage1SipTran.setDiagonalWidthEntranceDoor2(diagonalWidthEntranceDoor2AsInt);}
		if(!"".equals(diagonalWidthEntranceDoor3)){Integer diagonalWidthEntranceDoor3AsInt=Integer.parseInt(diagonalWidthEntranceDoor3);
		shellStage1SipTran.setDiagonalWidthEntranceDoor3(diagonalWidthEntranceDoor3AsInt);}
		if(!"".equals(diagonalWidthEntranceDoor4)){Integer diagonalWidthEntranceDoor4AsInt=Integer.parseInt(diagonalWidthEntranceDoor4);
		shellStage1SipTran.setDiagonalWidthEntranceDoor4(diagonalWidthEntranceDoor4AsInt);}
		if(!"".equals(diagonalWidthEntranceDoor5)){Integer diagonalWidthEntranceDoor5AsInt=Integer.parseInt(diagonalWidthEntranceDoor5);
		shellStage1SipTran.setDiagonalWidthEntranceDoor5(diagonalWidthEntranceDoor5AsInt);}
		if(!"".equals(diagonalWidthEntranceDoor6)){Integer diagonalWidthEntranceDoor6AsInt=Integer.parseInt(diagonalWidthEntranceDoor6);
		shellStage1SipTran.setDiagonalWidthEntranceDoor6(diagonalWidthEntranceDoor6AsInt);}
		if(!"".equals(heightEntranceDoor1)){Integer heightEntranceDoor1AsInt=Integer.parseInt(heightEntranceDoor1);
		shellStage1SipTran.setHeightEntranceDoor1(heightEntranceDoor1AsInt);}
		if(!"".equals(heightEntranceDoor2)){Integer heightEntranceDoor2AsInt=Integer.parseInt(heightEntranceDoor2);
		shellStage1SipTran.setHeightEntranceDoor2(heightEntranceDoor2AsInt);}
		if(!"".equals(heightEntranceDoor3)){Integer heightEntranceDoor3AsInt=Integer.parseInt(heightEntranceDoor3);
		shellStage1SipTran.setHeightEntranceDoor3(heightEntranceDoor3AsInt);}
		if(!"".equals(heightEntranceDoor4)){Integer heightEntranceDoor4AsInt=Integer.parseInt(heightEntranceDoor4);
		shellStage1SipTran.setHeightEntranceDoor4(heightEntranceDoor4AsInt);}
		if(!"".equals(heightEntranceDoor5)){Integer heightEntranceDoor5AsInt=Integer.parseInt(heightEntranceDoor5);
		shellStage1SipTran.setHeightEntranceDoor5(heightEntranceDoor5AsInt);}
		if(!"".equals(heightEntranceDoor6)){Integer heightEntranceDoor6AsInt=Integer.parseInt(heightEntranceDoor6);
		shellStage1SipTran.setHeightEntranceDoor6(heightEntranceDoor6AsInt);}
		if(!"".equals(widthEntranceDoor1)){Integer widthEntranceDoor1AsInt=Integer.parseInt(widthEntranceDoor1);
		shellStage1SipTran.setWidthEntranceDoor1(widthEntranceDoor1AsInt);}
		if(!"".equals(widthEntranceDoor2)){Integer widthEntranceDoor2AsInt=Integer.parseInt(widthEntranceDoor2);
		shellStage1SipTran.setWidthEntranceDoor2(widthEntranceDoor2AsInt);}
		if(!"".equals(widthEntranceDoor3)){Integer widthEntranceDoor3AsInt=Integer.parseInt(widthEntranceDoor3);
		shellStage1SipTran.setWidthEntranceDoor3(widthEntranceDoor3AsInt);}
		if(!"".equals(widthEntranceDoor4)){Integer widthEntranceDoor4AsInt=Integer.parseInt(widthEntranceDoor4);
		shellStage1SipTran.setWidthEntranceDoor4(widthEntranceDoor4AsInt);}
		if(!"".equals(widthEntranceDoor5)){Integer widthEntranceDoor5AsInt=Integer.parseInt(widthEntranceDoor5);
		shellStage1SipTran.setWidthEntranceDoor5(widthEntranceDoor5AsInt);}
		if(!"".equals(widthEntranceDoor6)){Integer widthEntranceDoor6AsInt=Integer.parseInt(widthEntranceDoor6);
		shellStage1SipTran.setWidthEntranceDoor6(widthEntranceDoor6AsInt);}
		if(!"".equals(heightTopTroughfloorToRoofsheetBottomPp)){Integer heightTopTroughfloorToRoofsheetBottomPpAsInt=Integer.parseInt(heightTopTroughfloorToRoofsheetBottomPp);
		shellStage1SipTran.setHeightTopTroughfloorToRoofsheetBottomPp(heightTopTroughfloorToRoofsheetBottomPpAsInt);}
		if(!"".equals(heightTopTroughfloorToRoofsheetBottomNpp)){Integer heightTopTroughfloorToRoofsheetBottomNppAsInt=Integer.parseInt(heightTopTroughfloorToRoofsheetBottomNpp);
		shellStage1SipTran.setHeightTopTroughfloorToRoofsheetBottomNpp(heightTopTroughfloorToRoofsheetBottomNppAsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceSingleside1)){Integer heightTopPillarsupportToBottomCrossbraceSingleside1AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceSingleside1);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceSingleside1(heightTopPillarsupportToBottomCrossbraceSingleside1AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceCabinside1)){Integer heightTopPillarsupportToBottomCrossbraceCabinside1AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceCabinside1);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceCabinside1(heightTopPillarsupportToBottomCrossbraceCabinside1AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceSingleside2)){Integer heightTopPillarsupportToBottomCrossbraceSingleside2AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceSingleside2);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceSingleside2(heightTopPillarsupportToBottomCrossbraceSingleside2AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceCabinside2)){Integer heightTopPillarsupportToBottomCrossbraceCabinside2AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceCabinside2);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceCabinside2(heightTopPillarsupportToBottomCrossbraceCabinside2AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceSingleside3)){Integer heightTopPillarsupportToBottomCrossbraceSingleside3AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceSingleside3);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceSingleside3(heightTopPillarsupportToBottomCrossbraceSingleside3AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceCabinside3)){Integer heightTopPillarsupportToBottomCrossbraceCabinside3AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceCabinside3);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceCabinside3(heightTopPillarsupportToBottomCrossbraceCabinside3AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceSingleside4)){Integer heightTopPillarsupportToBottomCrossbraceSingleside4AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceSingleside4);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceSingleside4(heightTopPillarsupportToBottomCrossbraceSingleside4AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceCabinside4)){Integer heightTopPillarsupportToBottomCrossbraceCabinside4AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceCabinside4);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceCabinside4(heightTopPillarsupportToBottomCrossbraceCabinside4AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceSingleside5)){Integer heightTopPillarsupportToBottomCrossbraceSingleside5AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceSingleside5);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceSingleside5(heightTopPillarsupportToBottomCrossbraceSingleside5AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceCabinside5)){Integer heightTopPillarsupportToBottomCrossbraceCabinside5AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceCabinside5);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceCabinside5(heightTopPillarsupportToBottomCrossbraceCabinside5AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceSingleside6)){Integer heightTopPillarsupportToBottomCrossbraceSingleside6AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceSingleside6);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceSingleside6(heightTopPillarsupportToBottomCrossbraceSingleside6AsInt);}
		if(!"".equals(heightTopPillarsupportToBottomCrossbraceCabinside6)){Integer heightTopPillarsupportToBottomCrossbraceCabinside6AsInt=Integer.parseInt(heightTopPillarsupportToBottomCrossbraceCabinside6);
		shellStage1SipTran.setHeightTopPillarsupportToBottomCrossbraceCabinside6(heightTopPillarsupportToBottomCrossbraceCabinside6AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerSingelside1)){Integer heightCrossbracePartitionpillerSingelside1AsInt=Integer.parseInt(heightCrossbracePartitionpillerSingelside1);
		shellStage1SipTran.setHeightCrossbracePartitionpillerSingelside1(heightCrossbracePartitionpillerSingelside1AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerCabinside1)){Integer heightCrossbracePartitionpillerCabinside1AsInt=Integer.parseInt(heightCrossbracePartitionpillerCabinside1);
		shellStage1SipTran.setHeightCrossbracePartitionpillerCabinside1(heightCrossbracePartitionpillerCabinside1AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerSingelside2)){Integer heightCrossbracePartitionpillerSingelside2AsInt=Integer.parseInt(heightCrossbracePartitionpillerSingelside2);
		shellStage1SipTran.setHeightCrossbracePartitionpillerSingelside2(heightCrossbracePartitionpillerSingelside2AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerCabinside2)){Integer heightCrossbracePartitionpillerCabinside2AsInt=Integer.parseInt(heightCrossbracePartitionpillerCabinside2);
		shellStage1SipTran.setHeightCrossbracePartitionpillerCabinside2(heightCrossbracePartitionpillerCabinside2AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerSingelside3)){Integer heightCrossbracePartitionpillerSingelside3AsInt=Integer.parseInt(heightCrossbracePartitionpillerSingelside3);
		shellStage1SipTran.setHeightCrossbracePartitionpillerSingelside3(heightCrossbracePartitionpillerSingelside3AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerCabinside3)){Integer heightCrossbracePartitionpillerCabinside3AsInt=Integer.parseInt(heightCrossbracePartitionpillerCabinside3);
		shellStage1SipTran.setHeightCrossbracePartitionpillerCabinside3(heightCrossbracePartitionpillerCabinside3AsInt);}
        if(!"".equals(heightCrossbracePartitionpillerSingelside4)){Integer heightCrossbracePartitionpillerSingelside4AsInt=Integer.parseInt(heightCrossbracePartitionpillerSingelside4);
		shellStage1SipTran.setHeightCrossbracePartitionpillerSingelside4(heightCrossbracePartitionpillerSingelside4AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerCabinside4)){Integer heightCrossbracePartitionpillerCabinside4AsInt=Integer.parseInt(heightCrossbracePartitionpillerCabinside4);
		shellStage1SipTran.setHeightCrossbracePartitionpillerCabinside4(heightCrossbracePartitionpillerCabinside4AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerSingelside5)){Integer heightCrossbracePartitionpillerSingelside5AsInt=Integer.parseInt(heightCrossbracePartitionpillerSingelside5);
		shellStage1SipTran.setHeightCrossbracePartitionpillerSingelside5(heightCrossbracePartitionpillerSingelside5AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerCabinside5)){Integer heightCrossbracePartitionpillerCabinside5AsInt=Integer.parseInt(heightCrossbracePartitionpillerCabinside5);
		shellStage1SipTran.setHeightCrossbracePartitionpillerCabinside5(heightCrossbracePartitionpillerCabinside5AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerSingelside6)){Integer heightCrossbracePartitionpillerSingelside6AsInt=Integer.parseInt(heightCrossbracePartitionpillerSingelside6);
		shellStage1SipTran.setHeightCrossbracePartitionpillerSingelside6(heightCrossbracePartitionpillerSingelside6AsInt);}
		if(!"".equals(heightCrossbracePartitionpillerCabinside6)){Integer heightCrossbracePartitionpillerCabinside6AsInt=Integer.parseInt(heightCrossbracePartitionpillerCabinside6);
		shellStage1SipTran.setHeightCrossbracePartitionpillerCabinside6(heightCrossbracePartitionpillerCabinside6AsInt);}
		 if(!"".equals(heightVestibuleplateEndwallPp)){Integer heightVestibuleplateEndwallPpAsInt=Integer.parseInt(heightVestibuleplateEndwallPp);
		 shellStage1SipTran.setHeightVestibuleplateEndwallPp(heightVestibuleplateEndwallPpAsInt);}
			if(!"".equals(heightVestibuleplateEndwallNpp)){Integer heightVestibuleplateEndwallNppAsInt=Integer.parseInt(heightVestibuleplateEndwallNpp);
			shellStage1SipTran.setHeightVestibuleplateEndwallNpp(heightVestibuleplateEndwallNppAsInt);}
		if(!"".equals(heightWtccPp)){Integer heightWtccPpAsInt=Integer.parseInt(heightWtccPp);
		shellStage1SipTran.setHeightWtccPp(heightWtccPpAsInt);}
		if(!"".equals(heightWtccNpp)){Integer heightWtccNppAsInt=Integer.parseInt(heightWtccNpp);
		shellStage1SipTran.setHeightWtccNpp(heightWtccNppAsInt);}
		if(!"".equals(widthWtccPp)){Integer widthWtccPpAsInt=Integer.parseInt(widthWtccPp);
		shellStage1SipTran.setWidthWtccPp(widthWtccPpAsInt);}
		if(!"".equals(widthWtccNpp)){Integer widthWtccNppAsInt=Integer.parseInt(widthWtccNpp);
		shellStage1SipTran.setWidthWtccNpp(widthWtccNppAsInt);}
		if(!"".equals(heightTopThroughfloorBottomRoofArchPp)){Integer heightTopThroughfloorBottomRoofArchPpAsInt=Integer.parseInt(heightTopThroughfloorBottomRoofArchPp);
		shellStage1SipTran.setHeightTopThroughfloorBottomRoofArchPp(heightTopThroughfloorBottomRoofArchPpAsInt);}
		if(!"".equals(heightTopThroughfloorBottomRoofArchNpp)){Integer heightTopThroughfloorBottomRoofArchNppAsInt=Integer.parseInt(heightTopThroughfloorBottomRoofArchNpp);
		shellStage1SipTran.setHeightTopThroughfloorBottomRoofArchNpp(heightTopThroughfloorBottomRoofArchNppAsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle1)){Integer heightFloorpillerbracketToRoofSingle1AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle1);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle1(heightFloorpillerbracketToRoofSingle1AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle7)){Integer heightFloorpillerbracketToRoofSingle7AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle7);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle7(heightFloorpillerbracketToRoofSingle7AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle2)){Integer heightFloorpillerbracketToRoofSingle2AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle2);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle2(heightFloorpillerbracketToRoofSingle2AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle8)){Integer heightFloorpillerbracketToRoofSingle8AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle8);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle8(heightFloorpillerbracketToRoofSingle8AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle3)){Integer heightFloorpillerbracketToRoofSingle3AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle3);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle3(heightFloorpillerbracketToRoofSingle3AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle9)){Integer heightFloorpillerbracketToRoofSingle9AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle9);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle9(heightFloorpillerbracketToRoofSingle9AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle4)){Integer heightFloorpillerbracketToRoofSingle4AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle4);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle4(heightFloorpillerbracketToRoofSingle4AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle10)){Integer heightFloorpillerbracketToRoofSingle10AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle10);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle10(heightFloorpillerbracketToRoofSingle10AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle5)){Integer heightFloorpillerbracketToRoofSingle5AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle5);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle5(heightFloorpillerbracketToRoofSingle5AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle11)){Integer heightFloorpillerbracketToRoofSingle11AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle11);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle11(heightFloorpillerbracketToRoofSingle11AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofSingle6)){Integer heightFloorpillerbracketToRoofSingle6AsInt=Integer.parseInt(heightFloorpillerbracketToRoofSingle6);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofSingle6(heightFloorpillerbracketToRoofSingle6AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin1)){Integer heightFloorpillerbracketToRoofCabin1AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin1);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin1(heightFloorpillerbracketToRoofCabin1AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin7)){Integer heightFloorpillerbracketToRoofCabin7AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin7);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin7(heightFloorpillerbracketToRoofCabin7AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin2)){Integer heightFloorpillerbracketToRoofCabin2AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin2);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin2(heightFloorpillerbracketToRoofCabin2AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin8)){Integer heightFloorpillerbracketToRoofCabin8AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin8);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin8(heightFloorpillerbracketToRoofCabin8AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin3)){Integer heightFloorpillerbracketToRoofCabin3AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin3);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin3(heightFloorpillerbracketToRoofCabin3AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin9)){Integer heightFloorpillerbracketToRoofCabin9AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin9);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin9(heightFloorpillerbracketToRoofCabin9AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin4)){Integer heightFloorpillerbracketToRoofCabin4AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin4);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin4(heightFloorpillerbracketToRoofCabin4AsInt);}
        if(!"".equals(heightFloorpillerbracketToRoofCabin10)){Integer heightFloorpillerbracketToRoofCabin10AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin10);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin10(heightFloorpillerbracketToRoofCabin10AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin5)){Integer heightFloorpillerbracketToRoofCabin5AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin5);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin5(heightFloorpillerbracketToRoofCabin5AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin11)){Integer heightFloorpillerbracketToRoofCabin11AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin11);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin11(heightFloorpillerbracketToRoofCabin11AsInt);}
		if(!"".equals(heightFloorpillerbracketToRoofCabin6)){Integer heightFloorpillerbracketToRoofCabin6AsInt=Integer.parseInt(heightFloorpillerbracketToRoofCabin6);
		shellStage1SipTran.setHeightFloorpillerbracketToRoofCabin6(heightFloorpillerbracketToRoofCabin6AsInt);}
		if(!"".equals(slidingDoorHeightLh)){Integer slidingDoorHeightLhAsInt=Integer.parseInt(slidingDoorHeightLh);
		shellStage1SipTran.setSlidingDoorHeightLh(slidingDoorHeightLhAsInt);}
		if(!"".equals(slidingDoorHeightRh)){Integer slidingDoorHeightRhAsInt=Integer.parseInt(slidingDoorHeightRh);
		shellStage1SipTran.setSlidingDoorHeightRh(slidingDoorHeightRhAsInt);}
		if(!"".equals(slidingDoorWidthLh)){Integer slidingDoorWidthLhAsInt=Integer.parseInt(slidingDoorWidthLh);
		shellStage1SipTran.setSlidingDoorWidthLh(slidingDoorWidthLhAsInt);}
		if(!"".equals(slidingDoorWidthRh)){Integer slidingDoorWidthRhAsInt=Integer.parseInt(slidingDoorWidthRh);
		shellStage1SipTran.setSlidingDoorWidthRh(slidingDoorWidthRhAsInt);}
		if(!"".equals(distanceRoofEndwallPp)){Integer distanceRoofEndwallPpAsInt=Integer.parseInt(distanceRoofEndwallPp);
		shellStage1SipTran.setDistanceRoofEndwallPp(distanceRoofEndwallPpAsInt);}
		if(!"".equals(distanceRoofEndwallNpp)){Integer distanceRoofEndwallNppAsInt=Integer.parseInt(distanceRoofEndwallNpp);
		shellStage1SipTran.setDistanceRoofEndwallNpp(distanceRoofEndwallNppAsInt);}
		if(!"".equals(roofElementShellSocketHoleDiePp)){Integer roofElementShellSocketHoleDiePpAsInt=Integer.parseInt(roofElementShellSocketHoleDiePp);
		shellStage1SipTran.setRoofElementShellSocketHoleDiePp(roofElementShellSocketHoleDiePpAsInt);}
		if(!"".equals(roofElementShellSocketHoleDieNpp)){Integer roofElementShellSocketHoleDieNppAsInt=Integer.parseInt(roofElementShellSocketHoleDieNpp);
		shellStage1SipTran.setRoofElementShellSocketHoleDieNpp(roofElementShellSocketHoleDieNppAsInt);}
		
		shellStage1SipTran.setRoofElementStudDiagonalPp(roofElementStudDiagonalPp);
		shellStage1SipTran.setRoofElementStudDiagonalNpp(roofElementStudDiagonalNpp);
		shellStage1SipTran.setCheckedDimenRemarks(checkedDimenRemarks);
		shellStage1SipTran.setAlignmentSidewallRoofarchFlag(alignmentSidewallRoofarchFlag);
		shellStage1SipTran.setWeldingSidewallLavsidewallFlag(weldingSidewallLavsidewallFlag);
		shellStage1SipTran.setWeldingRoofarchSidewallCarlineFlag(weldingRoofarchSidewallCarlineFlag);
		shellStage1SipTran.setWeldingCompletedoorframeFlag(weldingCompletedoorframeFlag);
		shellStage1SipTran.setWeldingCompleteendwallFinalroofelementFlag(weldingCompleteendwallFinalroofelementFlag);
		shellStage1SipTran.setWeldingRoofSidewallCarlineFlag(weldingRoofSidewallCarlineFlag);
		shellStage1SipTran.setGrindHorizontalVerticalJointFlag(grindHorizontalVerticalJointFlag);
		shellStage1SipTran.setAlignmentBothSidewallUnderframeFlag(alignmentBothSidewallUnderframeFlag);
		shellStage1SipTran.setDetailsOfModification(detailsOfModification);
		shellStage1SipTran.setDetailsOfTrial(detailsOfTrial);
		shellStage1SipTran.setRemarks(remarks);
		shellStage1SipTran.setStage1TestingStatus(stage1TestingStatus);
		
		shellStage1SipTran.setEntryBy(userID);
		Timestamp entryTime =new Timestamp(System.currentTimeMillis()) ;
		shellStage1SipTran.setEntryTime(entryTime);
		
		
		//update sidewallsiptran
		
		ShellSideWallSipTran shellSideWallSipTran=null;
		shellSideWallSipTran=(ShellSideWallSipTran) session.get(ShellSideWallSipTran.class, shellAssetIdAsInt);
		if(shellSideWallSipTran!=null)
		{
		
		
		if(!"".equals(sidewallSheetLengthLh)){Integer sidewallSheetLengthLhAsInt=Integer.parseInt(sidewallSheetLengthLh);
		shellSideWallSipTran.setSidewallSheetLengthLh(sidewallSheetLengthLhAsInt);}
		if(!"".equals(sidewallSheetLengthRh)){Integer sidewallSheetLengthRhAsInt=Integer.parseInt(sidewallSheetLengthRh);
		shellSideWallSipTran.setSidewallSheetLengthRh(sidewallSheetLengthRhAsInt);}
		if(!"".equals(sidewallSheetWidth)){Integer sidewallSheetWidthAsInt=Integer.parseInt(sidewallSheetWidth);
		shellSideWallSipTran.setSidewallSheetWidth(sidewallSheetWidthAsInt);}
		if(!"".equals(sidewallHeightVerticalmemberRoofflange)){Integer sidewallHeightVerticalmemberRoofflangeAsInt=Integer.parseInt(sidewallHeightVerticalmemberRoofflange);
		shellSideWallSipTran.setSidewallHeightVerticalmemberRoofflange(sidewallHeightVerticalmemberRoofflangeAsInt);}
}
		else
			
		{
			
					sswallSIP.setShellAssetId(shellAssetIdAsInt);
					if(!"".equals(sidewallSheetLengthLh)){Integer sidewallSheetLengthLhAsInt=Integer.parseInt(sidewallSheetLengthLh);
					sswallSIP.setSidewallSheetLengthLh(sidewallSheetLengthLhAsInt);}
					if(!"".equals(sidewallSheetLengthRh)){Integer sidewallSheetLengthRhAsInt=Integer.parseInt(sidewallSheetLengthRh);
					sswallSIP.setSidewallSheetLengthRh(sidewallSheetLengthRhAsInt);}
					if(!"".equals(sidewallSheetWidth)){Integer sidewallSheetWidthAsInt=Integer.parseInt(sidewallSheetWidth);
					sswallSIP.setSidewallSheetWidth(sidewallSheetWidthAsInt);}
					if(!"".equals(sidewallHeightVerticalmemberRoofflange)){Integer sidewallHeightVerticalmemberRoofflangeAsInt=Integer.parseInt(sidewallHeightVerticalmemberRoofflange);
					sswallSIP.setSidewallHeightVerticalmemberRoofflange(sidewallHeightVerticalmemberRoofflangeAsInt);}
		}
		
		
		//update endwallsiptran
		ShellEndwallSipTran shellEndwallSipTran=null;
		shellEndwallSipTran=(ShellEndwallSipTran) session.get(ShellEndwallSipTran.class, shellAssetIdAsInt);
		if(shellEndwallSipTran!=null)
		{
		

		if(!"".equals(endwallWidthPp)){Integer endwallWidthPpAsInt=Integer.parseInt(endwallWidthPp);
		shellEndwallSipTran.setEndwallWidthPp(endwallWidthPpAsInt);}
		if(!"".equals(endwallWidthNpp)){Integer endwallWidthNppAsInt=Integer.parseInt(endwallWidthNpp);
		shellEndwallSipTran.setEndwallWidthNpp(endwallWidthNppAsInt);}
		if(!"".equals(distanceVestibuleUchannelPp)){Integer distanceVestibuleUchannelPpAsInt=Integer.parseInt(distanceVestibuleUchannelPp);
		shellEndwallSipTran.setDistanceVestibuleUchannelPp(distanceVestibuleUchannelPpAsInt);}
		if(!"".equals(distanceVestibuleUchannelNpp)){Integer distanceVestibuleUchannelNppAsInt=Integer.parseInt(distanceVestibuleUchannelNpp);
		shellEndwallSipTran.setDistanceVestibuleUchannelNpp(distanceVestibuleUchannelNppAsInt);}
        if(!"".equals(heightVestibuleplateEndwallPp)){Integer heightVestibuleplateEndwallPpAsInt=Integer.parseInt(heightVestibuleplateEndwallPp);
		shellEndwallSipTran.setHeightVestibuleplateEndwallPp(heightVestibuleplateEndwallPpAsInt);}
		if(!"".equals(heightVestibuleplateEndwallNpp)){Integer heightVestibuleplateEndwallNppAsInt=Integer.parseInt(heightVestibuleplateEndwallNpp);
		shellEndwallSipTran.setHeightVestibuleplateEndwallNpp(heightVestibuleplateEndwallNppAsInt);}
}
		else
		{
			
			
			sewallSIP.setShellAssetId(shellAssetIdAsInt);
			if(!"".equals(endwallWidthPp)){Integer endwallWidthPpAsInt=Integer.parseInt(endwallWidthPp);
			sewallSIP.setEndwallWidthPp(endwallWidthPpAsInt);}
			if(!"".equals(endwallWidthNpp)){Integer endwallWidthNppAsInt=Integer.parseInt(endwallWidthNpp);
			sewallSIP.setEndwallWidthNpp(endwallWidthNppAsInt);}
			if(!"".equals(distanceVestibuleUchannelPp)){Integer distanceVestibuleUchannelPpAsInt=Integer.parseInt(distanceVestibuleUchannelPp);
			sewallSIP.setDistanceVestibuleUchannelPp(distanceVestibuleUchannelPpAsInt);}
			if(!"".equals(distanceVestibuleUchannelNpp)){Integer distanceVestibuleUchannelNppAsInt=Integer.parseInt(distanceVestibuleUchannelNpp);
			sewallSIP.setDistanceVestibuleUchannelNpp(distanceVestibuleUchannelNppAsInt);}
	        if(!"".equals(heightVestibuleplateEndwallPp)){Integer heightVestibuleplateEndwallPpAsInt=Integer.parseInt(heightVestibuleplateEndwallPp);
	        sewallSIP.setHeightVestibuleplateEndwallPp(heightVestibuleplateEndwallPpAsInt);}
			if(!"".equals(heightVestibuleplateEndwallNpp)){Integer heightVestibuleplateEndwallNppAsInt=Integer.parseInt(heightVestibuleplateEndwallNpp);
			sewallSIP.setHeightVestibuleplateEndwallNpp(heightVestibuleplateEndwallNppAsInt);}
			
		}
		
		
		// update shelltran
			ShellTransaction shellTran=null;
			shellTran=(ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			if(shellTran!=null)
			{
				shellTran.setShellType(shellType);
				shellTran.setShellNumber(shellNumber);
				shellTran.setShellAssembledBy(shellAssembledBy);
				shellTran.setJigNo(jigNo);
				shellTran.setUnderframeCompleteMake(underframeCompleteMake);
				shellTran.setRoofMake(roofMake);
				shellTran.setEndwallMakePp(endwallMakePp);
				shellTran.setSideWallMakeNoPp(sideWallMakeNoPp);
				shellTran.setEndwallMakeNpp(endwallMakeNpp);
				shellTran.setSideWallMakeNoNpp(sideWallMakeNoNpp);
				shellTran.setSideDoorMakeNoLeft(sideDoorMakeNoLeft);
				shellTran.setSideDoorMakeNoRight(sideDoorMakeNoRight);
				shellTran.setRoofAcAssemblyMakeNoPp(roofAcAssemblyMakeNoPp);
				shellTran.setRoofAcAssemblyMakeNoNpp(roofAcAssemblyMakeNoNpp);
				shellTran.setWtccMakeNoPp(wtccMakeNoPp);
				shellTran.setWtccMakeNoNpp(wtccMakeNoNpp);
				shellTran.setSlidingDoorMakeNoLeft(slidingDoorMakeNoLeft);
				shellTran.setSlidingDoorMakeNoRight(slidingDoorMakeNoRight);
			}

		    shellTran.setStage1SipFlag(1);
		    try
		    {
		    	DaoShellStage1SIP dao=new DaoShellStage1SIP();
		    dao.saveAssemblyStage1Data(shellStage1SipTran,shellSideWallSipTran,shellEndwallSipTran,shellTran,sswallSIP,sewallSIP);
		    System.out.println(slidingDoorMakeNoRight);
		    
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
		
			
			
			
			
			//ShellTransaction shellTran=(ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			}

		





	public String getShellAssetId() {
		return shellAssetId;
	}






	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}






	public String getStage1SipDocNo() {
		return stage1SipDocNo;
	}






	public void setStage1SipDocNo(String stage1SipDocNo) {
		this.stage1SipDocNo = stage1SipDocNo;
	}






	public String getShellType() {
		return shellType;
	}






	public void setShellType(String shellType) {
		this.shellType = shellType;
	}






	public String getShellNumber() {
		return shellNumber;
	}







	public void setShellNumber(String shellNumber) {
		this.shellNumber = shellNumber;
	}







	public String getStage1SipShift() {
		return stage1SipShift;
	}






	public void setStage1SipShift(String stage1SipShift) {
		this.stage1SipShift = stage1SipShift;
	}






	public String getStage1WorkBy() {
		return stage1WorkBy;
	}






	public void setStage1WorkBy(String stage1WorkBy) {
		this.stage1WorkBy = stage1WorkBy;
	}






	public String getStage1SipDate() {
		return stage1SipDate;
	}






	public void setStage1SipDate(String stage1SipDate) {
		this.stage1SipDate = stage1SipDate;
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






	public String getStage1DrawingNo() {
		return stage1DrawingNo;
	}






	public void setStage1DrawingNo(String stage1DrawingNo) {
		this.stage1DrawingNo = stage1DrawingNo;
	}






	public String getStage1WiNo() {
		return stage1WiNo;
	}






	public void setStage1WiNo(String stage1WiNo) {
		this.stage1WiNo = stage1WiNo;
	}






	public String getSideDoorMakeNoLeft() {
		return sideDoorMakeNoLeft;
	}






	public void setSideDoorMakeNoLeft(String sideDoorMakeNoLeft) {
		this.sideDoorMakeNoLeft = sideDoorMakeNoLeft;
	}






	public String getSideDoorMakeNoRight() {
		return sideDoorMakeNoRight;
	}






	public void setSideDoorMakeNoRight(String sideDoorMakeNoRight) {
		this.sideDoorMakeNoRight = sideDoorMakeNoRight;
	}






	public String getRoofAcAssemblyMakeNoPp() {
		return roofAcAssemblyMakeNoPp;
	}






	public void setRoofAcAssemblyMakeNoPp(String roofAcAssemblyMakeNoPp) {
		this.roofAcAssemblyMakeNoPp = roofAcAssemblyMakeNoPp;
	}






	public String getRoofAcAssemblyMakeNoNpp() {
		return roofAcAssemblyMakeNoNpp;
	}






	public void setRoofAcAssemblyMakeNoNpp(String roofAcAssemblyMakeNoNpp) {
		this.roofAcAssemblyMakeNoNpp = roofAcAssemblyMakeNoNpp;
	}






	public String getWtccMakeNoPp() {
		return wtccMakeNoPp;
	}






	public void setWtccMakeNoPp(String wtccMakeNoPp) {
		this.wtccMakeNoPp = wtccMakeNoPp;
	}






	public String getWtccMakeNoNpp() {
		return wtccMakeNoNpp;
	}






	public void setWtccMakeNoNpp(String wtccMakeNoNpp) {
		this.wtccMakeNoNpp = wtccMakeNoNpp;
	}






	public String getSlidingDoorMakeNoLeft() {
		return slidingDoorMakeNoLeft;
	}






	public void setSlidingDoorMakeNoLeft(String slidingDoorMakeNoLeft) {
		this.slidingDoorMakeNoLeft = slidingDoorMakeNoLeft;
	}






	public String getSlidingDoorMakeNoRight() {
		return slidingDoorMakeNoRight;
	}






	public void setSlidingDoorMakeNoRight(String slidingDoorMakeNoRight) {
		this.slidingDoorMakeNoRight = slidingDoorMakeNoRight;
	}






	public String getItemAsPerDrawingFlag() {
		return itemAsPerDrawingFlag;
	}






	public void setItemAsPerDrawingFlag(String itemAsPerDrawingFlag) {
		this.itemAsPerDrawingFlag = itemAsPerDrawingFlag;
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






	public String getLevelingCenteringUnderframeFlag() {
		return levelingCenteringUnderframeFlag;
	}






	public void setLevelingCenteringUnderframeFlag(String levelingCenteringUnderframeFlag) {
		this.levelingCenteringUnderframeFlag = levelingCenteringUnderframeFlag;
	}






	public String getNoOfLevelTrestle() {
		return noOfLevelTrestle;
	}






	public void setNoOfLevelTrestle(String noOfLevelTrestle) {
		this.noOfLevelTrestle = noOfLevelTrestle;
	}






	public String getGrindingCleaningSolebarFlag() {
		return grindingCleaningSolebarFlag;
	}






	public void setGrindingCleaningSolebarFlag(String grindingCleaningSolebarFlag) {
		this.grindingCleaningSolebarFlag = grindingCleaningSolebarFlag;
	}






	public String getWeildablePrimerSolebarFlag() {
		return weildablePrimerSolebarFlag;
	}






	public void setWeildablePrimerSolebarFlag(String weildablePrimerSolebarFlag) {
		this.weildablePrimerSolebarFlag = weildablePrimerSolebarFlag;
	}






	public String getLengthOverBodyLh() {
		return lengthOverBodyLh;
	}






	public void setLengthOverBodyLh(String lengthOverBodyLh) {
		this.lengthOverBodyLh = lengthOverBodyLh;
	}






	public String getLengthOverBodyRh() {
		return lengthOverBodyRh;
	}






	public void setLengthOverBodyRh(String lengthOverBodyRh) {
		this.lengthOverBodyRh = lengthOverBodyRh;
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






	public String getShellWidthPp() {
		return shellWidthPp;
	}






	public void setShellWidthPp(String shellWidthPp) {
		this.shellWidthPp = shellWidthPp;
	}






	public String getShellWidthNpp() {
		return shellWidthNpp;
	}






	public void setShellWidthNpp(String shellWidthNpp) {
		this.shellWidthNpp = shellWidthNpp;
	}






	public String getShellWidthCenter() {
		return shellWidthCenter;
	}






	public void setShellWidthCenter(String shellWidthCenter) {
		this.shellWidthCenter = shellWidthCenter;
	}






	public String getEndwallWidthPp() {
		return endwallWidthPp;
	}






	public void setEndwallWidthPp(String endwallWidthPp) {
		this.endwallWidthPp = endwallWidthPp;
	}






	public String getEndwallWidthNpp() {
		return endwallWidthNpp;
	}






	public void setEndwallWidthNpp(String endwallWidthNpp) {
		this.endwallWidthNpp = endwallWidthNpp;
	}






	public String getLateralWidthAcTroughPp() {
		return lateralWidthAcTroughPp;
	}






	public void setLateralWidthAcTroughPp(String lateralWidthAcTroughPp) {
		this.lateralWidthAcTroughPp = lateralWidthAcTroughPp;
	}






	public String getLateralWidthAcTroughNpp() {
		return lateralWidthAcTroughNpp;
	}






	public void setLateralWidthAcTroughNpp(String lateralWidthAcTroughNpp) {
		this.lateralWidthAcTroughNpp = lateralWidthAcTroughNpp;
	}






	public String getLongitudinalWidthAcTroughPp() {
		return longitudinalWidthAcTroughPp;
	}






	public void setLongitudinalWidthAcTroughPp(String longitudinalWidthAcTroughPp) {
		this.longitudinalWidthAcTroughPp = longitudinalWidthAcTroughPp;
	}






	public String getLongitudinalWidthAcTroughNpp() {
		return longitudinalWidthAcTroughNpp;
	}






	public void setLongitudinalWidthAcTroughNpp(String longitudinalWidthAcTroughNpp) {
		this.longitudinalWidthAcTroughNpp = longitudinalWidthAcTroughNpp;
	}






	public String getDistanceVestibuleUchannelPp() {
		return distanceVestibuleUchannelPp;
	}






	public void setDistanceVestibuleUchannelPp(String distanceVestibuleUchannelPp) {
		this.distanceVestibuleUchannelPp = distanceVestibuleUchannelPp;
	}






	public String getDistanceVestibuleUchannelNpp() {
		return distanceVestibuleUchannelNpp;
	}






	public void setDistanceVestibuleUchannelNpp(String distanceVestibuleUchannelNpp) {
		this.distanceVestibuleUchannelNpp = distanceVestibuleUchannelNpp;
	}






	public String getDiagonalWidthEntranceDoor1() {
		return diagonalWidthEntranceDoor1;
	}






	public void setDiagonalWidthEntranceDoor1(String diagonalWidthEntranceDoor1) {
		this.diagonalWidthEntranceDoor1 = diagonalWidthEntranceDoor1;
	}






	public String getDiagonalWidthEntranceDoor2() {
		return diagonalWidthEntranceDoor2;
	}






	public void setDiagonalWidthEntranceDoor2(String diagonalWidthEntranceDoor2) {
		this.diagonalWidthEntranceDoor2 = diagonalWidthEntranceDoor2;
	}






	public String getDiagonalWidthEntranceDoor3() {
		return diagonalWidthEntranceDoor3;
	}






	public void setDiagonalWidthEntranceDoor3(String diagonalWidthEntranceDoor3) {
		this.diagonalWidthEntranceDoor3 = diagonalWidthEntranceDoor3;
	}






	public String getDiagonalWidthEntranceDoor4() {
		return diagonalWidthEntranceDoor4;
	}






	public void setDiagonalWidthEntranceDoor4(String diagonalWidthEntranceDoor4) {
		this.diagonalWidthEntranceDoor4 = diagonalWidthEntranceDoor4;
	}






	public String getDiagonalWidthEntranceDoor5() {
		return diagonalWidthEntranceDoor5;
	}






	public void setDiagonalWidthEntranceDoor5(String diagonalWidthEntranceDoor5) {
		this.diagonalWidthEntranceDoor5 = diagonalWidthEntranceDoor5;
	}






	public String getDiagonalWidthEntranceDoor6() {
		return diagonalWidthEntranceDoor6;
	}






	public void setDiagonalWidthEntranceDoor6(String diagonalWidthEntranceDoor6) {
		this.diagonalWidthEntranceDoor6 = diagonalWidthEntranceDoor6;
	}






	public String getHeightEntranceDoor1() {
		return heightEntranceDoor1;
	}






	public void setHeightEntranceDoor1(String heightEntranceDoor1) {
		this.heightEntranceDoor1 = heightEntranceDoor1;
	}






	public String getHeightEntranceDoor2() {
		return heightEntranceDoor2;
	}






	public void setHeightEntranceDoor2(String heightEntranceDoor2) {
		this.heightEntranceDoor2 = heightEntranceDoor2;
	}






	public String getHeightEntranceDoor3() {
		return heightEntranceDoor3;
	}






	public void setHeightEntranceDoor3(String heightEntranceDoor3) {
		this.heightEntranceDoor3 = heightEntranceDoor3;
	}






	public String getHeightEntranceDoor4() {
		return heightEntranceDoor4;
	}






	public void setHeightEntranceDoor4(String heightEntranceDoor4) {
		this.heightEntranceDoor4 = heightEntranceDoor4;
	}






	public String getHeightEntranceDoor5() {
		return heightEntranceDoor5;
	}






	public void setHeightEntranceDoor5(String heightEntranceDoor5) {
		this.heightEntranceDoor5 = heightEntranceDoor5;
	}






	public String getHeightEntranceDoor6() {
		return heightEntranceDoor6;
	}






	public void setHeightEntranceDoor6(String heightEntranceDoor6) {
		this.heightEntranceDoor6 = heightEntranceDoor6;
	}






	public String getWidthEntranceDoor1() {
		return widthEntranceDoor1;
	}






	public void setWidthEntranceDoor1(String widthEntranceDoor1) {
		this.widthEntranceDoor1 = widthEntranceDoor1;
	}






	public String getWidthEntranceDoor2() {
		return widthEntranceDoor2;
	}






	public void setWidthEntranceDoor2(String widthEntranceDoor2) {
		this.widthEntranceDoor2 = widthEntranceDoor2;
	}






	public String getWidthEntranceDoor3() {
		return widthEntranceDoor3;
	}






	public void setWidthEntranceDoor3(String widthEntranceDoor3) {
		this.widthEntranceDoor3 = widthEntranceDoor3;
	}






	public String getWidthEntranceDoor4() {
		return widthEntranceDoor4;
	}






	public void setWidthEntranceDoor4(String widthEntranceDoor4) {
		this.widthEntranceDoor4 = widthEntranceDoor4;
	}






	public String getWidthEntranceDoor5() {
		return widthEntranceDoor5;
	}






	public void setWidthEntranceDoor5(String widthEntranceDoor5) {
		this.widthEntranceDoor5 = widthEntranceDoor5;
	}






	public String getWidthEntranceDoor6() {
		return widthEntranceDoor6;
	}






	public void setWidthEntranceDoor6(String widthEntranceDoor6) {
		this.widthEntranceDoor6 = widthEntranceDoor6;
	}






	public String getHeightTopTroughfloorToRoofsheetBottomPp() {
		return heightTopTroughfloorToRoofsheetBottomPp;
	}






	public void setHeightTopTroughfloorToRoofsheetBottomPp(String heightTopTroughfloorToRoofsheetBottomPp) {
		this.heightTopTroughfloorToRoofsheetBottomPp = heightTopTroughfloorToRoofsheetBottomPp;
	}






	public String getHeightTopTroughfloorToRoofsheetBottomNpp() {
		return heightTopTroughfloorToRoofsheetBottomNpp;
	}






	public void setHeightTopTroughfloorToRoofsheetBottomNpp(String heightTopTroughfloorToRoofsheetBottomNpp) {
		this.heightTopTroughfloorToRoofsheetBottomNpp = heightTopTroughfloorToRoofsheetBottomNpp;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceSingleside1() {
		return heightTopPillarsupportToBottomCrossbraceSingleside1;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceSingleside1(
			String heightTopPillarsupportToBottomCrossbraceSingleside1) {
		this.heightTopPillarsupportToBottomCrossbraceSingleside1 = heightTopPillarsupportToBottomCrossbraceSingleside1;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceCabinside1() {
		return heightTopPillarsupportToBottomCrossbraceCabinside1;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceCabinside1(
			String heightTopPillarsupportToBottomCrossbraceCabinside1) {
		this.heightTopPillarsupportToBottomCrossbraceCabinside1 = heightTopPillarsupportToBottomCrossbraceCabinside1;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceSingleside2() {
		return heightTopPillarsupportToBottomCrossbraceSingleside2;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceSingleside2(
			String heightTopPillarsupportToBottomCrossbraceSingleside2) {
		this.heightTopPillarsupportToBottomCrossbraceSingleside2 = heightTopPillarsupportToBottomCrossbraceSingleside2;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceCabinside2() {
		return heightTopPillarsupportToBottomCrossbraceCabinside2;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceCabinside2(
			String heightTopPillarsupportToBottomCrossbraceCabinside2) {
		this.heightTopPillarsupportToBottomCrossbraceCabinside2 = heightTopPillarsupportToBottomCrossbraceCabinside2;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceSingleside3() {
		return heightTopPillarsupportToBottomCrossbraceSingleside3;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceSingleside3(
			String heightTopPillarsupportToBottomCrossbraceSingleside3) {
		this.heightTopPillarsupportToBottomCrossbraceSingleside3 = heightTopPillarsupportToBottomCrossbraceSingleside3;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceCabinside3() {
		return heightTopPillarsupportToBottomCrossbraceCabinside3;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceCabinside3(
			String heightTopPillarsupportToBottomCrossbraceCabinside3) {
		this.heightTopPillarsupportToBottomCrossbraceCabinside3 = heightTopPillarsupportToBottomCrossbraceCabinside3;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceSingleside4() {
		return heightTopPillarsupportToBottomCrossbraceSingleside4;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceSingleside4(
			String heightTopPillarsupportToBottomCrossbraceSingleside4) {
		this.heightTopPillarsupportToBottomCrossbraceSingleside4 = heightTopPillarsupportToBottomCrossbraceSingleside4;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceCabinside4() {
		return heightTopPillarsupportToBottomCrossbraceCabinside4;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceCabinside4(
			String heightTopPillarsupportToBottomCrossbraceCabinside4) {
		this.heightTopPillarsupportToBottomCrossbraceCabinside4 = heightTopPillarsupportToBottomCrossbraceCabinside4;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceSingleside5() {
		return heightTopPillarsupportToBottomCrossbraceSingleside5;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceSingleside5(
			String heightTopPillarsupportToBottomCrossbraceSingleside5) {
		this.heightTopPillarsupportToBottomCrossbraceSingleside5 = heightTopPillarsupportToBottomCrossbraceSingleside5;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceCabinside5() {
		return heightTopPillarsupportToBottomCrossbraceCabinside5;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceCabinside5(
			String heightTopPillarsupportToBottomCrossbraceCabinside5) {
		this.heightTopPillarsupportToBottomCrossbraceCabinside5 = heightTopPillarsupportToBottomCrossbraceCabinside5;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceSingleside6() {
		return heightTopPillarsupportToBottomCrossbraceSingleside6;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceSingleside6(
			String heightTopPillarsupportToBottomCrossbraceSingleside6) {
		this.heightTopPillarsupportToBottomCrossbraceSingleside6 = heightTopPillarsupportToBottomCrossbraceSingleside6;
	}






	public String getHeightTopPillarsupportToBottomCrossbraceCabinside6() {
		return heightTopPillarsupportToBottomCrossbraceCabinside6;
	}






	public void setHeightTopPillarsupportToBottomCrossbraceCabinside6(
			String heightTopPillarsupportToBottomCrossbraceCabinside6) {
		this.heightTopPillarsupportToBottomCrossbraceCabinside6 = heightTopPillarsupportToBottomCrossbraceCabinside6;
	}






	public String getHeightCrossbracePartitionpillerSingelside1() {
		return heightCrossbracePartitionpillerSingelside1;
	}






	public void setHeightCrossbracePartitionpillerSingelside1(String heightCrossbracePartitionpillerSingelside1) {
		this.heightCrossbracePartitionpillerSingelside1 = heightCrossbracePartitionpillerSingelside1;
	}






	public String getHeightCrossbracePartitionpillerCabinside1() {
		return heightCrossbracePartitionpillerCabinside1;
	}






	public void setHeightCrossbracePartitionpillerCabinside1(String heightCrossbracePartitionpillerCabinside1) {
		this.heightCrossbracePartitionpillerCabinside1 = heightCrossbracePartitionpillerCabinside1;
	}






	public String getHeightCrossbracePartitionpillerSingelside2() {
		return heightCrossbracePartitionpillerSingelside2;
	}






	public void setHeightCrossbracePartitionpillerSingelside2(String heightCrossbracePartitionpillerSingelside2) {
		this.heightCrossbracePartitionpillerSingelside2 = heightCrossbracePartitionpillerSingelside2;
	}






	public String getHeightCrossbracePartitionpillerCabinside2() {
		return heightCrossbracePartitionpillerCabinside2;
	}






	public void setHeightCrossbracePartitionpillerCabinside2(String heightCrossbracePartitionpillerCabinside2) {
		this.heightCrossbracePartitionpillerCabinside2 = heightCrossbracePartitionpillerCabinside2;
	}






	public String getHeightCrossbracePartitionpillerSingelside3() {
		return heightCrossbracePartitionpillerSingelside3;
	}






	public void setHeightCrossbracePartitionpillerSingelside3(String heightCrossbracePartitionpillerSingelside3) {
		this.heightCrossbracePartitionpillerSingelside3 = heightCrossbracePartitionpillerSingelside3;
	}






	public String getHeightCrossbracePartitionpillerCabinside3() {
		return heightCrossbracePartitionpillerCabinside3;
	}






	public void setHeightCrossbracePartitionpillerCabinside3(String heightCrossbracePartitionpillerCabinside3) {
		this.heightCrossbracePartitionpillerCabinside3 = heightCrossbracePartitionpillerCabinside3;
	}






	public String getHeightCrossbracePartitionpillerSingelside4() {
		return heightCrossbracePartitionpillerSingelside4;
	}






	public void setHeightCrossbracePartitionpillerSingelside4(String heightCrossbracePartitionpillerSingelside4) {
		this.heightCrossbracePartitionpillerSingelside4 = heightCrossbracePartitionpillerSingelside4;
	}






	public String getHeightCrossbracePartitionpillerCabinside4() {
		return heightCrossbracePartitionpillerCabinside4;
	}






	public void setHeightCrossbracePartitionpillerCabinside4(String heightCrossbracePartitionpillerCabinside4) {
		this.heightCrossbracePartitionpillerCabinside4 = heightCrossbracePartitionpillerCabinside4;
	}






	public String getHeightCrossbracePartitionpillerSingelside5() {
		return heightCrossbracePartitionpillerSingelside5;
	}






	public void setHeightCrossbracePartitionpillerSingelside5(String heightCrossbracePartitionpillerSingelside5) {
		this.heightCrossbracePartitionpillerSingelside5 = heightCrossbracePartitionpillerSingelside5;
	}






	public String getHeightCrossbracePartitionpillerCabinside5() {
		return heightCrossbracePartitionpillerCabinside5;
	}






	public void setHeightCrossbracePartitionpillerCabinside5(String heightCrossbracePartitionpillerCabinside5) {
		this.heightCrossbracePartitionpillerCabinside5 = heightCrossbracePartitionpillerCabinside5;
	}






	public String getHeightCrossbracePartitionpillerSingelside6() {
		return heightCrossbracePartitionpillerSingelside6;
	}






	public void setHeightCrossbracePartitionpillerSingelside6(String heightCrossbracePartitionpillerSingelside6) {
		this.heightCrossbracePartitionpillerSingelside6 = heightCrossbracePartitionpillerSingelside6;
	}






	public String getHeightCrossbracePartitionpillerCabinside6() {
		return heightCrossbracePartitionpillerCabinside6;
	}






	public void setHeightCrossbracePartitionpillerCabinside6(String heightCrossbracePartitionpillerCabinside6) {
		this.heightCrossbracePartitionpillerCabinside6 = heightCrossbracePartitionpillerCabinside6;
	}






	public String getHeightVestibuleplateEndwallPp() {
		return heightVestibuleplateEndwallPp;
	}






	public void setHeightVestibuleplateEndwallPp(String heightVestibuleplateEndwallPp) {
		this.heightVestibuleplateEndwallPp = heightVestibuleplateEndwallPp;
	}






	public String getHeightVestibuleplateEndwallNpp() {
		return heightVestibuleplateEndwallNpp;
	}






	public void setHeightVestibuleplateEndwallNpp(String heightVestibuleplateEndwallNpp) {
		this.heightVestibuleplateEndwallNpp = heightVestibuleplateEndwallNpp;
	}






	public String getHeightWtccPp() {
		return heightWtccPp;
	}






	public void setHeightWtccPp(String heightWtccPp) {
		this.heightWtccPp = heightWtccPp;
	}






	public String getHeightWtccNpp() {
		return heightWtccNpp;
	}






	public void setHeightWtccNpp(String heightWtccNpp) {
		this.heightWtccNpp = heightWtccNpp;
	}






	public String getWidthWtccPp() {
		return widthWtccPp;
	}






	public void setWidthWtccPp(String widthWtccPp) {
		this.widthWtccPp = widthWtccPp;
	}






	public String getWidthWtccNpp() {
		return widthWtccNpp;
	}






	public void setWidthWtccNpp(String widthWtccNpp) {
		this.widthWtccNpp = widthWtccNpp;
	}






	public String getHeightTopThroughfloorBottomRoofArchPp() {
		return heightTopThroughfloorBottomRoofArchPp;
	}






	public void setHeightTopThroughfloorBottomRoofArchPp(String heightTopThroughfloorBottomRoofArchPp) {
		this.heightTopThroughfloorBottomRoofArchPp = heightTopThroughfloorBottomRoofArchPp;
	}






	public String getHeightTopThroughfloorBottomRoofArchNpp() {
		return heightTopThroughfloorBottomRoofArchNpp;
	}






	public void setHeightTopThroughfloorBottomRoofArchNpp(String heightTopThroughfloorBottomRoofArchNpp) {
		this.heightTopThroughfloorBottomRoofArchNpp = heightTopThroughfloorBottomRoofArchNpp;
	}






	public String getHeightFloorpillerbracketToRoofSingle1() {
		return heightFloorpillerbracketToRoofSingle1;
	}






	public void setHeightFloorpillerbracketToRoofSingle1(String heightFloorpillerbracketToRoofSingle1) {
		this.heightFloorpillerbracketToRoofSingle1 = heightFloorpillerbracketToRoofSingle1;
	}






	public String getHeightFloorpillerbracketToRoofSingle7() {
		return heightFloorpillerbracketToRoofSingle7;
	}






	public void setHeightFloorpillerbracketToRoofSingle7(String heightFloorpillerbracketToRoofSingle7) {
		this.heightFloorpillerbracketToRoofSingle7 = heightFloorpillerbracketToRoofSingle7;
	}






	public String getHeightFloorpillerbracketToRoofSingle2() {
		return heightFloorpillerbracketToRoofSingle2;
	}






	public void setHeightFloorpillerbracketToRoofSingle2(String heightFloorpillerbracketToRoofSingle2) {
		this.heightFloorpillerbracketToRoofSingle2 = heightFloorpillerbracketToRoofSingle2;
	}






	public String getHeightFloorpillerbracketToRoofSingle8() {
		return heightFloorpillerbracketToRoofSingle8;
	}






	public void setHeightFloorpillerbracketToRoofSingle8(String heightFloorpillerbracketToRoofSingle8) {
		this.heightFloorpillerbracketToRoofSingle8 = heightFloorpillerbracketToRoofSingle8;
	}






	public String getHeightFloorpillerbracketToRoofSingle3() {
		return heightFloorpillerbracketToRoofSingle3;
	}






	public void setHeightFloorpillerbracketToRoofSingle3(String heightFloorpillerbracketToRoofSingle3) {
		this.heightFloorpillerbracketToRoofSingle3 = heightFloorpillerbracketToRoofSingle3;
	}






	public String getHeightFloorpillerbracketToRoofSingle9() {
		return heightFloorpillerbracketToRoofSingle9;
	}






	public void setHeightFloorpillerbracketToRoofSingle9(String heightFloorpillerbracketToRoofSingle9) {
		this.heightFloorpillerbracketToRoofSingle9 = heightFloorpillerbracketToRoofSingle9;
	}






	public String getHeightFloorpillerbracketToRoofSingle4() {
		return heightFloorpillerbracketToRoofSingle4;
	}






	public void setHeightFloorpillerbracketToRoofSingle4(String heightFloorpillerbracketToRoofSingle4) {
		this.heightFloorpillerbracketToRoofSingle4 = heightFloorpillerbracketToRoofSingle4;
	}






	public String getHeightFloorpillerbracketToRoofSingle10() {
		return heightFloorpillerbracketToRoofSingle10;
	}






	public void setHeightFloorpillerbracketToRoofSingle10(String heightFloorpillerbracketToRoofSingle10) {
		this.heightFloorpillerbracketToRoofSingle10 = heightFloorpillerbracketToRoofSingle10;
	}






	public String getHeightFloorpillerbracketToRoofSingle5() {
		return heightFloorpillerbracketToRoofSingle5;
	}






	public void setHeightFloorpillerbracketToRoofSingle5(String heightFloorpillerbracketToRoofSingle5) {
		this.heightFloorpillerbracketToRoofSingle5 = heightFloorpillerbracketToRoofSingle5;
	}






	public String getHeightFloorpillerbracketToRoofSingle11() {
		return heightFloorpillerbracketToRoofSingle11;
	}






	public void setHeightFloorpillerbracketToRoofSingle11(String heightFloorpillerbracketToRoofSingle11) {
		this.heightFloorpillerbracketToRoofSingle11 = heightFloorpillerbracketToRoofSingle11;
	}






	public String getHeightFloorpillerbracketToRoofSingle6() {
		return heightFloorpillerbracketToRoofSingle6;
	}






	public void setHeightFloorpillerbracketToRoofSingle6(String heightFloorpillerbracketToRoofSingle6) {
		this.heightFloorpillerbracketToRoofSingle6 = heightFloorpillerbracketToRoofSingle6;
	}






	public String getHeightFloorpillerbracketToRoofCabin1() {
		return heightFloorpillerbracketToRoofCabin1;
	}






	public void setHeightFloorpillerbracketToRoofCabin1(String heightFloorpillerbracketToRoofCabin1) {
		this.heightFloorpillerbracketToRoofCabin1 = heightFloorpillerbracketToRoofCabin1;
	}






	public String getHeightFloorpillerbracketToRoofCabin7() {
		return heightFloorpillerbracketToRoofCabin7;
	}






	public void setHeightFloorpillerbracketToRoofCabin7(String heightFloorpillerbracketToRoofCabin7) {
		this.heightFloorpillerbracketToRoofCabin7 = heightFloorpillerbracketToRoofCabin7;
	}






	public String getHeightFloorpillerbracketToRoofCabin2() {
		return heightFloorpillerbracketToRoofCabin2;
	}






	public void setHeightFloorpillerbracketToRoofCabin2(String heightFloorpillerbracketToRoofCabin2) {
		this.heightFloorpillerbracketToRoofCabin2 = heightFloorpillerbracketToRoofCabin2;
	}






	public String getHeightFloorpillerbracketToRoofCabin8() {
		return heightFloorpillerbracketToRoofCabin8;
	}






	public void setHeightFloorpillerbracketToRoofCabin8(String heightFloorpillerbracketToRoofCabin8) {
		this.heightFloorpillerbracketToRoofCabin8 = heightFloorpillerbracketToRoofCabin8;
	}






	public String getHeightFloorpillerbracketToRoofCabin3() {
		return heightFloorpillerbracketToRoofCabin3;
	}






	public void setHeightFloorpillerbracketToRoofCabin3(String heightFloorpillerbracketToRoofCabin3) {
		this.heightFloorpillerbracketToRoofCabin3 = heightFloorpillerbracketToRoofCabin3;
	}






	public String getHeightFloorpillerbracketToRoofCabin9() {
		return heightFloorpillerbracketToRoofCabin9;
	}






	public void setHeightFloorpillerbracketToRoofCabin9(String heightFloorpillerbracketToRoofCabin9) {
		this.heightFloorpillerbracketToRoofCabin9 = heightFloorpillerbracketToRoofCabin9;
	}






	public String getHeightFloorpillerbracketToRoofCabin4() {
		return heightFloorpillerbracketToRoofCabin4;
	}






	public void setHeightFloorpillerbracketToRoofCabin4(String heightFloorpillerbracketToRoofCabin4) {
		this.heightFloorpillerbracketToRoofCabin4 = heightFloorpillerbracketToRoofCabin4;
	}






	public String getHeightFloorpillerbracketToRoofCabin10() {
		return heightFloorpillerbracketToRoofCabin10;
	}






	public void setHeightFloorpillerbracketToRoofCabin10(String heightFloorpillerbracketToRoofCabin10) {
		this.heightFloorpillerbracketToRoofCabin10 = heightFloorpillerbracketToRoofCabin10;
	}






	public String getHeightFloorpillerbracketToRoofCabin5() {
		return heightFloorpillerbracketToRoofCabin5;
	}






	public void setHeightFloorpillerbracketToRoofCabin5(String heightFloorpillerbracketToRoofCabin5) {
		this.heightFloorpillerbracketToRoofCabin5 = heightFloorpillerbracketToRoofCabin5;
	}






	public String getHeightFloorpillerbracketToRoofCabin11() {
		return heightFloorpillerbracketToRoofCabin11;
	}






	public void setHeightFloorpillerbracketToRoofCabin11(String heightFloorpillerbracketToRoofCabin11) {
		this.heightFloorpillerbracketToRoofCabin11 = heightFloorpillerbracketToRoofCabin11;
	}






	public String getHeightFloorpillerbracketToRoofCabin6() {
		return heightFloorpillerbracketToRoofCabin6;
	}






	public void setHeightFloorpillerbracketToRoofCabin6(String heightFloorpillerbracketToRoofCabin6) {
		this.heightFloorpillerbracketToRoofCabin6 = heightFloorpillerbracketToRoofCabin6;
	}






	public String getSlidingDoorHeightLh() {
		return slidingDoorHeightLh;
	}






	public void setSlidingDoorHeightLh(String slidingDoorHeightLh) {
		this.slidingDoorHeightLh = slidingDoorHeightLh;
	}






	public String getSlidingDoorHeightRh() {
		return slidingDoorHeightRh;
	}






	public void setSlidingDoorHeightRh(String slidingDoorHeightRh) {
		this.slidingDoorHeightRh = slidingDoorHeightRh;
	}






	public String getSlidingDoorWidthLh() {
		return slidingDoorWidthLh;
	}






	public void setSlidingDoorWidthLh(String slidingDoorWidthLh) {
		this.slidingDoorWidthLh = slidingDoorWidthLh;
	}






	public String getSlidingDoorWidthRh() {
		return slidingDoorWidthRh;
	}






	public void setSlidingDoorWidthRh(String slidingDoorWidthRh) {
		this.slidingDoorWidthRh = slidingDoorWidthRh;
	}






	public String getDistanceRoofEndwallPp() {
		return distanceRoofEndwallPp;
	}






	public void setDistanceRoofEndwallPp(String distanceRoofEndwallPp) {
		this.distanceRoofEndwallPp = distanceRoofEndwallPp;
	}






	public String getDistanceRoofEndwallNpp() {
		return distanceRoofEndwallNpp;
	}






	public void setDistanceRoofEndwallNpp(String distanceRoofEndwallNpp) {
		this.distanceRoofEndwallNpp = distanceRoofEndwallNpp;
	}






	public String getRoofElementShellSocketHoleDiePp() {
		return roofElementShellSocketHoleDiePp;
	}






	public void setRoofElementShellSocketHoleDiePp(String roofElementShellSocketHoleDiePp) {
		this.roofElementShellSocketHoleDiePp = roofElementShellSocketHoleDiePp;
	}






	public String getRoofElementShellSocketHoleDieNpp() {
		return roofElementShellSocketHoleDieNpp;
	}






	public void setRoofElementShellSocketHoleDieNpp(String roofElementShellSocketHoleDieNpp) {
		this.roofElementShellSocketHoleDieNpp = roofElementShellSocketHoleDieNpp;
	}






	public String getRoofElementStudDiagonalPp() {
		return roofElementStudDiagonalPp;
	}






	public void setRoofElementStudDiagonalPp(String roofElementStudDiagonalPp) {
		this.roofElementStudDiagonalPp = roofElementStudDiagonalPp;
	}






	public String getRoofElementStudDiagonalNpp() {
		return roofElementStudDiagonalNpp;
	}






	public void setRoofElementStudDiagonalNpp(String roofElementStudDiagonalNpp) {
		this.roofElementStudDiagonalNpp = roofElementStudDiagonalNpp;
	}






	public String getCheckedDimenRemarks() {
		return checkedDimenRemarks;
	}






	public void setCheckedDimenRemarks(String checkedDimenRemarks) {
		this.checkedDimenRemarks = checkedDimenRemarks;
	}






	public String getAlignmentSidewallRoofarchFlag() {
		return alignmentSidewallRoofarchFlag;
	}






	public void setAlignmentSidewallRoofarchFlag(String alignmentSidewallRoofarchFlag) {
		this.alignmentSidewallRoofarchFlag = alignmentSidewallRoofarchFlag;
	}






	public String getWeldingSidewallLavsidewallFlag() {
		return weldingSidewallLavsidewallFlag;
	}






	public void setWeldingSidewallLavsidewallFlag(String weldingSidewallLavsidewallFlag) {
		this.weldingSidewallLavsidewallFlag = weldingSidewallLavsidewallFlag;
	}






	public String getWeldingRoofarchSidewallCarlineFlag() {
		return weldingRoofarchSidewallCarlineFlag;
	}






	public void setWeldingRoofarchSidewallCarlineFlag(String weldingRoofarchSidewallCarlineFlag) {
		this.weldingRoofarchSidewallCarlineFlag = weldingRoofarchSidewallCarlineFlag;
	}






	public String getWeldingCompletedoorframeFlag() {
		return weldingCompletedoorframeFlag;
	}






	public void setWeldingCompletedoorframeFlag(String weldingCompletedoorframeFlag) {
		this.weldingCompletedoorframeFlag = weldingCompletedoorframeFlag;
	}






	public String getWeldingCompleteendwallFinalroofelementFlag() {
		return weldingCompleteendwallFinalroofelementFlag;
	}






	public void setWeldingCompleteendwallFinalroofelementFlag(String weldingCompleteendwallFinalroofelementFlag) {
		this.weldingCompleteendwallFinalroofelementFlag = weldingCompleteendwallFinalroofelementFlag;
	}






	public String getWeldingRoofSidewallCarlineFlag() {
		return weldingRoofSidewallCarlineFlag;
	}






	public void setWeldingRoofSidewallCarlineFlag(String weldingRoofSidewallCarlineFlag) {
		this.weldingRoofSidewallCarlineFlag = weldingRoofSidewallCarlineFlag;
	}






	public String getGrindHorizontalVerticalJointFlag() {
		return grindHorizontalVerticalJointFlag;
	}






	public void setGrindHorizontalVerticalJointFlag(String grindHorizontalVerticalJointFlag) {
		this.grindHorizontalVerticalJointFlag = grindHorizontalVerticalJointFlag;
	}






	public String getAlignmentBothSidewallUnderframeFlag() {
		return alignmentBothSidewallUnderframeFlag;
	}






	public void setAlignmentBothSidewallUnderframeFlag(String alignmentBothSidewallUnderframeFlag) {
		this.alignmentBothSidewallUnderframeFlag = alignmentBothSidewallUnderframeFlag;
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






	public String getStage1TestingStatus() {
		return stage1TestingStatus;
	}






	public void setStage1TestingStatus(String stage1TestingStatus) {
		this.stage1TestingStatus = stage1TestingStatus;
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
		


	