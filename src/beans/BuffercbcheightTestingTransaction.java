package beans;

import java.util.Date;

public class BuffercbcheightTestingTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer furnishingAssetId;
	private String docNoBuffercbcheight;
	
	private Date dateOfBuffercbcheight;
	private String shiftBuffercbcheight;
	
	private String cbcHeightPP;
	private String cbcHeightNPP;
	private String simHeightPP1;
	private String simHeightPP2;
	private String simHeightPP3;
	private String simHeightPP4;
	private String simHeightNPP1;
	private String simHeightNPP2;
	private String simHeightNPP3;
	private String simHeightNPP4;
	private String bufferHeightPP_A;
	private String bufferHeightPP_B;
	private String bufferHeightNPP_C;
	private String bufferHeightNPP_D;
	private String railLevelPP_Z11;
	private String railLevelPP_Z21;
	private String railLevelPP_Z31;
	private String railLevelPP_Z41;
	private String railLevelNPP_Z11;
	private String railLevelNPP_Z21;
	private String railLevelNPP_Z31;
	private String railLevelNPP_Z41;
	private String verticalStopClearancePP_Z1;
	private String verticalStopClearancePP_Z2;
	private String verticalStopClearanceNPP_Z1;
	private String verticalStopClearanceNPP_Z2;
	private String averageHeightPP_Z13_Z23;
	private String averageHeightPP_Z33_Z43;
	private String averageHeightNPP_Z13_Z23;
	private String averageHeightNPP_Z33_Z43;
	private String logintudinalClearancePP_X15;
	private String logintudinalClearancePP_X25;
	private String logintudinalClearanceNPP_X15;
	private String logintudinalClearanceNPP_X25;
	private String lateralClearancePP_Y14;
	private String lateralClearancePP_Y34;
	private String lateralClearanceNPP_Y14;
	private String lateralClearanceNPP_Y34;
	
	private String torqueForceBogiePP_1;
	private String torqueForceBogiePP_2;
	private String torqueForceBogiePP_3;
	private String torqueForceBogiePP_4;
	private String torqueForceBogieNPP_1;
	private String torqueForceBogieNPP_2;
	private String torqueForceBogieNPP_3;
	private String torqueForceBogieNPP_4;
	private String torqueForceYawDamper170PP_A1;
	private String torqueForceYawDamper170PP_A2;
	private String torqueForceYawDamper170NPP_A1;
	private String torqueForceYawDamper170NPP_A2;
	private String torqueForceYawDamper160PP_A1;
	private String torqueForceYawDamper160PP_A2;
	private String torqueForceYawDamper160NPP_A1;
	private String torqueForceYawDamper160NPP_A2;
	private String secSpringHeightPP_Z1;
	private String secSpringHeightPP_Z2;
	private String secSpringHeightNPP_Z1;
	private String secSpringHeightNPP_Z2;
	private String entryBy;
	private Date entryDate;
	private String testingstatus;
	
	public BuffercbcheightTestingTransaction()
	{
		
	}

	public BuffercbcheightTestingTransaction(Integer furnishingAssetId, String docNoBuffercbcheight,
			Date dateOfBuffercbcheight, String shiftBuffercbcheight, String cbcHeightPP, String cbcHeightNPP,
			String simHeightPP1, String simHeightPP2, String simHeightPP3, String simHeightPP4, String simHeightNPP1,
			String simHeightNPP2, String simHeightNPP3, String simHeightNPP4, String bufferHeightPP_A,
			String bufferHeightPP_B, String bufferHeightNPP_C, String bufferHeightNPP_D, String railLevelPP_Z11,
			String railLevelPP_Z21, String railLevelPP_Z31, String railLevelPP_Z41, String railLevelNPP_Z11,
			String railLevelNPP_Z21, String railLevelNPP_Z31, String railLevelNPP_Z41,
			String verticalStopClearancePP_Z1, String verticalStopClearancePP_Z2, String verticalStopClearanceNPP_Z1,
			String verticalStopClearanceNPP_Z2, String averageHeightPP_Z13_Z23, String averageHeightPP_Z33_Z43,
			String averageHeightNPP_Z13_Z23, String averageHeightNPP_Z33_Z43, String logintudinalClearancePP_X15,
			String logintudinalClearancePP_X25, String logintudinalClearanceNPP_X15,
			String logintudinalClearanceNPP_X25, String lateralClearancePP_Y14, String lateralClearancePP_Y34,
			String lateralClearanceNPP_Y14, String lateralClearanceNPP_Y34, String torqueForceBogiePP_1,
			String torqueForceBogiePP_2, String torqueForceBogiePP_3, String torqueForceBogiePP_4,
			String torqueForceBogieNPP_1, String torqueForceBogieNPP_2, String torqueForceBogieNPP_3,
			String torqueForceBogieNPP_4, String torqueForceYawDamper170PP_A1, String torqueForceYawDamper170PP_A2,
			String torqueForceYawDamper170NPP_A1, String torqueForceYawDamper170NPP_A2,
			String torqueForceYawDamper160PP_A1, String torqueForceYawDamper160PP_A2,
			String torqueForceYawDamper160NPP_A1, String torqueForceYawDamper160NPP_A2, String secSpringHeightPP_Z1,
			String secSpringHeightPP_Z2, String secSpringHeightNPP_Z1, String secSpringHeightNPP_Z2, String entryBy,String testingstatus,
			Date entryDate) {
		super();
		this.furnishingAssetId = furnishingAssetId;
		this.docNoBuffercbcheight = docNoBuffercbcheight;
		this.dateOfBuffercbcheight = dateOfBuffercbcheight;
		this.shiftBuffercbcheight = shiftBuffercbcheight;
		this.cbcHeightPP = cbcHeightPP;
		this.cbcHeightNPP = cbcHeightNPP;
		this.simHeightPP1 = simHeightPP1;
		this.simHeightPP2 = simHeightPP2;
		this.simHeightPP3 = simHeightPP3;
		this.simHeightPP4 = simHeightPP4;
		this.simHeightNPP1 = simHeightNPP1;
		this.simHeightNPP2 = simHeightNPP2;
		this.simHeightNPP3 = simHeightNPP3;
		this.simHeightNPP4 = simHeightNPP4;
		this.bufferHeightPP_A = bufferHeightPP_A;
		this.bufferHeightPP_B = bufferHeightPP_B;
		this.bufferHeightNPP_C = bufferHeightNPP_C;
		this.bufferHeightNPP_D = bufferHeightNPP_D;
		this.railLevelPP_Z11 = railLevelPP_Z11;
		this.railLevelPP_Z21 = railLevelPP_Z21;
		this.railLevelPP_Z31 = railLevelPP_Z31;
		this.railLevelPP_Z41 = railLevelPP_Z41;
		this.railLevelNPP_Z11 = railLevelNPP_Z11;
		this.railLevelNPP_Z21 = railLevelNPP_Z21;
		this.railLevelNPP_Z31 = railLevelNPP_Z31;
		this.railLevelNPP_Z41 = railLevelNPP_Z41;
		this.verticalStopClearancePP_Z1 = verticalStopClearancePP_Z1;
		this.verticalStopClearancePP_Z2 = verticalStopClearancePP_Z2;
		this.verticalStopClearanceNPP_Z1 = verticalStopClearanceNPP_Z1;
		this.verticalStopClearanceNPP_Z2 = verticalStopClearanceNPP_Z2;
		this.averageHeightPP_Z13_Z23 = averageHeightPP_Z13_Z23;
		this.averageHeightPP_Z33_Z43 = averageHeightPP_Z33_Z43;
		this.averageHeightNPP_Z13_Z23 = averageHeightNPP_Z13_Z23;
		this.averageHeightNPP_Z33_Z43 = averageHeightNPP_Z33_Z43;
		this.logintudinalClearancePP_X15 = logintudinalClearancePP_X15;
		this.logintudinalClearancePP_X25 = logintudinalClearancePP_X25;
		this.logintudinalClearanceNPP_X15 = logintudinalClearanceNPP_X15;
		this.logintudinalClearanceNPP_X25 = logintudinalClearanceNPP_X25;
		this.lateralClearancePP_Y14 = lateralClearancePP_Y14;
		this.lateralClearancePP_Y34 = lateralClearancePP_Y34;
		this.lateralClearanceNPP_Y14 = lateralClearanceNPP_Y14;
		this.lateralClearanceNPP_Y34 = lateralClearanceNPP_Y34;
		this.torqueForceBogiePP_1 = torqueForceBogiePP_1;
		this.torqueForceBogiePP_2 = torqueForceBogiePP_2;
		this.torqueForceBogiePP_3 = torqueForceBogiePP_3;
		this.torqueForceBogiePP_4 = torqueForceBogiePP_4;
		this.torqueForceBogieNPP_1 = torqueForceBogieNPP_1;
		this.torqueForceBogieNPP_2 = torqueForceBogieNPP_2;
		this.torqueForceBogieNPP_3 = torqueForceBogieNPP_3;
		this.torqueForceBogieNPP_4 = torqueForceBogieNPP_4;
		this.torqueForceYawDamper170PP_A1 = torqueForceYawDamper170PP_A1;
		this.torqueForceYawDamper170PP_A2 = torqueForceYawDamper170PP_A2;
		this.torqueForceYawDamper170NPP_A1 = torqueForceYawDamper170NPP_A1;
		this.torqueForceYawDamper170NPP_A2 = torqueForceYawDamper170NPP_A2;
		this.torqueForceYawDamper160PP_A1 = torqueForceYawDamper160PP_A1;
		this.torqueForceYawDamper160PP_A2 = torqueForceYawDamper160PP_A2;
		this.torqueForceYawDamper160NPP_A1 = torqueForceYawDamper160NPP_A1;
		this.torqueForceYawDamper160NPP_A2 = torqueForceYawDamper160NPP_A2;
		this.secSpringHeightPP_Z1 = secSpringHeightPP_Z1;
		this.secSpringHeightPP_Z2 = secSpringHeightPP_Z2;
		this.secSpringHeightNPP_Z1 = secSpringHeightNPP_Z1;
		this.secSpringHeightNPP_Z2 = secSpringHeightNPP_Z2;
		this.testingstatus=testingstatus;
		this.entryBy = entryBy;
		this.entryDate = entryDate;
	}



	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getDocNoBuffercbcheight() {
		return docNoBuffercbcheight;
	}

	public void setDocNoBuffercbcheight(String docNoBuffercbcheight) {
		this.docNoBuffercbcheight = docNoBuffercbcheight;
	}

	public Date getDateOfBuffercbcheight() {
		return dateOfBuffercbcheight;
	}

	public void setDateOfBuffercbcheight(Date dateOfBuffercbcheight) {
		this.dateOfBuffercbcheight = dateOfBuffercbcheight;
	}

	

	public String getShiftBuffercbcheight() {
		return shiftBuffercbcheight;
	}

	public void setShiftBuffercbcheight(String shiftBuffercbcheight) {
		this.shiftBuffercbcheight = shiftBuffercbcheight;
	}

	

	public String getCbcHeightPP() {
		return cbcHeightPP;
	}

	public void setCbcHeightPP(String cbcHeightPP) {
		this.cbcHeightPP = cbcHeightPP;
	}

	public String getCbcHeightNPP() {
		return cbcHeightNPP;
	}

	public void setCbcHeightNPP(String cbcHeightNPP) {
		this.cbcHeightNPP = cbcHeightNPP;
	}

	public String getSimHeightPP1() {
		return simHeightPP1;
	}

	public void setSimHeightPP1(String simHeightPP1) {
		this.simHeightPP1 = simHeightPP1;
	}

	public String getSimHeightPP2() {
		return simHeightPP2;
	}

	public void setSimHeightPP2(String simHeightPP2) {
		this.simHeightPP2 = simHeightPP2;
	}

	public String getSimHeightPP3() {
		return simHeightPP3;
	}

	public void setSimHeightPP3(String simHeightPP3) {
		this.simHeightPP3 = simHeightPP3;
	}

	public String getSimHeightPP4() {
		return simHeightPP4;
	}

	public void setSimHeightPP4(String simHeightPP4) {
		this.simHeightPP4 = simHeightPP4;
	}

	public String getSimHeightNPP1() {
		return simHeightNPP1;
	}

	public void setSimHeightNPP1(String simHeightNPP1) {
		this.simHeightNPP1 = simHeightNPP1;
	}

	public String getSimHeightNPP2() {
		return simHeightNPP2;
	}

	public void setSimHeightNPP2(String simHeightNPP2) {
		this.simHeightNPP2 = simHeightNPP2;
	}

	public String getSimHeightNPP3() {
		return simHeightNPP3;
	}

	public void setSimHeightNPP3(String simHeightNPP3) {
		this.simHeightNPP3 = simHeightNPP3;
	}

	public String getSimHeightNPP4() {
		return simHeightNPP4;
	}

	public void setSimHeightNPP4(String simHeightNPP4) {
		this.simHeightNPP4 = simHeightNPP4;
	}

	public String getBufferHeightPP_A() {
		return bufferHeightPP_A;
	}

	public void setBufferHeightPP_A(String bufferHeightPP_A) {
		this.bufferHeightPP_A = bufferHeightPP_A;
	}

	public String getBufferHeightPP_B() {
		return bufferHeightPP_B;
	}

	public void setBufferHeightPP_B(String bufferHeightPP_B) {
		this.bufferHeightPP_B = bufferHeightPP_B;
	}

	public String getBufferHeightNPP_C() {
		return bufferHeightNPP_C;
	}

	public void setBufferHeightNPP_C(String bufferHeightNPP_C) {
		this.bufferHeightNPP_C = bufferHeightNPP_C;
	}

	public String getBufferHeightNPP_D() {
		return bufferHeightNPP_D;
	}

	public void setBufferHeightNPP_D(String bufferHeightNPP_D) {
		this.bufferHeightNPP_D = bufferHeightNPP_D;
	}

	public String getRailLevelPP_Z11() {
		return railLevelPP_Z11;
	}

	public void setRailLevelPP_Z11(String railLevelPP_Z11) {
		this.railLevelPP_Z11 = railLevelPP_Z11;
	}

	public String getRailLevelPP_Z21() {
		return railLevelPP_Z21;
	}

	public void setRailLevelPP_Z21(String railLevelPP_Z21) {
		this.railLevelPP_Z21 = railLevelPP_Z21;
	}

	public String getRailLevelPP_Z31() {
		return railLevelPP_Z31;
	}

	public void setRailLevelPP_Z31(String railLevelPP_Z31) {
		this.railLevelPP_Z31 = railLevelPP_Z31;
	}

	public String getRailLevelPP_Z41() {
		return railLevelPP_Z41;
	}

	public void setRailLevelPP_Z41(String railLevelPP_Z41) {
		this.railLevelPP_Z41 = railLevelPP_Z41;
	}

	public String getRailLevelNPP_Z11() {
		return railLevelNPP_Z11;
	}

	public void setRailLevelNPP_Z11(String railLevelNPP_Z11) {
		this.railLevelNPP_Z11 = railLevelNPP_Z11;
	}

	public String getRailLevelNPP_Z21() {
		return railLevelNPP_Z21;
	}

	public void setRailLevelNPP_Z21(String railLevelNPP_Z21) {
		this.railLevelNPP_Z21 = railLevelNPP_Z21;
	}

	public String getRailLevelNPP_Z31() {
		return railLevelNPP_Z31;
	}

	public void setRailLevelNPP_Z31(String railLevelNPP_Z31) {
		this.railLevelNPP_Z31 = railLevelNPP_Z31;
	}

	public String getRailLevelNPP_Z41() {
		return railLevelNPP_Z41;
	}

	public void setRailLevelNPP_Z41(String railLevelNPP_Z41) {
		this.railLevelNPP_Z41 = railLevelNPP_Z41;
	}

	public String getVerticalStopClearancePP_Z1() {
		return verticalStopClearancePP_Z1;
	}

	public void setVerticalStopClearancePP_Z1(String verticalStopClearancePP_Z1) {
		this.verticalStopClearancePP_Z1 = verticalStopClearancePP_Z1;
	}

	public String getVerticalStopClearancePP_Z2() {
		return verticalStopClearancePP_Z2;
	}

	public void setVerticalStopClearancePP_Z2(String verticalStopClearancePP_Z2) {
		this.verticalStopClearancePP_Z2 = verticalStopClearancePP_Z2;
	}

	public String getVerticalStopClearanceNPP_Z1() {
		return verticalStopClearanceNPP_Z1;
	}

	public void setVerticalStopClearanceNPP_Z1(String verticalStopClearanceNPP_Z1) {
		this.verticalStopClearanceNPP_Z1 = verticalStopClearanceNPP_Z1;
	}

	public String getVerticalStopClearanceNPP_Z2() {
		return verticalStopClearanceNPP_Z2;
	}

	public void setVerticalStopClearanceNPP_Z2(String verticalStopClearanceNPP_Z2) {
		this.verticalStopClearanceNPP_Z2 = verticalStopClearanceNPP_Z2;
	}

	public String getAverageHeightPP_Z13_Z23() {
		return averageHeightPP_Z13_Z23;
	}

	public void setAverageHeightPP_Z13_Z23(String averageHeightPP_Z13_Z23) {
		this.averageHeightPP_Z13_Z23 = averageHeightPP_Z13_Z23;
	}

	public String getAverageHeightPP_Z33_Z43() {
		return averageHeightPP_Z33_Z43;
	}

	public void setAverageHeightPP_Z33_Z43(String averageHeightPP_Z33_Z43) {
		this.averageHeightPP_Z33_Z43 = averageHeightPP_Z33_Z43;
	}

	public String getAverageHeightNPP_Z13_Z23() {
		return averageHeightNPP_Z13_Z23;
	}

	public void setAverageHeightNPP_Z13_Z23(String averageHeightNPP_Z13_Z23) {
		this.averageHeightNPP_Z13_Z23 = averageHeightNPP_Z13_Z23;
	}

	public String getAverageHeightNPP_Z33_Z43() {
		return averageHeightNPP_Z33_Z43;
	}

	public void setAverageHeightNPP_Z33_Z43(String averageHeightNPP_Z33_Z43) {
		this.averageHeightNPP_Z33_Z43 = averageHeightNPP_Z33_Z43;
	}

	public String getLogintudinalClearancePP_X15() {
		return logintudinalClearancePP_X15;
	}

	public void setLogintudinalClearancePP_X15(String logintudinalClearancePP_X15) {
		this.logintudinalClearancePP_X15 = logintudinalClearancePP_X15;
	}

	public String getLogintudinalClearancePP_X25() {
		return logintudinalClearancePP_X25;
	}

	public void setLogintudinalClearancePP_X25(String logintudinalClearancePP_X25) {
		this.logintudinalClearancePP_X25 = logintudinalClearancePP_X25;
	}

	public String getLogintudinalClearanceNPP_X15() {
		return logintudinalClearanceNPP_X15;
	}

	public void setLogintudinalClearanceNPP_X15(String logintudinalClearanceNPP_X15) {
		this.logintudinalClearanceNPP_X15 = logintudinalClearanceNPP_X15;
	}

	public String getLogintudinalClearanceNPP_X25() {
		return logintudinalClearanceNPP_X25;
	}

	public void setLogintudinalClearanceNPP_X25(String logintudinalClearanceNPP_X25) {
		this.logintudinalClearanceNPP_X25 = logintudinalClearanceNPP_X25;
	}

	public String getLateralClearancePP_Y14() {
		return lateralClearancePP_Y14;
	}

	public void setLateralClearancePP_Y14(String lateralClearancePP_Y14) {
		this.lateralClearancePP_Y14 = lateralClearancePP_Y14;
	}

	public String getLateralClearancePP_Y34() {
		return lateralClearancePP_Y34;
	}

	public void setLateralClearancePP_Y34(String lateralClearancePP_Y34) {
		this.lateralClearancePP_Y34 = lateralClearancePP_Y34;
	}

	public String getLateralClearanceNPP_Y14() {
		return lateralClearanceNPP_Y14;
	}

	public void setLateralClearanceNPP_Y14(String lateralClearanceNPP_Y14) {
		this.lateralClearanceNPP_Y14 = lateralClearanceNPP_Y14;
	}

	public String getLateralClearanceNPP_Y34() {
		return lateralClearanceNPP_Y34;
	}

	public void setLateralClearanceNPP_Y34(String lateralClearanceNPP_Y34) {
		this.lateralClearanceNPP_Y34 = lateralClearanceNPP_Y34;
	}

	public String getTorqueForceBogiePP_1() {
		return torqueForceBogiePP_1;
	}

	public void setTorqueForceBogiePP_1(String torqueForceBogiePP_1) {
		this.torqueForceBogiePP_1 = torqueForceBogiePP_1;
	}

	public String getTorqueForceBogiePP_2() {
		return torqueForceBogiePP_2;
	}

	public void setTorqueForceBogiePP_2(String torqueForceBogiePP_2) {
		this.torqueForceBogiePP_2 = torqueForceBogiePP_2;
	}

	public String getTorqueForceBogiePP_3() {
		return torqueForceBogiePP_3;
	}

	public void setTorqueForceBogiePP_3(String torqueForceBogiePP_3) {
		this.torqueForceBogiePP_3 = torqueForceBogiePP_3;
	}

	public String getTorqueForceBogiePP_4() {
		return torqueForceBogiePP_4;
	}

	public void setTorqueForceBogiePP_4(String torqueForceBogiePP_4) {
		this.torqueForceBogiePP_4 = torqueForceBogiePP_4;
	}

	public String getTorqueForceBogieNPP_1() {
		return torqueForceBogieNPP_1;
	}

	public void setTorqueForceBogieNPP_1(String torqueForceBogieNPP_1) {
		this.torqueForceBogieNPP_1 = torqueForceBogieNPP_1;
	}

	public String getTorqueForceBogieNPP_2() {
		return torqueForceBogieNPP_2;
	}

	public void setTorqueForceBogieNPP_2(String torqueForceBogieNPP_2) {
		this.torqueForceBogieNPP_2 = torqueForceBogieNPP_2;
	}

	public String getTorqueForceBogieNPP_3() {
		return torqueForceBogieNPP_3;
	}

	public void setTorqueForceBogieNPP_3(String torqueForceBogieNPP_3) {
		this.torqueForceBogieNPP_3 = torqueForceBogieNPP_3;
	}

	public String getTorqueForceBogieNPP_4() {
		return torqueForceBogieNPP_4;
	}

	public void setTorqueForceBogieNPP_4(String torqueForceBogieNPP_4) {
		this.torqueForceBogieNPP_4 = torqueForceBogieNPP_4;
	}

	public String getTorqueForceYawDamper170PP_A1() {
		return torqueForceYawDamper170PP_A1;
	}

	public void setTorqueForceYawDamper170PP_A1(String torqueForceYawDamper170PP_A1) {
		this.torqueForceYawDamper170PP_A1 = torqueForceYawDamper170PP_A1;
	}

	public String getTorqueForceYawDamper170PP_A2() {
		return torqueForceYawDamper170PP_A2;
	}

	public void setTorqueForceYawDamper170PP_A2(String torqueForceYawDamper170PP_A2) {
		this.torqueForceYawDamper170PP_A2 = torqueForceYawDamper170PP_A2;
	}

	public String getTorqueForceYawDamper170NPP_A1() {
		return torqueForceYawDamper170NPP_A1;
	}

	public void setTorqueForceYawDamper170NPP_A1(String torqueForceYawDamper170NPP_A1) {
		this.torqueForceYawDamper170NPP_A1 = torqueForceYawDamper170NPP_A1;
	}

	public String getTorqueForceYawDamper170NPP_A2() {
		return torqueForceYawDamper170NPP_A2;
	}

	public void setTorqueForceYawDamper170NPP_A2(String torqueForceYawDamper170NPP_A2) {
		this.torqueForceYawDamper170NPP_A2 = torqueForceYawDamper170NPP_A2;
	}

	public String getTorqueForceYawDamper160PP_A1() {
		return torqueForceYawDamper160PP_A1;
	}

	public void setTorqueForceYawDamper160PP_A1(String torqueForceYawDamper160PP_A1) {
		this.torqueForceYawDamper160PP_A1 = torqueForceYawDamper160PP_A1;
	}

	public String getTorqueForceYawDamper160PP_A2() {
		return torqueForceYawDamper160PP_A2;
	}

	public void setTorqueForceYawDamper160PP_A2(String torqueForceYawDamper160PP_A2) {
		this.torqueForceYawDamper160PP_A2 = torqueForceYawDamper160PP_A2;
	}

	public String getTorqueForceYawDamper160NPP_A1() {
		return torqueForceYawDamper160NPP_A1;
	}

	public void setTorqueForceYawDamper160NPP_A1(String torqueForceYawDamper160NPP_A1) {
		this.torqueForceYawDamper160NPP_A1 = torqueForceYawDamper160NPP_A1;
	}

	public String getTorqueForceYawDamper160NPP_A2() {
		return torqueForceYawDamper160NPP_A2;
	}

	public void setTorqueForceYawDamper160NPP_A2(String torqueForceYawDamper160NPP_A2) {
		this.torqueForceYawDamper160NPP_A2 = torqueForceYawDamper160NPP_A2;
	}

	public String getSecSpringHeightPP_Z1() {
		return secSpringHeightPP_Z1;
	}

	public void setSecSpringHeightPP_Z1(String secSpringHeightPP_Z1) {
		this.secSpringHeightPP_Z1 = secSpringHeightPP_Z1;
	}

	public String getSecSpringHeightPP_Z2() {
		return secSpringHeightPP_Z2;
	}

	public void setSecSpringHeightPP_Z2(String secSpringHeightPP_Z2) {
		this.secSpringHeightPP_Z2 = secSpringHeightPP_Z2;
	}

	public String getSecSpringHeightNPP_Z1() {
		return secSpringHeightNPP_Z1;
	}

	public void setSecSpringHeightNPP_Z1(String secSpringHeightNPP_Z1) {
		this.secSpringHeightNPP_Z1 = secSpringHeightNPP_Z1;
	}

	public String getSecSpringHeightNPP_Z2() {
		return secSpringHeightNPP_Z2;
	}

	public void setSecSpringHeightNPP_Z2(String secSpringHeightNPP_Z2) {
		this.secSpringHeightNPP_Z2 = secSpringHeightNPP_Z2;
	}
   
	public String getTestingstatus() {
		return testingstatus;
	}

	public void setTestingstatus(String testingstatus) {
		this.testingstatus = testingstatus;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}
	
}
