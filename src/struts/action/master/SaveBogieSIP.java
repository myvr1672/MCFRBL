package struts.action.master;

import dao.DaoBogieFinal;




import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import beans.BogiesetTransaction;
import beans.BogieFinalSipTran;
//import beans.BogieStaticSipTran;
//import beans.WheelsetTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveBogieSIP {
	
	private String bogieAssetId;
	private String dateOfTesting;
	private String shiftOfTesting;
	private String primarySpringColorInner;
	private String primarySpringColorOuter;
	private String fitmentAntiRollBarStatus;
	private String fitmentAntiRollBarActual;
	private String fitmentAntiRollBarAttendant;
	private String fitmentTractionLeverJointStatus;
	private String fitmentTractionLeverJointActual;
	private String fitmentTractionLeverJointAttendant;
	private String fitmentLateralDamperBktStatus;
	private String fitmentLateralDamperBktActual;
	private String fitmentLateralDamperBktAttendant;
	private String fitmentCrossSectionStatus;
	private String fitmentCrossSectionActual;
	private String fitmentCrossSectionAttendant;
	private String fitmentLateralBumpStopStatus;
	private String fitmentLateralBumpStopActual;
	private String fitmentLateralBumpStopAttendant;
	private String fitmentBrakeCylinderStatus;
	private String fitmentBrakeCylinderActual;
	private String fitmentBrakeCylinderAttendant;
	private String fitmentLongitudinalStopStatus;
	private String fitmentLongitudinalStopActual;
	private String fitmentLongitudinalStopAttendant;
	private String fitmentRollLinkStatus;
	private String fitmentRollLinkActual;
	private String fitmentRollLinkAttendant;
	private String fitmentControlArmTopBottomStatus;
	private String fitmentControlArmTopBottomActual;
	private String fitmentControlArmTopBottomAttendant;
	private String fitmentAxleEndCoverStatus;
	private String fitmentAxleEndCoverActual;
	private String fitmentAxleEndCoverAttendant;
	private String fitmentPrimaryBumpStatus;
	private String fitmentPrimaryBumpActual;
	private String fitmentPrimaryBumpAttendant;
	private String fitmentControlArmTopArmbktStatus;
	private String fitmentControlArmTopArmbktActual;
	private String fitmentControlArmTopArmbktAttendant;
	private String fitmentPrimaryShockAbsorberStatus;
	private String fitmentPrimaryShockAbsorberActual;
	private String fitmentPrimaryShockAbsorberAttendant;
	private String fitmentTractionCentreStatus;
	private String fitmentTractionCentreActual;
	private String fitmentTractionCentreAttendant;
	private String fitmentLateralDamperDiscStatus;
	private String fitmentLateralDamperDiscActual;
	private String fitmentLateralDamperDiscAttendant;
	private String fitmentSecVerticalDamperStatus;
	private String fitmentSecVerticalDamperActual;
	private String fitmentSecVerticalDamperAttendant;
	private String fitmentLockingPlateActual;
	private String fitmentLockingPlateAttendant;
	private String noPlateOfShockAbsorber;
	private String noPlateOfShockAbsorberAttendant;
	private String pipesLeakageActual;
	private String pipesLeakageAttendant;
	private String cotterSplitActual;
	private String cotterSplitAttendant;
	private String nutBoltTightActual;
	private String nutBoltTightAttendant;
	private String weldingOfBogieplateActual;
	private String weldingOfBogieplateAttendant;
	private String paintingOfBogieActual;
	private String paintingOfBogieAttendant;
	private String fitmentPhonicWheelActual;
	private String fitmentPhonicWheelAttendant;
	private String fitmentAirpipeBolsterActual;
	private String fitmentAirpipeBolsterAttendant;
	private String fitmentAirpipeBrakecylinderActual;
	private String fitmentAirpipeBrakecylinderAttendant;
	private String movementBrakeRiggingActual;
	private String movementBrakeRiggingAttendant;
	private String itemFittedAsDrawingFlag;
	private String complianceWiFlag;
	private String weldingThroatLengthFlag;
	private String wheelBase;
	private String detailsModification;
	private String detailsTrialItems;
	private String remarks;
	private String testingStatus;
	private String drawingNoFinalSip;
	   private String formNoFinalSip;
	   private String bogieNumber;
	   private String bogieType;
	   private String frameNo;
	   private String bolsNo;
	  
	   private String brakeCylinderNo1;
	   private String brakeCylinderNo2;
	   private String brakeCylinderNo3;
	   private String brakeCylinderNo4;
	   private String brakeCaliperNo1;
	   private String brakeCaliperNo2;
	   private String brakeCaliperNo3;
	   private String brakeCaliperNo4;
	public String saveBogie()
	{
		
		System.out.println("Bpogie id: "+bogieAssetId);
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryTime=new Timestamp(System.currentTimeMillis());
		Integer bogieAssetIdAsInt=Integer.parseInt(bogieAssetId);
		BogieFinalSipTran bogieFinalSipTran= new BogieFinalSipTran();
		bogieFinalSipTran.setBogieAssetId(bogieAssetIdAsInt);
		// insert one by one remaining column in above object
		
			if(!"".equals(fitmentAntiRollBarActual))
			{
				Integer FitmentAntiRollBarActualAsInt=Integer.parseInt(fitmentAntiRollBarActual);
				bogieFinalSipTran.setFitmentAntiRollBarActual(FitmentAntiRollBarActualAsInt);
				
			}
			
			if(!"".equals(fitmentTractionLeverJointActual))
			{
				Integer FitmentTractionLeverJointActualAsInt=Integer.parseInt(fitmentTractionLeverJointActual);
				bogieFinalSipTran.setFitmentTractionLeverJointActual(FitmentTractionLeverJointActualAsInt);
				
			}if(!"".equals(fitmentLateralDamperBktActual))
			{
				Integer FitmentLateralDamperBktActualAsInt=Integer.parseInt(fitmentLateralDamperBktActual);
				bogieFinalSipTran.setFitmentLateralDamperBktActual(FitmentLateralDamperBktActualAsInt);
				
			}if(!"".equals(fitmentCrossSectionActual))
			{
				Integer FitmentCrossSectionActualAsInt=Integer.parseInt(fitmentCrossSectionActual);
				bogieFinalSipTran.setFitmentCrossSectionActual(FitmentCrossSectionActualAsInt);
				
			}if(!"".equals(fitmentLateralBumpStopActual))
			{
				Integer FitmentLateralBumpStopActualAsInt=Integer.parseInt(fitmentLateralBumpStopActual);
				bogieFinalSipTran.setFitmentLateralBumpStopActual(FitmentLateralBumpStopActualAsInt);
				
			}if(!"".equals(fitmentBrakeCylinderActual))
			{
				Integer FitmentBrakeCylinderActualAsInt=Integer.parseInt(fitmentBrakeCylinderActual);
				bogieFinalSipTran.setFitmentBrakeCylinderActual(FitmentBrakeCylinderActualAsInt);
				
			}if(!"".equals(fitmentLongitudinalStopActual))
			{
				Integer FitmentLongitudinalStopActualAsInt=Integer.parseInt(fitmentLongitudinalStopActual);
				bogieFinalSipTran.setFitmentLongitudinalStopActual(FitmentLongitudinalStopActualAsInt);
				
			}if(!"".equals(fitmentRollLinkActual))
			{
				Integer FitmentRollLinkActualAsInt=Integer.parseInt(fitmentRollLinkActual);
				bogieFinalSipTran.setFitmentRollLinkActual(FitmentRollLinkActualAsInt);
				
			}if(!"".equals(fitmentControlArmTopBottomActual))
			{
				Integer FitmentControlArmTopBottomActualAsInt=Integer.parseInt(fitmentControlArmTopBottomActual);
				bogieFinalSipTran.setFitmentControlArmTopBottomActual(FitmentControlArmTopBottomActualAsInt);
				
			}if(!"".equals(fitmentAxleEndCoverActual))
			{
				Integer FitmentAxleEndCoverActualAsInt=Integer.parseInt(fitmentAxleEndCoverActual);
				bogieFinalSipTran.setFitmentAxleEndCoverActual(FitmentAxleEndCoverActualAsInt);
				
			}if(!"".equals(fitmentPrimaryBumpActual))
			{
				Integer FitmentPrimaryBumpActualAsInt=Integer.parseInt(fitmentPrimaryBumpActual);
				bogieFinalSipTran.setFitmentPrimaryBumpActual(FitmentPrimaryBumpActualAsInt);
				
			}if(!"".equals(fitmentControlArmTopArmbktActual))
			{
				Integer FitmentControlArmTopArmbktActualAsInt=Integer.parseInt(fitmentControlArmTopArmbktActual);
				bogieFinalSipTran.setFitmentControlArmTopArmbktActual(FitmentControlArmTopArmbktActualAsInt);
				
			}
			
			if(!"".equals(fitmentPrimaryShockAbsorberActual))
			{
				Integer FitmentPrimaryShockAbsorberActualAsInt=Integer.parseInt(fitmentPrimaryShockAbsorberActual);
				bogieFinalSipTran.setFitmentPrimaryShockAbsorberActual(FitmentPrimaryShockAbsorberActualAsInt);
				
			}if(!"".equals(fitmentTractionCentreActual))
			{
				Integer FitmentTractionCentreActualAsInt=Integer.parseInt(fitmentTractionCentreActual);
				bogieFinalSipTran.setFitmentTractionCentreActual(FitmentTractionCentreActualAsInt);
				
			}if(!"".equals(fitmentLateralDamperDiscActual))
			{
				Integer FitmentLateralDamperDiscActualAsInt=Integer.parseInt(fitmentLateralDamperDiscActual);
				bogieFinalSipTran.setFitmentLateralDamperDiscActual(FitmentLateralDamperDiscActualAsInt);
				
			}if(!"".equals(fitmentSecVerticalDamperActual))
			{
				Integer FitmentSecVerticalDamperActualAsInt=Integer.parseInt(fitmentSecVerticalDamperActual);
				bogieFinalSipTran.setFitmentSecVerticalDamperActual(FitmentSecVerticalDamperActualAsInt);
				
			}
			
			if(!"".equals(fitmentPhonicWheelActual))
			{
				Integer FitmentPhonicWheelActualAsInt=Integer.parseInt(fitmentPhonicWheelActual);
				bogieFinalSipTran.setFitmentPhonicWheelActual(FitmentPhonicWheelActualAsInt);
				
			}
			if(!"".equals(wheelBase))
			{
				Float wheelBaseAsReal=Float.parseFloat(wheelBase);
				bogieFinalSipTran.setWheelBase(wheelBaseAsReal);
				
			}
			System.out.println("SAVE");
		if(!"".equals(dateOfTesting))
		{
			
			
			bogieFinalSipTran.setDateOfTesting(DateUtil.convertToDate(dateOfTesting));
		}
			//bogieFinalSipTran.setBogieAssetId(bogieAssetIdAsInt);
			bogieFinalSipTran.setFitmentAirpipeBrakecylinderActual(fitmentAirpipeBrakecylinderActual);
		
		System.out.println("Save1");
			
		 bogieFinalSipTran.setFitmentAirpipeBolsterActual(fitmentAirpipeBolsterActual);
		bogieFinalSipTran.setPaintingOfBogieActual(paintingOfBogieActual);
		bogieFinalSipTran.setWeldingOfBogieplateActual(weldingOfBogieplateActual);
		bogieFinalSipTran.setNutBoltTightActual(nutBoltTightActual);
		bogieFinalSipTran.setCotterSplitActual(cotterSplitActual);
		bogieFinalSipTran.setPipesLeakageActual(pipesLeakageActual);
		
		
		bogieFinalSipTran.setFitmentLockingPlateActual(fitmentLockingPlateActual);
		bogieFinalSipTran.setMovementBrakeRiggingActual(movementBrakeRiggingActual);
		
			bogieFinalSipTran.setShiftOfTesting(shiftOfTesting);
	
		
		bogieFinalSipTran.setPrimarySpringColorInner(primarySpringColorInner);
		bogieFinalSipTran.setPrimarySpringColorOuter(primarySpringColorOuter);
		bogieFinalSipTran.setFitmentAntiRollBarStatus(fitmentAntiRollBarStatus);
		
		bogieFinalSipTran.setFitmentAntiRollBarAttendant(fitmentAntiRollBarAttendant);
		bogieFinalSipTran.setFitmentTractionLeverJointStatus(fitmentTractionLeverJointStatus);
		
		bogieFinalSipTran.setFitmentTractionLeverJointAttendant(fitmentTractionLeverJointAttendant);
		
		bogieFinalSipTran.setFitmentLateralDamperBktStatus(fitmentLateralDamperBktStatus);
		bogieFinalSipTran.setFitmentLateralDamperBktAttendant(fitmentLateralDamperBktAttendant);
		bogieFinalSipTran.setFitmentCrossSectionStatus(fitmentCrossSectionStatus);
		
		
		bogieFinalSipTran.setFitmentCrossSectionAttendant(fitmentCrossSectionAttendant);
		bogieFinalSipTran.setFitmentLateralBumpStopStatus(fitmentLateralBumpStopStatus);
		bogieFinalSipTran.setFitmentLateralBumpStopAttendant(fitmentLateralBumpStopAttendant);
		bogieFinalSipTran.setFitmentBrakeCylinderStatus(fitmentBrakeCylinderStatus);
		//System.out.println("Status"+fitmentBrakeCylinderStatus);
		bogieFinalSipTran.setFitmentBrakeCylinderAttendant(fitmentBrakeCylinderAttendant);
		bogieFinalSipTran.setFitmentLongitudinalStopStatus(fitmentLongitudinalStopStatus);
		bogieFinalSipTran.setFitmentLongitudinalStopAttendant(fitmentLongitudinalStopAttendant);
		bogieFinalSipTran.setFitmentRollLinkStatus(fitmentRollLinkStatus);
		bogieFinalSipTran.setFitmentRollLinkAttendant(fitmentRollLinkAttendant);
		bogieFinalSipTran.setFitmentControlArmTopBottomStatus(fitmentControlArmTopBottomStatus);
		
		bogieFinalSipTran.setFitmentControlArmTopBottomAttendant(fitmentControlArmTopBottomAttendant);
		bogieFinalSipTran.setFitmentAxleEndCoverStatus(fitmentAxleEndCoverStatus);
		
		bogieFinalSipTran.setFitmentAxleEndCoverAttendant(fitmentAxleEndCoverAttendant);
		bogieFinalSipTran.setFitmentPrimaryBumpStatus(fitmentPrimaryBumpStatus);
		bogieFinalSipTran.setFitmentPrimaryBumpAttendant(fitmentPrimaryBumpAttendant);
		bogieFinalSipTran.setFitmentControlArmTopArmbktStatus(fitmentControlArmTopArmbktStatus);
		bogieFinalSipTran.setFitmentControlArmTopArmbktAttendant(fitmentControlArmTopArmbktAttendant);
		bogieFinalSipTran.setFitmentPrimaryShockAbsorberStatus(fitmentPrimaryShockAbsorberStatus);
		
		bogieFinalSipTran.setFitmentPrimaryShockAbsorberAttendant(fitmentPrimaryShockAbsorberAttendant);
		
		bogieFinalSipTran.setFitmentTractionCentreStatus(fitmentTractionCentreStatus);
		
		bogieFinalSipTran.setFitmentTractionCentreAttendant(fitmentTractionCentreAttendant);
		
		bogieFinalSipTran.setFitmentLateralDamperDiscStatus(fitmentLateralDamperDiscStatus);
		
		bogieFinalSipTran.setFitmentLateralDamperDiscAttendant(fitmentLateralDamperDiscAttendant);
		
		bogieFinalSipTran.setFitmentSecVerticalDamperStatus(fitmentSecVerticalDamperStatus);
		
		bogieFinalSipTran.setFitmentSecVerticalDamperAttendant(fitmentSecVerticalDamperAttendant);
		
bogieFinalSipTran.setFitmentLockingPlateAttendant(fitmentLockingPlateAttendant);
		
		bogieFinalSipTran.setNoPlateOfShockAbsorber(noPlateOfShockAbsorber);
		
bogieFinalSipTran.setNoPlateOfShockAbsorberAttendant(noPlateOfShockAbsorberAttendant);
		
		bogieFinalSipTran.setPipesLeakageActual(pipesLeakageActual);
		
bogieFinalSipTran.setPipesLeakageAttendant(pipesLeakageAttendant);
		
		bogieFinalSipTran.setCotterSplitActual(cotterSplitActual);
		
bogieFinalSipTran.setCotterSplitAttendant(cotterSplitAttendant);
		
		bogieFinalSipTran.setNutBoltTightActual(nutBoltTightActual);
		
bogieFinalSipTran.setNutBoltTightAttendant(nutBoltTightAttendant);
		
		bogieFinalSipTran.setWeldingOfBogieplateActual(weldingOfBogieplateActual);
bogieFinalSipTran.setWeldingOfBogieplateAttendant(weldingOfBogieplateAttendant);
System.out.println("Welding"+weldingOfBogieplateAttendant);
		
		bogieFinalSipTran.setPaintingOfBogieActual(paintingOfBogieActual);
		
bogieFinalSipTran.setPaintingOfBogieAttendant(paintingOfBogieAttendant);
		
	//	bogieFinalSipTran.setFitmentPhonicWheelActual(fitmentPhonicWheelActual);
		
bogieFinalSipTran.setFitmentPhonicWheelAttendant(fitmentPhonicWheelAttendant);
		
		bogieFinalSipTran.setFitmentAirpipeBolsterActual(fitmentAirpipeBolsterActual);
		
bogieFinalSipTran.setFitmentAirpipeBolsterAttendant(fitmentAirpipeBolsterAttendant);
		
		bogieFinalSipTran.setFitmentAirpipeBrakecylinderActual(fitmentAirpipeBrakecylinderActual);
		
bogieFinalSipTran.setFitmentAirpipeBrakecylinderAttendant(fitmentAirpipeBrakecylinderAttendant);
		
		bogieFinalSipTran.setMovementBrakeRiggingActual(movementBrakeRiggingActual);
		
bogieFinalSipTran.setMovementBrakeRiggingAttendant(movementBrakeRiggingAttendant);
		
		bogieFinalSipTran.setItemFittedAsDrawingFlag(itemFittedAsDrawingFlag);
bogieFinalSipTran.setComplianceWiFlag(complianceWiFlag);
		
		bogieFinalSipTran.setWeldingThroatLengthFlag(weldingThroatLengthFlag);

		
		bogieFinalSipTran.setDetailsModification(detailsModification);
bogieFinalSipTran.setDetailsTrialItems(detailsTrialItems);
		
		bogieFinalSipTran.setRemarks(remarks);
		bogieFinalSipTran.setTestingStatus(testingStatus);
	
			
		
		//shellTran.setStage4SipFlag(1);
		System.out.println("last!!");
BogiesetTransaction bogiesetTran=(BogiesetTransaction) session.get(BogiesetTransaction.class, bogieAssetIdAsInt);
		

		//bogiesetTran.setBogieAssetId(bogieAssetIdAsInt);
		bogiesetTran.setSipFinalFlag(1);
		bogiesetTran.setBogieNumber(bogieNumber);
		bogiesetTran.setBogieType(bogieType);
		bogiesetTran.setBolsNo(bolsNo);
		bogiesetTran.setFrameNo(frameNo);
		bogiesetTran.setBrakeCaliperNo1(brakeCaliperNo1);
		bogiesetTran.setBrakeCaliperNo2(brakeCaliperNo2);
		bogiesetTran.setBrakeCaliperNo3(brakeCaliperNo3);
		bogiesetTran.setBrakeCaliperNo4(brakeCaliperNo4);
		bogiesetTran.setBrakeCylinderNo1(brakeCylinderNo1);
		bogiesetTran.setBrakeCylinderNo2(brakeCylinderNo2);
		bogiesetTran.setBrakeCylinderNo3(brakeCylinderNo3);
		bogiesetTran.setBrakeCylinderNo4(brakeCylinderNo4);
		
		// other field also.
		try
		{	
			System.out.println(bogieAssetIdAsInt);
			DaoBogieFinal dao= new DaoBogieFinal();
			dao.saveBogieFinal(bogieFinalSipTran, bogiesetTran);
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
	public String getBogieAssetId() {
		return bogieAssetId;
	}
	public void setBogieAssetId(String bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}
	public String getDateOfTesting() {
		return dateOfTesting;
	}
	public void setDateOfTesting(String dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}
	public String getShiftOfTesting() {
		return shiftOfTesting;
	}
	public void setShiftOfTesting(String shiftOfTesting) {
		this.shiftOfTesting = shiftOfTesting;
	}
	public String getPrimarySpringColorInner() {
		return primarySpringColorInner;
	}
	public void setPrimarySpringColorInner(String primarySpringColorInner) {
		this.primarySpringColorInner = primarySpringColorInner;
	}
	public String getPrimarySpringColorOuter() {
		return primarySpringColorOuter;
	}
	public void setPrimarySpringColorOuter(String primarySpringColorOuter) {
		this.primarySpringColorOuter = primarySpringColorOuter;
	}
	public String getFitmentAntiRollBarStatus() {
		return fitmentAntiRollBarStatus;
	}
	public void setFitmentAntiRollBarStatus(String fitmentAntiRollBarStatus) {
		this.fitmentAntiRollBarStatus = fitmentAntiRollBarStatus;
	}
	public String getFitmentAntiRollBarActual() {
		return fitmentAntiRollBarActual;
	}
	public void setFitmentAntiRollBarActual(String fitmentAntiRollBarActual) {
		this.fitmentAntiRollBarActual = fitmentAntiRollBarActual;
	}
	public String getFitmentAntiRollBarAttendant() {
		return fitmentAntiRollBarAttendant;
	}
	public void setFitmentAntiRollBarAttendant(String fitmentAntiRollBarAttendant) {
		this.fitmentAntiRollBarAttendant = fitmentAntiRollBarAttendant;
	}
	public String getFitmentTractionLeverJointStatus() {
		return fitmentTractionLeverJointStatus;
	}
	public void setFitmentTractionLeverJointStatus(String fitmentTractionLeverJointStatus) {
		this.fitmentTractionLeverJointStatus = fitmentTractionLeverJointStatus;
	}
	public String getFitmentTractionLeverJointActual() {
		return fitmentTractionLeverJointActual;
	}
	public void setFitmentTractionLeverJointActual(String fitmentTractionLeverJointActual) {
		this.fitmentTractionLeverJointActual = fitmentTractionLeverJointActual;
	}
	public String getFitmentTractionLeverJointAttendant() {
		return fitmentTractionLeverJointAttendant;
	}
	public void setFitmentTractionLeverJointAttendant(String fitmentTractionLeverJointAttendant) {
		this.fitmentTractionLeverJointAttendant = fitmentTractionLeverJointAttendant;
	}
	public String getFitmentLateralDamperBktStatus() {
		return fitmentLateralDamperBktStatus;
	}
	public void setFitmentLateralDamperBktStatus(String fitmentLateralDamperBktStatus) {
		this.fitmentLateralDamperBktStatus = fitmentLateralDamperBktStatus;
	}
	public String getFitmentLateralDamperBktActual() {
		return fitmentLateralDamperBktActual;
	}
	public void setFitmentLateralDamperBktActual(String fitmentLateralDamperBktActual) {
		this.fitmentLateralDamperBktActual = fitmentLateralDamperBktActual;
	}
	public String getFitmentLateralDamperBktAttendant() {
		return fitmentLateralDamperBktAttendant;
	}
	public void setFitmentLateralDamperBktAttendant(String fitmentLateralDamperBktAttendant) {
		this.fitmentLateralDamperBktAttendant = fitmentLateralDamperBktAttendant;
	}
	public String getFitmentCrossSectionStatus() {
		return fitmentCrossSectionStatus;
	}
	public void setFitmentCrossSectionStatus(String fitmentCrossSectionStatus) {
		this.fitmentCrossSectionStatus = fitmentCrossSectionStatus;
	}
	public String getFitmentCrossSectionActual() {
		return fitmentCrossSectionActual;
	}
	public void setFitmentCrossSectionActual(String fitmentCrossSectionActual) {
		this.fitmentCrossSectionActual = fitmentCrossSectionActual;
	}
	public String getFitmentCrossSectionAttendant() {
		return fitmentCrossSectionAttendant;
	}
	public void setFitmentCrossSectionAttendant(String fitmentCrossSectionAttendant) {
		this.fitmentCrossSectionAttendant = fitmentCrossSectionAttendant;
	}
	public String getFitmentLateralBumpStopStatus() {
		return fitmentLateralBumpStopStatus;
	}
	public void setFitmentLateralBumpStopStatus(String fitmentLateralBumpStopStatus) {
		this.fitmentLateralBumpStopStatus = fitmentLateralBumpStopStatus;
	}
	public String getFitmentLateralBumpStopActual() {
		return fitmentLateralBumpStopActual;
	}
	public void setFitmentLateralBumpStopActual(String fitmentLateralBumpStopActual) {
		this.fitmentLateralBumpStopActual = fitmentLateralBumpStopActual;
	}
	public String getFitmentLateralBumpStopAttendant() {
		return fitmentLateralBumpStopAttendant;
	}
	public void setFitmentLateralBumpStopAttendant(String fitmentLateralBumpStopAttendant) {
		this.fitmentLateralBumpStopAttendant = fitmentLateralBumpStopAttendant;
	}
	public String getFitmentBrakeCylinderStatus() {
		return fitmentBrakeCylinderStatus;
	}
	public void setFitmentBrakeCylinderStatus(String fitmentBrakeCylinderStatus) {
		this.fitmentBrakeCylinderStatus = fitmentBrakeCylinderStatus;
	}
	public String getFitmentBrakeCylinderActual() {
		return fitmentBrakeCylinderActual;
	}
	public void setFitmentBrakeCylinderActual(String fitmentBrakeCylinderActual) {
		this.fitmentBrakeCylinderActual = fitmentBrakeCylinderActual;
	}
	public String getFitmentBrakeCylinderAttendant() {
		return fitmentBrakeCylinderAttendant;
	}
	public void setFitmentBrakeCylinderAttendant(String fitmentBrakeCylinderAttendant) {
		this.fitmentBrakeCylinderAttendant = fitmentBrakeCylinderAttendant;
	}
	public String getFitmentLongitudinalStopStatus() {
		return fitmentLongitudinalStopStatus;
	}
	public void setFitmentLongitudinalStopStatus(String fitmentLongitudinalStopStatus) {
		this.fitmentLongitudinalStopStatus = fitmentLongitudinalStopStatus;
	}
	public String getFitmentLongitudinalStopActual() {
		return fitmentLongitudinalStopActual;
	}
	public void setFitmentLongitudinalStopActual(String fitmentLongitudinalStopActual) {
		this.fitmentLongitudinalStopActual = fitmentLongitudinalStopActual;
	}
	public String getFitmentLongitudinalStopAttendant() {
		return fitmentLongitudinalStopAttendant;
	}
	public void setFitmentLongitudinalStopAttendant(String fitmentLongitudinalStopAttendant) {
		this.fitmentLongitudinalStopAttendant = fitmentLongitudinalStopAttendant;
	}
	public String getFitmentRollLinkStatus() {
		return fitmentRollLinkStatus;
	}
	public void setFitmentRollLinkStatus(String fitmentRollLinkStatus) {
		this.fitmentRollLinkStatus = fitmentRollLinkStatus;
	}
	public String getFitmentRollLinkActual() {
		return fitmentRollLinkActual;
	}
	public void setFitmentRollLinkActual(String fitmentRollLinkActual) {
		this.fitmentRollLinkActual = fitmentRollLinkActual;
	}
	public String getFitmentRollLinkAttendant() {
		return fitmentRollLinkAttendant;
	}
	public void setFitmentRollLinkAttendant(String fitmentRollLinkAttendant) {
		this.fitmentRollLinkAttendant = fitmentRollLinkAttendant;
	}
	public String getFitmentControlArmTopBottomStatus() {
		return fitmentControlArmTopBottomStatus;
	}
	public void setFitmentControlArmTopBottomStatus(String fitmentControlArmTopBottomStatus) {
		this.fitmentControlArmTopBottomStatus = fitmentControlArmTopBottomStatus;
	}
	public String getFitmentControlArmTopBottomActual() {
		return fitmentControlArmTopBottomActual;
	}
	public void setFitmentControlArmTopBottomActual(String fitmentControlArmTopBottomActual) {
		this.fitmentControlArmTopBottomActual = fitmentControlArmTopBottomActual;
	}
	public String getFitmentControlArmTopBottomAttendant() {
		return fitmentControlArmTopBottomAttendant;
	}
	public void setFitmentControlArmTopBottomAttendant(String fitmentControlArmTopBottomAttendant) {
		this.fitmentControlArmTopBottomAttendant = fitmentControlArmTopBottomAttendant;
	}
	public String getFitmentAxleEndCoverStatus() {
		return fitmentAxleEndCoverStatus;
	}
	public void setFitmentAxleEndCoverStatus(String fitmentAxleEndCoverStatus) {
		this.fitmentAxleEndCoverStatus = fitmentAxleEndCoverStatus;
	}
	public String getFitmentAxleEndCoverActual() {
		return fitmentAxleEndCoverActual;
	}
	public void setFitmentAxleEndCoverActual(String fitmentAxleEndCoverActual) {
		this.fitmentAxleEndCoverActual = fitmentAxleEndCoverActual;
	}
	public String getFitmentAxleEndCoverAttendant() {
		return fitmentAxleEndCoverAttendant;
	}
	public void setFitmentAxleEndCoverAttendant(String fitmentAxleEndCoverAttendant) {
		this.fitmentAxleEndCoverAttendant = fitmentAxleEndCoverAttendant;
	}
	public String getFitmentPrimaryBumpStatus() {
		return fitmentPrimaryBumpStatus;
	}
	public void setFitmentPrimaryBumpStatus(String fitmentPrimaryBumpStatus) {
		this.fitmentPrimaryBumpStatus = fitmentPrimaryBumpStatus;
	}
	public String getFitmentPrimaryBumpActual() {
		return fitmentPrimaryBumpActual;
	}
	public void setFitmentPrimaryBumpActual(String fitmentPrimaryBumpActual) {
		this.fitmentPrimaryBumpActual = fitmentPrimaryBumpActual;
	}
	public String getFitmentPrimaryBumpAttendant() {
		return fitmentPrimaryBumpAttendant;
	}
	public void setFitmentPrimaryBumpAttendant(String fitmentPrimaryBumpAttendant) {
		this.fitmentPrimaryBumpAttendant = fitmentPrimaryBumpAttendant;
	}
	public String getFitmentControlArmTopArmbktStatus() {
		return fitmentControlArmTopArmbktStatus;
	}
	public void setFitmentControlArmTopArmbktStatus(String fitmentControlArmTopArmbktStatus) {
		this.fitmentControlArmTopArmbktStatus = fitmentControlArmTopArmbktStatus;
	}
	public String getFitmentControlArmTopArmbktActual() {
		return fitmentControlArmTopArmbktActual;
	}
	public void setFitmentControlArmTopArmbktActual(String fitmentControlArmTopArmbktActual) {
		this.fitmentControlArmTopArmbktActual = fitmentControlArmTopArmbktActual;
	}
	public String getFitmentControlArmTopArmbktAttendant() {
		return fitmentControlArmTopArmbktAttendant;
	}
	public void setFitmentControlArmTopArmbktAttendant(String fitmentControlArmTopArmbktAttendant) {
		this.fitmentControlArmTopArmbktAttendant = fitmentControlArmTopArmbktAttendant;
	}
	public String getFitmentPrimaryShockAbsorberStatus() {
		return fitmentPrimaryShockAbsorberStatus;
	}
	public void setFitmentPrimaryShockAbsorberStatus(String fitmentPrimaryShockAbsorberStatus) {
		this.fitmentPrimaryShockAbsorberStatus = fitmentPrimaryShockAbsorberStatus;
	}
	public String getFitmentPrimaryShockAbsorberActual() {
		return fitmentPrimaryShockAbsorberActual;
	}
	public void setFitmentPrimaryShockAbsorberActual(String fitmentPrimaryShockAbsorberActual) {
		this.fitmentPrimaryShockAbsorberActual = fitmentPrimaryShockAbsorberActual;
	}
	public String getFitmentPrimaryShockAbsorberAttendant() {
		return fitmentPrimaryShockAbsorberAttendant;
	}
	public void setFitmentPrimaryShockAbsorberAttendant(String fitmentPrimaryShockAbsorberAttendant) {
		this.fitmentPrimaryShockAbsorberAttendant = fitmentPrimaryShockAbsorberAttendant;
	}
	public String getFitmentTractionCentreStatus() {
		return fitmentTractionCentreStatus;
	}
	public void setFitmentTractionCentreStatus(String fitmentTractionCentreStatus) {
		this.fitmentTractionCentreStatus = fitmentTractionCentreStatus;
	}
	public String getFitmentTractionCentreActual() {
		return fitmentTractionCentreActual;
	}
	public void setFitmentTractionCentreActual(String fitmentTractionCentreActual) {
		this.fitmentTractionCentreActual = fitmentTractionCentreActual;
	}
	public String getFitmentTractionCentreAttendant() {
		return fitmentTractionCentreAttendant;
	}
	public void setFitmentTractionCentreAttendant(String fitmentTractionCentreAttendant) {
		this.fitmentTractionCentreAttendant = fitmentTractionCentreAttendant;
	}
	public String getFitmentLateralDamperDiscStatus() {
		return fitmentLateralDamperDiscStatus;
	}
	public void setFitmentLateralDamperDiscStatus(String fitmentLateralDamperDiscStatus) {
		this.fitmentLateralDamperDiscStatus = fitmentLateralDamperDiscStatus;
	}
	public String getFitmentLateralDamperDiscActual() {
		return fitmentLateralDamperDiscActual;
	}
	public void setFitmentLateralDamperDiscActual(String fitmentLateralDamperDiscActual) {
		this.fitmentLateralDamperDiscActual = fitmentLateralDamperDiscActual;
	}
	public String getFitmentLateralDamperDiscAttendant() {
		return fitmentLateralDamperDiscAttendant;
	}
	public void setFitmentLateralDamperDiscAttendant(String fitmentLateralDamperDiscAttendant) {
		this.fitmentLateralDamperDiscAttendant = fitmentLateralDamperDiscAttendant;
	}
	public String getFitmentSecVerticalDamperStatus() {
		return fitmentSecVerticalDamperStatus;
	}
	public void setFitmentSecVerticalDamperStatus(String fitmentSecVerticalDamperStatus) {
		this.fitmentSecVerticalDamperStatus = fitmentSecVerticalDamperStatus;
	}
	public String getFitmentSecVerticalDamperActual() {
		return fitmentSecVerticalDamperActual;
	}
	public void setFitmentSecVerticalDamperActual(String fitmentSecVerticalDamperActual) {
		this.fitmentSecVerticalDamperActual = fitmentSecVerticalDamperActual;
	}
	public String getFitmentSecVerticalDamperAttendant() {
		return fitmentSecVerticalDamperAttendant;
	}
	public void setFitmentSecVerticalDamperAttendant(String fitmentSecVerticalDamperAttendant) {
		this.fitmentSecVerticalDamperAttendant = fitmentSecVerticalDamperAttendant;
	}
	public String getFitmentLockingPlateActual() {
		return fitmentLockingPlateActual;
	}
	public void setFitmentLockingPlateActual(String fitmentLockingPlateActual) {
		this.fitmentLockingPlateActual = fitmentLockingPlateActual;
	}
	public String getFitmentLockingPlateAttendant() {
		return fitmentLockingPlateAttendant;
	}
	public void setFitmentLockingPlateAttendant(String fitmentLockingPlateAttendant) {
		this.fitmentLockingPlateAttendant = fitmentLockingPlateAttendant;
	}
	public String getNoPlateOfShockAbsorber() {
		return noPlateOfShockAbsorber;
	}
	public void setNoPlateOfShockAbsorber(String noPlateOfShockAbsorber) {
		this.noPlateOfShockAbsorber = noPlateOfShockAbsorber;
	}
	public String getNoPlateOfShockAbsorberAttendant() {
		return noPlateOfShockAbsorberAttendant;
	}
	public void setNoPlateOfShockAbsorberAttendant(String noPlateOfShockAbsorberAttendant) {
		this.noPlateOfShockAbsorberAttendant = noPlateOfShockAbsorberAttendant;
	}
	public String getPipesLeakageActual() {
		return pipesLeakageActual;
	}
	public void setPipesLeakageActual(String pipesLeakageActual) {
		this.pipesLeakageActual = pipesLeakageActual;
	}
	public String getPipesLeakageAttendant() {
		return pipesLeakageAttendant;
	}
	public void setPipesLeakageAttendant(String pipesLeakageAttendant) {
		this.pipesLeakageAttendant = pipesLeakageAttendant;
	}
	public String getCotterSplitActual() {
		return cotterSplitActual;
	}
	public void setCotterSplitActual(String cotterSplitActual) {
		this.cotterSplitActual = cotterSplitActual;
	}
	public String getCotterSplitAttendant() {
		return cotterSplitAttendant;
	}
	public void setCotterSplitAttendant(String cotterSplitAttendant) {
		this.cotterSplitAttendant = cotterSplitAttendant;
	}
	public String getNutBoltTightActual() {
		return nutBoltTightActual;
	}
	public void setNutBoltTightActual(String nutBoltTightActual) {
		this.nutBoltTightActual = nutBoltTightActual;
	}
	public String getNutBoltTightAttendant() {
		return nutBoltTightAttendant;
	}
	public void setNutBoltTightAttendant(String nutBoltTightAttendant) {
		this.nutBoltTightAttendant = nutBoltTightAttendant;
	}
	public String getWeldingOfBogieplateActual() {
		return weldingOfBogieplateActual;
	}
	public void setWeldingOfBogieplateActual(String weldingOfBogieplateActual) {
		this.weldingOfBogieplateActual = weldingOfBogieplateActual;
	}
	public String getWeldingOfBogieplateAttendant() {
		return weldingOfBogieplateAttendant;
	}
	public void setWeldingOfBogieplateAttendant(String weldingOfBogieplateAttendant) {
		this.weldingOfBogieplateAttendant = weldingOfBogieplateAttendant;
	}
	public String getPaintingOfBogieActual() {
		return paintingOfBogieActual;
	}
	public void setPaintingOfBogieActual(String paintingOfBogieActual) {
		this.paintingOfBogieActual = paintingOfBogieActual;
	}
	public String getPaintingOfBogieAttendant() {
		return paintingOfBogieAttendant;
	}
	public void setPaintingOfBogieAttendant(String paintingOfBogieAttendant) {
		this.paintingOfBogieAttendant = paintingOfBogieAttendant;
	}
	public String getFitmentPhonicWheelActual() {
		return fitmentPhonicWheelActual;
	}
	public void setFitmentPhonicWheelActual(String fitmentPhonicWheelActual) {
		this.fitmentPhonicWheelActual = fitmentPhonicWheelActual;
	}
	public String getFitmentPhonicWheelAttendant() {
		return fitmentPhonicWheelAttendant;
	}
	public void setFitmentPhonicWheelAttendant(String fitmentPhonicWheelAttendant) {
		this.fitmentPhonicWheelAttendant = fitmentPhonicWheelAttendant;
	}
	public String getFitmentAirpipeBolsterActual() {
		return fitmentAirpipeBolsterActual;
	}
	public void setFitmentAirpipeBolsterActual(String fitmentAirpipeBolsterActual) {
		this.fitmentAirpipeBolsterActual = fitmentAirpipeBolsterActual;
	}
	public String getFitmentAirpipeBolsterAttendant() {
		return fitmentAirpipeBolsterAttendant;
	}
	public void setFitmentAirpipeBolsterAttendant(String fitmentAirpipeBolsterAttendant) {
		this.fitmentAirpipeBolsterAttendant = fitmentAirpipeBolsterAttendant;
	}
	public String getFitmentAirpipeBrakecylinderActual() {
		return fitmentAirpipeBrakecylinderActual;
	}
	public void setFitmentAirpipeBrakecylinderActual(String fitmentAirpipeBrakecylinderActual) {
		this.fitmentAirpipeBrakecylinderActual = fitmentAirpipeBrakecylinderActual;
	}
	public String getFitmentAirpipeBrakecylinderAttendant() {
		return fitmentAirpipeBrakecylinderAttendant;
	}
	public void setFitmentAirpipeBrakecylinderAttendant(String fitmentAirpipeBrakecylinderAttendant) {
		this.fitmentAirpipeBrakecylinderAttendant = fitmentAirpipeBrakecylinderAttendant;
	}
	public String getMovementBrakeRiggingActual() {
		return movementBrakeRiggingActual;
	}
	public void setMovementBrakeRiggingActual(String movementBrakeRiggingActual) {
		this.movementBrakeRiggingActual = movementBrakeRiggingActual;
	}
	public String getMovementBrakeRiggingAttendant() {
		return movementBrakeRiggingAttendant;
	}
	public void setMovementBrakeRiggingAttendant(String movementBrakeRiggingAttendant) {
		this.movementBrakeRiggingAttendant = movementBrakeRiggingAttendant;
	}
	public String getItemFittedAsDrawingFlag() {
		return itemFittedAsDrawingFlag;
	}
	public void setItemFittedAsDrawingFlag(String itemFittedAsDrawingFlag) {
		this.itemFittedAsDrawingFlag = itemFittedAsDrawingFlag;
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
	public String getWheelBase() {
		return wheelBase;
	}
	public void setWheelBase(String wheelBase) {
		this.wheelBase = wheelBase;
	}
	public String getDetailsModification() {
		return detailsModification;
	}
	public void setDetailsModification(String detailsModification) {
		this.detailsModification = detailsModification;
	}
	public String getDetailsTrialItems() {
		return detailsTrialItems;
	}
	public void setDetailsTrialItems(String detailsTrialItems) {
		this.detailsTrialItems = detailsTrialItems;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getTestingStatus() {
		return testingStatus;
	}
	public void setTestingStatus(String testingStatus) {
		this.testingStatus = testingStatus;
	}
	public String getDrawingNoFinalSip() {
		return drawingNoFinalSip;
	}
	public void setDrawingNoFinalSip(String drawingNoFinalSip) {
		this.drawingNoFinalSip = drawingNoFinalSip;
	}
	public String getFormNoFinalSip() {
		return formNoFinalSip;
	}
	public void setFormNoFinalSip(String formNoFinalSip) {
		this.formNoFinalSip = formNoFinalSip;
	}
	public String getBogieNumber() {
		return bogieNumber;
	}
	public void setBogieNumber(String bogieNumber) {
		this.bogieNumber = bogieNumber;
	}
	public String getBogieType() {
		return bogieType;
	}
	public void setBogieType(String bogieType) {
		this.bogieType = bogieType;
	}
	public String getFrameNo() {
		return frameNo;
	}
	public void setFrameNo(String frameNo) {
		this.frameNo = frameNo;
	}
	public String getBolsNo() {
		return bolsNo;
	}
	public void setBolsNo(String bolsNo) {
		this.bolsNo = bolsNo;
	}
	public String getBrakeCylinderNo1() {
		return brakeCylinderNo1;
	}
	public void setBrakeCylinderNo1(String brakeCylinderNo1) {
		this.brakeCylinderNo1 = brakeCylinderNo1;
	}
	public String getBrakeCylinderNo2() {
		return brakeCylinderNo2;
	}
	public void setBrakeCylinderNo2(String brakeCylinderNo2) {
		this.brakeCylinderNo2 = brakeCylinderNo2;
	}
	public String getBrakeCylinderNo3() {
		return brakeCylinderNo3;
	}
	public void setBrakeCylinderNo3(String brakeCylinderNo3) {
		this.brakeCylinderNo3 = brakeCylinderNo3;
	}
	public String getBrakeCylinderNo4() {
		return brakeCylinderNo4;
	}
	public void setBrakeCylinderNo4(String brakeCylinderNo4) {
		this.brakeCylinderNo4 = brakeCylinderNo4;
	}
	public String getBrakeCaliperNo1() {
		return brakeCaliperNo1;
	}
	public void setBrakeCaliperNo1(String brakeCaliperNo1) {
		this.brakeCaliperNo1 = brakeCaliperNo1;
	}
	public String getBrakeCaliperNo2() {
		return brakeCaliperNo2;
	}
	public void setBrakeCaliperNo2(String brakeCaliperNo2) {
		this.brakeCaliperNo2 = brakeCaliperNo2;
	}
	public String getBrakeCaliperNo3() {
		return brakeCaliperNo3;
	}
	public void setBrakeCaliperNo3(String brakeCaliperNo3) {
		this.brakeCaliperNo3 = brakeCaliperNo3;
	}
	public String getBrakeCaliperNo4() {
		return brakeCaliperNo4;
	}
	public void setBrakeCaliperNo4(String brakeCaliperNo4) {
		this.brakeCaliperNo4 = brakeCaliperNo4;
	}

	
	
}	
