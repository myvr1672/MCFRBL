package struts.action.master;
import dao.DaoBioTankTesting;

import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import beans.BiotankTestingTransaction;
import beans.FurnishingTransaction;
//import beans.PlumbingTestingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveDataBioTankTesting {
	private String furnishingAssetId;
	
	private String bioTankTestingDocNo ;
	private String bioTankTestingShift;
	private String bioTankTestingDate;
	private String bioTankTestingMakeLav1;
	private String bioTankTestingMakeLav2;
	private String bioTankTestingMakeLav3;
	private String bioTankTestingMakeLav4;
	private String bioTankTestingBacteriaType;
	private String bioTankTestingBacteriaMake;
	private String bioTankTestingBacteriaFeedDate;
	private String weldRibBendBrklav1;
	private String weldRibBendBrklav2;
	private String weldRibBendBrklav3;
	private String weldRibBendBrklav4;
	private String properBioTankTightlav1;
	private String properBioTankTightlav2;
	private String properBioTankTightlav3;
	private String properBioTankTightlav4;
	private String panOutAlignBallValvelav1;
	private String panOutAlignBallValvelav2;
	private String panOutAlignBallValvelav3;
	private String panOutAlignBallValvelav4;
	private String weldCondJbracketlav1;
	private String weldCondJbracketlav2;
	private String weldCondJbracketlav3;
	private String weldCondJbracketlav4;
	private String fitBioJbracketlav1;
	private String fitBioJbracketlav2;
	private String fitBioJbracketlav3;
	private String fitBioJbracketlav4;
	private String rubberConnCondlav1;
	private String rubberConnCondlav2;
	private String rubberConnCondlav3;
	private String rubberConnCondlav4;
	private String leakChloUnitlav1;
	private String leakChloUnitlav2;
	private String leakChloUnitlav3;
	private String leakChloUnitlav4;
	private String condOfChlolav1;
	private String condOfChlolav2;
	private String condOfChlolav3;
	private String condOfChlolav4;
	private String condOfSafeStraplav1;
	private String condOfSafeStraplav2;
	private String condOfSafeStraplav3;
	private String condOfSafeStraplav4;
	private String leakRubberBlockChlorlav1;
	private String leakRubberBlockChlorlav2;
	private String leakRubberBlockChlorlav3;
	private String leakRubberBlockChlorlav4;
	private String leakJointConnCompSyslav1;
	private String leakJointConnCompSyslav2;
	private String leakJointConnCompSyslav3;
	private String leakJointConnCompSyslav4;
	private String funcOfFlushButtlav1;
	private String funcOfFlushButtlav2;
	private String funcOfFlushButtlav3;
	private String funcOfFlushButtlav4;
	private String suffFlushPanlav1;
	private String suffFlushPanlav2;
	private String suffFlushPanlav3;
	private String suffFlushPanlav4;
	private String odourMedHeavylav1;
	private String odourMedHeavylav2;
	private String odourMedHeavylav3;
	private String odourMedHeavylav4;
	private String stickUserlav1;
	private String stickUserlav2;
	private String stickUserlav3;
	private String stickUserlav4;
	private String chockStraplav1;
	private String chockStraplav2;
	private String chockStraplav3;
	private String chockStraplav4;
	private String consumpFlushlav1;
	private String consumpFlushlav2;
	private String consumpFlushlav3;
	private String consumpFlushlav4;
	private String sysFlushCyclelav1;
	private String sysFlushCyclelav2;
	private String sysFlushCyclelav3;
	private String sysFlushCyclelav4;
	private String allPrtVaccToiletlav1;
	private String allPrtVaccToiletlav2;
	private String allPrtVaccToiletlav3;
	private String allPrtVaccToiletlav4;
	private String airPressureSupplav1;
	private String airPressureSupplav2;
	private String airPressureSupplav3;
	private String airPressureSupplav4;
	private String bioTankConforming;
	private String weldRibBendBrk;
	private String properBioTankTight;
	private String panOutAlignBallValve;
	private String weldCondJbracket;
	private String fitBioJbracket;
	private String rubberConnCond;
	private String leakChloUnit;
	private String condOfChlol;
	private String condOfSafeStrap;
	private String leakRubberBlockChlor;
	private String leakJointConnCompSys;
	private String funcOfFlushButt;
	private String suffFlushPan;
	private String odourMedHeavy;
	private String stickUser;
	private String chockStrap;
	private String consumpFlush;
	private String sysFlushCycle;
	private String allPrtVaccToilet;
	private String airPressureSupp;
	private String entryBy;
	private String entryDate;
	
	
	
	public String saveDataBioTank()
	{
		
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryDate=new Timestamp(System.currentTimeMillis());
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		//PlumbingTestingTransaction plumbingTestingTransaction= new PlumbingTestingTransaction();
		FurnishingTransaction furnishingTran= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		furnishingTran.setBiotankBacteriaMake(bioTankTestingBacteriaMake);
		furnishingTran.setBiotankBacteriaType(bioTankTestingBacteriaType);
		furnishingTran.setBiotankLavatoryMake_1(bioTankTestingMakeLav1);
		furnishingTran.setBiotankLavatoryMake_2(bioTankTestingMakeLav2);
		furnishingTran.setBiotankLavatoryMake_3(bioTankTestingMakeLav3);
		furnishingTran.setBiotankLavatoryMake_4(bioTankTestingMakeLav4);
		if(!"".equals(bioTankTestingBacteriaFeedDate))
		{
			furnishingTran.setBiotankBacteriaFeedingDate(DateUtil.convertToDate(bioTankTestingBacteriaFeedDate));
		}
		BiotankTestingTransaction BiotankTestingTrans= new BiotankTestingTransaction();
		if(!"".equals(bioTankTestingDate))
		{
			BiotankTestingTrans.setDateOfBiotankTesting(DateUtil.convertToDate(bioTankTestingDate));
		}
		BiotankTestingTrans.setFurnishingAssetId(furnishingAssetIdAsInt);
		BiotankTestingTrans.setDocNoBiotank(bioTankTestingDocNo);
		BiotankTestingTrans.setShiftBiotank(bioTankTestingShift);
		BiotankTestingTrans.setBiotankWeldingLav1(weldRibBendBrklav1);
		BiotankTestingTrans.setBiotankWeldingLav2(weldRibBendBrklav2);
		BiotankTestingTrans.setBiotankWeldingLav3(weldRibBendBrklav3);
		BiotankTestingTrans.setBiotankWeldingLav4(weldRibBendBrklav4);
		BiotankTestingTrans.setBiotankWeldingRemark(weldRibBendBrk);
		BiotankTestingTrans.setBiotankMountingLav1(properBioTankTightlav1);
		BiotankTestingTrans.setBiotankMountingLav2(properBioTankTightlav2);
		BiotankTestingTrans.setBiotankMountingLav3(properBioTankTightlav3);
		BiotankTestingTrans.setBiotankMountingLav4(properBioTankTightlav4);
		BiotankTestingTrans.setBiotankMountingRemark(properBioTankTight);
		BiotankTestingTrans.setBiotankHoleAlignmentLav1(panOutAlignBallValvelav1);
		BiotankTestingTrans.setBiotankHoleAlignmentLav2(panOutAlignBallValvelav2);
		BiotankTestingTrans.setBiotankHoleAlignmentLav3(panOutAlignBallValvelav3);
		BiotankTestingTrans.setBiotankHoleAlignmentLav4(panOutAlignBallValvelav4);
		BiotankTestingTrans.setBiotankHoleAlignmenRemark(panOutAlignBallValve);
		BiotankTestingTrans.setBiotankWeldingJbracketLav1(weldCondJbracketlav1);
		BiotankTestingTrans.setBiotankWeldingJbracketLav2(weldCondJbracketlav2);
		BiotankTestingTrans.setBiotankWeldingJbracketLav3(weldCondJbracketlav3);
		BiotankTestingTrans.setBiotankWeldingJbracketLav4(weldCondJbracketlav4);
		BiotankTestingTrans.setBiotankWeldingJbracketRemark(weldCondJbracket);
		BiotankTestingTrans.setBiotankFittingJbracketLav1(fitBioJbracketlav1);
		BiotankTestingTrans.setBiotankFittingJbracketLav2(fitBioJbracketlav2);
		BiotankTestingTrans.setBiotankFittingJbracketLav3(fitBioJbracketlav3);
		BiotankTestingTrans.setBiotankFittingJbracketLav4(fitBioJbracketlav4);
		BiotankTestingTrans.setBiotankFittingJbracketRemark(fitBioJbracket);
		BiotankTestingTrans.setBiotankRubberConnectorLav1(rubberConnCondlav1);
		BiotankTestingTrans.setBiotankRubberConnectorLav2(rubberConnCondlav2);
		BiotankTestingTrans.setBiotankRubberConnectorLav3(rubberConnCondlav3);
		BiotankTestingTrans.setBiotankRubberConnectorLav4(rubberConnCondlav4);
		BiotankTestingTrans.setBiotankRubberConnectorRemark(rubberConnCond);
		BiotankTestingTrans.setBiotankLeakageChlorinatorLav1(leakChloUnitlav1);
		BiotankTestingTrans.setBiotankLeakageChlorinatorLav2(leakChloUnitlav2);
		BiotankTestingTrans.setBiotankLeakageChlorinatorLav3(leakChloUnitlav3);
		BiotankTestingTrans.setBiotankLeakageChlorinatorLav4(leakChloUnitlav4);
		
		BiotankTestingTrans.setBiotankLeakageChlorinatorRemark(leakChloUnit);
		BiotankTestingTrans.setBiotankConditionChlorinatorLav1(condOfChlolav1);
		BiotankTestingTrans.setBiotankConditionChlorinatorLav2(condOfChlolav2);
		BiotankTestingTrans.setBiotankConditionChlorinatorLav3(condOfChlolav3);
		BiotankTestingTrans.setBiotankConditionChlorinatorLav4(condOfChlolav4);
		BiotankTestingTrans.setBiotankConditionChlorinatorRemark(condOfChlol);
		BiotankTestingTrans.setBiotankConditionSafetystrapLav1(condOfSafeStraplav1);
		BiotankTestingTrans.setBiotankConditionSafetystrapLav2(condOfSafeStraplav2);
		BiotankTestingTrans.setBiotankConditionSafetystrapLav3(condOfSafeStraplav3);
		BiotankTestingTrans.setBiotankConditionSafetystrapLav4(condOfSafeStraplav4);
		BiotankTestingTrans.setBiotankConditionSafetystrapRemark(condOfSafeStrap);
		BiotankTestingTrans.setBiotankLeakageRubbergasketLav1(leakRubberBlockChlorlav1);
		BiotankTestingTrans.setBiotankLeakageRubbergasketLav2(leakRubberBlockChlorlav2);
		BiotankTestingTrans.setBiotankLeakageRubbergasketLav3(leakRubberBlockChlorlav3);
		BiotankTestingTrans.setBiotankLeakageRubbergasketLav4(leakRubberBlockChlorlav4);
		BiotankTestingTrans.setBiotankLeakageRubbergasketRemark(leakRubberBlockChlor);
		BiotankTestingTrans.setBiotankLeakageJointconnectionLav1(leakJointConnCompSyslav1);
		BiotankTestingTrans.setBiotankLeakageJointconnectionLav2(leakJointConnCompSyslav2);
		BiotankTestingTrans.setBiotankLeakageJointconnectionLav3(leakJointConnCompSyslav3);
		BiotankTestingTrans.setBiotankLeakageJointconnectionLav4(leakJointConnCompSyslav4);
		BiotankTestingTrans.setBiotankLeakageJointconnectionRemark(leakJointConnCompSys);
		BiotankTestingTrans.setBiotankFlushbuttonLav1(funcOfFlushButtlav1);
		BiotankTestingTrans.setBiotankFlushbuttonLav2(funcOfFlushButtlav2);
		BiotankTestingTrans.setBiotankFlushbuttonLav3(funcOfFlushButtlav3);
		BiotankTestingTrans.setBiotankFlushbuttonLav4(funcOfFlushButtlav4);
		BiotankTestingTrans.setBiotankFlushbuttonRemark(funcOfFlushButt);
		BiotankTestingTrans.setBiotankSufficientFlushingLav1(suffFlushPanlav1);
		BiotankTestingTrans.setBiotankSufficientFlushingLav2(suffFlushPanlav2);
		BiotankTestingTrans.setBiotankSufficientFlushingLav3(suffFlushPanlav3);
		BiotankTestingTrans.setBiotankSufficientFlushingLav4(suffFlushPanlav4);
		BiotankTestingTrans.setBiotankSufficientFlushingRemark(suffFlushPan);
		BiotankTestingTrans.setBiotankFoulOdourLav1(odourMedHeavylav1);
		BiotankTestingTrans.setBiotankFoulOdourLav2(odourMedHeavylav2);
		BiotankTestingTrans.setBiotankFoulOdourLav3(odourMedHeavylav3);
		BiotankTestingTrans.setBiotankFoulOdourLav4(odourMedHeavylav4);
		BiotankTestingTrans.setBiotankFoulOdourRemark(odourMedHeavy);
		BiotankTestingTrans.setBiotankStickerLav1(stickUserlav1);
		BiotankTestingTrans.setBiotankStickerLav2(stickUserlav2);
		BiotankTestingTrans.setBiotankStickerLav3(stickUserlav3);
		BiotankTestingTrans.setBiotankStickerLav4(stickUserlav4);
		BiotankTestingTrans.setBiotankStickerRemark(stickUser);
		BiotankTestingTrans.setBiotankChockingStrapLav1(chockStraplav1);
		BiotankTestingTrans.setBiotankChockingStrapLav2(chockStraplav2);
		BiotankTestingTrans.setBiotankChockingStrapLav3(chockStraplav3);
		BiotankTestingTrans.setBiotankChockingStrapLav4(chockStraplav4);
		BiotankTestingTrans.setBiotankChockingStrapRemark(chockStrap);
		BiotankTestingTrans.setBiotankConsumptionWaterLav1(consumpFlushlav1);
		BiotankTestingTrans.setBiotankConsumptionWaterLav2(consumpFlushlav2);
		BiotankTestingTrans.setBiotankConsumptionWaterLav3(consumpFlushlav3);
		BiotankTestingTrans.setBiotankConsumptionWaterLav4(consumpFlushlav4);
		BiotankTestingTrans.setBiotankConsumptionWaterRemark(consumpFlush);
		BiotankTestingTrans.setBiotankReadyNextFlushLav1(sysFlushCyclelav1);
		BiotankTestingTrans.setBiotankReadyNextFlushLav2(sysFlushCyclelav2);
		BiotankTestingTrans.setBiotankReadyNextFlushLav3(sysFlushCyclelav3);
		BiotankTestingTrans.setBiotankReadyNextFlushLav4(sysFlushCyclelav4);
		BiotankTestingTrans.setBiotankReadyNextFlushRemark(sysFlushCycle);
		BiotankTestingTrans.setBiotankVacuumEvacuationLav1(allPrtVaccToiletlav1);
		BiotankTestingTrans.setBiotankVacuumEvacuationLav2(allPrtVaccToiletlav2);
		BiotankTestingTrans.setBiotankVacuumEvacuationLav3(allPrtVaccToiletlav3);
		BiotankTestingTrans.setBiotankVacuumEvacuationLav4(allPrtVaccToiletlav4);
		BiotankTestingTrans.setBiotankVacuumEvacuationRemark(allPrtVaccToilet);
		BiotankTestingTrans.setBiotankAirPressureLav1(airPressureSupplav1);
		BiotankTestingTrans.setBiotankAirPressureLav2(airPressureSupplav2);
		BiotankTestingTrans.setBiotankAirPressureLav3(airPressureSupplav3);
		BiotankTestingTrans.setBiotankAirPressureLav4(airPressureSupplav4);
		BiotankTestingTrans.setBiotankAirPressureRemark(airPressureSupp);	
		BiotankTestingTrans.setBioTankTestingStatus(bioTankConforming);
		BiotankTestingTrans.setEntryBy(userID);
		BiotankTestingTrans.setEntryDate(entryDate);
		
		furnishingTran.setBiotankTestingFlag(1);
		System.out.println("last!!");
		
		
		
		try
		{	
			System.out.println(furnishingAssetIdAsInt);
			DaoBioTankTesting dao= new DaoBioTankTesting ();
			dao.saveBioTankTestData(furnishingTran,BiotankTestingTrans);
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



	public String getBioTankTestingDocNo() {
		return bioTankTestingDocNo;
	}



	public void setBioTankTestingDocNo(String bioTankTestingDocNo) {
		this.bioTankTestingDocNo = bioTankTestingDocNo;
	}



	public String getBioTankTestingShift() {
		return bioTankTestingShift;
	}



	public void setBioTankTestingShift(String bioTankTestingShift) {
		this.bioTankTestingShift = bioTankTestingShift;
	}



	public String getBioTankTestingDate() {
		return bioTankTestingDate;
	}



	public void setBioTankTestingDate(String bioTankTestingDate) {
		this.bioTankTestingDate = bioTankTestingDate;
	}



	public String getBioTankTestingMakeLav1() {
		return bioTankTestingMakeLav1;
	}



	public void setBioTankTestingMakeLav1(String bioTankTestingMakeLav1) {
		this.bioTankTestingMakeLav1 = bioTankTestingMakeLav1;
	}



	public String getBioTankTestingMakeLav2() {
		return bioTankTestingMakeLav2;
	}



	public void setBioTankTestingMakeLav2(String bioTankTestingMakeLav2) {
		this.bioTankTestingMakeLav2 = bioTankTestingMakeLav2;
	}



	public String getBioTankTestingMakeLav3() {
		return bioTankTestingMakeLav3;
	}



	public void setBioTankTestingMakeLav3(String bioTankTestingMakeLav3) {
		this.bioTankTestingMakeLav3 = bioTankTestingMakeLav3;
	}



	public String getBioTankTestingMakeLav4() {
		return bioTankTestingMakeLav4;
	}



	public void setBioTankTestingMakeLav4(String bioTankTestingMakeLav4) {
		this.bioTankTestingMakeLav4 = bioTankTestingMakeLav4;
	}



	public String getBioTankTestingBacteriaType() {
		return bioTankTestingBacteriaType;
	}



	public void setBioTankTestingBacteriaType(String bioTankTestingBacteriaType) {
		this.bioTankTestingBacteriaType = bioTankTestingBacteriaType;
	}



	public String getBioTankTestingBacteriaMake() {
		return bioTankTestingBacteriaMake;
	}



	public void setBioTankTestingBacteriaMake(String bioTankTestingBacteriaMake) {
		this.bioTankTestingBacteriaMake = bioTankTestingBacteriaMake;
	}



	public String getBioTankTestingBacteriaFeedDate() {
		return bioTankTestingBacteriaFeedDate;
	}



	public void setBioTankTestingBacteriaFeedDate(String bioTankTestingBacteriaFeedDate) {
		this.bioTankTestingBacteriaFeedDate = bioTankTestingBacteriaFeedDate;
	}



	public String getWeldRibBendBrklav1() {
		return weldRibBendBrklav1;
	}



	public void setWeldRibBendBrklav1(String weldRibBendBrklav1) {
		this.weldRibBendBrklav1 = weldRibBendBrklav1;
	}



	public String getWeldRibBendBrklav2() {
		return weldRibBendBrklav2;
	}



	public void setWeldRibBendBrklav2(String weldRibBendBrklav2) {
		this.weldRibBendBrklav2 = weldRibBendBrklav2;
	}



	public String getWeldRibBendBrklav3() {
		return weldRibBendBrklav3;
	}



	public void setWeldRibBendBrklav3(String weldRibBendBrklav3) {
		this.weldRibBendBrklav3 = weldRibBendBrklav3;
	}



	public String getWeldRibBendBrklav4() {
		return weldRibBendBrklav4;
	}



	public void setWeldRibBendBrklav4(String weldRibBendBrklav4) {
		this.weldRibBendBrklav4 = weldRibBendBrklav4;
	}



	public String getProperBioTankTightlav1() {
		return properBioTankTightlav1;
	}



	public void setProperBioTankTightlav1(String properBioTankTightlav1) {
		this.properBioTankTightlav1 = properBioTankTightlav1;
	}



	public String getProperBioTankTightlav2() {
		return properBioTankTightlav2;
	}



	public void setProperBioTankTightlav2(String properBioTankTightlav2) {
		this.properBioTankTightlav2 = properBioTankTightlav2;
	}



	public String getProperBioTankTightlav3() {
		return properBioTankTightlav3;
	}



	public void setProperBioTankTightlav3(String properBioTankTightlav3) {
		this.properBioTankTightlav3 = properBioTankTightlav3;
	}



	public String getProperBioTankTightlav4() {
		return properBioTankTightlav4;
	}



	public void setProperBioTankTightlav4(String properBioTankTightlav4) {
		this.properBioTankTightlav4 = properBioTankTightlav4;
	}



	public String getPanOutAlignBallValvelav1() {
		return panOutAlignBallValvelav1;
	}



	public void setPanOutAlignBallValvelav1(String panOutAlignBallValvelav1) {
		this.panOutAlignBallValvelav1 = panOutAlignBallValvelav1;
	}



	public String getPanOutAlignBallValvelav2() {
		return panOutAlignBallValvelav2;
	}



	public void setPanOutAlignBallValvelav2(String panOutAlignBallValvelav2) {
		this.panOutAlignBallValvelav2 = panOutAlignBallValvelav2;
	}



	public String getPanOutAlignBallValvelav3() {
		return panOutAlignBallValvelav3;
	}



	public void setPanOutAlignBallValvelav3(String panOutAlignBallValvelav3) {
		this.panOutAlignBallValvelav3 = panOutAlignBallValvelav3;
	}



	public String getPanOutAlignBallValvelav4() {
		return panOutAlignBallValvelav4;
	}



	public void setPanOutAlignBallValvelav4(String panOutAlignBallValvelav4) {
		this.panOutAlignBallValvelav4 = panOutAlignBallValvelav4;
	}



	public String getWeldCondJbracketlav1() {
		return weldCondJbracketlav1;
	}



	public void setWeldCondJbracketlav1(String weldCondJbracketlav1) {
		this.weldCondJbracketlav1 = weldCondJbracketlav1;
	}



	public String getWeldCondJbracketlav2() {
		return weldCondJbracketlav2;
	}



	public void setWeldCondJbracketlav2(String weldCondJbracketlav2) {
		this.weldCondJbracketlav2 = weldCondJbracketlav2;
	}



	public String getWeldCondJbracketlav3() {
		return weldCondJbracketlav3;
	}



	public void setWeldCondJbracketlav3(String weldCondJbracketlav3) {
		this.weldCondJbracketlav3 = weldCondJbracketlav3;
	}



	public String getWeldCondJbracketlav4() {
		return weldCondJbracketlav4;
	}



	public void setWeldCondJbracketlav4(String weldCondJbracketlav4) {
		this.weldCondJbracketlav4 = weldCondJbracketlav4;
	}



	public String getFitBioJbracketlav1() {
		return fitBioJbracketlav1;
	}



	public void setFitBioJbracketlav1(String fitBioJbracketlav1) {
		this.fitBioJbracketlav1 = fitBioJbracketlav1;
	}



	public String getFitBioJbracketlav2() {
		return fitBioJbracketlav2;
	}



	public void setFitBioJbracketlav2(String fitBioJbracketlav2) {
		this.fitBioJbracketlav2 = fitBioJbracketlav2;
	}



	public String getFitBioJbracketlav3() {
		return fitBioJbracketlav3;
	}



	public void setFitBioJbracketlav3(String fitBioJbracketlav3) {
		this.fitBioJbracketlav3 = fitBioJbracketlav3;
	}



	public String getFitBioJbracketlav4() {
		return fitBioJbracketlav4;
	}



	public void setFitBioJbracketlav4(String fitBioJbracketlav4) {
		this.fitBioJbracketlav4 = fitBioJbracketlav4;
	}



	public String getRubberConnCondlav1() {
		return rubberConnCondlav1;
	}



	public void setRubberConnCondlav1(String rubberConnCondlav1) {
		this.rubberConnCondlav1 = rubberConnCondlav1;
	}



	public String getRubberConnCondlav2() {
		return rubberConnCondlav2;
	}



	public void setRubberConnCondlav2(String rubberConnCondlav2) {
		this.rubberConnCondlav2 = rubberConnCondlav2;
	}



	public String getRubberConnCondlav3() {
		return rubberConnCondlav3;
	}



	public void setRubberConnCondlav3(String rubberConnCondlav3) {
		this.rubberConnCondlav3 = rubberConnCondlav3;
	}



	public String getRubberConnCondlav4() {
		return rubberConnCondlav4;
	}



	public void setRubberConnCondlav4(String rubberConnCondlav4) {
		this.rubberConnCondlav4 = rubberConnCondlav4;
	}



	public String getLeakChloUnitlav1() {
		return leakChloUnitlav1;
	}



	public void setLeakChloUnitlav1(String leakChloUnitlav1) {
		this.leakChloUnitlav1 = leakChloUnitlav1;
	}



	public String getLeakChloUnitlav2() {
		return leakChloUnitlav2;
	}



	public void setLeakChloUnitlav2(String leakChloUnitlav2) {
		this.leakChloUnitlav2 = leakChloUnitlav2;
	}



	public String getLeakChloUnitlav3() {
		return leakChloUnitlav3;
	}



	public void setLeakChloUnitlav3(String leakChloUnitlav3) {
		this.leakChloUnitlav3 = leakChloUnitlav3;
	}



	public String getLeakChloUnitlav4() {
		return leakChloUnitlav4;
	}



	public void setLeakChloUnitlav4(String leakChloUnitlav4) {
		this.leakChloUnitlav4 = leakChloUnitlav4;
	}



	public String getCondOfChlolav1() {
		return condOfChlolav1;
	}



	public void setCondOfChlolav1(String condOfChlolav1) {
		this.condOfChlolav1 = condOfChlolav1;
	}



	public String getCondOfChlolav2() {
		return condOfChlolav2;
	}



	public void setCondOfChlolav2(String condOfChlolav2) {
		this.condOfChlolav2 = condOfChlolav2;
	}



	public String getCondOfChlolav3() {
		return condOfChlolav3;
	}



	public void setCondOfChlolav3(String condOfChlolav3) {
		this.condOfChlolav3 = condOfChlolav3;
	}



	public String getCondOfChlolav4() {
		return condOfChlolav4;
	}



	public void setCondOfChlolav4(String condOfChlolav4) {
		this.condOfChlolav4 = condOfChlolav4;
	}



	public String getCondOfSafeStraplav1() {
		return condOfSafeStraplav1;
	}



	public void setCondOfSafeStraplav1(String condOfSafeStraplav1) {
		this.condOfSafeStraplav1 = condOfSafeStraplav1;
	}



	public String getCondOfSafeStraplav2() {
		return condOfSafeStraplav2;
	}



	public void setCondOfSafeStraplav2(String condOfSafeStraplav2) {
		this.condOfSafeStraplav2 = condOfSafeStraplav2;
	}



	public String getCondOfSafeStraplav3() {
		return condOfSafeStraplav3;
	}



	public void setCondOfSafeStraplav3(String condOfSafeStraplav3) {
		this.condOfSafeStraplav3 = condOfSafeStraplav3;
	}



	public String getCondOfSafeStraplav4() {
		return condOfSafeStraplav4;
	}



	public void setCondOfSafeStraplav4(String condOfSafeStraplav4) {
		this.condOfSafeStraplav4 = condOfSafeStraplav4;
	}



	public String getLeakRubberBlockChlorlav1() {
		return leakRubberBlockChlorlav1;
	}



	public void setLeakRubberBlockChlorlav1(String leakRubberBlockChlorlav1) {
		this.leakRubberBlockChlorlav1 = leakRubberBlockChlorlav1;
	}



	public String getLeakRubberBlockChlorlav2() {
		return leakRubberBlockChlorlav2;
	}



	public void setLeakRubberBlockChlorlav2(String leakRubberBlockChlorlav2) {
		this.leakRubberBlockChlorlav2 = leakRubberBlockChlorlav2;
	}



	public String getLeakRubberBlockChlorlav3() {
		return leakRubberBlockChlorlav3;
	}



	public void setLeakRubberBlockChlorlav3(String leakRubberBlockChlorlav3) {
		this.leakRubberBlockChlorlav3 = leakRubberBlockChlorlav3;
	}



	public String getLeakRubberBlockChlorlav4() {
		return leakRubberBlockChlorlav4;
	}



	public void setLeakRubberBlockChlorlav4(String leakRubberBlockChlorlav4) {
		this.leakRubberBlockChlorlav4 = leakRubberBlockChlorlav4;
	}



	public String getLeakJointConnCompSyslav1() {
		return leakJointConnCompSyslav1;
	}



	public void setLeakJointConnCompSyslav1(String leakJointConnCompSyslav1) {
		this.leakJointConnCompSyslav1 = leakJointConnCompSyslav1;
	}



	public String getLeakJointConnCompSyslav2() {
		return leakJointConnCompSyslav2;
	}



	public void setLeakJointConnCompSyslav2(String leakJointConnCompSyslav2) {
		this.leakJointConnCompSyslav2 = leakJointConnCompSyslav2;
	}



	public String getLeakJointConnCompSyslav3() {
		return leakJointConnCompSyslav3;
	}



	public void setLeakJointConnCompSyslav3(String leakJointConnCompSyslav3) {
		this.leakJointConnCompSyslav3 = leakJointConnCompSyslav3;
	}



	public String getLeakJointConnCompSyslav4() {
		return leakJointConnCompSyslav4;
	}



	public void setLeakJointConnCompSyslav4(String leakJointConnCompSyslav4) {
		this.leakJointConnCompSyslav4 = leakJointConnCompSyslav4;
	}



	public String getFuncOfFlushButtlav1() {
		return funcOfFlushButtlav1;
	}



	public void setFuncOfFlushButtlav1(String funcOfFlushButtlav1) {
		this.funcOfFlushButtlav1 = funcOfFlushButtlav1;
	}



	public String getFuncOfFlushButtlav2() {
		return funcOfFlushButtlav2;
	}



	public void setFuncOfFlushButtlav2(String funcOfFlushButtlav2) {
		this.funcOfFlushButtlav2 = funcOfFlushButtlav2;
	}



	public String getFuncOfFlushButtlav3() {
		return funcOfFlushButtlav3;
	}



	public void setFuncOfFlushButtlav3(String funcOfFlushButtlav3) {
		this.funcOfFlushButtlav3 = funcOfFlushButtlav3;
	}



	public String getFuncOfFlushButtlav4() {
		return funcOfFlushButtlav4;
	}



	public void setFuncOfFlushButtlav4(String funcOfFlushButtlav4) {
		this.funcOfFlushButtlav4 = funcOfFlushButtlav4;
	}



	public String getSuffFlushPanlav1() {
		return suffFlushPanlav1;
	}



	public void setSuffFlushPanlav1(String suffFlushPanlav1) {
		this.suffFlushPanlav1 = suffFlushPanlav1;
	}



	public String getSuffFlushPanlav2() {
		return suffFlushPanlav2;
	}



	public void setSuffFlushPanlav2(String suffFlushPanlav2) {
		this.suffFlushPanlav2 = suffFlushPanlav2;
	}



	public String getSuffFlushPanlav3() {
		return suffFlushPanlav3;
	}



	public void setSuffFlushPanlav3(String suffFlushPanlav3) {
		this.suffFlushPanlav3 = suffFlushPanlav3;
	}



	public String getSuffFlushPanlav4() {
		return suffFlushPanlav4;
	}



	public void setSuffFlushPanlav4(String suffFlushPanlav4) {
		this.suffFlushPanlav4 = suffFlushPanlav4;
	}



	public String getOdourMedHeavylav1() {
		return odourMedHeavylav1;
	}



	public void setOdourMedHeavylav1(String odourMedHeavylav1) {
		this.odourMedHeavylav1 = odourMedHeavylav1;
	}



	public String getOdourMedHeavylav2() {
		return odourMedHeavylav2;
	}



	public void setOdourMedHeavylav2(String odourMedHeavylav2) {
		this.odourMedHeavylav2 = odourMedHeavylav2;
	}



	public String getOdourMedHeavylav3() {
		return odourMedHeavylav3;
	}



	public void setOdourMedHeavylav3(String odourMedHeavylav3) {
		this.odourMedHeavylav3 = odourMedHeavylav3;
	}



	public String getOdourMedHeavylav4() {
		return odourMedHeavylav4;
	}



	public void setOdourMedHeavylav4(String odourMedHeavylav4) {
		this.odourMedHeavylav4 = odourMedHeavylav4;
	}



	public String getStickUserlav1() {
		return stickUserlav1;
	}



	public void setStickUserlav1(String stickUserlav1) {
		this.stickUserlav1 = stickUserlav1;
	}



	public String getStickUserlav2() {
		return stickUserlav2;
	}



	public void setStickUserlav2(String stickUserlav2) {
		this.stickUserlav2 = stickUserlav2;
	}



	public String getStickUserlav3() {
		return stickUserlav3;
	}



	public void setStickUserlav3(String stickUserlav3) {
		this.stickUserlav3 = stickUserlav3;
	}



	public String getStickUserlav4() {
		return stickUserlav4;
	}



	public void setStickUserlav4(String stickUserlav4) {
		this.stickUserlav4 = stickUserlav4;
	}



	public String getChockStraplav1() {
		return chockStraplav1;
	}



	public void setChockStraplav1(String chockStraplav1) {
		this.chockStraplav1 = chockStraplav1;
	}



	public String getChockStraplav2() {
		return chockStraplav2;
	}



	public void setChockStraplav2(String chockStraplav2) {
		this.chockStraplav2 = chockStraplav2;
	}



	public String getChockStraplav3() {
		return chockStraplav3;
	}



	public void setChockStraplav3(String chockStraplav3) {
		this.chockStraplav3 = chockStraplav3;
	}



	public String getChockStraplav4() {
		return chockStraplav4;
	}



	public void setChockStraplav4(String chockStraplav4) {
		this.chockStraplav4 = chockStraplav4;
	}



	public String getConsumpFlushlav1() {
		return consumpFlushlav1;
	}



	public void setConsumpFlushlav1(String consumpFlushlav1) {
		this.consumpFlushlav1 = consumpFlushlav1;
	}



	public String getConsumpFlushlav2() {
		return consumpFlushlav2;
	}



	public void setConsumpFlushlav2(String consumpFlushlav2) {
		this.consumpFlushlav2 = consumpFlushlav2;
	}



	public String getConsumpFlushlav3() {
		return consumpFlushlav3;
	}



	public void setConsumpFlushlav3(String consumpFlushlav3) {
		this.consumpFlushlav3 = consumpFlushlav3;
	}



	public String getConsumpFlushlav4() {
		return consumpFlushlav4;
	}



	public void setConsumpFlushlav4(String consumpFlushlav4) {
		this.consumpFlushlav4 = consumpFlushlav4;
	}



	public String getSysFlushCyclelav1() {
		return sysFlushCyclelav1;
	}



	public void setSysFlushCyclelav1(String sysFlushCyclelav1) {
		this.sysFlushCyclelav1 = sysFlushCyclelav1;
	}



	public String getSysFlushCyclelav2() {
		return sysFlushCyclelav2;
	}



	public void setSysFlushCyclelav2(String sysFlushCyclelav2) {
		this.sysFlushCyclelav2 = sysFlushCyclelav2;
	}



	public String getSysFlushCyclelav3() {
		return sysFlushCyclelav3;
	}



	public void setSysFlushCyclelav3(String sysFlushCyclelav3) {
		this.sysFlushCyclelav3 = sysFlushCyclelav3;
	}



	public String getSysFlushCyclelav4() {
		return sysFlushCyclelav4;
	}



	public void setSysFlushCyclelav4(String sysFlushCyclelav4) {
		this.sysFlushCyclelav4 = sysFlushCyclelav4;
	}



	public String getAllPrtVaccToiletlav1() {
		return allPrtVaccToiletlav1;
	}



	public void setAllPrtVaccToiletlav1(String allPrtVaccToiletlav1) {
		this.allPrtVaccToiletlav1 = allPrtVaccToiletlav1;
	}



	public String getAllPrtVaccToiletlav2() {
		return allPrtVaccToiletlav2;
	}



	public void setAllPrtVaccToiletlav2(String allPrtVaccToiletlav2) {
		this.allPrtVaccToiletlav2 = allPrtVaccToiletlav2;
	}



	public String getAllPrtVaccToiletlav3() {
		return allPrtVaccToiletlav3;
	}



	public void setAllPrtVaccToiletlav3(String allPrtVaccToiletlav3) {
		this.allPrtVaccToiletlav3 = allPrtVaccToiletlav3;
	}



	public String getAllPrtVaccToiletlav4() {
		return allPrtVaccToiletlav4;
	}



	public void setAllPrtVaccToiletlav4(String allPrtVaccToiletlav4) {
		this.allPrtVaccToiletlav4 = allPrtVaccToiletlav4;
	}



	public String getAirPressureSupplav1() {
		return airPressureSupplav1;
	}



	public void setAirPressureSupplav1(String airPressureSupplav1) {
		this.airPressureSupplav1 = airPressureSupplav1;
	}



	public String getAirPressureSupplav2() {
		return airPressureSupplav2;
	}



	public void setAirPressureSupplav2(String airPressureSupplav2) {
		this.airPressureSupplav2 = airPressureSupplav2;
	}



	public String getAirPressureSupplav3() {
		return airPressureSupplav3;
	}



	public void setAirPressureSupplav3(String airPressureSupplav3) {
		this.airPressureSupplav3 = airPressureSupplav3;
	}



	public String getAirPressureSupplav4() {
		return airPressureSupplav4;
	}



	public void setAirPressureSupplav4(String airPressureSupplav4) {
		this.airPressureSupplav4 = airPressureSupplav4;
	}



	public String getBioTankConforming() {
		return bioTankConforming;
	}



	public void setBioTankConforming(String bioTankConforming) {
		this.bioTankConforming = bioTankConforming;
	}



	public String getWeldRibBendBrk() {
		return weldRibBendBrk;
	}



	public void setWeldRibBendBrk(String weldRibBendBrk) {
		this.weldRibBendBrk = weldRibBendBrk;
	}



	public String getProperBioTankTight() {
		return properBioTankTight;
	}



	public void setProperBioTankTight(String properBioTankTight) {
		this.properBioTankTight = properBioTankTight;
	}



	public String getPanOutAlignBallValve() {
		return panOutAlignBallValve;
	}



	public void setPanOutAlignBallValve(String panOutAlignBallValve) {
		this.panOutAlignBallValve = panOutAlignBallValve;
	}



	public String getWeldCondJbracket() {
		return weldCondJbracket;
	}



	public void setWeldCondJbracket(String weldCondJbracket) {
		this.weldCondJbracket = weldCondJbracket;
	}



	public String getFitBioJbracket() {
		return fitBioJbracket;
	}



	public void setFitBioJbracket(String fitBioJbracket) {
		this.fitBioJbracket = fitBioJbracket;
	}



	public String getRubberConnCond() {
		return rubberConnCond;
	}



	public void setRubberConnCond(String rubberConnCond) {
		this.rubberConnCond = rubberConnCond;
	}



	public String getLeakChloUnit() {
		return leakChloUnit;
	}



	public void setLeakChloUnit(String leakChloUnit) {
		this.leakChloUnit = leakChloUnit;
	}



	public String getCondOfChlol() {
		return condOfChlol;
	}



	public void setCondOfChlol(String condOfChlol) {
		this.condOfChlol = condOfChlol;
	}



	public String getCondOfSafeStrap() {
		return condOfSafeStrap;
	}



	public void setCondOfSafeStrap(String condOfSafeStrap) {
		this.condOfSafeStrap = condOfSafeStrap;
	}



	public String getLeakRubberBlockChlor() {
		return leakRubberBlockChlor;
	}



	public void setLeakRubberBlockChlor(String leakRubberBlockChlor) {
		this.leakRubberBlockChlor = leakRubberBlockChlor;
	}



	public String getLeakJointConnCompSys() {
		return leakJointConnCompSys;
	}



	public void setLeakJointConnCompSys(String leakJointConnCompSys) {
		this.leakJointConnCompSys = leakJointConnCompSys;
	}



	public String getFuncOfFlushButt() {
		return funcOfFlushButt;
	}



	public void setFuncOfFlushButt(String funcOfFlushButt) {
		this.funcOfFlushButt = funcOfFlushButt;
	}



	public String getSuffFlushPan() {
		return suffFlushPan;
	}



	public void setSuffFlushPan(String suffFlushPan) {
		this.suffFlushPan = suffFlushPan;
	}



	public String getOdourMedHeavy() {
		return odourMedHeavy;
	}



	public void setOdourMedHeavy(String odourMedHeavy) {
		this.odourMedHeavy = odourMedHeavy;
	}



	public String getStickUser() {
		return stickUser;
	}



	public void setStickUser(String stickUser) {
		this.stickUser = stickUser;
	}



	public String getChockStrap() {
		return chockStrap;
	}



	public void setChockStrap(String chockStrap) {
		this.chockStrap = chockStrap;
	}



	public String getConsumpFlush() {
		return consumpFlush;
	}



	public void setConsumpFlush(String consumpFlush) {
		this.consumpFlush = consumpFlush;
	}



	public String getSysFlushCycle() {
		return sysFlushCycle;
	}



	public void setSysFlushCycle(String sysFlushCycle) {
		this.sysFlushCycle = sysFlushCycle;
	}



	public String getAllPrtVaccToilet() {
		return allPrtVaccToilet;
	}



	public void setAllPrtVaccToilet(String allPrtVaccToilet) {
		this.allPrtVaccToilet = allPrtVaccToilet;
	}



	public String getAirPressureSupp() {
		return airPressureSupp;
	}



	public void setAirPressureSupp(String airPressureSupp) {
		this.airPressureSupp = airPressureSupp;
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
