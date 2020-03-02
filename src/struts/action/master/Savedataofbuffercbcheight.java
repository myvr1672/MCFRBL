
package struts.action.master;

import dao.DaoBuffercbcheight;





import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
//import beans.ShellUnderframeSipTrans;
import beans.FurnishingTransaction;
import beans.BuffercbcheightTestingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class  Savedataofbuffercbcheight
{
	
	private String furnishingAssetId;
	private String dateofbuffercbcheighttesting;
	//private String shelltype;
	
	private String coachtype;
	private String coachno;
	private String dampernppa1;
	private String dampernppa2;
	private String damperppa1;
	private String damperppa2;
	
    private String shiftbuffercbcheight;
	private String bogienoh2;
	private String bogienoh1;
	private String h2npp;
	private String h1pp;
	private String simheightnpp1;
	private String simheightnpp2;
	private String simheightpp1;
	private String simheightpp2;
	private String simheightnpp3;
	private String simheightnpp4;
	private String simheightpp3;
	private String simheightpp4;
	private String bufferheightnppc;
	private String bufferheightnppd;
	private String bufferheightppa;
	private String bufferheightppb;
	private String raillevelnppz11;
	private String raillevelnppz21;
	private String raillevelnppz31;
	private String raillevelnppz41;
	private String raillevelppz11;
	private String raillevelppz21;
	private String raillevelppz31;
	private String raillevelppz41;
	private String verticalstopclearancenppz1;
	private String verticalstopclearancenppz2;
	private String verticalstopclearanceppz1;
	private String verticalstopclearanceppz2;
	private String averageheightnppz13z23;
	private String averageheightnppz33z43;
	private String averageheightppz13z23;
	
	private String averageheightppz33z43;
	private String logintudinalclearancenppx15;
	private String logintudinalclearancenppx25;
	private String logintudinalclearanceppx15;
	private String logintudinalclearanceppx25;
	private String lateralclearancenppy14;
	private String lateralclearancenppy34;
	private String lateralclearanceppy14;
	private String lateralclearanceppy34;
	private String torqueforcebogienpp1;
	private String torqueforcebogienpp2;
	private String torqueforcebogienpp3;
	private String torqueforcebogienpp4;
	private String torqueforcebogiepp1;
	private String torqueforcebogiepp2;
	private String torqueforcebogiepp3;
	private String torqueforcebogiepp4;
	private String torqueforceyawdamper170nppa1;
	private String torqueforceyawdamper170nppa2;
	private String torqueforceyawdamper170ppa1;
	private String torqueforceyawdamper170ppa2;
	private String torqueforceyawdamper160nppa1;
	private String torqueforceyawdamper160nppa2;
	private String torqueforceyawdamper160ppa1;
	private String torqueforceyawdamper160ppa2;
	private String secspringheightnppz1;
	private String secspringheightnppz2;
	private String secspringheightppz1;
	private String secspringheightppz2;
	private String checkingStatus;
    private String docnobuffercbcheight;
	
	

	public String savedata()
	{
		System.out.println("hii");
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		System.out.println("2");
	String userID=(String)httpSession.getAttribute("userid");
	Timestamp entryTime=new Timestamp(System.currentTimeMillis());
	BuffercbcheightTestingTransaction buffercbcheightTestingTransaction=new BuffercbcheightTestingTransaction();
	Integer furnishingAssetIdasint=Integer.parseInt(furnishingAssetId);
	
	buffercbcheightTestingTransaction.setFurnishingAssetId(furnishingAssetIdasint);
	buffercbcheightTestingTransaction.setCbcHeightNPP(h2npp);
	buffercbcheightTestingTransaction.setCbcHeightPP(h1pp);
	buffercbcheightTestingTransaction.setSimHeightNPP1(simheightnpp1);
	buffercbcheightTestingTransaction.setSimHeightNPP2(simheightnpp2);
	buffercbcheightTestingTransaction.setSimHeightNPP3(simheightnpp3);
	buffercbcheightTestingTransaction.setSimHeightNPP4(simheightnpp4);
	buffercbcheightTestingTransaction.setSimHeightPP1(simheightpp1);
	buffercbcheightTestingTransaction.setSimHeightPP2(simheightpp2);
	buffercbcheightTestingTransaction.setSimHeightPP3(simheightpp3);
	buffercbcheightTestingTransaction.setSimHeightPP4(simheightpp4);
	buffercbcheightTestingTransaction.setBufferHeightNPP_C(bufferheightnppc);
	buffercbcheightTestingTransaction.setBufferHeightNPP_D(bufferheightnppd);
	buffercbcheightTestingTransaction.setBufferHeightPP_A(bufferheightppa);
	buffercbcheightTestingTransaction.setBufferHeightPP_B(bufferheightppb);
	buffercbcheightTestingTransaction.setRailLevelNPP_Z11(raillevelnppz11);
	buffercbcheightTestingTransaction.setRailLevelNPP_Z21(raillevelnppz21);
	buffercbcheightTestingTransaction.setRailLevelNPP_Z31(raillevelnppz31);
	buffercbcheightTestingTransaction.setRailLevelNPP_Z41(raillevelnppz41);
	buffercbcheightTestingTransaction.setRailLevelPP_Z11(raillevelppz11);
	buffercbcheightTestingTransaction.setRailLevelPP_Z21(raillevelppz21);
	buffercbcheightTestingTransaction.setRailLevelPP_Z31(raillevelppz31);
	buffercbcheightTestingTransaction.setRailLevelPP_Z41(raillevelppz41);
	buffercbcheightTestingTransaction.setVerticalStopClearanceNPP_Z1(verticalstopclearancenppz1);
	buffercbcheightTestingTransaction.setVerticalStopClearanceNPP_Z2(verticalstopclearancenppz2);
	buffercbcheightTestingTransaction.setVerticalStopClearancePP_Z1(verticalstopclearanceppz1);
	buffercbcheightTestingTransaction.setVerticalStopClearancePP_Z2(verticalstopclearanceppz2);
	buffercbcheightTestingTransaction.setAverageHeightNPP_Z13_Z23(averageheightnppz13z23);
	buffercbcheightTestingTransaction.setAverageHeightNPP_Z33_Z43(averageheightnppz33z43);
	buffercbcheightTestingTransaction.setAverageHeightPP_Z13_Z23(averageheightppz13z23);
	buffercbcheightTestingTransaction.setAverageHeightPP_Z33_Z43(averageheightppz33z43);
	buffercbcheightTestingTransaction.setLogintudinalClearanceNPP_X15(logintudinalclearancenppx15);
	buffercbcheightTestingTransaction.setLogintudinalClearanceNPP_X25(logintudinalclearancenppx25);
	buffercbcheightTestingTransaction.setLogintudinalClearancePP_X15(logintudinalclearanceppx15);
	buffercbcheightTestingTransaction.setLogintudinalClearancePP_X25(logintudinalclearanceppx25);
	buffercbcheightTestingTransaction.setLateralClearanceNPP_Y14(lateralclearancenppy14);
	buffercbcheightTestingTransaction.setLateralClearanceNPP_Y34(lateralclearancenppy34);
	buffercbcheightTestingTransaction.setLateralClearancePP_Y14(lateralclearanceppy14);
	buffercbcheightTestingTransaction.setLateralClearancePP_Y34(lateralclearanceppy34);
	buffercbcheightTestingTransaction.setTorqueForceBogieNPP_1(torqueforcebogienpp1);
	buffercbcheightTestingTransaction.setTorqueForceBogieNPP_2(torqueforcebogienpp2);
	buffercbcheightTestingTransaction.setTorqueForceBogieNPP_3(torqueforcebogienpp3);
	buffercbcheightTestingTransaction.setTorqueForceBogieNPP_4(torqueforcebogienpp4);
	buffercbcheightTestingTransaction.setTorqueForceBogiePP_1(torqueforcebogiepp1);
	buffercbcheightTestingTransaction.setTorqueForceBogiePP_2(torqueforcebogiepp2);
	buffercbcheightTestingTransaction.setTorqueForceBogiePP_3(torqueforcebogiepp3);
	buffercbcheightTestingTransaction.setTorqueForceBogiePP_4(torqueforcebogiepp4);
	buffercbcheightTestingTransaction.setTorqueForceYawDamper170NPP_A1(torqueforceyawdamper170nppa1);
	buffercbcheightTestingTransaction.setTorqueForceYawDamper170NPP_A2(torqueforceyawdamper170nppa2);
	buffercbcheightTestingTransaction.setTorqueForceYawDamper170PP_A1(torqueforceyawdamper170ppa1);
	buffercbcheightTestingTransaction.setTorqueForceYawDamper170PP_A2(torqueforceyawdamper170ppa2);
	buffercbcheightTestingTransaction.setTorqueForceYawDamper160NPP_A1(torqueforceyawdamper160nppa1);
	buffercbcheightTestingTransaction.setTorqueForceYawDamper160NPP_A2(torqueforceyawdamper160nppa2);
	System.out.println(torqueforceyawdamper160nppa2);
	buffercbcheightTestingTransaction.setTorqueForceYawDamper160PP_A1(torqueforceyawdamper160ppa1);
	buffercbcheightTestingTransaction.setTorqueForceYawDamper160PP_A2(torqueforceyawdamper160ppa2);
	buffercbcheightTestingTransaction.setSecSpringHeightNPP_Z1(secspringheightnppz1);
	buffercbcheightTestingTransaction.setSecSpringHeightNPP_Z2(secspringheightnppz2);
	buffercbcheightTestingTransaction.setSecSpringHeightPP_Z1(secspringheightppz1);
	buffercbcheightTestingTransaction.setSecSpringHeightPP_Z2(secspringheightppz2);
	buffercbcheightTestingTransaction.setShiftBuffercbcheight(shiftbuffercbcheight);
	buffercbcheightTestingTransaction.setDocNoBuffercbcheight(docnobuffercbcheight);
	System.out.println("go to hell");
	buffercbcheightTestingTransaction.setTestingstatus(checkingStatus);
	if(!"".equals(dateofbuffercbcheighttesting))
	{
		buffercbcheightTestingTransaction.setDateOfBuffercbcheight(DateUtil.convertToDate(dateofbuffercbcheighttesting));
	}
	FurnishingTransaction furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdasint);
		
	furnishingTransaction.setCbcTestingFlag(1);
	//furnishingTransaction.setShellType(shelltype);
	furnishingTransaction.setCoachNumber(coachno);
	furnishingTransaction.setCoachType(coachtype);
	furnishingTransaction.setYawDamperNPPVertical(dampernppa1);
	furnishingTransaction.setYawDamperNPPHorizontal(dampernppa2);
	furnishingTransaction.setYawDamperPPVertical(damperppa1);
	furnishingTransaction.setYawDamperPPHorizontal(damperppa2);
	
		
		
		
		System.out.println("last!!");
		
		
		
		System.out.println("last1");
		try
		{	
			System.out.println(furnishingAssetId);
			DaoBuffercbcheight dao= new DaoBuffercbcheight();
			dao.saveDaoBuffercbcheight(furnishingTransaction,buffercbcheightTestingTransaction);
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




	public String getDateofbuffercbcheighttesting() {
		return dateofbuffercbcheighttesting;
	}




	public void setDateofbuffercbcheighttesting(String dateofbuffercbcheighttesting) {
		this.dateofbuffercbcheighttesting = dateofbuffercbcheighttesting;
	}




	/*public String getShelltype() {
		return shelltype;
	}




	public void setShelltype(String shelltype) {
		this.shelltype = shelltype;
	}
*/



	public String getCoachtype() {
		return coachtype;
	}




	public void setCoachtype(String coachtype) {
		this.coachtype = coachtype;
	}




	public String getCoachno() {
		return coachno;
	}




	public void setCoachno(String coachno) {
		this.coachno = coachno;
	}




	public String getDampernppa1() {
		return dampernppa1;
	}




	public void setDampernppa1(String dampernppa1) {
		this.dampernppa1 = dampernppa1;
	}




	public String getDampernppa2() {
		return dampernppa2;
	}




	public void setDampernppa2(String dampernppa2) {
		this.dampernppa2 = dampernppa2;
	}




	public String getDamperppa1() {
		return damperppa1;
	}




	public void setDamperppa1(String damperppa1) {
		this.damperppa1 = damperppa1;
	}




	public String getDamperppa2() {
		return damperppa2;
	}




	public void setDamperppa2(String damperppa2) {
		this.damperppa2 = damperppa2;
	}




	public String getShiftbuffercbcheight() {
		return shiftbuffercbcheight;
	}




	public void setShiftbuffercbcheight(String shiftbuffercbcheight) {
		this.shiftbuffercbcheight = shiftbuffercbcheight;
	}




	public String getBogienoh2() {
		return bogienoh2;
	}




	public void setBogienoh2(String bogienoh2) {
		this.bogienoh2 = bogienoh2;
	}




	public String getBogienoh1() {
		return bogienoh1;
	}




	public void setBogienoh1(String bogienoh1) {
		this.bogienoh1 = bogienoh1;
	}




	public String getH2npp() {
		return h2npp;
	}




	public void setH2npp(String h2npp) {
		this.h2npp = h2npp;
	}




	public String getH1pp() {
		return h1pp;
	}




	public void setH1pp(String h1pp) {
		this.h1pp = h1pp;
	}




	public String getSimheightnpp1() {
		return simheightnpp1;
	}




	public void setSimheightnpp1(String simheightnpp1) {
		this.simheightnpp1 = simheightnpp1;
	}




	public String getSimheightnpp2() {
		return simheightnpp2;
	}




	public void setSimheightnpp2(String simheightnpp2) {
		this.simheightnpp2 = simheightnpp2;
	}




	public String getSimheightpp1() {
		return simheightpp1;
	}




	public void setSimheightpp1(String simheightpp1) {
		this.simheightpp1 = simheightpp1;
	}




	public String getSimheightpp2() {
		return simheightpp2;
	}




	public void setSimheightpp2(String simheightpp2) {
		this.simheightpp2 = simheightpp2;
	}




	public String getSimheightnpp3() {
		return simheightnpp3;
	}




	public void setSimheightnpp3(String simheightnpp3) {
		this.simheightnpp3 = simheightnpp3;
	}




	public String getSimheightnpp4() {
		return simheightnpp4;
	}




	public void setSimheightnpp4(String simheightnpp4) {
		this.simheightnpp4 = simheightnpp4;
	}




	public String getSimheightpp3() {
		return simheightpp3;
	}




	public void setSimheightpp3(String simheightpp3) {
		this.simheightpp3 = simheightpp3;
	}




	public String getSimheightpp4() {
		return simheightpp4;
	}




	public void setSimheightpp4(String simheightpp4) {
		this.simheightpp4 = simheightpp4;
	}




	public String getBufferheightnppc() {
		return bufferheightnppc;
	}




	public void setBufferheightnppc(String bufferheightnppc) {
		this.bufferheightnppc = bufferheightnppc;
	}




	public String getBufferheightnppd() {
		return bufferheightnppd;
	}




	public void setBufferheightnppd(String bufferheightnppd) {
		this.bufferheightnppd = bufferheightnppd;
	}




	public String getBufferheightppa() {
		return bufferheightppa;
	}




	public void setBufferheightppa(String bufferheightppa) {
		this.bufferheightppa = bufferheightppa;
	}




	public String getBufferheightppb() {
		return bufferheightppb;
	}




	public void setBufferheightppb(String bufferheightppb) {
		this.bufferheightppb = bufferheightppb;
	}




	public String getRaillevelnppz11() {
		return raillevelnppz11;
	}




	public void setRaillevelnppz11(String raillevelnppz11) {
		this.raillevelnppz11 = raillevelnppz11;
	}




	public String getRaillevelnppz21() {
		return raillevelnppz21;
	}




	public void setRaillevelnppz21(String raillevelnppz21) {
		this.raillevelnppz21 = raillevelnppz21;
	}




	public String getRaillevelnppz31() {
		return raillevelnppz31;
	}




	public void setRaillevelnppz31(String raillevelnppz31) {
		this.raillevelnppz31 = raillevelnppz31;
	}




	public String getRaillevelnppz41() {
		return raillevelnppz41;
	}




	public void setRaillevelnppz41(String raillevelnppz41) {
		this.raillevelnppz41 = raillevelnppz41;
	}




	public String getRaillevelppz11() {
		return raillevelppz11;
	}




	public void setRaillevelppz11(String raillevelppz11) {
		this.raillevelppz11 = raillevelppz11;
	}




	public String getRaillevelppz21() {
		return raillevelppz21;
	}




	public void setRaillevelppz21(String raillevelppz21) {
		this.raillevelppz21 = raillevelppz21;
	}




	public String getRaillevelppz31() {
		return raillevelppz31;
	}




	public void setRaillevelppz31(String raillevelppz31) {
		this.raillevelppz31 = raillevelppz31;
	}




	public String getRaillevelppz41() {
		return raillevelppz41;
	}




	public void setRaillevelppz41(String raillevelppz41) {
		this.raillevelppz41 = raillevelppz41;
	}




	public String getVerticalstopclearancenppz1() {
		return verticalstopclearancenppz1;
	}




	public void setVerticalstopclearancenppz1(String verticalstopclearancenppz1) {
		this.verticalstopclearancenppz1 = verticalstopclearancenppz1;
	}




	public String getVerticalstopclearancenppz2() {
		return verticalstopclearancenppz2;
	}




	public void setVerticalstopclearancenppz2(String verticalstopclearancenppz2) {
		this.verticalstopclearancenppz2 = verticalstopclearancenppz2;
	}




	public String getVerticalstopclearanceppz1() {
		return verticalstopclearanceppz1;
	}




	public void setVerticalstopclearanceppz1(String verticalstopclearanceppz1) {
		this.verticalstopclearanceppz1 = verticalstopclearanceppz1;
	}




	public String getVerticalstopclearanceppz2() {
		return verticalstopclearanceppz2;
	}




	public void setVerticalstopclearanceppz2(String verticalstopclearanceppz2) {
		this.verticalstopclearanceppz2 = verticalstopclearanceppz2;
	}




	public String getAverageheightnppz13z23() {
		return averageheightnppz13z23;
	}




	public void setAverageheightnppz13z23(String averageheightnppz13z23) {
		this.averageheightnppz13z23 = averageheightnppz13z23;
	}




	public String getAverageheightnppz33z43() {
		return averageheightnppz33z43;
	}




	public void setAverageheightnppz33z43(String averageheightnppz33z43) {
		this.averageheightnppz33z43 = averageheightnppz33z43;
	}




	public String getAverageheightppz13z23() {
		return averageheightppz13z23;
	}




	public void setAverageheightppz13z23(String averageheightppz13z23) {
		this.averageheightppz13z23 = averageheightppz13z23;
	}




	public String getAverageheightppz33z43() {
		return averageheightppz33z43;
	}




	public void setAverageheightppz33z43(String averageheightppz33z43) {
		this.averageheightppz33z43 = averageheightppz33z43;
	}




	public String getLogintudinalclearancenppx15() {
		return logintudinalclearancenppx15;
	}




	public void setLogintudinalclearancenppx15(String logintudinalclearancenppx15) {
		this.logintudinalclearancenppx15 = logintudinalclearancenppx15;
	}




	public String getLogintudinalclearancenppx25() {
		return logintudinalclearancenppx25;
	}




	public void setLogintudinalclearancenppx25(String logintudinalclearancenppx25) {
		this.logintudinalclearancenppx25 = logintudinalclearancenppx25;
	}




	public String getLogintudinalclearanceppx15() {
		return logintudinalclearanceppx15;
	}




	public void setLogintudinalclearanceppx15(String logintudinalclearanceppx15) {
		this.logintudinalclearanceppx15 = logintudinalclearanceppx15;
	}




	public String getLogintudinalclearanceppx25() {
		return logintudinalclearanceppx25;
	}




	public void setLogintudinalclearanceppx25(String logintudinalclearanceppx25) {
		this.logintudinalclearanceppx25 = logintudinalclearanceppx25;
	}




	public String getLateralclearancenppy14() {
		return lateralclearancenppy14;
	}




	public void setLateralclearancenppy14(String lateralclearancenppy14) {
		this.lateralclearancenppy14 = lateralclearancenppy14;
	}




	public String getLateralclearancenppy34() {
		return lateralclearancenppy34;
	}




	public void setLateralclearancenppy34(String lateralclearancenppy34) {
		this.lateralclearancenppy34 = lateralclearancenppy34;
	}




	public String getLateralclearanceppy14() {
		return lateralclearanceppy14;
	}




	public void setLateralclearanceppy14(String lateralclearanceppy14) {
		this.lateralclearanceppy14 = lateralclearanceppy14;
	}




	public String getLateralclearanceppy34() {
		return lateralclearanceppy34;
	}




	public void setLateralclearanceppy34(String lateralclearanceppy34) {
		this.lateralclearanceppy34 = lateralclearanceppy34;
	}




	public String getTorqueforcebogienpp1() {
		return torqueforcebogienpp1;
	}




	public void setTorqueforcebogienpp1(String torqueforcebogienpp1) {
		this.torqueforcebogienpp1 = torqueforcebogienpp1;
	}




	public String getTorqueforcebogienpp2() {
		return torqueforcebogienpp2;
	}




	public void setTorqueforcebogienpp2(String torqueforcebogienpp2) {
		this.torqueforcebogienpp2 = torqueforcebogienpp2;
	}




	public String getTorqueforcebogienpp3() {
		return torqueforcebogienpp3;
	}




	public void setTorqueforcebogienpp3(String torqueforcebogienpp3) {
		this.torqueforcebogienpp3 = torqueforcebogienpp3;
	}




	public String getTorqueforcebogienpp4() {
		return torqueforcebogienpp4;
	}




	public void setTorqueforcebogienpp4(String torqueforcebogienpp4) {
		this.torqueforcebogienpp4 = torqueforcebogienpp4;
	}




	public String getTorqueforcebogiepp1() {
		return torqueforcebogiepp1;
	}




	public void setTorqueforcebogiepp1(String torqueforcebogiepp1) {
		this.torqueforcebogiepp1 = torqueforcebogiepp1;
	}




	public String getTorqueforcebogiepp2() {
		return torqueforcebogiepp2;
	}




	public void setTorqueforcebogiepp2(String torqueforcebogiepp2) {
		this.torqueforcebogiepp2 = torqueforcebogiepp2;
	}




	public String getTorqueforcebogiepp3() {
		return torqueforcebogiepp3;
	}




	


	public void setTorqueforcebogiepp3(String torqueforcebogiepp3) {
		this.torqueforcebogiepp3 = torqueforcebogiepp3;
	}




	public String getTorqueforcebogiepp4() {
		return torqueforcebogiepp4;
	}




	public void setTorqueforcebogiepp4(String torqueforcebogiepp4) {
		this.torqueforcebogiepp4 = torqueforcebogiepp4;
	}




	public String getTorqueforceyawdamper170nppa1() {
		return torqueforceyawdamper170nppa1;
	}




	public void setTorqueforceyawdamper170nppa1(String torqueforceyawdamper170nppa1) {
		this.torqueforceyawdamper170nppa1 = torqueforceyawdamper170nppa1;
	}




	public String getTorqueforceyawdamper170nppa2() {
		return torqueforceyawdamper170nppa2;
	}




	public void setTorqueforceyawdamper170nppa2(String torqueforceyawdamper170nppa2) {
		this.torqueforceyawdamper170nppa2 = torqueforceyawdamper170nppa2;
	}




	public String getTorqueforceyawdamper170ppa1() {
		return torqueforceyawdamper170ppa1;
	}




	public void setTorqueforceyawdamper170ppa1(String torqueforceyawdamper170ppa1) {
		this.torqueforceyawdamper170ppa1 = torqueforceyawdamper170ppa1;
	}




	public String getTorqueforceyawdamper170ppa2() {
		return torqueforceyawdamper170ppa2;
	}




	public void setTorqueforceyawdamper170ppa2(String torqueforceyawdamper170ppa2) {
		this.torqueforceyawdamper170ppa2 = torqueforceyawdamper170ppa2;
	}




	public String getTorqueforceyawdamper160nppa1() {
		return torqueforceyawdamper160nppa1;
	}




	public void setTorqueforceyawdamper160nppa1(String torqueforceyawdamper160nppa1) {
		this.torqueforceyawdamper160nppa1 = torqueforceyawdamper160nppa1;
	}




	public String getTorqueforceyawdamper160nppa2() {
		return torqueforceyawdamper160nppa2;
	}




	public void setTorqueforceyawdamper160nppa2(String torqueforceyawdamper160nppa2) {
		this.torqueforceyawdamper160nppa2 = torqueforceyawdamper160nppa2;
	}




	public String getTorqueforceyawdamper160ppa1() {
		return torqueforceyawdamper160ppa1;
	}




	public void setTorqueforceyawdamper160ppa1(String torqueforceyawdamper160ppa1) {
		this.torqueforceyawdamper160ppa1 = torqueforceyawdamper160ppa1;
	}




	public String getTorqueforceyawdamper160ppa2() {
		return torqueforceyawdamper160ppa2;
	}




	public void setTorqueforceyawdamper160ppa2(String torqueforceyawdamper160ppa2) {
		this.torqueforceyawdamper160ppa2 = torqueforceyawdamper160ppa2;
	}




	public String getSecspringheightnppz1() {
		return secspringheightnppz1;
	}




	public void setSecspringheightnppz1(String secspringheightnppz1) {
		this.secspringheightnppz1 = secspringheightnppz1;
	}




	public String getSecspringheightnppz2() {
		return secspringheightnppz2;
	}




	public void setSecspringheightnppz2(String secspringheightnppz2) {
		this.secspringheightnppz2 = secspringheightnppz2;
	}




	public String getSecspringheightppz1() {
		return secspringheightppz1;
	}




	public void setSecspringheightppz1(String secspringheightppz1) {
		this.secspringheightppz1 = secspringheightppz1;
	}




	public String getSecspringheightppz2() {
		return secspringheightppz2;
	}




	public void setSecspringheightppz2(String secspringheightppz2) {
		this.secspringheightppz2 = secspringheightppz2;
	}




	public String getCheckingStatus() {
		return checkingStatus;
	}




	public void setCheckingStatus(String checkingStatus) {
		this.checkingStatus = checkingStatus;
	}




	public String getDocnobuffercbcheight() {
		return docnobuffercbcheight;
	}




	public void setDocnobuffercbcheight(String docnobuffercbcheight) {
		this.docnobuffercbcheight = docnobuffercbcheight;
	}
	
	
	
	
	
}





	
	
		