package struts.action.master;

import java.sql.Timestamp;



import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import beans.FibaTestingTransaction;
import beans.FurnishingTransaction;
import common.DateUtil;
import dao.DaoFIBATest;

import hibernateConnect.HibernateConfig;

public class SaveFIBATest {
	private String furnishingAssetId;
	private String docNoFiba;
	private String dateOfFibaTesting;
	private String shiftFiba;
	private String generalInstallationNo;
	private String wiNo;
	private String pslNo;



	private String initialChargingPPAirSpring1;
	private String initialChargingPPAirSpring2;
	private String initialChargingNPPAirSpring1;
	private String initialChargingNPPAirSpring2;

	private String leakageDetectionPPAirSpring1;
	private String leakageDetectionPPAirSpring2;
	private String leakageDetectionNPPAirSpring1;
	private String leakageDetectionNPPAirSpring2;

	private String functionTestFIBAPPAirSpring1;
	private String functionTestFIBAPPAirSpring2;
	private String functionTestFIBANPPAirSpring1;
	private String functionTestFIBANPPAirSpring2;

	private String functionTestBrakePPAirSpring1;
	private String functionTestBrakePPAirSpring2;
	private String functionTestBrakeNPPAirSpring1;
	private String functionTestBrakeNPPAirSpring2;

	private String functionTestIndicatorPPAirSpring1;
	private String functionTestIndicatorPPAirSpring2;
	private String functionTestIndicatorNPPAirSpring1;
	private String functionTestIndicatorNPPAirSpring2;

	private String functionTestWrestingBlowPPAirSpring1;
	private String functionTestWrestingBlowPPAirSpring2;
	private String functionTestWrestingBlowNPPAirSpring1;
	private String functionTestWrestingBlowNPPAirSpring2;

	private String brakePipeIsolationHissingSoundPPAirSpring1;
	private String brakePipeIsolationHissingSoundPPAirSpring2;
	private String brakePipeIsolationHissingSoundNPPAirSpring1;
	private String brakePipeIsolationHissingSoundNPPAirSpring2;

	private String brakePipeIsolationBrakeReleasePPAirSpring1;
	private String brakePipeIsolationBrakeReleasePPAirSpring2;
	private String brakePipeIsolationBrakeReleaseNPPAirSpring1;
	private String brakePipeIsolationBrakeReleaseNPPAirSpring2;
	 
	private String brakePipeVariationPPAirSpring1;
	private String brakePipeVariationPPAirSpring2;
	private String brakePipeVariationNPPAirSpring1;
	private String brakePipeVariationNPPAirSpring2;
	
	private String suppressPipeVariationPPTest1;
	private String suppressPipeVariationPPTest2;
	private String suppressPipeVariationNPPTest1;
	private String suppressPipeVariationNPPTest2;

	public String getSuppressPipeVariationPPTest1() {
		return suppressPipeVariationPPTest1;
	}
	public void setSuppressPipeVariationPPTest1(String suppressPipeVariationPPTest1) {
		this.suppressPipeVariationPPTest1 = suppressPipeVariationPPTest1;
	}
	public String getSuppressPipeVariationPPTest2() {
		return suppressPipeVariationPPTest2;
	}
	public void setSuppressPipeVariationPPTest2(String suppressPipeVariationPPTest2) {
		this.suppressPipeVariationPPTest2 = suppressPipeVariationPPTest2;
	}
	public String getSuppressPipeVariationNPPTest1() {
		return suppressPipeVariationNPPTest1;
	}
	public void setSuppressPipeVariationNPPTest1(String suppressPipeVariationNPPTest1) {
		this.suppressPipeVariationNPPTest1 = suppressPipeVariationNPPTest1;
	}
	public String getSuppressPipeVariationNPPTest2() {
		return suppressPipeVariationNPPTest2;
	}
	public void setSuppressPipeVariationNPPTest2(String suppressPipeVariationNPPTest2) {
		this.suppressPipeVariationNPPTest2 = suppressPipeVariationNPPTest2;
	}

