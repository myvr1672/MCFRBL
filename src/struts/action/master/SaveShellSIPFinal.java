package struts.action.master;
import java.util.Date;

import org.hibernate.Session;
import dao.DaoShellSIPFinal;

import beans.ShellFinalSipTran;
import beans.ShellTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveShellSIPFinal {

	private String shellAssetId;
	private String docNo;
	private String docNoRev;
	private String docNoDate;
	private String shiftOfTesting;
	private String dateOfTesting;
	private String alignmentRoofarchCarline;
	private String weldingGrindingRwg;
	private String doorCutBackPiece;
	private String carlineRoofsheetLeakageTest;
	private String weldingAttachmentWallHolding;
	private String weldingAuxiliaryWatertankBkt;
	private String weldingGrindingSidewall;
	private String weldingStiffeningPlate;
	private String diagonalRmpuMountingStud;
	private String roofelementEndwallJoint;
	private String dimensionAcOpeningRmpu;
	private String lavMountingBracketDistance;
	private String carlineRoofsheetWelding;
	private String roofarchCarlineWelding;
	private String sidewallVerticalpillarCoveringPlateWeld;
	private String doorCutoutWelding;
	private String roofelementLavsidewallWelding;
	private String lavsidewallSidewallWelding;
	private String endwallLavsidewallRoofUfWelding;
	private String shellAssemblyGrinding;
	private String roofelementRmpuHoleDieAlignment;
	private String roofBktFitmentStage4;
	private String bodyWidth;
	private String insulatingPin;
	private String crossBraceHeightL3t;
	private String crossBraceHeightL2t;
	private String roofHeightTroughSheet;
	private String dbCnBkt;	
	private String finalTestingObservation;
	/*private String parameterRemark;
	private String entryBy;
	private Date entryTime;*/
	
	public String saveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		
		// update shell_tran table
		ShellTransaction shellTransaction= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
		shellTransaction.setFinalIspectionReportFlag(1);
		//end of update shell_tran
		
		// insertion in ShellSideRoofShellCombineSipTran
		ShellFinalSipTran shellFinalSipTran=new ShellFinalSipTran();
		shellFinalSipTran.setShellAssetId(shellAssetIdAsInt);
		System.out.println("shellAssetIdAsInt"+shellAssetIdAsInt);
		
		shellFinalSipTran.setDocNo(docNo);
		shellFinalSipTran.setDocNoRev(docNoRev);
		if(!"".equals(docNoDate))
		{
			shellFinalSipTran.setDocNoDate(DateUtil.convertToDate(docNoDate));
		}
		shellFinalSipTran.setShiftOfTesting(shiftOfTesting);
		if(!"".equals(dateOfTesting))
		{
			shellFinalSipTran.setDateOfTesting(DateUtil.convertToDate(dateOfTesting));
		}
		
		shellFinalSipTran.setAlignmentRoofarchCarline(alignmentRoofarchCarline);
		shellFinalSipTran.setWeldingGrindingRwg(weldingGrindingRwg);
		shellFinalSipTran.setDoorCutBackPiece(doorCutBackPiece);
		shellFinalSipTran.setCarlineRoofsheetLeakageTest(carlineRoofsheetLeakageTest);
		shellFinalSipTran.setWeldingAttachmentWallHolding(weldingAttachmentWallHolding);
		shellFinalSipTran.setWeldingAuxiliaryWatertankBkt(weldingAuxiliaryWatertankBkt);
		shellFinalSipTran.setWeldingGrindingSidewall(weldingGrindingSidewall);
		shellFinalSipTran.setWeldingStiffeningPlate(weldingStiffeningPlate);
		shellFinalSipTran.setDiagonalRmpuMountingStud(diagonalRmpuMountingStud);
		shellFinalSipTran.setRoofelementEndwallJoint(roofelementEndwallJoint);
		shellFinalSipTran.setDimensionAcOpeningRmpu(dimensionAcOpeningRmpu);
		shellFinalSipTran.setLavMountingBracketDistance(lavMountingBracketDistance);
		shellFinalSipTran.setCarlineRoofsheetWelding(carlineRoofsheetWelding);
		shellFinalSipTran.setRoofarchCarlineWelding(roofarchCarlineWelding);
		shellFinalSipTran.setSidewallVerticalpillarCoveringPlateWeld(sidewallVerticalpillarCoveringPlateWeld);
		shellFinalSipTran.setDoorCutoutWelding(doorCutoutWelding);
		shellFinalSipTran.setRoofelementLavsidewallWelding(roofelementLavsidewallWelding);
		shellFinalSipTran.setLavsidewallSidewallWelding(lavsidewallSidewallWelding);
		shellFinalSipTran.setEndwallLavsidewallRoofUfWelding(endwallLavsidewallRoofUfWelding);
		shellFinalSipTran.setShellAssemblyGrinding(shellAssemblyGrinding);
		shellFinalSipTran.setRoofelementRmpuHoleDieAlignment(roofelementRmpuHoleDieAlignment);
		shellFinalSipTran.setRoofBktFitmentStage4(roofBktFitmentStage4);
		shellFinalSipTran.setBodyWidth(bodyWidth);
		shellFinalSipTran.setInsulatingPin(insulatingPin);
		shellFinalSipTran.setCrossBraceHeightL3t(crossBraceHeightL3t);
		shellFinalSipTran.setCrossBraceHeightL2t(crossBraceHeightL2t);
		shellFinalSipTran.setRoofHeightTroughSheet(roofHeightTroughSheet);
		shellFinalSipTran.setDbCnBkt(dbCnBkt);
		shellFinalSipTran.setFinalTestingObservation(finalTestingObservation);
		
		
		
		
		
		// end of code
		
			try
			{
				DaoShellSIPFinal dao=new DaoShellSIPFinal();
				dao.saveData(shellFinalSipTran, shellTransaction);
				System.out.println("After");
				System.out.println(docNo);
				System.out.println(docNoRev);
				System.out.println(alignmentRoofarchCarline);
				System.out.println(diagonalRmpuMountingStud);
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
		}

	public String getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getDocNoRev() {
		return docNoRev;
	}

	public void setDocNoRev(String docNoRev) {
		this.docNoRev = docNoRev;
	}

	public String getDocNoDate() {
		return docNoDate;
	}

	public void setDocNoDate(String docNoDate) {
		this.docNoDate = docNoDate;
	}

	public String getShiftOfTesting() {
		return shiftOfTesting;
	}

	public void setShiftOfTesting(String shiftOfTesting) {
		this.shiftOfTesting = shiftOfTesting;
	}

	public String getDateOfTesting() {
		return dateOfTesting;
	}

	public void setDateOfTesting(String dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}

	public String getAlignmentRoofarchCarline() {
		return alignmentRoofarchCarline;
	}

	public void setAlignmentRoofarchCarline(String alignmentRoofarchCarline) {
		this.alignmentRoofarchCarline = alignmentRoofarchCarline;
	}

	public String getWeldingGrindingRwg() {
		return weldingGrindingRwg;
	}

	public void setWeldingGrindingRwg(String weldingGrindingRwg) {
		this.weldingGrindingRwg = weldingGrindingRwg;
	}

	public String getDoorCutBackPiece() {
		return doorCutBackPiece;
	}

	public void setDoorCutBackPiece(String doorCutBackPiece) {
		this.doorCutBackPiece = doorCutBackPiece;
	}

	public String getCarlineRoofsheetLeakageTest() {
		return carlineRoofsheetLeakageTest;
	}

	public void setCarlineRoofsheetLeakageTest(String carlineRoofsheetLeakageTest) {
		this.carlineRoofsheetLeakageTest = carlineRoofsheetLeakageTest;
	}

	public String getWeldingAttachmentWallHolding() {
		return weldingAttachmentWallHolding;
	}

	public void setWeldingAttachmentWallHolding(String weldingAttachmentWallHolding) {
		this.weldingAttachmentWallHolding = weldingAttachmentWallHolding;
	}

	public String getWeldingAuxiliaryWatertankBkt() {
		return weldingAuxiliaryWatertankBkt;
	}

	public void setWeldingAuxiliaryWatertankBkt(String weldingAuxiliaryWatertankBkt) {
		this.weldingAuxiliaryWatertankBkt = weldingAuxiliaryWatertankBkt;
	}

	public String getWeldingGrindingSidewall() {
		return weldingGrindingSidewall;
	}

	public void setWeldingGrindingSidewall(String weldingGrindingSidewall) {
		this.weldingGrindingSidewall = weldingGrindingSidewall;
	}

	public String getWeldingStiffeningPlate() {
		return weldingStiffeningPlate;
	}

	public void setWeldingStiffeningPlate(String weldingStiffeningPlate) {
		this.weldingStiffeningPlate = weldingStiffeningPlate;
	}

	public String getDiagonalRmpuMountingStud() {
		return diagonalRmpuMountingStud;
	}

	public void setDiagonalRmpuMountingStud(String diagonalRmpuMountingStud) {
		this.diagonalRmpuMountingStud = diagonalRmpuMountingStud;
	}

	public String getRoofelementEndwallJoint() {
		return roofelementEndwallJoint;
	}

	public void setRoofelementEndwallJoint(String roofelementEndwallJoint) {
		this.roofelementEndwallJoint = roofelementEndwallJoint;
	}

	public String getDimensionAcOpeningRmpu() {
		return dimensionAcOpeningRmpu;
	}

	public void setDimensionAcOpeningRmpu(String dimensionAcOpeningRmpu) {
		this.dimensionAcOpeningRmpu = dimensionAcOpeningRmpu;
	}

	public String getLavMountingBracketDistance() {
		return lavMountingBracketDistance;
	}

	public void setLavMountingBracketDistance(String lavMountingBracketDistance) {
		this.lavMountingBracketDistance = lavMountingBracketDistance;
	}

	public String getCarlineRoofsheetWelding() {
		return carlineRoofsheetWelding;
	}

	public void setCarlineRoofsheetWelding(String carlineRoofsheetWelding) {
		this.carlineRoofsheetWelding = carlineRoofsheetWelding;
	}

	public String getRoofarchCarlineWelding() {
		return roofarchCarlineWelding;
	}

	public void setRoofarchCarlineWelding(String roofarchCarlineWelding) {
		this.roofarchCarlineWelding = roofarchCarlineWelding;
	}

	public String getSidewallVerticalpillarCoveringPlateWeld() {
		return sidewallVerticalpillarCoveringPlateWeld;
	}

	public void setSidewallVerticalpillarCoveringPlateWeld(String sidewallVerticalpillarCoveringPlateWeld) {
		this.sidewallVerticalpillarCoveringPlateWeld = sidewallVerticalpillarCoveringPlateWeld;
	}

	public String getDoorCutoutWelding() {
		return doorCutoutWelding;
	}

	public void setDoorCutoutWelding(String doorCutoutWelding) {
		this.doorCutoutWelding = doorCutoutWelding;
	}

	public String getRoofelementLavsidewallWelding() {
		return roofelementLavsidewallWelding;
	}

	public void setRoofelementLavsidewallWelding(String roofelementLavsidewallWelding) {
		this.roofelementLavsidewallWelding = roofelementLavsidewallWelding;
	}

	public String getLavsidewallSidewallWelding() {
		return lavsidewallSidewallWelding;
	}

	public void setLavsidewallSidewallWelding(String lavsidewallSidewallWelding) {
		this.lavsidewallSidewallWelding = lavsidewallSidewallWelding;
	}

	public String getEndwallLavsidewallRoofUfWelding() {
		return endwallLavsidewallRoofUfWelding;
	}

	public void setEndwallLavsidewallRoofUfWelding(String endwallLavsidewallRoofUfWelding) {
		this.endwallLavsidewallRoofUfWelding = endwallLavsidewallRoofUfWelding;
	}

	public String getShellAssemblyGrinding() {
		return shellAssemblyGrinding;
	}

	public void setShellAssemblyGrinding(String shellAssemblyGrinding) {
		this.shellAssemblyGrinding = shellAssemblyGrinding;
	}

	public String getRoofelementRmpuHoleDieAlignment() {
		return roofelementRmpuHoleDieAlignment;
	}

	public void setRoofelementRmpuHoleDieAlignment(String roofelementRmpuHoleDieAlignment) {
		this.roofelementRmpuHoleDieAlignment = roofelementRmpuHoleDieAlignment;
	}

	public String getRoofBktFitmentStage4() {
		return roofBktFitmentStage4;
	}

	public void setRoofBktFitmentStage4(String roofBktFitmentStage4) {
		this.roofBktFitmentStage4 = roofBktFitmentStage4;
	}

	public String getBodyWidth() {
		return bodyWidth;
	}

	public void setBodyWidth(String bodyWidth) {
		this.bodyWidth = bodyWidth;
	}

	public String getInsulatingPin() {
		return insulatingPin;
	}

	public void setInsulatingPin(String insulatingPin) {
		this.insulatingPin = insulatingPin;
	}

	public String getCrossBraceHeightL3t() {
		return crossBraceHeightL3t;
	}

	public void setCrossBraceHeightL3t(String crossBraceHeightL3t) {
		this.crossBraceHeightL3t = crossBraceHeightL3t;
	}

	public String getCrossBraceHeightL2t() {
		return crossBraceHeightL2t;
	}

	public void setCrossBraceHeightL2t(String crossBraceHeightL2t) {
		this.crossBraceHeightL2t = crossBraceHeightL2t;
	}

	public String getRoofHeightTroughSheet() {
		return roofHeightTroughSheet;
	}

	public void setRoofHeightTroughSheet(String roofHeightTroughSheet) {
		this.roofHeightTroughSheet = roofHeightTroughSheet;
	}

	public String getDbCnBkt() {
		return dbCnBkt;
	}

	public void setDbCnBkt(String dbCnBkt) {
		this.dbCnBkt = dbCnBkt;
	}

	public String getFinalTestingObservation() {
		return finalTestingObservation;
	}

	public void setFinalTestingObservation(String finalTestingObservation) {
		this.finalTestingObservation = finalTestingObservation;
	}

	

	
		
}
