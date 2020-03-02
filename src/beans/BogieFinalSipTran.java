package beans;

import java.util.Date;

public class BogieFinalSipTran implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer bogieAssetId;
    private String docNo;
    private String shiftOfTesting;
    private String drawingNo;
    private Date dateOfTesting;
    private String primarySpringColorInner;
    private String primarySpringColorOuter;
    private String secondarySpringColorInner;
    private String secondarySpringColorOuter;
    private Integer fitmentAntiRollBarActual;
    private String fitmentAntiRollBarStatus;
    private String fitmentAntiRollBarAttendant;
    private Integer fitmentTractionLeverJointActual;
    private String fitmentTractionLeverJointStatus;
    private String fitmentTractionLeverJointAttendant;
	private Integer fitmentLateralDamperBktActual;
    private String fitmentLateralDamperBktStatus;
    private String fitmentLateralDamperBktAttendant;
    private Integer fitmentCrossSectionActual;
    private String fitmentCrossSectionStatus;
    private String fitmentCrossSectionAttendant;
    private Integer fitmentLateralBumpStopActual;
    private String fitmentLateralBumpStopStatus;
    private String fitmentLateralBumpStopAttendant;
    private Integer fitmentBrakeCylinderActual;
    private String fitmentBrakeCylinderStatus;
    private String fitmentBrakeCylinderAttendant;
    private Integer fitmentLongitudinalStopActual;
    private String fitmentLongitudinalStopStatus;
    private String fitmentLongitudinalStopAttendant;
    private Integer fitmentRollLinkActual;
    private String fitmentRollLinkStatus;
    private String fitmentRollLinkAttendant;
    private Integer fitmentControlArmTopBottomActual;
    private String fitmentControlArmTopBottomStatus;
    private String fitmentControlArmTopBottomAttendant;
    private Integer fitmentAxleEndCoverActual;
    private String fitmentAxleEndCoverStatus;
    private String fitmentAxleEndCoverAttendant;
    private Integer fitmentPrimaryBumpActual;
    private String fitmentPrimaryBumpStatus;
    private String fitmentPrimaryBumpAttendant;
    private Integer fitmentControlArmTopArmbktActual;
    private String fitmentControlArmTopArmbktStatus;
    private String fitmentControlArmTopArmbktAttendant;
    private Integer fitmentPrimaryShockAbsorberActual;
    private String fitmentPrimaryShockAbsorberStatus;
    private String fitmentPrimaryShockAbsorberAttendant;
    private Integer fitmentTractionCentreActual;
    private String fitmentTractionCentreStatus;
    private String fitmentTractionCentreAttendant;
	private Integer fitmentLateralDamperDiscActual;
    private String fitmentLateralDamperDiscStatus;
    private String fitmentLateralDamperDiscAttendant;
	private Integer fitmentSecVerticalDamperActual;
    private String fitmentSecVerticalDamperStatus;
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
	private Integer fitmentPhonicWheelActual;
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
	private Float wheelBase;
	private String detailsModification;
	private String detailsTrialItems;
	private String remarks;
	private String testingStatus;
	private String entryBy;
	private Date entryTime ;
	
	public BogieFinalSipTran()
	{
		
	}
    
	public BogieFinalSipTran(Integer bogieAssetId, String docNo, String shiftOfTesting,String drawingNo, Date dateOfTesting,
			String primarySpringColorInner, String primarySpringColorOuter,String secondarySpringColorInner,
			String secondarySpringColorOuter, Integer fitmentAntiRollBarActual,
			String fitmentAntiRollBarStatus, String fitmentAntiRollBarAttendant,
			Integer fitmentTractionLeverJointActual, String fitmentTractionLeverJointStatus,
			String fitmentTractionLeverJointAttendant, Integer fitmentLateralDamperBktActual,
			String fitmentLateralDamperBktStatus, String fitmentLateralDamperBktAttendant,
			Integer fitmentCrossSectionActual, String fitmentCrossSectionStatus, String fitmentCrossSectionAttendant,
			Integer fitmentLateralBumpStopActual, String fitmentLateralBumpStopStatus,
			String fitmentLateralBumpStopAttendant, Integer fitmentBrakeCylinderActual,
			String fitmentBrakeCylinderStatus, String fitmentBrakeCylinderAttendant,
			Integer fitmentLongitudinalStopActual, String fitmentLongitudinalStopStatus,
			String fitmentLongitudinalStopAttendant, Integer fitmentRollLinkActual, String fitmentRollLinkStatus,
			String fitmentRollLinkAttendant, Integer fitmentControlArmTopBottomActual,
			String fitmentControlArmTopBottomStatus, String fitmentControlArmTopBottomAttendant,
			Integer fitmentAxleEndCoverActual, String fitmentAxleEndCoverStatus, String fitmentAxleEndCoverAttendant,
			Integer fitmentPrimaryBumpActual, String fitmentPrimaryBumpStatus, String fitmentPrimaryBumpAttendant,
			Integer fitmentControlArmTopArmbktActual, String fitmentControlArmTopArmbktStatus,
			String fitmentControlArmTopArmbktAttendant, Integer fitmentPrimaryShockAbsorberActual,
			String fitmentPrimaryShockAbsorberStatus, String fitmentPrimaryShockAbsorberAttendant,
			Integer fitmentTractionCentreActual, String fitmentTractionCentreStatus,
			String fitmentTractionCentreAttendant, Integer fitmentLateralDamperDiscActual,
			String fitmentLateralDamperDiscStatus, String fitmentLateralDamperDiscAttendant,
			Integer fitmentSecVerticalDamperActual, String fitmentSecVerticalDamperStatus,
			String fitmentSecVerticalDamperAttendant, String fitmentLockingPlateActual,
			String fitmentLockingPlateAttendant, String noPlateOfShockAbsorber, String noPlateOfShockAbsorberAttendant,
			String pipesLeakageActual, String pipesLeakageAttendant, String cotterSplitActual,
			String cotterSplitAttendant, String nutBoltTightActual, String nutBoltTightAttendant,
			String weldingOfBogieplateActual, String weldingOfBogieplateAttendant, String paintingOfBogieActual,
			String paintingOfBogieAttendant, Integer fitmentPhonicWheelActual, String fitmentPhonicWheelAttendant,
			String fitmentAirpipeBolsterActual, String fitmentAirpipeBolsterAttendant,
			String fitmentAirpipeBrakecylinderActual, String fitmentAirpipeBrakecylinderAttendant,
			String movementBrakeRiggingActual, String movementBrakeRiggingAttendant, String itemFittedAsDrawingFlag,
			String complianceWiFlag, String weldingThroatLengthFlag, Float wheelBase, String detailsModification,
			String detailsTrialItems, String remarks, String testingStatus, String entryBy, Date entryTime) {
		super();
		this.bogieAssetId = bogieAssetId;
		this.docNo = docNo;
		this.shiftOfTesting = shiftOfTesting;
		this.dateOfTesting = dateOfTesting;
		this.drawingNo=drawingNo;
		this.primarySpringColorInner = primarySpringColorInner;
		this.primarySpringColorOuter = primarySpringColorOuter;
		this.secondarySpringColorInner=secondarySpringColorInner;
		this.secondarySpringColorOuter=secondarySpringColorOuter;
		this.fitmentAntiRollBarActual = fitmentAntiRollBarActual;
		this.fitmentAntiRollBarStatus = fitmentAntiRollBarStatus;
		this.fitmentAntiRollBarAttendant = fitmentAntiRollBarAttendant;
		this.fitmentTractionLeverJointActual = fitmentTractionLeverJointActual;
		this.fitmentTractionLeverJointStatus = fitmentTractionLeverJointStatus;
		this.fitmentTractionLeverJointAttendant = fitmentTractionLeverJointAttendant;
		this.fitmentLateralDamperBktActual = fitmentLateralDamperBktActual;
		this.fitmentLateralDamperBktStatus = fitmentLateralDamperBktStatus;
		this.fitmentLateralDamperBktAttendant = fitmentLateralDamperBktAttendant;
		this.fitmentCrossSectionActual = fitmentCrossSectionActual;
		this.fitmentCrossSectionStatus = fitmentCrossSectionStatus;
		this.fitmentCrossSectionAttendant = fitmentCrossSectionAttendant;
		this.fitmentLateralBumpStopActual = fitmentLateralBumpStopActual;
		this.fitmentLateralBumpStopStatus = fitmentLateralBumpStopStatus;
		this.fitmentLateralBumpStopAttendant = fitmentLateralBumpStopAttendant;
		this.fitmentBrakeCylinderActual = fitmentBrakeCylinderActual;
		this.fitmentBrakeCylinderStatus = fitmentBrakeCylinderStatus;
		this.fitmentBrakeCylinderAttendant = fitmentBrakeCylinderAttendant;
		this.fitmentLongitudinalStopActual = fitmentLongitudinalStopActual;
		this.fitmentLongitudinalStopStatus = fitmentLongitudinalStopStatus;
		this.fitmentLongitudinalStopAttendant = fitmentLongitudinalStopAttendant;
		this.fitmentRollLinkActual = fitmentRollLinkActual;
		this.fitmentRollLinkStatus = fitmentRollLinkStatus;
		this.fitmentRollLinkAttendant = fitmentRollLinkAttendant;
		this.fitmentControlArmTopBottomActual = fitmentControlArmTopBottomActual;
		this.fitmentControlArmTopBottomStatus = fitmentControlArmTopBottomStatus;
		this.fitmentControlArmTopBottomAttendant = fitmentControlArmTopBottomAttendant;
		this.fitmentAxleEndCoverActual = fitmentAxleEndCoverActual;
		this.fitmentAxleEndCoverStatus = fitmentAxleEndCoverStatus;
		this.fitmentAxleEndCoverAttendant = fitmentAxleEndCoverAttendant;
		this.fitmentPrimaryBumpActual = fitmentPrimaryBumpActual;
		this.fitmentPrimaryBumpStatus = fitmentPrimaryBumpStatus;
		this.fitmentPrimaryBumpAttendant = fitmentPrimaryBumpAttendant;
		this.fitmentControlArmTopArmbktActual = fitmentControlArmTopArmbktActual;
		this.fitmentControlArmTopArmbktStatus = fitmentControlArmTopArmbktStatus;
		this.fitmentControlArmTopArmbktAttendant = fitmentControlArmTopArmbktAttendant;
		this.fitmentPrimaryShockAbsorberActual = fitmentPrimaryShockAbsorberActual;
		this.fitmentPrimaryShockAbsorberStatus = fitmentPrimaryShockAbsorberStatus;
		this.fitmentPrimaryShockAbsorberAttendant = fitmentPrimaryShockAbsorberAttendant;
		this.fitmentTractionCentreActual = fitmentTractionCentreActual;
		this.fitmentTractionCentreStatus = fitmentTractionCentreStatus;
		this.fitmentTractionCentreAttendant = fitmentTractionCentreAttendant;
		this.fitmentLateralDamperDiscActual = fitmentLateralDamperDiscActual;
		this.fitmentLateralDamperDiscStatus = fitmentLateralDamperDiscStatus;
		this.fitmentLateralDamperDiscAttendant = fitmentLateralDamperDiscAttendant;
		this.fitmentSecVerticalDamperActual = fitmentSecVerticalDamperActual;
		this.fitmentSecVerticalDamperStatus = fitmentSecVerticalDamperStatus;
		this.fitmentSecVerticalDamperAttendant = fitmentSecVerticalDamperAttendant;
		this.fitmentLockingPlateActual = fitmentLockingPlateActual;
		this.fitmentLockingPlateAttendant = fitmentLockingPlateAttendant;
		this.noPlateOfShockAbsorber = noPlateOfShockAbsorber;
		this.noPlateOfShockAbsorberAttendant = noPlateOfShockAbsorberAttendant;
		this.pipesLeakageActual = pipesLeakageActual;
		this.pipesLeakageAttendant = pipesLeakageAttendant;
		this.cotterSplitActual = cotterSplitActual;
		this.cotterSplitAttendant = cotterSplitAttendant;
		this.nutBoltTightActual = nutBoltTightActual;
		this.nutBoltTightAttendant = nutBoltTightAttendant;
		this.weldingOfBogieplateActual = weldingOfBogieplateActual;
		this.weldingOfBogieplateAttendant = weldingOfBogieplateAttendant;
		this.paintingOfBogieActual = paintingOfBogieActual;
		this.paintingOfBogieAttendant = paintingOfBogieAttendant;
		this.fitmentPhonicWheelActual = fitmentPhonicWheelActual;
		this.fitmentPhonicWheelAttendant = fitmentPhonicWheelAttendant;
		this.fitmentAirpipeBolsterActual = fitmentAirpipeBolsterActual;
		this.fitmentAirpipeBolsterAttendant = fitmentAirpipeBolsterAttendant;
		this.fitmentAirpipeBrakecylinderActual = fitmentAirpipeBrakecylinderActual;
		this.fitmentAirpipeBrakecylinderAttendant = fitmentAirpipeBrakecylinderAttendant;
		this.movementBrakeRiggingActual = movementBrakeRiggingActual;
		this.movementBrakeRiggingAttendant = movementBrakeRiggingAttendant;
		this.itemFittedAsDrawingFlag = itemFittedAsDrawingFlag;
		this.complianceWiFlag = complianceWiFlag;
		this.weldingThroatLengthFlag = weldingThroatLengthFlag;
		this.wheelBase = wheelBase;
		this.detailsModification = detailsModification;
		this.detailsTrialItems = detailsTrialItems;
		this.remarks = remarks;
		this.testingStatus = testingStatus;
		this.entryBy = entryBy;
		this.entryTime = entryTime;
	}




	public Integer getBogieAssetId() {
		return bogieAssetId;
	}

	public void setBogieAssetId(Integer bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getShiftOfTesting() {
		return shiftOfTesting;
	}

	public void setShiftOfTesting(String shiftOfTesting) {
		this.shiftOfTesting = shiftOfTesting;
	}

	public Date getDateOfTesting() {
		return dateOfTesting;
	}

	public void setDateOfTesting(Date dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}
   
	public String getDrawingNo() {
		return drawingNo;
	}




	public void setDrawingNo(String drawingNo) {
		this.drawingNo = drawingNo;
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
    
	public String getSecondarySpringColorInner() {
		return secondarySpringColorInner;
	}

	public void setSecondarySpringColorInner(String secondarySpringColorInner) {
		this.secondarySpringColorInner = secondarySpringColorInner;
	}

	public String getSecondarySpringColorOuter() {
		return secondarySpringColorOuter;
	}

	public void setSecondarySpringColorOuter(String secondarySpringColorOuter) {
		this.secondarySpringColorOuter = secondarySpringColorOuter;
	}

	public Integer getFitmentAntiRollBarActual() {
		return fitmentAntiRollBarActual;
	}

	public void setFitmentAntiRollBarActual(Integer fitmentAntiRollBarActual) {
		this.fitmentAntiRollBarActual = fitmentAntiRollBarActual;
	}

	public String getFitmentAntiRollBarStatus() {
		return fitmentAntiRollBarStatus;
	}

	public void setFitmentAntiRollBarStatus(String fitmentAntiRollBarStatus) {
		this.fitmentAntiRollBarStatus = fitmentAntiRollBarStatus;
	}

	public String getFitmentAntiRollBarAttendant() {
		return fitmentAntiRollBarAttendant;
	}

	public void setFitmentAntiRollBarAttendant(String fitmentAntiRollBarAttendant) {
		this.fitmentAntiRollBarAttendant = fitmentAntiRollBarAttendant;
	}

	public Integer getFitmentTractionLeverJointActual() {
		return fitmentTractionLeverJointActual;
	}

	public void setFitmentTractionLeverJointActual(Integer fitmentTractionLeverJointActual) {
		this.fitmentTractionLeverJointActual = fitmentTractionLeverJointActual;
	}

	public String getFitmentTractionLeverJointStatus() {
		return fitmentTractionLeverJointStatus;
	}

	public void setFitmentTractionLeverJointStatus(String fitmentTractionLeverJointStatus) {
		this.fitmentTractionLeverJointStatus = fitmentTractionLeverJointStatus;
	}

	public String getFitmentTractionLeverJointAttendant() {
		return fitmentTractionLeverJointAttendant;
	}

	public void setFitmentTractionLeverJointAttendant(String fitmentTractionLeverJointAttendant) {
		this.fitmentTractionLeverJointAttendant = fitmentTractionLeverJointAttendant;
	}

	public Integer getFitmentLateralDamperBktActual() {
		return fitmentLateralDamperBktActual;
	}

	public void setFitmentLateralDamperBktActual(Integer fitmentLateralDamperBktActual) {
		this.fitmentLateralDamperBktActual = fitmentLateralDamperBktActual;
	}

	public String getFitmentLateralDamperBktStatus() {
		return fitmentLateralDamperBktStatus;
	}

	public void setFitmentLateralDamperBktStatus(String fitmentLateralDamperBktStatus) {
		this.fitmentLateralDamperBktStatus = fitmentLateralDamperBktStatus;
	}

	public String getFitmentLateralDamperBktAttendant() {
		return fitmentLateralDamperBktAttendant;
	}

	public void setFitmentLateralDamperBktAttendant(String fitmentLateralDamperBktAttendant) {
		this.fitmentLateralDamperBktAttendant = fitmentLateralDamperBktAttendant;
	}

	public Integer getFitmentCrossSectionActual() {
		return fitmentCrossSectionActual;
	}

	public void setFitmentCrossSectionActual(Integer fitmentCrossSectionActual) {
		this.fitmentCrossSectionActual = fitmentCrossSectionActual;
	}

	public String getFitmentCrossSectionStatus() {
		return fitmentCrossSectionStatus;
	}

	public void setFitmentCrossSectionStatus(String fitmentCrossSectionStatus) {
		this.fitmentCrossSectionStatus = fitmentCrossSectionStatus;
	}

	public String getFitmentCrossSectionAttendant() {
		return fitmentCrossSectionAttendant;
	}

	public void setFitmentCrossSectionAttendant(String fitmentCrossSectionAttendant) {
		this.fitmentCrossSectionAttendant = fitmentCrossSectionAttendant;
	}

	public Integer getFitmentLateralBumpStopActual() {
		return fitmentLateralBumpStopActual;
	}

	public void setFitmentLateralBumpStopActual(Integer fitmentLateralBumpStopActual) {
		this.fitmentLateralBumpStopActual = fitmentLateralBumpStopActual;
	}

	public String getFitmentLateralBumpStopStatus() {
		return fitmentLateralBumpStopStatus;
	}

	public void setFitmentLateralBumpStopStatus(String fitmentLateralBumpStopStatus) {
		this.fitmentLateralBumpStopStatus = fitmentLateralBumpStopStatus;
	}

	public String getFitmentLateralBumpStopAttendant() {
		return fitmentLateralBumpStopAttendant;
	}

	public void setFitmentLateralBumpStopAttendant(String fitmentLateralBumpStopAttendant) {
		this.fitmentLateralBumpStopAttendant = fitmentLateralBumpStopAttendant;
	}

	public Integer getFitmentBrakeCylinderActual() {
		return fitmentBrakeCylinderActual;
	}

	public void setFitmentBrakeCylinderActual(Integer fitmentBrakeCylinderActual) {
		this.fitmentBrakeCylinderActual = fitmentBrakeCylinderActual;
	}

	public String getFitmentBrakeCylinderStatus() {
		return fitmentBrakeCylinderStatus;
	}

	public void setFitmentBrakeCylinderStatus(String fitmentBrakeCylinderStatus) {
		this.fitmentBrakeCylinderStatus = fitmentBrakeCylinderStatus;
	}

	public String getFitmentBrakeCylinderAttendant() {
		return fitmentBrakeCylinderAttendant;
	}

	public void setFitmentBrakeCylinderAttendant(String fitmentBrakeCylinderAttendant) {
		this.fitmentBrakeCylinderAttendant = fitmentBrakeCylinderAttendant;
	}

	public Integer getFitmentLongitudinalStopActual() {
		return fitmentLongitudinalStopActual;
	}

	public void setFitmentLongitudinalStopActual(Integer fitmentLongitudinalStopActual) {
		this.fitmentLongitudinalStopActual = fitmentLongitudinalStopActual;
	}

	public String getFitmentLongitudinalStopStatus() {
		return fitmentLongitudinalStopStatus;
	}

	public void setFitmentLongitudinalStopStatus(String fitmentLongitudinalStopStatus) {
		this.fitmentLongitudinalStopStatus = fitmentLongitudinalStopStatus;
	}

	public String getFitmentLongitudinalStopAttendant() {
		return fitmentLongitudinalStopAttendant;
	}

	public void setFitmentLongitudinalStopAttendant(String fitmentLongitudinalStopAttendant) {
		this.fitmentLongitudinalStopAttendant = fitmentLongitudinalStopAttendant;
	}

	public Integer getFitmentRollLinkActual() {
		return fitmentRollLinkActual;
	}

	public void setFitmentRollLinkActual(Integer fitmentRollLinkActual) {
		this.fitmentRollLinkActual = fitmentRollLinkActual;
	}

	public String getFitmentRollLinkStatus() {
		return fitmentRollLinkStatus;
	}

	public void setFitmentRollLinkStatus(String fitmentRollLinkStatus) {
		this.fitmentRollLinkStatus = fitmentRollLinkStatus;
	}

	public String getFitmentRollLinkAttendant() {
		return fitmentRollLinkAttendant;
	}

	public void setFitmentRollLinkAttendant(String fitmentRollLinkAttendant) {
		this.fitmentRollLinkAttendant = fitmentRollLinkAttendant;
	}
    public Integer getFitmentControlArmTopBottomActual() {
		return fitmentControlArmTopBottomActual;
	}



	public void setFitmentControlArmTopBottomActual(Integer fitmentControlArmTopBottomActual) {
		this.fitmentControlArmTopBottomActual = fitmentControlArmTopBottomActual;
	}



	public String getFitmentControlArmTopBottomStatus() {
		return fitmentControlArmTopBottomStatus;
	}



	public void setFitmentControlArmTopBottomStatus(String fitmentControlArmTopBottomStatus) {
		this.fitmentControlArmTopBottomStatus = fitmentControlArmTopBottomStatus;
	}



	public String getFitmentControlArmTopBottomAttendant() {
		return fitmentControlArmTopBottomAttendant;
	}



	public void setFitmentControlArmTopBottomAttendant(String fitmentControlArmTopBottomAttendant) {
		this.fitmentControlArmTopBottomAttendant = fitmentControlArmTopBottomAttendant;
	}



	public Integer getFitmentControlArmTopArmbktActual() {
		return fitmentControlArmTopArmbktActual;
	}



	public void setFitmentControlArmTopArmbktActual(Integer fitmentControlArmTopArmbktActual) {
		this.fitmentControlArmTopArmbktActual = fitmentControlArmTopArmbktActual;
	}



	public String getFitmentControlArmTopArmbktStatus() {
		return fitmentControlArmTopArmbktStatus;
	}



	public void setFitmentControlArmTopArmbktStatus(String fitmentControlArmTopArmbktStatus) {
		this.fitmentControlArmTopArmbktStatus = fitmentControlArmTopArmbktStatus;
	}



	public String getFitmentControlArmTopArmbktAttendant() {
		return fitmentControlArmTopArmbktAttendant;
	}



	public void setFitmentControlArmTopArmbktAttendant(String fitmentControlArmTopArmbktAttendant) {
		this.fitmentControlArmTopArmbktAttendant = fitmentControlArmTopArmbktAttendant;
	}



	public Integer getFitmentAxleEndCoverActual() {
		return fitmentAxleEndCoverActual;
	}

	public void setFitmentAxleEndCoverActual(Integer fitmentAxleEndCoverActual) {
		this.fitmentAxleEndCoverActual = fitmentAxleEndCoverActual;
	}

	public String getFitmentAxleEndCoverStatus() {
		return fitmentAxleEndCoverStatus;
	}

	public void setFitmentAxleEndCoverStatus(String fitmentAxleEndCoverStatus) {
		this.fitmentAxleEndCoverStatus = fitmentAxleEndCoverStatus;
	}

	public String getFitmentAxleEndCoverAttendant() {
		return fitmentAxleEndCoverAttendant;
	}

	public void setFitmentAxleEndCoverAttendant(String fitmentAxleEndCoverAttendant) {
		this.fitmentAxleEndCoverAttendant = fitmentAxleEndCoverAttendant;
	}

	public Integer getFitmentPrimaryBumpActual() {
		return fitmentPrimaryBumpActual;
	}

	public void setFitmentPrimaryBumpActual(Integer fitmentPrimaryBumpActual) {
		this.fitmentPrimaryBumpActual = fitmentPrimaryBumpActual;
	}

	public String getFitmentPrimaryBumpStatus() {
		return fitmentPrimaryBumpStatus;
	}

	public void setFitmentPrimaryBumpStatus(String fitmentPrimaryBumpStatus) {
		this.fitmentPrimaryBumpStatus = fitmentPrimaryBumpStatus;
	}

	public String getFitmentPrimaryBumpAttendant() {
		return fitmentPrimaryBumpAttendant;
	}

	public void setFitmentPrimaryBumpAttendant(String fitmentPrimaryBumpAttendant) {
		this.fitmentPrimaryBumpAttendant = fitmentPrimaryBumpAttendant;
	}

	public Integer getFitmentPrimaryShockAbsorberActual() {
		return fitmentPrimaryShockAbsorberActual;
	}

	public void setFitmentPrimaryShockAbsorberActual(Integer fitmentPrimaryShockAbsorberActual) {
		this.fitmentPrimaryShockAbsorberActual = fitmentPrimaryShockAbsorberActual;
	}

	public String getFitmentPrimaryShockAbsorberStatus() {
		return fitmentPrimaryShockAbsorberStatus;
	}

	public void setFitmentPrimaryShockAbsorberStatus(String fitmentPrimaryShockAbsorberStatus) {
		this.fitmentPrimaryShockAbsorberStatus = fitmentPrimaryShockAbsorberStatus;
	}

	public String getFitmentPrimaryShockAbsorberAttendant() {
		return fitmentPrimaryShockAbsorberAttendant;
	}

	public void setFitmentPrimaryShockAbsorberAttendant(String fitmentPrimaryShockAbsorberAttendant) {
		this.fitmentPrimaryShockAbsorberAttendant = fitmentPrimaryShockAbsorberAttendant;
	}

	public Integer getFitmentTractionCentreActual() {
		return fitmentTractionCentreActual;
	}

	public void setFitmentTractionCentreActual(Integer fitmentTractionCentreActual) {
		this.fitmentTractionCentreActual = fitmentTractionCentreActual;
	}

	public String getFitmentTractionCentreStatus() {
		return fitmentTractionCentreStatus;
	}

	public void setFitmentTractionCentreStatus(String fitmentTractionCentreStatus) {
		this.fitmentTractionCentreStatus = fitmentTractionCentreStatus;
	}

	public String getFitmentTractionCentreAttendant() {
		return fitmentTractionCentreAttendant;
	}

	public void setFitmentTractionCentreAttendant(String fitmentTractionCentreAttendant) {
		this.fitmentTractionCentreAttendant = fitmentTractionCentreAttendant;
	}

	public Integer getFitmentLateralDamperDiscActual() {
		return fitmentLateralDamperDiscActual;
	}

	public void setFitmentLateralDamperDiscActual(Integer fitmentLateralDamperDiscActual) {
		this.fitmentLateralDamperDiscActual = fitmentLateralDamperDiscActual;
	}

	public String getFitmentLateralDamperDiscStatus() {
		return fitmentLateralDamperDiscStatus;
	}

	public void setFitmentLateralDamperDiscStatus(String fitmentLateralDamperDiscStatus) {
		this.fitmentLateralDamperDiscStatus = fitmentLateralDamperDiscStatus;
	}

	public String getFitmentLateralDamperDiscAttendant() {
		return fitmentLateralDamperDiscAttendant;
	}

	public void setFitmentLateralDamperDiscAttendant(String fitmentLateralDamperDiscAttendant) {
		this.fitmentLateralDamperDiscAttendant = fitmentLateralDamperDiscAttendant;
	}

	public Integer getFitmentSecVerticalDamperActual() {
		return fitmentSecVerticalDamperActual;
	}

	public void setFitmentSecVerticalDamperActual(Integer fitmentSecVerticalDamperActual) {
		this.fitmentSecVerticalDamperActual = fitmentSecVerticalDamperActual;
	}

	public String getFitmentSecVerticalDamperStatus() {
		return fitmentSecVerticalDamperStatus;
	}

	public void setFitmentSecVerticalDamperStatus(String fitmentSecVerticalDamperStatus) {
		this.fitmentSecVerticalDamperStatus = fitmentSecVerticalDamperStatus;
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

	public Integer getFitmentPhonicWheelActual() {
		return fitmentPhonicWheelActual;
	}

	public void setFitmentPhonicWheelActual(Integer fitmentPhonicWheelActual) {
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

	public Float getWheelBase() {
		return wheelBase;
	}

	public void setWheelBase(Float wheelBase) {
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
