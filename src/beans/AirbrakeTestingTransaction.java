package beans;

import java.util.Date;

public class AirbrakeTestingTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer furnishingAssetId;
	private String docNoAirbrake;
	private Date dateOfAirbrake;
	private String shiftAirbrake;
	
	private String preTextLockCoach;
	private String preTextConformityBrakeMount;
	private String preTextVerifyAllBrake;
	private String preTextVerifyPositionCockes;
	private String preTextOpenedCockes103;
	private String preTextOpenedCockes104_1;
	private String preTextOpenedCockes104_2;
	private String preTextEmergencyCock;
	private String preTextDistributorValve;
	private String preTextBrakeCylinder;
	private String preTextFitmentAuxiliaryReservoir;
	
	private String reservoirChargingGeneratorCoaches;
	private String reservoirChargingBrakePipePressure;
	private String reservoirChargingChargingTime;
	private String reservoirChargingControlPressure;
	
    private String sealingTestInterruptCharging;
    private String sealingTestOpenCocks;
    private String fullBrakeApplicationReducePressure;
    private String fullBrakeApplicationEmergencyApplication;
    private String fullBrakeApplicationMaxPressure;
    private String fullBrakeApplicationAllBrake;
    
    private String releaseFullBrakeFillBP;
    private String releaseFullBrakeAllBrake;
    private String emergencyApplicationReduceBrakePressure;
    private String emergencyApplicationAcceleratorRespond;
    private String emergencyApplicationChargingTime;
    private String emergencyApplicationMaxBCPressure;
    private String emergencyApplicationAllBrake;
    
    private String releaseEmergencyBrakeFillBP;
    private String releaseEmergencyBrakePressureDropTime;
    private String releaseEmergencyBrakeBrakeCylinderRelease;
    private String graduatedBrakeApplication;
    private String pressureGovernorChargeFeedingPipe;
    private String pressureGovernorExhaustFeedingPipe;
    private String sealingTestFeed;
    private String normalServiceFeedMaxPressure;
    
    private String controlIndicatingDeviceActualFullBrake;
    private String controlIndicatingDeviceCockPosition4_1;
    private String controlIndicatingDeviceCockPosition4_2;
    private String controlIndicatingDeviceCockPosition41_42;
    private String controlInsensitivityExhaustBrakePipe;
    
    private String controlSensitivityBrakePipe;
    private String firstBrakeStep;
    private String reactivityQuickServiceFailure;
    private String parkingBrakeHandbrakeReleased;
    private String parkingBrakeHandbrakeApplied;
    
    private String emergencyBrakePassengerExhaustBrake;
    private String emergencyBrakePassengerCloseHandle;
    private String emergencyBrakePassengerPassengerAlarm;
    private String emergencyBrakeGuard;
    private String cbcFitment;
    private String remarks;
    private String airbrakeTestingStatus;
    private String entryBy;
    private Date entryTime;
    
    public AirbrakeTestingTransaction()
    {
    	
    }

	public AirbrakeTestingTransaction(Integer furnishingAssetId, String docNoAirbrake, Date dateOfAirbrake,
			String shiftAirbrake, String preTextLockCoach, String preTextConformityBrakeMount,
			String preTextVerifyAllBrake, String preTextVerifyPositionCockes, String preTextOpenedCockes103,
			String preTextOpenedCockes104_1, String preTextOpenedCockes104_2, String preTextEmergencyCock,
			String preTextDistributorValve, String preTextBrakeCylinder, String preTextFitmentAuxiliaryReservoir,
			String reservoirChargingGeneratorCoaches, String reservoirChargingBrakePipePressure,
			String reservoirChargingChargingTime, String reservoirChargingControlPressure,
			String sealingTestInterruptCharging, String sealingTestOpenCocks, String fullBrakeApplicationReducePressure,
			String fullBrakeApplicationEmergencyApplication, String fullBrakeApplicationMaxPressure,
			String fullBrakeApplicationAllBrake, String releaseFullBrakeFillBP, String releaseFullBrakeAllBrake,
			String emergencyApplicationReduceBrakePressure, String emergencyApplicationAcceleratorRespond,
			String emergencyApplicationChargingTime, String emergencyApplicationMaxBCPressure,
			String emergencyApplicationAllBrake, String releaseEmergencyBrakeFillBP,
			String releaseEmergencyBrakePressureDropTime, String releaseEmergencyBrakeBrakeCylinderRelease,
			String graduatedBrakeApplication, String pressureGovernorChargeFeedingPipe,
			String pressureGovernorExhaustFeedingPipe, String sealingTestFeed, String normalServiceFeedMaxPressure,
			String controlIndicatingDeviceActualFullBrake, String controlIndicatingDeviceCockPosition4_1,
			String controlIndicatingDeviceCockPosition4_2, String controlIndicatingDeviceCockPosition41_42,
			String controlInsensitivityExhaustBrakePipe, String controlSensitivityBrakePipe, String firstBrakeStep,
			String reactivityQuickServiceFailure, String parkingBrakeHandbrakeReleased,
			String parkingBrakeHandbrakeApplied, String emergencyBrakePassengerExhaustBrake,
			String emergencyBrakePassengerCloseHandle, String emergencyBrakePassengerPassengerAlarm,
			String emergencyBrakeGuard, String cbcFitment, String remarks,String airbrakeTestingStatus, String entryBy, Date entryTime) {
		super();
		this.furnishingAssetId = furnishingAssetId;
		this.docNoAirbrake = docNoAirbrake;
		this.dateOfAirbrake = dateOfAirbrake;
		this.shiftAirbrake = shiftAirbrake;
		this.preTextLockCoach = preTextLockCoach;
		this.preTextConformityBrakeMount = preTextConformityBrakeMount;
		this.preTextVerifyAllBrake = preTextVerifyAllBrake;
		this.preTextVerifyPositionCockes = preTextVerifyPositionCockes;
		this.preTextOpenedCockes103 = preTextOpenedCockes103;
		this.preTextOpenedCockes104_1 = preTextOpenedCockes104_1;
		this.preTextOpenedCockes104_2 = preTextOpenedCockes104_2;
		this.preTextEmergencyCock = preTextEmergencyCock;
		this.preTextDistributorValve = preTextDistributorValve;
		this.preTextBrakeCylinder = preTextBrakeCylinder;
		this.preTextFitmentAuxiliaryReservoir = preTextFitmentAuxiliaryReservoir;
		this.reservoirChargingGeneratorCoaches = reservoirChargingGeneratorCoaches;
		this.reservoirChargingBrakePipePressure = reservoirChargingBrakePipePressure;
		this.reservoirChargingChargingTime = reservoirChargingChargingTime;
		this.reservoirChargingControlPressure = reservoirChargingControlPressure;
		this.sealingTestInterruptCharging = sealingTestInterruptCharging;
		this.sealingTestOpenCocks = sealingTestOpenCocks;
		this.fullBrakeApplicationReducePressure = fullBrakeApplicationReducePressure;
		this.fullBrakeApplicationEmergencyApplication = fullBrakeApplicationEmergencyApplication;
		this.fullBrakeApplicationMaxPressure = fullBrakeApplicationMaxPressure;
		this.fullBrakeApplicationAllBrake = fullBrakeApplicationAllBrake;
		this.releaseFullBrakeFillBP = releaseFullBrakeFillBP;
		this.releaseFullBrakeAllBrake = releaseFullBrakeAllBrake;
		this.emergencyApplicationReduceBrakePressure = emergencyApplicationReduceBrakePressure;
		this.emergencyApplicationAcceleratorRespond = emergencyApplicationAcceleratorRespond;
		this.emergencyApplicationChargingTime = emergencyApplicationChargingTime;
		this.emergencyApplicationMaxBCPressure = emergencyApplicationMaxBCPressure;
		this.emergencyApplicationAllBrake = emergencyApplicationAllBrake;
		this.releaseEmergencyBrakeFillBP = releaseEmergencyBrakeFillBP;
		this.releaseEmergencyBrakePressureDropTime = releaseEmergencyBrakePressureDropTime;
		this.releaseEmergencyBrakeBrakeCylinderRelease = releaseEmergencyBrakeBrakeCylinderRelease;
		this.graduatedBrakeApplication = graduatedBrakeApplication;
		this.pressureGovernorChargeFeedingPipe = pressureGovernorChargeFeedingPipe;
		this.pressureGovernorExhaustFeedingPipe = pressureGovernorExhaustFeedingPipe;
		this.sealingTestFeed = sealingTestFeed;
		this.normalServiceFeedMaxPressure = normalServiceFeedMaxPressure;
		this.controlIndicatingDeviceActualFullBrake = controlIndicatingDeviceActualFullBrake;
		this.controlIndicatingDeviceCockPosition4_1 = controlIndicatingDeviceCockPosition4_1;
		this.controlIndicatingDeviceCockPosition4_2 = controlIndicatingDeviceCockPosition4_2;
		this.controlIndicatingDeviceCockPosition41_42 = controlIndicatingDeviceCockPosition41_42;
		this.controlInsensitivityExhaustBrakePipe = controlInsensitivityExhaustBrakePipe;
		this.controlSensitivityBrakePipe = controlSensitivityBrakePipe;
		this.firstBrakeStep = firstBrakeStep;
		this.reactivityQuickServiceFailure = reactivityQuickServiceFailure;
		this.parkingBrakeHandbrakeReleased = parkingBrakeHandbrakeReleased;
		this.parkingBrakeHandbrakeApplied = parkingBrakeHandbrakeApplied;
		this.emergencyBrakePassengerExhaustBrake = emergencyBrakePassengerExhaustBrake;
		this.emergencyBrakePassengerCloseHandle = emergencyBrakePassengerCloseHandle;
		this.emergencyBrakePassengerPassengerAlarm = emergencyBrakePassengerPassengerAlarm;
		this.emergencyBrakeGuard = emergencyBrakeGuard;
		this.cbcFitment = cbcFitment;
		this.remarks = remarks;
		this.airbrakeTestingStatus=airbrakeTestingStatus;
		this.entryBy = entryBy;
		this.entryTime = entryTime;
	}

	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getDocNoAirbrake() {
		return docNoAirbrake;
	}

	public void setDocNoAirbrake(String docNoAirbrake) {
		this.docNoAirbrake = docNoAirbrake;
	}

	public Date getDateOfAirbrake() {
		return dateOfAirbrake;
	}

	public void setDateOfAirbrake(Date dateOfAirbrake) {
		this.dateOfAirbrake = dateOfAirbrake;
	}

	public String getShiftAirbrake() {
		return shiftAirbrake;
	}

	public void setShiftAirbrake(String shiftAirbrake) {
		this.shiftAirbrake = shiftAirbrake;
	}

	public String getPreTextLockCoach() {
		return preTextLockCoach;
	}

	public void setPreTextLockCoach(String preTextLockCoach) {
		this.preTextLockCoach = preTextLockCoach;
	}

	public String getPreTextConformityBrakeMount() {
		return preTextConformityBrakeMount;
	}

	public void setPreTextConformityBrakeMount(String preTextConformityBrakeMount) {
		this.preTextConformityBrakeMount = preTextConformityBrakeMount;
	}

	public String getPreTextVerifyAllBrake() {
		return preTextVerifyAllBrake;
	}

	public void setPreTextVerifyAllBrake(String preTextVerifyAllBrake) {
		this.preTextVerifyAllBrake = preTextVerifyAllBrake;
	}

	public String getPreTextVerifyPositionCockes() {
		return preTextVerifyPositionCockes;
	}

	public void setPreTextVerifyPositionCockes(String preTextVerifyPositionCockes) {
		this.preTextVerifyPositionCockes = preTextVerifyPositionCockes;
	}

	public String getPreTextOpenedCockes103() {
		return preTextOpenedCockes103;
	}

	public void setPreTextOpenedCockes103(String preTextOpenedCockes103) {
		this.preTextOpenedCockes103 = preTextOpenedCockes103;
	}

	public String getPreTextOpenedCockes104_1() {
		return preTextOpenedCockes104_1;
	}

	public void setPreTextOpenedCockes104_1(String preTextOpenedCockes104_1) {
		this.preTextOpenedCockes104_1 = preTextOpenedCockes104_1;
	}

	public String getPreTextOpenedCockes104_2() {
		return preTextOpenedCockes104_2;
	}

	public void setPreTextOpenedCockes104_2(String preTextOpenedCockes104_2) {
		this.preTextOpenedCockes104_2 = preTextOpenedCockes104_2;
	}

	public String getPreTextEmergencyCock() {
		return preTextEmergencyCock;
	}

	public void setPreTextEmergencyCock(String preTextEmergencyCock) {
		this.preTextEmergencyCock = preTextEmergencyCock;
	}

	public String getPreTextDistributorValve() {
		return preTextDistributorValve;
	}

	public void setPreTextDistributorValve(String preTextDistributorValve) {
		this.preTextDistributorValve = preTextDistributorValve;
	}

	public String getAirbrakeTestingStatus() {
		return airbrakeTestingStatus;
	}

	public void setAirbrakeTestingStatus(String airbrakeTestingStatus) {
		this.airbrakeTestingStatus = airbrakeTestingStatus;
	}

	public String getPreTextBrakeCylinder() {
		return preTextBrakeCylinder;
	}

	public void setPreTextBrakeCylinder(String preTextBrakeCylinder) {
		this.preTextBrakeCylinder = preTextBrakeCylinder;
	}

	public String getPreTextFitmentAuxiliaryReservoir() {
		return preTextFitmentAuxiliaryReservoir;
	}

	public void setPreTextFitmentAuxiliaryReservoir(String preTextFitmentAuxiliaryReservoir) {
		this.preTextFitmentAuxiliaryReservoir = preTextFitmentAuxiliaryReservoir;
	}

	public String getReservoirChargingGeneratorCoaches() {
		return reservoirChargingGeneratorCoaches;
	}

	public void setReservoirChargingGeneratorCoaches(String reservoirChargingGeneratorCoaches) {
		this.reservoirChargingGeneratorCoaches = reservoirChargingGeneratorCoaches;
	}

	public String getReservoirChargingBrakePipePressure() {
		return reservoirChargingBrakePipePressure;
	}

	public void setReservoirChargingBrakePipePressure(String reservoirChargingBrakePipePressure) {
		this.reservoirChargingBrakePipePressure = reservoirChargingBrakePipePressure;
	}

	public String getReservoirChargingChargingTime() {
		return reservoirChargingChargingTime;
	}

	public void setReservoirChargingChargingTime(String reservoirChargingChargingTime) {
		this.reservoirChargingChargingTime = reservoirChargingChargingTime;
	}

	public String getReservoirChargingControlPressure() {
		return reservoirChargingControlPressure;
	}

	public void setReservoirChargingControlPressure(String reservoirChargingControlPressure) {
		this.reservoirChargingControlPressure = reservoirChargingControlPressure;
	}

	public String getSealingTestInterruptCharging() {
		return sealingTestInterruptCharging;
	}

	public void setSealingTestInterruptCharging(String sealingTestInterruptCharging) {
		this.sealingTestInterruptCharging = sealingTestInterruptCharging;
	}

	public String getSealingTestOpenCocks() {
		return sealingTestOpenCocks;
	}

	public void setSealingTestOpenCocks(String sealingTestOpenCocks) {
		this.sealingTestOpenCocks = sealingTestOpenCocks;
	}

	public String getFullBrakeApplicationReducePressure() {
		return fullBrakeApplicationReducePressure;
	}

	public void setFullBrakeApplicationReducePressure(String fullBrakeApplicationReducePressure) {
		this.fullBrakeApplicationReducePressure = fullBrakeApplicationReducePressure;
	}

	public String getFullBrakeApplicationEmergencyApplication() {
		return fullBrakeApplicationEmergencyApplication;
	}

	public void setFullBrakeApplicationEmergencyApplication(String fullBrakeApplicationEmergencyApplication) {
		this.fullBrakeApplicationEmergencyApplication = fullBrakeApplicationEmergencyApplication;
	}

	public String getFullBrakeApplicationMaxPressure() {
		return fullBrakeApplicationMaxPressure;
	}

	public void setFullBrakeApplicationMaxPressure(String fullBrakeApplicationMaxPressure) {
		this.fullBrakeApplicationMaxPressure = fullBrakeApplicationMaxPressure;
	}

	public String getFullBrakeApplicationAllBrake() {
		return fullBrakeApplicationAllBrake;
	}

	public void setFullBrakeApplicationAllBrake(String fullBrakeApplicationAllBrake) {
		this.fullBrakeApplicationAllBrake = fullBrakeApplicationAllBrake;
	}

	public String getReleaseFullBrakeFillBP() {
		return releaseFullBrakeFillBP;
	}

	public void setReleaseFullBrakeFillBP(String releaseFullBrakeFillBP) {
		this.releaseFullBrakeFillBP = releaseFullBrakeFillBP;
	}

	public String getReleaseFullBrakeAllBrake() {
		return releaseFullBrakeAllBrake;
	}

	public void setReleaseFullBrakeAllBrake(String releaseFullBrakeAllBrake) {
		this.releaseFullBrakeAllBrake = releaseFullBrakeAllBrake;
	}

	public String getEmergencyApplicationReduceBrakePressure() {
		return emergencyApplicationReduceBrakePressure;
	}

	public void setEmergencyApplicationReduceBrakePressure(String emergencyApplicationReduceBrakePressure) {
		this.emergencyApplicationReduceBrakePressure = emergencyApplicationReduceBrakePressure;
	}

	public String getEmergencyApplicationAcceleratorRespond() {
		return emergencyApplicationAcceleratorRespond;
	}

	public void setEmergencyApplicationAcceleratorRespond(String emergencyApplicationAcceleratorRespond) {
		this.emergencyApplicationAcceleratorRespond = emergencyApplicationAcceleratorRespond;
	}

	public String getEmergencyApplicationChargingTime() {
		return emergencyApplicationChargingTime;
	}

	public void setEmergencyApplicationChargingTime(String emergencyApplicationChargingTime) {
		this.emergencyApplicationChargingTime = emergencyApplicationChargingTime;
	}

	public String getEmergencyApplicationMaxBCPressure() {
		return emergencyApplicationMaxBCPressure;
	}

	public void setEmergencyApplicationMaxBCPressure(String emergencyApplicationMaxBCPressure) {
		this.emergencyApplicationMaxBCPressure = emergencyApplicationMaxBCPressure;
	}

	public String getEmergencyApplicationAllBrake() {
		return emergencyApplicationAllBrake;
	}

	public void setEmergencyApplicationAllBrake(String emergencyApplicationAllBrake) {
		this.emergencyApplicationAllBrake = emergencyApplicationAllBrake;
	}

	public String getReleaseEmergencyBrakeFillBP() {
		return releaseEmergencyBrakeFillBP;
	}

	public void setReleaseEmergencyBrakeFillBP(String releaseEmergencyBrakeFillBP) {
		this.releaseEmergencyBrakeFillBP = releaseEmergencyBrakeFillBP;
	}

	public String getReleaseEmergencyBrakePressureDropTime() {
		return releaseEmergencyBrakePressureDropTime;
	}

	public void setReleaseEmergencyBrakePressureDropTime(String releaseEmergencyBrakePressureDropTime) {
		this.releaseEmergencyBrakePressureDropTime = releaseEmergencyBrakePressureDropTime;
	}

	public String getReleaseEmergencyBrakeBrakeCylinderRelease() {
		return releaseEmergencyBrakeBrakeCylinderRelease;
	}

	public void setReleaseEmergencyBrakeBrakeCylinderRelease(String releaseEmergencyBrakeBrakeCylinderRelease) {
		this.releaseEmergencyBrakeBrakeCylinderRelease = releaseEmergencyBrakeBrakeCylinderRelease;
	}

	public String getGraduatedBrakeApplication() {
		return graduatedBrakeApplication;
	}

	public void setGraduatedBrakeApplication(String graduatedBrakeApplication) {
		this.graduatedBrakeApplication = graduatedBrakeApplication;
	}

	public String getPressureGovernorChargeFeedingPipe() {
		return pressureGovernorChargeFeedingPipe;
	}

	public void setPressureGovernorChargeFeedingPipe(String pressureGovernorChargeFeedingPipe) {
		this.pressureGovernorChargeFeedingPipe = pressureGovernorChargeFeedingPipe;
	}

	public String getPressureGovernorExhaustFeedingPipe() {
		return pressureGovernorExhaustFeedingPipe;
	}

	public void setPressureGovernorExhaustFeedingPipe(String pressureGovernorExhaustFeedingPipe) {
		this.pressureGovernorExhaustFeedingPipe = pressureGovernorExhaustFeedingPipe;
	}

	public String getSealingTestFeed() {
		return sealingTestFeed;
	}

	public void setSealingTestFeed(String sealingTestFeed) {
		this.sealingTestFeed = sealingTestFeed;
	}

	public String getNormalServiceFeedMaxPressure() {
		return normalServiceFeedMaxPressure;
	}

	public void setNormalServiceFeedMaxPressure(String normalServiceFeedMaxPressure) {
		this.normalServiceFeedMaxPressure = normalServiceFeedMaxPressure;
	}

	public String getControlIndicatingDeviceActualFullBrake() {
		return controlIndicatingDeviceActualFullBrake;
	}

	public void setControlIndicatingDeviceActualFullBrake(String controlIndicatingDeviceActualFullBrake) {
		this.controlIndicatingDeviceActualFullBrake = controlIndicatingDeviceActualFullBrake;
	}

	public String getControlIndicatingDeviceCockPosition4_1() {
		return controlIndicatingDeviceCockPosition4_1;
	}

	public void setControlIndicatingDeviceCockPosition4_1(String controlIndicatingDeviceCockPosition4_1) {
		this.controlIndicatingDeviceCockPosition4_1 = controlIndicatingDeviceCockPosition4_1;
	}

	public String getControlIndicatingDeviceCockPosition4_2() {
		return controlIndicatingDeviceCockPosition4_2;
	}

	public void setControlIndicatingDeviceCockPosition4_2(String controlIndicatingDeviceCockPosition4_2) {
		this.controlIndicatingDeviceCockPosition4_2 = controlIndicatingDeviceCockPosition4_2;
	}

	public String getControlIndicatingDeviceCockPosition41_42() {
		return controlIndicatingDeviceCockPosition41_42;
	}

	public void setControlIndicatingDeviceCockPosition41_42(String controlIndicatingDeviceCockPosition41_42) {
		this.controlIndicatingDeviceCockPosition41_42 = controlIndicatingDeviceCockPosition41_42;
	}

	public String getControlInsensitivityExhaustBrakePipe() {
		return controlInsensitivityExhaustBrakePipe;
	}

	public void setControlInsensitivityExhaustBrakePipe(String controlInsensitivityExhaustBrakePipe) {
		this.controlInsensitivityExhaustBrakePipe = controlInsensitivityExhaustBrakePipe;
	}

	public String getControlSensitivityBrakePipe() {
		return controlSensitivityBrakePipe;
	}

	public void setControlSensitivityBrakePipe(String controlSensitivityBrakePipe) {
		this.controlSensitivityBrakePipe = controlSensitivityBrakePipe;
	}

	public String getFirstBrakeStep() {
		return firstBrakeStep;
	}

	public void setFirstBrakeStep(String firstBrakeStep) {
		this.firstBrakeStep = firstBrakeStep;
	}

	public String getReactivityQuickServiceFailure() {
		return reactivityQuickServiceFailure;
	}

	public void setReactivityQuickServiceFailure(String reactivityQuickServiceFailure) {
		this.reactivityQuickServiceFailure = reactivityQuickServiceFailure;
	}

	public String getParkingBrakeHandbrakeReleased() {
		return parkingBrakeHandbrakeReleased;
	}

	public void setParkingBrakeHandbrakeReleased(String parkingBrakeHandbrakeReleased) {
		this.parkingBrakeHandbrakeReleased = parkingBrakeHandbrakeReleased;
	}

	public String getParkingBrakeHandbrakeApplied() {
		return parkingBrakeHandbrakeApplied;
	}

	public void setParkingBrakeHandbrakeApplied(String parkingBrakeHandbrakeApplied) {
		this.parkingBrakeHandbrakeApplied = parkingBrakeHandbrakeApplied;
	}

	public String getEmergencyBrakePassengerExhaustBrake() {
		return emergencyBrakePassengerExhaustBrake;
	}

	public void setEmergencyBrakePassengerExhaustBrake(String emergencyBrakePassengerExhaustBrake) {
		this.emergencyBrakePassengerExhaustBrake = emergencyBrakePassengerExhaustBrake;
	}

	public String getEmergencyBrakePassengerCloseHandle() {
		return emergencyBrakePassengerCloseHandle;
	}

	public void setEmergencyBrakePassengerCloseHandle(String emergencyBrakePassengerCloseHandle) {
		this.emergencyBrakePassengerCloseHandle = emergencyBrakePassengerCloseHandle;
	}

	public String getEmergencyBrakePassengerPassengerAlarm() {
		return emergencyBrakePassengerPassengerAlarm;
	}

	public void setEmergencyBrakePassengerPassengerAlarm(String emergencyBrakePassengerPassengerAlarm) {
		this.emergencyBrakePassengerPassengerAlarm = emergencyBrakePassengerPassengerAlarm;
	}

	public String getEmergencyBrakeGuard() {
		return emergencyBrakeGuard;
	}

	public void setEmergencyBrakeGuard(String emergencyBrakeGuard) {
		this.emergencyBrakeGuard = emergencyBrakeGuard;
	}

	public String getCbcFitment() {
		return cbcFitment;
	}

	public void setCbcFitment(String cbcFitment) {
		this.cbcFitment = cbcFitment;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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