	private String repetitionTestPPAirSpring1;
	private String repetitionTestPPAirSpring2;
	private String repetitionTestNPPAirSpring1;
	private String repetitionTestNPPAirSpring2;
	
	
	
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}
	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}
	public String getDocNoFiba() {
		return docNoFiba;
	}
	public void setDocNoFiba(String docNoFiba) {
		this.docNoFiba = docNoFiba;
	}
	public String getDateOfFibaTesting() {
		return dateOfFibaTesting;
	}
	public void setDateOfFibaTesting(String dateOfFibaTesting) {
		this.dateOfFibaTesting = dateOfFibaTesting;
	}
	public String getShiftFiba() {
		return shiftFiba;
	}
	public void setShiftFiba(String shiftFiba) {
		this.shiftFiba = shiftFiba;
	}
	public String getGeneralInstallationNo() {
		return generalInstallationNo;
	}
	public void setGeneralInstallationNo(String generalInstallationNo) {
		this.generalInstallationNo = generalInstallationNo;
	}
	public String getWiNo() {
		return wiNo;
	}
	public void setWiNo(String wiNo) {
		this.wiNo = wiNo;
	}
	public String getPslNo() {
		return pslNo;
	}
	public void setPslNo(String pslNo) {
		this.pslNo = pslNo;
	}
	public String getInitialChargingPPAirSpring1() {
		return initialChargingPPAirSpring1;
	}
	public void setInitialChargingPPAirSpring1(String initialChargingPPAirSpring1) {
		this.initialChargingPPAirSpring1 = initialChargingPPAirSpring1;
	}
	public String getInitialChargingPPAirSpring2() {
		return initialChargingPPAirSpring2;
	}
	public void setInitialChargingPPAirSpring2(String initialChargingPPAirSpring2) {
		this.initialChargingPPAirSpring2 = initialChargingPPAirSpring2;
	}
	public String getInitialChargingNPPAirSpring1() {
		return initialChargingNPPAirSpring1;
	}
	public void setInitialChargingNPPAirSpring1(String initialChargingNPPAirSpring1) {
		this.initialChargingNPPAirSpring1 = initialChargingNPPAirSpring1;
	}
	public String getInitialChargingNPPAirSpring2() {
		return initialChargingNPPAirSpring2;
	}
	public void setInitialChargingNPPAirSpring2(String initialChargingNPPAirSpring2) {
		this.initialChargingNPPAirSpring2 = initialChargingNPPAirSpring2;
	}
	public String getLeakageDetectionPPAirSpring1() {
		return leakageDetectionPPAirSpring1;
	}
	public void setLeakageDetectionPPAirSpring1(String leakageDetectionPPAirSpring1) {
		this.leakageDetectionPPAirSpring1 = leakageDetectionPPAirSpring1;
	}
	public String getLeakageDetectionPPAirSpring2() {
		return leakageDetectionPPAirSpring2;
	}
	public void setLeakageDetectionPPAirSpring2(String leakageDetectionPPAirSpring2) {
		this.leakageDetectionPPAirSpring2 = leakageDetectionPPAirSpring2;
	}
	public String getLeakageDetectionNPPAirSpring1() {
		return leakageDetectionNPPAirSpring1;
	}
	public void setLeakageDetectionNPPAirSpring1(String leakageDetectionNPPAirSpring1) {
		this.leakageDetectionNPPAirSpring1 = leakageDetectionNPPAirSpring1;
	}
	public String getLeakageDetectionNPPAirSpring2() {
		return leakageDetectionNPPAirSpring2;
	}
	public void setLeakageDetectionNPPAirSpring2(String leakageDetectionNPPAirSpring2) {
		this.leakageDetectionNPPAirSpring2 = leakageDetectionNPPAirSpring2;
	}
	public String getFunctionTestFIBAPPAirSpring1() {
		return functionTestFIBAPPAirSpring1;
	}
	public void setFunctionTestFIBAPPAirSpring1(String functionTestFIBAPPAirSpring1) {
		this.functionTestFIBAPPAirSpring1 = functionTestFIBAPPAirSpring1;
	}
	public String getFunctionTestFIBAPPAirSpring2() {
		return functionTestFIBAPPAirSpring2;
	}
	public void setFunctionTestFIBAPPAirSpring2(String functionTestFIBAPPAirSpring2) {
		this.functionTestFIBAPPAirSpring2 = functionTestFIBAPPAirSpring2;
	}
	public String getFunctionTestFIBANPPAirSpring1() {
		return functionTestFIBANPPAirSpring1;
	}
	public void setFunctionTestFIBANPPAirSpring1(String functionTestFIBANPPAirSpring1) {
		this.functionTestFIBANPPAirSpring1 = functionTestFIBANPPAirSpring1;
	}
	public String getFunctionTestFIBANPPAirSpring2() {
		return functionTestFIBANPPAirSpring2;
	}
	public void setFunctionTestFIBANPPAirSpring2(String functionTestFIBANPPAirSpring2) {
		this.functionTestFIBANPPAirSpring2 = functionTestFIBANPPAirSpring2;
	}
	public String getFunctionTestBrakePPAirSpring1() {
		return functionTestBrakePPAirSpring1;
	}
	public void setFunctionTestBrakePPAirSpring1(String functionTestBrakePPAirSpring1) {
		this.functionTestBrakePPAirSpring1 = functionTestBrakePPAirSpring1;
	}
	public String getFunctionTestBrakePPAirSpring2() {
		return functionTestBrakePPAirSpring2;
	}
	public void setFunctionTestBrakePPAirSpring2(String functionTestBrakePPAirSpring2) {
		this.functionTestBrakePPAirSpring2 = functionTestBrakePPAirSpring2;
	}
	public String getFunctionTestBrakeNPPAirSpring1() {
		return functionTestBrakeNPPAirSpring1;
	}
	public void setFunctionTestBrakeNPPAirSpring1(String functionTestBrakeNPPAirSpring1) {
		this.functionTestBrakeNPPAirSpring1 = functionTestBrakeNPPAirSpring1;
	}
	public String getFunctionTestBrakeNPPAirSpring2() {
		return functionTestBrakeNPPAirSpring2;
	}
	public void setFunctionTestBrakeNPPAirSpring2(String functionTestBrakeNPPAirSpring2) {
		this.functionTestBrakeNPPAirSpring2 = functionTestBrakeNPPAirSpring2;
	}
	public String getFunctionTestIndicatorPPAirSpring1() {
		return functionTestIndicatorPPAirSpring1;
	}
	public void setFunctionTestIndicatorPPAirSpring1(String functionTestIndicatorPPAirSpring1) {
		this.functionTestIndicatorPPAirSpring1 = functionTestIndicatorPPAirSpring1;
	}
	public String getFunctionTestIndicatorPPAirSpring2() {
		return functionTestIndicatorPPAirSpring2;
	}
	public void setFunctionTestIndicatorPPAirSpring2(String functionTestIndicatorPPAirSpring2) {
		this.functionTestIndicatorPPAirSpring2 = functionTestIndicatorPPAirSpring2;
	}
	public String getFunctionTestIndicatorNPPAirSpring1() {
		return functionTestIndicatorNPPAirSpring1;
	}
	public void setFunctionTestIndicatorNPPAirSpring1(String functionTestIndicatorNPPAirSpring1) {
		this.functionTestIndicatorNPPAirSpring1 = functionTestIndicatorNPPAirSpring1;
	}
	public String getFunctionTestIndicatorNPPAirSpring2() {
		return functionTestIndicatorNPPAirSpring2;
	}
	public void setFunctionTestIndicatorNPPAirSpring2(String functionTestIndicatorNPPAirSpring2) {
		this.functionTestIndicatorNPPAirSpring2 = functionTestIndicatorNPPAirSpring2;
	}
	public String getFunctionTestWrestingBlowPPAirSpring1() {
		return functionTestWrestingBlowPPAirSpring1;
	}
	public void setFunctionTestWrestingBlowPPAirSpring1(String functionTestWrestingBlowPPAirSpring1) {
		this.functionTestWrestingBlowPPAirSpring1 = functionTestWrestingBlowPPAirSpring1;
	}
	public String getFunctionTestWrestingBlowPPAirSpring2() {
		return functionTestWrestingBlowPPAirSpring2;
	}
	public void setFunctionTestWrestingBlowPPAirSpring2(String functionTestWrestingBlowPPAirSpring2) {
		this.functionTestWrestingBlowPPAirSpring2 = functionTestWrestingBlowPPAirSpring2;
	}
	public String getFunctionTestWrestingBlowNPPAirSpring1() {
		return functionTestWrestingBlowNPPAirSpring1;
	}
	public void setFunctionTestWrestingBlowNPPAirSpring1(String functionTestWrestingBlowNPPAirSpring1) {
		this.functionTestWrestingBlowNPPAirSpring1 = functionTestWrestingBlowNPPAirSpring1;
	}
	public String getFunctionTestWrestingBlowNPPAirSpring2() {
		return functionTestWrestingBlowNPPAirSpring2;
	}
	public void setFunctionTestWrestingBlowNPPAirSpring2(String functionTestWrestingBlowNPPAirSpring2) {
		this.functionTestWrestingBlowNPPAirSpring2 = functionTestWrestingBlowNPPAirSpring2;
	}
	public String getBrakePipeIsolationHissingSoundPPAirSpring1() {
		return brakePipeIsolationHissingSoundPPAirSpring1;
	}
	public void setBrakePipeIsolationHissingSoundPPAirSpring1(String brakePipeIsolationHissingSoundPPAirSpring1) {
		this.brakePipeIsolationHissingSoundPPAirSpring1 = brakePipeIsolationHissingSoundPPAirSpring1;
	}
	public String getBrakePipeIsolationHissingSoundPPAirSpring2() {
		return brakePipeIsolationHissingSoundPPAirSpring2;
	}
	public void setBrakePipeIsolationHissingSoundPPAirSpring2(String brakePipeIsolationHissingSoundPPAirSpring2) {
		this.brakePipeIsolationHissingSoundPPAirSpring2 = brakePipeIsolationHissingSoundPPAirSpring2;
	}
	public String getBrakePipeIsolationHissingSoundNPPAirSpring1() {
		return brakePipeIsolationHissingSoundNPPAirSpring1;
	}
	public void setBrakePipeIsolationHissingSoundNPPAirSpring1(String brakePipeIsolationHissingSoundNPPAirSpring1) {
		this.brakePipeIsolationHissingSoundNPPAirSpring1 = brakePipeIsolationHissingSoundNPPAirSpring1;
	}
	public String getBrakePipeIsolationHissingSoundNPPAirSpring2() {
		return brakePipeIsolationHissingSoundNPPAirSpring2;
	}
	public void setBrakePipeIsolationHissingSoundNPPAirSpring2(String brakePipeIsolationHissingSoundNPPAirSpring2) {
		this.brakePipeIsolationHissingSoundNPPAirSpring2 = brakePipeIsolationHissingSoundNPPAirSpring2;
	}
	public String getBrakePipeIsolationBrakeReleasePPAirSpring1() {
		return brakePipeIsolationBrakeReleasePPAirSpring1;
	}
	public void setBrakePipeIsolationBrakeReleasePPAirSpring1(String brakePipeIsolationBrakeReleasePPAirSpring1) {
		this.brakePipeIsolationBrakeReleasePPAirSpring1 = brakePipeIsolationBrakeReleasePPAirSpring1;
	}
	public String getBrakePipeIsolationBrakeReleasePPAirSpring2() {
		return brakePipeIsolationBrakeReleasePPAirSpring2;
	}
	public void setBrakePipeIsolationBrakeReleasePPAirSpring2(String brakePipeIsolationBrakeReleasePPAirSpring2) {
		this.brakePipeIsolationBrakeReleasePPAirSpring2 = brakePipeIsolationBrakeReleasePPAirSpring2;
	}
	public String getBrakePipeIsolationBrakeReleaseNPPAirSpring1() {
		return brakePipeIsolationBrakeReleaseNPPAirSpring1;
	}
	public void setBrakePipeIsolationBrakeReleaseNPPAirSpring1(String brakePipeIsolationBrakeReleaseNPPAirSpring1) {
		this.brakePipeIsolationBrakeReleaseNPPAirSpring1 = brakePipeIsolationBrakeReleaseNPPAirSpring1;
	}
	public String getBrakePipeIsolationBrakeReleaseNPPAirSpring2() {
		return brakePipeIsolationBrakeReleaseNPPAirSpring2;
	}
	public void setBrakePipeIsolationBrakeReleaseNPPAirSpring2(String brakePipeIsolationBrakeReleaseNPPAirSpring2) {
		this.brakePipeIsolationBrakeReleaseNPPAirSpring2 = brakePipeIsolationBrakeReleaseNPPAirSpring2;
	}
	public String getBrakePipeVariationPPAirSpring1() {
		return brakePipeVariationPPAirSpring1;
	}
	public void setBrakePipeVariationPPAirSpring1(String brakePipeVariationPPAirSpring1) {
		this.brakePipeVariationPPAirSpring1 = brakePipeVariationPPAirSpring1;
	}
	public String getBrakePipeVariationPPAirSpring2() {
		return brakePipeVariationPPAirSpring2;
	}
	public void setBrakePipeVariationPPAirSpring2(String brakePipeVariationPPAirSpring2) {
		this.brakePipeVariationPPAirSpring2 = brakePipeVariationPPAirSpring2;
	}
	public String getBrakePipeVariationNPPAirSpring1() {
		return brakePipeVariationNPPAirSpring1;
	}
	public void setBrakePipeVariationNPPAirSpring1(String brakePipeVariationNPPAirSpring1) {
		this.brakePipeVariationNPPAirSpring1 = brakePipeVariationNPPAirSpring1;
	}
	public String getBrakePipeVariationNPPAirSpring2() {
		return brakePipeVariationNPPAirSpring2;
	}
	public void setBrakePipeVariationNPPAirSpring2(String brakePipeVariationNPPAirSpring2) {
		this.brakePipeVariationNPPAirSpring2 = brakePipeVariationNPPAirSpring2;
	}
	public String getRepetitionTestPPAirSpring1() {
		return repetitionTestPPAirSpring1;
	}
	public void setRepetitionTestPPAirSpring1(String repetitionTestPPAirSpring1) {
		this.repetitionTestPPAirSpring1 = repetitionTestPPAirSpring1;
	}
	public String getRepetitionTestPPAirSpring2() {
		return repetitionTestPPAirSpring2;
	}
	public void setRepetitionTestPPAirSpring2(String repetitionTestPPAirSpring2) {
		this.repetitionTestPPAirSpring2 = repetitionTestPPAirSpring2;
	}
	public String getRepetitionTestNPPAirSpring1() {
		return repetitionTestNPPAirSpring1;
	}
	public void setRepetitionTestNPPAirSpring1(String repetitionTestNPPAirSpring1) {
		this.repetitionTestNPPAirSpring1 = repetitionTestNPPAirSpring1;
	}
	public String getRepetitionTestNPPAirSpring2() {
		return repetitionTestNPPAirSpring2;
	}
	public void setRepetitionTestNPPAirSpring2(String repetitionTestNPPAirSpring2) {
		this.repetitionTestNPPAirSpring2 = repetitionTestNPPAirSpring2;
	}
	 
		public String fibaTest()
	    {
	    	Session session=null;
	    	session=HibernateConfig.getSession();
	    	HttpSession httpSession=ServletActionContext.getRequest().getSession();
	    	String userID=(String)httpSession.getAttribute("userid");
	    	Timestamp entryTime=new Timestamp(System.currentTimeMillis());
	    	FibaTestingTransaction fibaTestingTran=new FibaTestingTransaction();
	    	Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
	    	fibaTestingTran.setFurnishingAssetId(furnishingAssetIdAsInt);
	    	fibaTestingTran.setDocNoFiba(docNoFiba);
	    	fibaTestingTran.setShiftFiba(shiftFiba);
	    	fibaTestingTran.setGeneralInstallationNo(generalInstallationNo);
	    	fibaTestingTran.setWiNo(wiNo);
	    	fibaTestingTran.setPslNo(pslNo);
	    	if(!"".equals(dateOfFibaTesting))
	    	{
	    		fibaTestingTran.setDateOfFibaTesting(DateUtil.convertToDate(dateOfFibaTesting));
	    	}
	    	fibaTestingTran.setInitialChargingPPAirSpring1(initialChargingPPAirSpring1);
	    	fibaTestingTran.setInitialChargingPPAirSpring2(initialChargingPPAirSpring2);
	    	fibaTestingTran.setInitialChargingNPPAirSpring1(initialChargingNPPAirSpring1);
	    	fibaTestingTran.setInitialChargingNPPAirSpring2(initialChargingPPAirSpring2);
	    	fibaTestingTran.setLeakageDetectionPPAirSpring1(leakageDetectionPPAirSpring1);
	    	fibaTestingTran.setLeakageDetectionPPAirSpring2(leakageDetectionPPAirSpring2);
	    	fibaTestingTran.setLeakageDetectionNPPAirSpring1(leakageDetectionNPPAirSpring1);
	    	fibaTestingTran.setLeakageDetectionNPPAirSpring2(leakageDetectionNPPAirSpring2);
	    	fibaTestingTran.setFunctionTestFIBAPPAirSpring1(functionTestFIBAPPAirSpring1);
	    	fibaTestingTran.setFunctionTestFIBAPPAirSpring2(functionTestFIBAPPAirSpring2);
	    	fibaTestingTran.setFunctionTestFIBANPPAirSpring1(functionTestFIBAPPAirSpring1);
	    	fibaTestingTran.setFunctionTestFIBANPPAirSpring2(functionTestFIBAPPAirSpring2);
	    	fibaTestingTran.setFunctionTestBrakePPAirSpring1(functionTestBrakePPAirSpring1);
	    	fibaTestingTran.setFunctionTestBrakePPAirSpring2(functionTestBrakePPAirSpring2);
	    	fibaTestingTran.setFunctionTestBrakeNPPAirSpring1(functionTestBrakeNPPAirSpring1);
	    	fibaTestingTran.setFunctionTestBrakeNPPAirSpring2(functionTestBrakeNPPAirSpring2);
	    	fibaTestingTran.setFunctionTestIndicatorPPAirSpring1(functionTestIndicatorPPAirSpring1);
	    	fibaTestingTran.setFunctionTestIndicatorPPAirSpring2(functionTestIndicatorPPAirSpring2);
	    	fibaTestingTran.setFunctionTestIndicatorNPPAirSpring1(functionTestIndicatorNPPAirSpring1);
	    	fibaTestingTran.setFunctionTestIndicatorNPPAirSpring2(functionTestIndicatorNPPAirSpring2);
	    	fibaTestingTran.setFunctionTestWrestingBlowPPAirSpring1(functionTestWrestingBlowPPAirSpring1);
	    	fibaTestingTran.setFunctionTestWrestingBlowPPAirSpring2(functionTestWrestingBlowPPAirSpring2);
	    	fibaTestingTran.setFunctionTestWrestingBlowNPPAirSpring1(functionTestWrestingBlowNPPAirSpring1);
	    	fibaTestingTran.setFunctionTestWrestingBlowNPPAirSpring2(functionTestWrestingBlowNPPAirSpring2);
	    	fibaTestingTran.setBrakePipeIsolationHissingSoundPPAirSpring1(brakePipeIsolationHissingSoundPPAirSpring1);
	    	fibaTestingTran.setBrakePipeIsolationHissingSoundPPAirSpring2(brakePipeIsolationHissingSoundPPAirSpring2);
	    	fibaTestingTran.setBrakePipeIsolationHissingSoundNPPAirSpring1(brakePipeIsolationHissingSoundNPPAirSpring1);
	    	fibaTestingTran.setBrakePipeIsolationHissingSoundNPPAirSpring2(brakePipeIsolationHissingSoundNPPAirSpring2);
	    	fibaTestingTran.setBrakePipeIsolationBrakeReleasePPAirSpring1(brakePipeIsolationBrakeReleasePPAirSpring1);
	    	fibaTestingTran.setBrakePipeIsolationBrakeReleasePPAirSpring2(brakePipeIsolationBrakeReleasePPAirSpring2);
	    	fibaTestingTran.setBrakePipeIsolationBrakeReleaseNPPAirSpring1(brakePipeIsolationBrakeReleaseNPPAirSpring1);
	    	fibaTestingTran.setBrakePipeIsolationBrakeReleaseNPPAirSpring2(brakePipeIsolationBrakeReleaseNPPAirSpring2);
	    	fibaTestingTran.setSuppressPipeVariationPPTest1(suppressPipeVariationPPTest1);
	    	fibaTestingTran.setSuppressPipeVariationPPTest2(suppressPipeVariationPPTest2);
	    	fibaTestingTran.setSuppressPipeVariationNPPTest1(suppressPipeVariationNPPTest1);
	    	fibaTestingTran.setSuppressPipeVariationNPPTest2(suppressPipeVariationNPPTest2);
	    	fibaTestingTran.setBrakePipeVariationPPAirSpring1(brakePipeVariationPPAirSpring1);
	    	fibaTestingTran.setBrakePipeVariationPPAirSpring2(brakePipeVariationPPAirSpring2);
	    	fibaTestingTran.setBrakePipeVariationNPPAirSpring1(brakePipeVariationNPPAirSpring1);
	    	fibaTestingTran.setBrakePipeVariationNPPAirSpring2(brakePipeVariationNPPAirSpring2);
	    	fibaTestingTran.setRepetitionTestPPAirSpring1(repetitionTestPPAirSpring1);
	    	fibaTestingTran.setRepetitionTestPPAirSpring2(repetitionTestPPAirSpring2);
	    	fibaTestingTran.setRepetitionTestNPPAirSpring1(repetitionTestNPPAirSpring1);
	    	fibaTestingTran.setRepetitionTestNPPAirSpring2(repetitionTestNPPAirSpring2);
	    	fibaTestingTran.setEntryBy(userID);
	    	fibaTestingTran.setEntryTime(entryTime);
	    	
	    	// update furnishing_tran table
	    	
	    	FurnishingTransaction furnishingTran=new FurnishingTransaction();
	    	furnishingTran=(FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdAsInt);
	    	furnishingTran.setAirBrakeTestingFlag(1);
	    	try
	    	{
	    		DaoFIBATest dao=new DaoFIBATest();
	    		dao.saveFIBATestData(fibaTestingTran,furnishingTran);
	    		System.out.println("furnishing"+furnishingAssetIdAsInt);
	    		return "success";
	    	}
	    	catch (Exception e) {
	    		// TODO Auto-generated catch block
	    		e.printStackTrace();
	    		return "failure";
	    	}
	    	finally
	    	{
	    		if(session!=null)
	    		{
	    			session.close();
	    		}
	    	}
	    }
	
	
}
