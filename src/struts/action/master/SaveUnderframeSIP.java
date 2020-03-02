package struts.action.master;
import dao.DaoShellUnderframeSip;

import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import beans.ShellUnderframeSipTrans;
import beans.ShellTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveUnderframeSIP {
	
	
	private String shellAssetId;
	private String appDrawNoUnderframe;
	private String underframeDocNo;
	private String underframeShiftSelect;
	private String underframeDate;	
	private String appLineNoUnderframe;
	private String appWiNoUnderframe;
	
	private String frntPrtPp;
	private String frntPrtNpp;
	private String waterTankBkt1;
	private String waterTankBkt2;
	private String waterTankBkt3;
	private String waterTankBkt4;
	private String cbCMakePp1;
	private String cbCMakePp2;
	private String cbCMakeNpp1;
	private String cbCMakeNpp2;
	private String cbCFitPp;
	private String cbCFitNpp;
	private String underframeMakeNo;
	
	private String itemsFitted;
	private String compAppWi ;
	private String weldThroatLen;
	private String tightScrew;
	private String outerFaceOuterHead;
	private String conditionOfPlugWelding;
	private String conditionOfConsole;
	private String bodyBolster;
	private String completeLenUndeframe;
	private String frntPartToFront;
	private String ufWidth;
	private String coveringPlate;
	private String wedgeBolt;
	private String waterTankMount;
	private String frntPartBrktDist;
	private String distBwConsoleBrkt;
	private String footStepsDist;
	private String suppMemTrough;
	private String pillarMountChannel;
	private String distBwCurvedRoll;
	private String grindWeldJoints;
	private String holesForDrawing;
	private String holesDrilled;
	private String distBwCenterCenter;
	private String doorFixBrkt;
	private String doorFixBrktOb;
	private String fitmentDimenBiotank;
	private String longDistBrktBrktpp;
	private String longDistBrktBrktnpp;
	private String latDistBrktFrntpp;
	private String latDistBrktFrntnpp;
	private String bioTankHoleDist;
	private String distCenCen;
	private String genMmountScrew1;
	private String genMmountScrew2;
	private String cbcUncoup;
	private String transfMount;
	private String batteryBox;
	private String airBrakeModule;
	private String guideDistPP;
	private String guideDistNPP;
	private String twinePipHoleObs;	
	private String fibaBktAirPro;
	private String reserBktAirPro;
	private String distanceCrossMemberpp1;
	private String distanceCrossMembernpp1;
	private String distanceCrossMemberpp2;
	private String distanceCrossMembernpp2;
	private String distanceCrossMemberpp3;
	private String distanceCrossMembernpp3;
	private String distanceCrossMemberpp4;
	private String distanceCrossMembernpp4;
	private String distanceCrossMemberpp5;
	private String distanceCrossMembernpp5;
	private String distanceCrossMemberpp6;
	private String distanceCrossMembernpp6;
	private String distanceCrossMemberpp7;
	private String distanceCrossMembernpp7;
	private String distanceCrossMemberpp8;
	private String distanceCrossMembernpp8;
	private String distanceCrossMemberpp9;
	private String distanceCrossMembernpp9;
	private String distanceCrossMemberpp10;
	private String distanceCrossMembernpp10;
	private String obserVal;
	private String detlOfModf;
	private String detlOfTrialItems;
	private String rmk;
	private String underframeTestingStatus;
	
	public String SaveUnderframe()
	{
		System.out.println("hello");
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryTime=new Timestamp(System.currentTimeMillis());
		ShellUnderframeSipTrans shellUnderframeSipTrans= new ShellUnderframeSipTrans();
		
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		shellUnderframeSipTrans.setShellAssetId(shellAssetIdAsInt);
		
		//System.out.println(don);
		if(!"".equals(bodyBolster))
		{
			Integer bodyBolsterAsInt=Integer.parseInt(bodyBolster);
			shellUnderframeSipTrans.setBodyBolster(bodyBolsterAsInt);
			
		}
		if(!"".equals(completeLenUndeframe))
		{
			Integer CompleteLenUndeframeAsInt=Integer.parseInt(completeLenUndeframe);
			shellUnderframeSipTrans.setCompleteLenUndeframe(CompleteLenUndeframeAsInt);
			
		}
		if(!"".equals(frntPartToFront))
		{
			Integer frntPartToFrontAsInt=Integer.parseInt(frntPartToFront);
			shellUnderframeSipTrans.setFrntPartToFront(frntPartToFrontAsInt);
			
			
		}
		if(!"".equals(ufWidth))
		{
			Integer ufWidthAsInt=Integer.parseInt(ufWidth);
			shellUnderframeSipTrans.setUfWidth(ufWidthAsInt);
			
			
		}
		
		if(!"".equals(coveringPlate))
		{
			Integer coveringPlateAsInt=Integer.parseInt(coveringPlate);
			shellUnderframeSipTrans.setCoveringPlate(coveringPlateAsInt);
			
			
		}
		if(!"".equals(wedgeBolt))
		{
			Integer wedgeBoltAsInt=Integer.parseInt(wedgeBolt);
			shellUnderframeSipTrans.setWedgeBolt(wedgeBoltAsInt);
			
			
			
		}
		if(!"".equals(frntPartBrktDist))
		{
			Integer frntPartBrktDistAsInt=Integer.parseInt(frntPartBrktDist);
			shellUnderframeSipTrans.setFrntPartBrktDist(frntPartBrktDistAsInt);
			
			
			
		}
		if(!"".equals(distBwConsoleBrkt))
		{
			Integer distBwConsoleBrktAsInt=Integer.parseInt(distBwConsoleBrkt);
			shellUnderframeSipTrans.setDistBwConsoleBrkt(distBwConsoleBrktAsInt);
			
						
		}
		if(!"".equals(footStepsDist))
		{
			Integer footStepsDistAsInt=Integer.parseInt(footStepsDist);
			shellUnderframeSipTrans.setFootStepsDist(footStepsDistAsInt);
		}
		if(!"".equals(distBwCurvedRoll))
		{
			Integer distBwCurvedRollAsInt=Integer.parseInt(distBwCurvedRoll);
			shellUnderframeSipTrans.setDistBwCurvedRoll(distBwCurvedRollAsInt);
		}
		if(!"".equals(doorFixBrktOb))
		{
			Integer doorFixBrktObAsInt=Integer.parseInt(doorFixBrktOb);
			shellUnderframeSipTrans.setDoorFixBrktOb(doorFixBrktObAsInt);
		}
		if(!"".equals(longDistBrktBrktpp))
		{
			Integer longDistBrktBrktppAsInt=Integer.parseInt(longDistBrktBrktpp);
			shellUnderframeSipTrans.setLongDistBrktBrktpp(longDistBrktBrktppAsInt);
			
		}
		if(!"".equals(longDistBrktBrktnpp))
		{
			Integer longDistBrktBrktnppAsInt=Integer.parseInt(longDistBrktBrktnpp);
			shellUnderframeSipTrans.setLongDistBrktBrktnpp(longDistBrktBrktnppAsInt);
		}
		if(!"".equals(latDistBrktFrntpp))
		{
			Integer latDistBrktFrntppAsInt=Integer.parseInt(latDistBrktFrntpp);
			shellUnderframeSipTrans.setLatDistBrktFrntpp(latDistBrktFrntppAsInt);
		}
		if(!"".equals(latDistBrktFrntnpp))
		{
			
			Integer latDistBrktFrntnppAsInt=Integer.parseInt(latDistBrktFrntnpp);
			shellUnderframeSipTrans.setLatDistBrktFrntnpp(latDistBrktFrntnppAsInt);
		}
		if(!"".equals(distanceCrossMemberpp1))
		{
			Integer distanceCrossMemberpp1AsInt=Integer.parseInt(distanceCrossMemberpp1);
			shellUnderframeSipTrans.setDistanceCrossMemberpp1(distanceCrossMemberpp1AsInt);
			
		}
		if(!"".equals(distanceCrossMemberpp2))
		{
			Integer distanceCrossMemberpp2AsInt=Integer.parseInt(distanceCrossMemberpp2);
			shellUnderframeSipTrans.setDistanceCrossMemberpp2(distanceCrossMemberpp2AsInt);
		}

		if(!"".equals(distanceCrossMemberpp3))
		{
			Integer distanceCrossMemberpp3AsInt=Integer.parseInt(distanceCrossMemberpp3);
			shellUnderframeSipTrans.setDistanceCrossMemberpp3(distanceCrossMemberpp3AsInt);
		}
		if(!"".equals(distanceCrossMemberpp4))
		{
			Integer distanceCrossMemberpp4AsInt=Integer.parseInt(distanceCrossMemberpp4);
			shellUnderframeSipTrans.setDistanceCrossMemberpp4(distanceCrossMemberpp4AsInt);
		}
		if(!"".equals(distanceCrossMemberpp5))
		{
			Integer distanceCrossMemberpp5AsInt=Integer.parseInt(distanceCrossMemberpp5);
			shellUnderframeSipTrans.setDistanceCrossMemberpp5(distanceCrossMemberpp5AsInt);
		}
		if(!"".equals(distanceCrossMemberpp6))
		{
			Integer distanceCrossMemberpp6AsInt=Integer.parseInt(distanceCrossMemberpp6);
			shellUnderframeSipTrans.setDistanceCrossMemberpp6(distanceCrossMemberpp6AsInt);
		}
		if(!"".equals(distanceCrossMemberpp7))
		{
			Integer distanceCrossMemberpp7AsInt=Integer.parseInt(distanceCrossMemberpp7);
			shellUnderframeSipTrans.setDistanceCrossMemberpp7(distanceCrossMemberpp7AsInt);
		}
		if(!"".equals(distanceCrossMemberpp8))
		{
			Integer distanceCrossMemberpp8AsInt=Integer.parseInt(distanceCrossMemberpp8);
			shellUnderframeSipTrans.setDistanceCrossMemberpp8(distanceCrossMemberpp8AsInt);
		}
		if(!"".equals(distanceCrossMemberpp9))
		{
			Integer distanceCrossMemberpp9AsInt=Integer.parseInt(distanceCrossMemberpp9);
			shellUnderframeSipTrans.setDistanceCrossMemberpp9(distanceCrossMemberpp9AsInt);
		}
		if(!"".equals(distanceCrossMemberpp10))
		{
			Integer distanceCrossMemberpp10AsInt=Integer.parseInt(distanceCrossMemberpp10);
			shellUnderframeSipTrans.setDistanceCrossMemberpp10(distanceCrossMemberpp10AsInt);
		}
		if(!"".equals(distanceCrossMembernpp1))
		{
			Integer distanceCrossMembernpp1AsInt=Integer.parseInt(distanceCrossMembernpp1);
			shellUnderframeSipTrans.setDistanceCrossMembernpp1(distanceCrossMembernpp1AsInt);
		}
		if(!"".equals(distanceCrossMembernpp2))
		{
			Integer distanceCrossMembernpp2AsInt=Integer.parseInt(distanceCrossMembernpp2);
			shellUnderframeSipTrans.setDistanceCrossMembernpp2(distanceCrossMembernpp2AsInt);
		}
		if(!"".equals(distanceCrossMembernpp3))
		{
			Integer distanceCrossMembernpp3AsInt=Integer.parseInt(distanceCrossMembernpp3);
			shellUnderframeSipTrans.setDistanceCrossMembernpp3(distanceCrossMembernpp3AsInt);
		}
		if(!"".equals(distanceCrossMembernpp4))
		{
			Integer distanceCrossMembernpp4AsInt=Integer.parseInt(distanceCrossMembernpp4);
			shellUnderframeSipTrans.setDistanceCrossMembernpp4(distanceCrossMembernpp4AsInt);
		}
		if(!"".equals(distanceCrossMembernpp5))
		{
			Integer distanceCrossMembernpp5AsInt=Integer.parseInt(distanceCrossMembernpp5);
			shellUnderframeSipTrans.setDistanceCrossMembernpp5(distanceCrossMembernpp5AsInt);
		}
		if(!"".equals(distanceCrossMembernpp6))
		{
			Integer distanceCrossMembernpp6AsInt=Integer.parseInt(distanceCrossMembernpp6);
			shellUnderframeSipTrans.setDistanceCrossMembernpp6(distanceCrossMembernpp6AsInt);
		}
		if(!"".equals(distanceCrossMembernpp7))
		{
			Integer distanceCrossMembernpp7AsInt=Integer.parseInt(distanceCrossMembernpp7);
			shellUnderframeSipTrans.setDistanceCrossMembernpp7(distanceCrossMembernpp7AsInt);
		}
		if(!"".equals(distanceCrossMembernpp8))
		{
			Integer distanceCrossMembernpp8AsInt=Integer.parseInt(distanceCrossMembernpp8);
			shellUnderframeSipTrans.setDistanceCrossMembernpp8(distanceCrossMembernpp8AsInt);
		}
		if(!"".equals(distanceCrossMembernpp9))
		{
			Integer distanceCrossMembernpp9AsInt=Integer.parseInt(distanceCrossMembernpp9);
			shellUnderframeSipTrans.setDistanceCrossMembernpp9(distanceCrossMembernpp9AsInt);
		}
		if(!"".equals(distanceCrossMembernpp10))
		{
			Integer distanceCrossMembernpp10AsInt=Integer.parseInt(distanceCrossMembernpp10);
			shellUnderframeSipTrans.setDistanceCrossMembernpp10(distanceCrossMembernpp10AsInt);
		}
			
		
		if(!"".equals(underframeDate))
		{
			shellUnderframeSipTrans.setUnderframeDate(DateUtil.convertToDate(underframeDate));
		}
		
		
		shellUnderframeSipTrans.setAppDrawNoUnderframe(appDrawNoUnderframe);
		shellUnderframeSipTrans.setUnderframeDocNo(underframeDocNo);
		shellUnderframeSipTrans.setUnderframeShiftSelect(underframeShiftSelect);
		shellUnderframeSipTrans.setAppLineNoUnderframe(appLineNoUnderframe);
		shellUnderframeSipTrans.setAppWiNoUnderframe(appWiNoUnderframe);
		shellUnderframeSipTrans.setItemsFitted(itemsFitted);
		shellUnderframeSipTrans.setCompAppWi(compAppWi);
		shellUnderframeSipTrans.setWeldThroatLen(weldThroatLen);
		shellUnderframeSipTrans.setTightScrew(tightScrew);
		shellUnderframeSipTrans.setOuterFaceOuterHead(outerFaceOuterHead);
		shellUnderframeSipTrans.setConditionOfPlugWelding(conditionOfPlugWelding);
		shellUnderframeSipTrans.setConditionOfConsole(conditionOfConsole);			
		shellUnderframeSipTrans.setWaterTankMount(waterTankMount);
		shellUnderframeSipTrans.setSuppMemTrough(suppMemTrough);
		shellUnderframeSipTrans.setPillarMountChannel(pillarMountChannel);
		shellUnderframeSipTrans.setGrindWeldJoints(grindWeldJoints);
		shellUnderframeSipTrans.setHolesForDrawing(holesForDrawing);
		shellUnderframeSipTrans.setHolesDrilled(holesDrilled);
		shellUnderframeSipTrans.setDistBwCenterCenter(distBwCenterCenter);
		shellUnderframeSipTrans.setDoorFixBrkt(doorFixBrkt);
		shellUnderframeSipTrans.setFitmentDimenBiotank(fitmentDimenBiotank);
		shellUnderframeSipTrans.setBioTankHoleDist(bioTankHoleDist);
		shellUnderframeSipTrans.setDistCenCen(distCenCen);
		shellUnderframeSipTrans.setGenMmountScrew1(genMmountScrew1);
		shellUnderframeSipTrans.setGenMmountScrew2(genMmountScrew2);
		shellUnderframeSipTrans.setCbcUncoup(cbcUncoup);
		shellUnderframeSipTrans.setTransfMount(transfMount);
		shellUnderframeSipTrans.setBatteryBox(batteryBox);
		shellUnderframeSipTrans.setAirBrakeModule(airBrakeModule);
		shellUnderframeSipTrans.setGuideDistPP(guideDistPP);
		shellUnderframeSipTrans.setGuideDistNPP(guideDistNPP);
		shellUnderframeSipTrans.setTwinePipHoleObs(twinePipHoleObs);
		shellUnderframeSipTrans.setFibaBktAirPro(fibaBktAirPro);
		shellUnderframeSipTrans.setReserBktAirPro(reserBktAirPro);
		shellUnderframeSipTrans.setObserVal(obserVal);
		shellUnderframeSipTrans.setDetlOfModf(detlOfModf);
		shellUnderframeSipTrans.setDetlOfTrialItems(detlOfTrialItems);
		shellUnderframeSipTrans.setRmk(rmk);
		shellUnderframeSipTrans.setUnderframeTestingStatus(underframeTestingStatus);
		shellUnderframeSipTrans.setEntryBy(userID);
		shellUnderframeSipTrans.setEntryTime(entryTime);

		//end of insertion in ShellUnderframeSipTran
		//update table shell_tran
		ShellTransaction shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
		shellTran.setWaterTankBkt1( waterTankBkt1);
		shellTran.setWaterTankBkt2( waterTankBkt2);
		shellTran.setWaterTankBkt3( waterTankBkt3);
		shellTran.setWaterTankBkt4( waterTankBkt4);
		shellTran.setUnderframeFrontPartMakePp(frntPrtPp);
		shellTran.setUnderframeFrontPartMakeNpp(frntPrtNpp);
	
		
		shellTran.setCbcPpEndMake(cbCMakePp1);
		shellTran.setCbcPpEndSrno(cbCMakePp2);
		shellTran.setCbcNppEndMake(cbCMakeNpp1);
		shellTran.setCbcNppEndSrno(cbCMakeNpp2);
			
		shellTran.setCbcFittedByPp(cbCFitPp);
		shellTran.setCbcFittedByNpp(cbCFitNpp);
		shellTran.setUnderframeCompleteMake(underframeMakeNo);
		shellTran.setUnderframeSipFlag(1);
		System.out.println("last!!");
		
		try
		{	DaoShellUnderframeSip dao= new DaoShellUnderframeSip();
			dao.saveUnderframeData(shellUnderframeSipTrans,shellTran);
			System.out.println(shellAssetIdAsInt);
			
			
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

	public String getAppDrawNoUnderframe() {
		return appDrawNoUnderframe;
	}

	public void setAppDrawNoUnderframe(String appDrawNoUnderframe) {
		this.appDrawNoUnderframe = appDrawNoUnderframe;
	}

	public String getUnderframeDocNo() {
		return underframeDocNo;
	}

	public void setUnderframeDocNo(String underframeDocNo) {
		this.underframeDocNo = underframeDocNo;
	}

	public String getUnderframeShiftSelect() {
		return underframeShiftSelect;
	}

	public void setUnderframeShiftSelect(String underframeShiftSelect) {
		this.underframeShiftSelect = underframeShiftSelect;
	}

	public String getUnderframeDate() {
		return underframeDate;
	}

	public void setUnderframeDate(String underframeDate) {
		this.underframeDate = underframeDate;
	}

	public String getAppLineNoUnderframe() {
		return appLineNoUnderframe;
	}

	public void setAppLineNoUnderframe(String appLineNoUnderframe) {
		this.appLineNoUnderframe = appLineNoUnderframe;
	}

	public String getAppWiNoUnderframe() {
		return appWiNoUnderframe;
	}

	public void setAppWiNoUnderframe(String appWiNoUnderframe) {
		this.appWiNoUnderframe = appWiNoUnderframe;
	}

	public String getWaterTankBkt1() {
		return waterTankBkt1;
	}

	public void setWaterTankBkt1(String waterTankBkt1) {
		this.waterTankBkt1 = waterTankBkt1;
	}

	public String getWaterTankBkt2() {
		return waterTankBkt2;
	}

	public void setWaterTankBkt2(String waterTankBkt2) {
		this.waterTankBkt2 = waterTankBkt2;
	}

	public String getWaterTankBkt3() {
		return waterTankBkt3;
	}

	public void setWaterTankBkt3(String waterTankBkt3) {
		this.waterTankBkt3 = waterTankBkt3;
	}

	public String getWaterTankBkt4() {
		return waterTankBkt4;
	}

	public void setWaterTankBkt4(String waterTankBkt4) {
		this.waterTankBkt4 = waterTankBkt4;
	}

	public String getFrntPrtPp() {
		return frntPrtPp;
	}

	public void setFrntPrtPp(String frntPrtPp) {
		this.frntPrtPp = frntPrtPp;
	}

	public String getFrntPrtNpp() {
		return frntPrtNpp;
	}

	public void setFrntPrtNpp(String frntPrtNpp) {
		this.frntPrtNpp = frntPrtNpp;
	}

	public String getCbCMakePp1() {
		return cbCMakePp1;
	}

	public void setCbCMakePp1(String cbCMakePp1) {
		this.cbCMakePp1 = cbCMakePp1;
	}

	public String getCbCMakePp2() {
		return cbCMakePp2;
	}

	public void setCbCMakePp2(String cbCMakePp2) {
		this.cbCMakePp2 = cbCMakePp2;
	}

	public String getCbCMakeNpp1() {
		return cbCMakeNpp1;
	}

	public void setCbCMakeNpp1(String cbCMakeNpp1) {
		this.cbCMakeNpp1 = cbCMakeNpp1;
	}

	public String getCbCMakeNpp2() {
		return cbCMakeNpp2;
	}

	public void setCbCMakeNpp2(String cbCMakeNpp2) {
		this.cbCMakeNpp2 = cbCMakeNpp2;
	}

	public String getCbCFitPp() {
		return cbCFitPp;
	}

	public void setCbCFitPp(String cbCFitPp) {
		this.cbCFitPp = cbCFitPp;
	}

	public String getCbCFitNpp() {
		return cbCFitNpp;
	}

	public void setCbCFitNpp(String cbCFitNpp) {
		this.cbCFitNpp = cbCFitNpp;
	}

	public String getUnderframeMakeNo() {
		return underframeMakeNo;
	}

	public void setUnderframeMakeNo(String underframeMakeNo) {
		this.underframeMakeNo = underframeMakeNo;
	}

	public String getItemsFitted() {
		return itemsFitted;
	}

	public void setItemsFitted(String itemsFitted) {
		this.itemsFitted = itemsFitted;
	}

	public String getCompAppWi() {
		return compAppWi;
	}

	public void setCompAppWi(String compAppWi) {
		this.compAppWi = compAppWi;
	}

	public String getWeldThroatLen() {
		return weldThroatLen;
	}

	public void setWeldThroatLen(String weldThroatLen) {
		this.weldThroatLen = weldThroatLen;
	}

	public String getTightScrew() {
		return tightScrew;
	}

	public void setTightScrew(String tightScrew) {
		this.tightScrew = tightScrew;
	}

	public String getOuterFaceOuterHead() {
		return outerFaceOuterHead;
	}

	public void setOuterFaceOuterHead(String outerFaceOuterHead) {
		this.outerFaceOuterHead = outerFaceOuterHead;
	}

	public String getConditionOfPlugWelding() {
		return conditionOfPlugWelding;
	}

	public void setConditionOfPlugWelding(String conditionOfPlugWelding) {
		this.conditionOfPlugWelding = conditionOfPlugWelding;
	}

	public String getConditionOfConsole() {
		return conditionOfConsole;
	}

	public void setConditionOfConsole(String conditionOfConsole) {
		this.conditionOfConsole = conditionOfConsole;
	}

	public String getBodyBolster() {
		return bodyBolster;
	}

	public void setBodyBolster(String bodyBolster) {
		this.bodyBolster = bodyBolster;
	}

	public String getCompleteLenUndeframe() {
		return completeLenUndeframe;
	}

	public void setCompleteLenUndeframe(String completeLenUndeframe) {
		this.completeLenUndeframe = completeLenUndeframe;
	}

	public String getFrntPartToFront() {
		return frntPartToFront;
	}

	public void setFrntPartToFront(String frntPartToFront) {
		this.frntPartToFront = frntPartToFront;
	}

	public String getUfWidth() {
		return ufWidth;
	}

	public void setUfWidth(String ufWidth) {
		this.ufWidth = ufWidth;
	}

	public String getCoveringPlate() {
		return coveringPlate;
	}

	public void setCoveringPlate(String coveringPlate) {
		this.coveringPlate = coveringPlate;
	}

	public String getWedgeBolt() {
		return wedgeBolt;
	}

	public void setWedgeBolt(String wedgeBolt) {
		this.wedgeBolt = wedgeBolt;
	}

	public String getWaterTankMount() {
		return waterTankMount;
	}

	public void setWaterTankMount(String waterTankMount) {
		this.waterTankMount = waterTankMount;
	}

	public String getFrntPartBrktDist() {
		return frntPartBrktDist;
	}

	public void setFrntPartBrktDist(String frntPartBrktDist) {
		this.frntPartBrktDist = frntPartBrktDist;
	}

	public String getDistBwConsoleBrkt() {
		return distBwConsoleBrkt;
	}

	public void setDistBwConsoleBrkt(String distBwConsoleBrkt) {
		this.distBwConsoleBrkt = distBwConsoleBrkt;
	}

	public String getFootStepsDist() {
		return footStepsDist;
	}

	public void setFootStepsDist(String footStepsDist) {
		this.footStepsDist = footStepsDist;
	}

	public String getSuppMemTrough() {
		return suppMemTrough;
	}

	public void setSuppMemTrough(String suppMemTrough) {
		this.suppMemTrough = suppMemTrough;
	}

	public String getPillarMountChannel() {
		return pillarMountChannel;
	}

	public void setPillarMountChannel(String pillarMountChannel) {
		this.pillarMountChannel = pillarMountChannel;
	}

	public String getDistBwCurvedRoll() {
		return distBwCurvedRoll;
	}

	public void setDistBwCurvedRoll(String distBwCurvedRoll) {
		this.distBwCurvedRoll = distBwCurvedRoll;
	}

	public String getGrindWeldJoints() {
		return grindWeldJoints;
	}

	public void setGrindWeldJoints(String grindWeldJoints) {
		this.grindWeldJoints = grindWeldJoints;
	}

	public String getHolesForDrawing() {
		return holesForDrawing;
	}

	public void setHolesForDrawing(String holesForDrawing) {
		this.holesForDrawing = holesForDrawing;
	}

	public String getHolesDrilled() {
		return holesDrilled;
	}

	

	public void setHolesDrilled(String holesDrilled) {
		this.holesDrilled = holesDrilled;
	}

	public String getDistBwCenterCenter() {
		return distBwCenterCenter;
	}

	public void setDistBwCenterCenter(String distBwCenterCenter) {
		this.distBwCenterCenter = distBwCenterCenter;
	}

	public String getDoorFixBrkt() {
		return doorFixBrkt;
	}

	public void setDoorFixBrkt(String doorFixBrkt) {
		this.doorFixBrkt = doorFixBrkt;
	}

	public String getDoorFixBrktOb() {
		return doorFixBrktOb;
	}

	public void setDoorFixBrktOb(String doorFixBrktOb) {
		this.doorFixBrktOb = doorFixBrktOb;
	}

	public String getFitmentDimenBiotank() {
		return fitmentDimenBiotank;
	}

	public void setFitmentDimenBiotank(String fitmentDimenBiotank) {
		this.fitmentDimenBiotank = fitmentDimenBiotank;
	}

	public String getLongDistBrktBrktpp() {
		return longDistBrktBrktpp;
	}

	public void setLongDistBrktBrktpp(String longDistBrktBrktpp) {
		this.longDistBrktBrktpp = longDistBrktBrktpp;
	}

	public String getLongDistBrktBrktnpp() {
		return longDistBrktBrktnpp;
	}

	public void setLongDistBrktBrktnpp(String longDistBrktBrktnpp) {
		this.longDistBrktBrktnpp = longDistBrktBrktnpp;
	}

	public String getLatDistBrktFrntpp() {
		return latDistBrktFrntpp;
	}

	public void setLatDistBrktFrntpp(String latDistBrktFrntpp) {
		this.latDistBrktFrntpp = latDistBrktFrntpp;
	}

	public String getLatDistBrktFrntnpp() {
		return latDistBrktFrntnpp;
	}

	public void setLatDistBrktFrntnpp(String latDistBrktFrntnpp) {
		this.latDistBrktFrntnpp = latDistBrktFrntnpp;
	}

	public String getBioTankHoleDist() {
		return bioTankHoleDist;
	}

	public void setBioTankHoleDist(String bioTankHoleDist) {
		this.bioTankHoleDist = bioTankHoleDist;
	}

	public String getDistCenCen() {
		return distCenCen;
	}

	public void setDistCenCen(String distCenCen) {
		this.distCenCen = distCenCen;
	}

	public String getGenMmountScrew1() {
		return genMmountScrew1;
	}

	public void setGenMmountScrew1(String genMmountScrew1) {
		this.genMmountScrew1 = genMmountScrew1;
	}

	public String getGenMmountScrew2() {
		return genMmountScrew2;
	}

	public void setGenMmountScrew2(String genMmountScrew2) {
		this.genMmountScrew2 = genMmountScrew2;
	}

	public String getCbcUncoup() {
		return cbcUncoup;
	}

	public void setCbcUncoup(String cbcUncoup) {
		this.cbcUncoup = cbcUncoup;
	}

	public String getTransfMount() {
		return transfMount;
	}

	public void setTransfMount(String transfMount) {
		this.transfMount = transfMount;
	}

	public String getBatteryBox() {
		return batteryBox;
	}

	public void setBatteryBox(String batteryBox) {
		this.batteryBox = batteryBox;
	}

	public String getAirBrakeModule() {
		return airBrakeModule;
	}

	public void setAirBrakeModule(String airBrakeModule) {
		this.airBrakeModule = airBrakeModule;
	}

	public String getGuideDistPP() {
		return guideDistPP;
	}

	public void setGuideDistPP(String guideDistPP) {
		this.guideDistPP = guideDistPP;
	}

	public String getGuideDistNPP() {
		return guideDistNPP;
	}

	public void setGuideDistNPP(String guideDistNPP) {
		this.guideDistNPP = guideDistNPP;
	}

	public String getTwinePipHoleObs() {
		return twinePipHoleObs;
	}

	public void setTwinePipHoleObs(String twinePipHoleObs) {
		this.twinePipHoleObs = twinePipHoleObs;
	}

	public String getFibaBktAirPro() {
		return fibaBktAirPro;
	}

	public void setFibaBktAirPro(String fibaBktAirPro) {
		this.fibaBktAirPro = fibaBktAirPro;
	}

	public String getReserBktAirPro() {
		return reserBktAirPro;
	}

	public void setReserBktAirPro(String reserBktAirPro) {
		this.reserBktAirPro = reserBktAirPro;
	}

	public String getDistanceCrossMemberpp1() {
		return distanceCrossMemberpp1;
	}

	public void setDistanceCrossMemberpp1(String distanceCrossMemberpp1) {
		this.distanceCrossMemberpp1 = distanceCrossMemberpp1;
	}

	public String getDistanceCrossMembernpp1() {
		return distanceCrossMembernpp1;
	}

	public void setDistanceCrossMembernpp1(String distanceCrossMembernpp1) {
		this.distanceCrossMembernpp1 = distanceCrossMembernpp1;
	}

	public String getDistanceCrossMemberpp2() {
		return distanceCrossMemberpp2;
	}

	public void setDistanceCrossMemberpp2(String distanceCrossMemberpp2) {
		this.distanceCrossMemberpp2 = distanceCrossMemberpp2;
	}

	public String getDistanceCrossMembernpp2() {
		return distanceCrossMembernpp2;
	}

	public void setDistanceCrossMembernpp2(String distanceCrossMembernpp2) {
		this.distanceCrossMembernpp2 = distanceCrossMembernpp2;
	}

	public String getDistanceCrossMemberpp3() {
		return distanceCrossMemberpp3;
	}

	public void setDistanceCrossMemberpp3(String distanceCrossMemberpp3) {
		this.distanceCrossMemberpp3 = distanceCrossMemberpp3;
	}

	public String getDistanceCrossMembernpp3() {
		return distanceCrossMembernpp3;
	}

	public void setDistanceCrossMembernpp3(String distanceCrossMembernpp3) {
		this.distanceCrossMembernpp3 = distanceCrossMembernpp3;
	}

	public String getDistanceCrossMemberpp4() {
		return distanceCrossMemberpp4;
	}

	public void setDistanceCrossMemberpp4(String distanceCrossMemberpp4) {
		this.distanceCrossMemberpp4 = distanceCrossMemberpp4;
	}

	public String getDistanceCrossMembernpp4() {
		return distanceCrossMembernpp4;
	}

	public void setDistanceCrossMembernpp4(String distanceCrossMembernpp4) {
		this.distanceCrossMembernpp4 = distanceCrossMembernpp4;
	}

	public String getDistanceCrossMemberpp5() {
		return distanceCrossMemberpp5;
	}

	public void setDistanceCrossMemberpp5(String distanceCrossMemberpp5) {
		this.distanceCrossMemberpp5 = distanceCrossMemberpp5;
	}

	public String getDistanceCrossMembernpp5() {
		return distanceCrossMembernpp5;
	}

	public void setDistanceCrossMembernpp5(String distanceCrossMembernpp5) {
		this.distanceCrossMembernpp5 = distanceCrossMembernpp5;
	}

	public String getDistanceCrossMemberpp6() {
		return distanceCrossMemberpp6;
	}

	public void setDistanceCrossMemberpp6(String distanceCrossMemberpp6) {
		this.distanceCrossMemberpp6 = distanceCrossMemberpp6;
	}

	public String getDistanceCrossMembernpp6() {
		return distanceCrossMembernpp6;
	}

	public void setDistanceCrossMembernpp6(String distanceCrossMembernpp6) {
		this.distanceCrossMembernpp6 = distanceCrossMembernpp6;
	}

	public String getDistanceCrossMemberpp7() {
		return distanceCrossMemberpp7;
	}

	public void setDistanceCrossMemberpp7(String distanceCrossMemberpp7) {
		this.distanceCrossMemberpp7 = distanceCrossMemberpp7;
	}

	public String getDistanceCrossMembernpp7() {
		return distanceCrossMembernpp7;
	}

	public void setDistanceCrossMembernpp7(String distanceCrossMembernpp7) {
		this.distanceCrossMembernpp7 = distanceCrossMembernpp7;
	}

	public String getDistanceCrossMemberpp8() {
		return distanceCrossMemberpp8;
	}

	public void setDistanceCrossMemberpp8(String distanceCrossMemberpp8) {
		this.distanceCrossMemberpp8 = distanceCrossMemberpp8;
	}

	public String getDistanceCrossMembernpp8() {
		return distanceCrossMembernpp8;
	}

	public void setDistanceCrossMembernpp8(String distanceCrossMembernpp8) {
		this.distanceCrossMembernpp8 = distanceCrossMembernpp8;
	}

	public String getDistanceCrossMemberpp9() {
		return distanceCrossMemberpp9;
	}

	public void setDistanceCrossMemberpp9(String distanceCrossMemberpp9) {
		this.distanceCrossMemberpp9 = distanceCrossMemberpp9;
	}

	public String getDistanceCrossMembernpp9() {
		return distanceCrossMembernpp9;
	}

	public void setDistanceCrossMembernpp9(String distanceCrossMembernpp9) {
		this.distanceCrossMembernpp9 = distanceCrossMembernpp9;
	}

	public String getDistanceCrossMemberpp10() {
		return distanceCrossMemberpp10;
	}

	public void setDistanceCrossMemberpp10(String distanceCrossMemberpp10) {
		this.distanceCrossMemberpp10 = distanceCrossMemberpp10;
	}

	public String getDistanceCrossMembernpp10() {
		return distanceCrossMembernpp10;
	}

	public void setDistanceCrossMembernpp10(String distanceCrossMembernpp10) {
		this.distanceCrossMembernpp10 = distanceCrossMembernpp10;
	}

	public String getObserVal() {
		return obserVal;
	}

	public void setObserVal(String obserVal) {
		this.obserVal = obserVal;
	}

	public String getDetlOfModf() {
		return detlOfModf;
	}

	public void setDetlOfModf(String detlOfModf) {
		this.detlOfModf = detlOfModf;
	}

	public String getDetlOfTrialItems() {
		return detlOfTrialItems;
	}

	public void setDetlOfTrialItems(String detlOfTrialItems) {
		this.detlOfTrialItems = detlOfTrialItems;
	}

	public String getRmk() {
		return rmk;
	}

	public void setRmk(String rmk) {
		this.rmk = rmk;
	}
	
	
	
	
	
	
}
