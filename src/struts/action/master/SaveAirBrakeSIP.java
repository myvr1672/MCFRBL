package struts.action.master;

import java.sql.Timestamp;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.hibernate.Session;

import beans.AirbrakeTestingTransaction;
import beans.FurnishingTransaction;
import beans.ShellTransaction;
import common.DateUtil;
import dao.DaoAirBrakeTest;

import hibernateConnect.HibernateConfig;

public class SaveAirBrakeSIP {
	
	private String furnishingAssetId;
	private String docNoAirbrake;
	private String dateOfAirbrake;
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
    
    private String cbcPpEndMake;
	private String cbcPpEndSrno;
    private String cbcNppEndMake;
	private String cbcNppEndSrno;
	 private String bufferMake;
		private String bufferSrno;
	    private String brakePanelMake;
		private String brakePanelSrno;
	    private String distributorValveMake;
		private String distributorValveSrno;
	    private String pullBoxMake;
	    private String pullBoxNo;
		private String handBrakeMake;
	    private String handBrakeNo;
  
	private String airbrakeTestingStatus;
	private String entryBy;
    private String entryTime;
	public String saveAirBrakeData()
	{
		
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryTime=new Timestamp(System.currentTimeMillis());
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		AirbrakeTestingTransaction airbrakeTestingTransaction=new AirbrakeTestingTransaction();
		airbrakeTestingTransaction.setDocNoAirbrake(docNoAirbrake);
		airbrakeTestingTransaction.setFurnishingAssetId(furnishingAssetIdAsInt);
		airbrakeTestingTransaction.setShiftAirbrake(shiftAirbrake);
		airbrakeTestingTransaction.setPreTextLockCoach(preTextLockCoach);
		airbrakeTestingTransaction.setPreTextConformityBrakeMount(preTextConformityBrakeMount);
		airbrakeTestingTransaction.setPreTextVerifyAllBrake(preTextVerifyAllBrake);
		airbrakeTestingTransaction.setPreTextVerifyPositionCockes(preTextVerifyPositionCockes);
		airbrakeTestingTransaction.setPreTextOpenedCockes103(preTextOpenedCockes103);
		airbrakeTestingTransaction.setPreTextOpenedCockes104_1(preTextOpenedCockes104_1);
		airbrakeTestingTransaction.setPreTextOpenedCockes104_2(preTextOpenedCockes104_2);
		airbrakeTestingTransaction.setPreTextEmergencyCock(preTextEmergencyCock);
		airbrakeTestingTransaction.setPreTextDistributorValve(preTextDistributorValve);
		airbrakeTestingTransaction.setPreTextBrakeCylinder(preTextBrakeCylinder);
		airbrakeTestingTransaction.setPreTextFitmentAuxiliaryReservoir(preTextFitmentAuxiliaryReservoir);
		airbrakeTestingTransaction.setReservoirChargingGeneratorCoaches(reservoirChargingGeneratorCoaches);
		airbrakeTestingTransaction.setReservoirChargingBrakePipePressure(reservoirChargingBrakePipePressure);
		airbrakeTestingTransaction.setReservoirChargingChargingTime(reservoirChargingChargingTime);
		airbrakeTestingTransaction.setReservoirChargingControlPressure(reservoirChargingControlPressure);
		airbrakeTestingTransaction.setSealingTestInterruptCharging(sealingTestInterruptCharging);
		airbrakeTestingTransaction.setSealingTestOpenCocks(sealingTestOpenCocks);
		airbrakeTestingTransaction.setFullBrakeApplicationReducePressure(fullBrakeApplicationReducePressure);
		airbrakeTestingTransaction.setFullBrakeApplicationEmergencyApplication(fullBrakeApplicationEmergencyApplication);
		airbrakeTestingTransaction.setFullBrakeApplicationMaxPressure(fullBrakeApplicationMaxPressure);
		airbrakeTestingTransaction.setFullBrakeApplicationAllBrake(fullBrakeApplicationAllBrake);
		airbrakeTestingTransaction.setReleaseFullBrakeFillBP(releaseFullBrakeFillBP);
		airbrakeTestingTransaction.setReleaseFullBrakeAllBrake(releaseFullBrakeAllBrake);
		airbrakeTestingTransaction.setEmergencyApplicationReduceBrakePressure(emergencyApplicationReduceBrakePressure);
		airbrakeTestingTransaction.setEmergencyApplicationAcceleratorRespond(emergencyApplicationAcceleratorRespond);
		airbrakeTestingTransaction.setEmergencyApplicationChargingTime(emergencyApplicationChargingTime);
		airbrakeTestingTransaction.setEmergencyApplicationMaxBCPressure(emergencyApplicationMaxBCPressure);
		airbrakeTestingTransaction.setEmergencyApplicationAllBrake(emergencyApplicationAllBrake);
		airbrakeTestingTransaction.setReleaseEmergencyBrakeFillBP(releaseEmergencyBrakeFillBP);
		airbrakeTestingTransaction.setReleaseEmergencyBrakePressureDropTime(releaseEmergencyBrakePressureDropTime);
		airbrakeTestingTransaction.setReleaseEmergencyBrakeBrakeCylinderRelease(releaseEmergencyBrakeBrakeCylinderRelease);
		airbrakeTestingTransaction.setGraduatedBrakeApplication(graduatedBrakeApplication);
		airbrakeTestingTransaction.setPressureGovernorChargeFeedingPipe(pressureGovernorChargeFeedingPipe);
		airbrakeTestingTransaction.setPressureGovernorExhaustFeedingPipe(pressureGovernorExhaustFeedingPipe);
		airbrakeTestingTransaction.setSealingTestFeed(sealingTestFeed);
		airbrakeTestingTransaction.setNormalServiceFeedMaxPressure(normalServiceFeedMaxPressure);
		airbrakeTestingTransaction.setControlIndicatingDeviceActualFullBrake(controlIndicatingDeviceActualFullBrake);
		airbrakeTestingTransaction.setControlIndicatingDeviceCockPosition4_1(controlIndicatingDeviceCockPosition4_1);
		airbrakeTestingTransaction.setControlIndicatingDeviceCockPosition4_2(controlIndicatingDeviceCockPosition4_2);
		airbrakeTestingTransaction.setControlIndicatingDeviceCockPosition41_42(controlIndicatingDeviceCockPosition41_42);
		airbrakeTestingTransaction.setControlInsensitivityExhaustBrakePipe(controlInsensitivityExhaustBrakePipe);
		airbrakeTestingTransaction.setControlSensitivityBrakePipe(controlSensitivityBrakePipe);
		airbrakeTestingTransaction.setFirstBrakeStep(firstBrakeStep);
		airbrakeTestingTransaction.setReactivityQuickServiceFailure(reactivityQuickServiceFailure);
		airbrakeTestingTransaction.setParkingBrakeHandbrakeReleased(parkingBrakeHandbrakeReleased);
		airbrakeTestingTransaction.setParkingBrakeHandbrakeApplied(parkingBrakeHandbrakeApplied);
		airbrakeTestingTransaction.setEmergencyBrakePassengerExhaustBrake(emergencyBrakePassengerExhaustBrake);
		airbrakeTestingTransaction.setEmergencyBrakePassengerCloseHandle(emergencyBrakePassengerCloseHandle);
		airbrakeTestingTransaction.setEmergencyBrakePassengerPassengerAlarm(emergencyBrakePassengerPassengerAlarm);
		airbrakeTestingTransaction.setEmergencyBrakeGuard(emergencyBrakeGuard);
		airbrakeTestingTransaction.setCbcFitment(cbcFitment);
		airbrakeTestingTransaction.setAirbrakeTestingStatus(airbrakeTestingStatus);
		airbrakeTestingTransaction.setRemarks(remarks);
		airbrakeTestingTransaction.setDocNoAirbrake(docNoAirbrake);
		airbrakeTestingTransaction.setEntryBy(userID);
		airbrakeTestingTransaction.setEntryTime(entryTime);
		if(!"".equals(dateOfAirbrake))
		{
			
			
			airbrakeTestingTransaction.setDateOfAirbrake(DateUtil.convertToDate(dateOfAirbrake));
		}
		//FurnishingTran
		FurnishingTransaction furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		System.out.println("bufferMake"+bufferMake);
		furnishingTransaction.setBufferMake(bufferMake);
		furnishingTransaction.setBufferSrno(bufferSrno);
		System.out.println("bufferNumber"+bufferSrno);
		furnishingTransaction.setBrakePanelMake(brakePanelMake);
		furnishingTransaction.setBrakePanelSrno(brakePanelSrno);
		furnishingTransaction.setDistributorValveMake(distributorValveMake);
		furnishingTransaction.setDistributorValveSrno(distributorValveSrno);
		furnishingTransaction.setPullBoxMake(pullBoxMake);
		furnishingTransaction.setPullBoxNo(pullBoxNo);
		furnishingTransaction.setHandBrakeMake(handBrakeMake);
		furnishingTransaction.setHandBrakeNo(handBrakeNo);
		furnishingTransaction.setAirBrakeTestingFlag(1);
		Integer shellAssetId=furnishingTransaction.getShellAssetId();
		
		//ShellTran
		ShellTransaction shellTransaction=(ShellTransaction) session.get(ShellTransaction.class, shellAssetId);
		shellTransaction.setCbcNppEndMake(cbcNppEndMake);
		shellTransaction.setCbcNppEndSrno(cbcNppEndSrno);
		shellTransaction.setCbcPpEndMake(cbcPpEndMake);
		shellTransaction.setCbcPpEndSrno(cbcPpEndSrno);
		try
		{	
			System.out.println("Furnishing Asset Id:"+furnishingAssetIdAsInt);
			DaoAirBrakeTest dao= new DaoAirBrakeTest();
			dao.saveAirBrakeTest(airbrakeTestingTransaction, shellTransaction,furnishingTransaction);
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

	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getDocNoAirbrake() {
		return docNoAirbrake;
	}

	public void setDocNoAirbrake(String docNoAirbrake) {
		this.docNoAirbrake = docNoAirbrake;
	}

	public String getDateOfAirbrake() {
		return dateOfAirbrake;
	}

	public void setDateOfAirbrake(String dateOfAirbrake) {
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

	public String getCbcPpEndMake() {
		return cbcPpEndMake;
	}

	public void setCbcPpEndMake(String cbcPpEndMake) {
		this.cbcPpEndMake = cbcPpEndMake;
	}

	public String getCbcPpEndSrno() {
		return cbcPpEndSrno;
	}

	public void setCbcPpEndSrno(String cbcPpEndSrno) {
		this.cbcPpEndSrno = cbcPpEndSrno;
	}

	public String getCbcNppEndMake() {
		return cbcNppEndMake;
	}

	public void setCbcNppEndMake(String cbcNppEndMake) {
		this.cbcNppEndMake = cbcNppEndMake;
	}

	public String getCbcNppEndSrno() {
		return cbcNppEndSrno;
	}

	public void setCbcNppEndSrno(String cbcNppEndSrno) {
		this.cbcNppEndSrno = cbcNppEndSrno;
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
	  public String getBufferMake() {
			return bufferMake;
		}

		public void setBufferMake(String bufferMake) {
			this.bufferMake = bufferMake;
		}

		public String getBufferSrno() {
			return bufferSrno;
		}

		public void setBufferSrno(String bufferSrno) {
			this.bufferSrno = bufferSrno;
		}

		public String getBrakePanelMake() {
			return brakePanelMake;
		}

		public void setBrakePanelMake(String brakePanelMake) {
			this.brakePanelMake = brakePanelMake;
		}

		public String getBrakePanelSrno() {
			return brakePanelSrno;
		}

		public void setBrakePanelSrno(String brakePanelSrno) {
			this.brakePanelSrno = brakePanelSrno;
		}

		public String getDistributorValveMake() {
			return distributorValveMake;
		}

		public void setDistributorValveMake(String distributorValveMake) {
			this.distributorValveMake = distributorValveMake;
		}

		public String getDistributorValveSrno() {
			return distributorValveSrno;
		}

		public void setDistributorValveSrno(String distributorValveSrno) {
			this.distributorValveSrno = distributorValveSrno;
		}

		public String getPullBoxMake() {
			return pullBoxMake;
		}

		public void setPullBoxMake(String pullBoxMake) {
			this.pullBoxMake = pullBoxMake;
		}

		public String getPullBoxNo() {
			return pullBoxNo;
		}

		public void setPullBoxNo(String pullBoxNo) {
			this.pullBoxNo = pullBoxNo;
		}

		public String getHandBrakeMake() {
			return handBrakeMake;
		}

		public void setHandBrakeMake(String handBrakeMake) {
			this.handBrakeMake = handBrakeMake;
		}

		public String getHandBrakeNo() {
			return handBrakeNo;
		}

		public void setHandBrakeNo(String handBrakeNo) {
			this.handBrakeNo = handBrakeNo;
		}

		public String getAirbrakeTestingStatus() {
			return airbrakeTestingStatus;
		}

		public void setAirbrakeTestingStatus(String airbrakeTestingStatus) {
			this.airbrakeTestingStatus = airbrakeTestingStatus;
		}


}
