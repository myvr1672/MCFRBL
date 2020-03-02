package struts.action.master;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import beans.ShellStage3SipTran;
import beans.ShellTransaction;
import common.DateUtil;
import dao.DaoShellStage3Sip;
import hibernateConnect.HibernateConfig;

public class Stage3SIPAction {
	private String shellAssetId;
	private String stage3SipDocNo;
	private String stage3SipShift;
	private String stage3SipDate;
	private String stage3WorkBy;
	private String stage3DrawingNo;
	private String stage3JigNo;
	private String stage3ShellAssemblyBy;
	private String stage3UnderFrameMake;
	private String stage3RoofMake;
	private String endwallMakePp;
	private String sideWallMakeLh;
	private String endwallMakeNpp;
	private String sideWallMakeRh;
	private String undulationAboveWindow1;
	private String undulationBelowWindow1;
	private String undulationAboveWindow2;
	private String undulationBelowWindow2;
	private String undulationAboveWindow3;
	private String undulationBelowWindow3;
	private String undulationAboveWindow4;
	private String undulationBelowWindow4;
	private String undulationAboveWindow5;
	private String undulationBelowWindow5;
	private String undulationAboveWindow6;
	private String undulationBelowWindow6;
	private String undulationAboveWindow7;
	private String undulationBelowWindow7;
	private String undulationAboveWindow8;
	private String undulationBelowWindow8;
	private String undulationAboveWindow9;
	private String undulationBelowWindow9;
	private String undulationAboveWindow10;
	private String undulationBelowWindow10;
	private String undulationAboveWindow11;
	private String undulationBelowWindow11;
	private String undulationAboveWindow12;
	private String undulationBelowWindow12;
	private String undulationAboveWindow13;
	private String undulationBelowWindow13;
	private String undulationAboveWindow14;
	private String undulationBelowWindow14;
	private String undulationAboveWindow15;
	private String undulationBelowWindow15;
	private String undulationAboveWindow16;
	private String undulationBelowWindow16;
	private String undulationAboveWindow17;
	private String undulationBelowWindow17;
	private String undulationAboveWindow18;
	private String undulationBelowWindow18;
	private String undulationAboveWindow19;
	private String undulationBelowWindow19;
	private String undulationAboveWindow20;
	private String undulationBelowWindow20;
	private String undulationAboveWindow21;
	private String undulationBelowWindow21;
	private String undulationAboveWindow22;
	private String undulationBelowWindow22;
	private String undulationAboveWindow23;
	private String undulationBelowWindow23;
	private String undulationAboveWindow24;
	private String undulationBelowWindow24;
	private String undulationAboveWindow25;
	private String undulationBelowWindow25;
	private String undulationAboveWindow26;
	private String undulationBelowWindow26;
	private String undulationAboveWindow27;
	private String undulationBelowWindow27;
	private String undulationAboveWindow28;
	private String undulationBelowWindow28;
	private String undulationAboveWindow29;
	private String undulationBelowWindow29;
	private String undulationAboveWindow30;
	private String undulationBelowWindow30;
	private String undulationAboveWindow31;
	private String undulationBelowWindow31;
	private String undulationAboveWindow32;
	private String undulationBelowWindow32;
	private String undulationAboveWindow33;
	private String undulationBelowWindow33;
	private String undulationAboveWindow34;
	private String undulationBelowWindow34;
	private String undulationAboveWindow35;
	private String undulationBelowWindow35;
	private String undulationAboveWindow36;
	private String undulationBelowWindow36;
	private String undulationAboveWindow37;
	private String undulationBelowWindow37;
	private String undulationAboveWindow38;
	private String undulationBelowWindow38;
	private String undulationAboveWindow39;
	private String undulationBelowWindow39;
	private String undulationAboveWindow40;
	private String undulationBelowWindow40;
	private String undulationAboveWindow41;
	private String undulationBelowWindow41;
	private String undulationAboveWindow42;
	private String undulationBelowWindow42;
	private String endwallPpAboveCenterLh;
	private String endwallPpAboveCenterRh;
	private String endwallNppAboveCenterLh;
	private String endwallNppAboveCenterRh;
	private String endwallPpMiddleCenterLh;
	private String endwallPpMiddleCenterRh;
	private String endwallNppMiddleCenterLh;
	private String endwallNppMiddleCenterRh;
	private String endwallPpBottomCenterLh;
	private String endwallPpBottomCenterRh;
	private String endwallNppBottomCenterLh;
	private String endwallNppBottomCenterRh;
	private String dentReduceSidewallEndwallFlag;
	private String skinTensioningWiFlag;
	private String skinTensioningSidewallEndwallLavFlag;
	private String heatedSpotFlag;
	private String weldRainWaterFlag;
	private String insulatingWeldingPinFlag;
	private String fitmentWeldingSidewallFlag;
	private String fitmentWeldingBracketarrangementFlag;
	private String levelRainWaterGutterFlag;
	private String fitmentWeldingWindowbarFlag;
	private String fitmentWeldingBracketLavatoryFlag;
	private String detailsOfModification;
	private String detailsOfTrial;
	private String remarks;
	private String stage3TestingStatus;
	
	
	public String saveStage3(){
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		
		String userID= (String) httpSession.getAttribute("userid");
		
		Timestamp entryTime=new Timestamp(System.currentTimeMillis());
		ShellStage3SipTran ShellStage3SipTran=new ShellStage3SipTran();
				
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		ShellStage3SipTran.setShellAssetId(shellAssetIdAsInt);
		if(!"".equals(stage3SipDate)){ShellStage3SipTran.setStage3SipDate(DateUtil.convertToDate(stage3SipDate));}
		
		
		if(!"".equals(undulationAboveWindow1)){
			float undulationAboveWindow1AsFloat=Float.parseFloat(undulationAboveWindow1);
			ShellStage3SipTran.setUndulationAboveWindow1(undulationAboveWindow1AsFloat);}
		if(!"".equals(undulationAboveWindow2)){
			float undulationAboveWindow2AsFloat=Float.parseFloat(undulationAboveWindow2);
			ShellStage3SipTran.setUndulationAboveWindow2(undulationAboveWindow2AsFloat);}
		if(!"".equals(undulationAboveWindow3)){
			float undulationAboveWindow3AsFloat=Float.parseFloat(undulationAboveWindow3);
			ShellStage3SipTran.setUndulationAboveWindow3(undulationAboveWindow3AsFloat);}
		if(!"".equals(undulationAboveWindow4)){
			float undulationAboveWindow4AsFloat=Float.parseFloat(undulationAboveWindow4);
			ShellStage3SipTran.setUndulationAboveWindow4(undulationAboveWindow4AsFloat);}
		if(!"".equals(undulationAboveWindow5)){
			float undulationAboveWindow5AsFloat=Float.parseFloat(undulationAboveWindow5);
			ShellStage3SipTran.setUndulationAboveWindow5(undulationAboveWindow5AsFloat);}
		if(!"".equals(undulationAboveWindow6)){
			float undulationAboveWindow6AsFloat=Float.parseFloat(undulationAboveWindow6);
			ShellStage3SipTran.setUndulationAboveWindow6(undulationAboveWindow6AsFloat);}
		if(!"".equals(undulationAboveWindow7)){
			float undulationAboveWindow7AsFloat=Float.parseFloat(undulationAboveWindow7);
			ShellStage3SipTran.setUndulationAboveWindow7(undulationAboveWindow7AsFloat);}
		if(!"".equals(undulationAboveWindow8)){
			float undulationAboveWindow8AsFloat=Float.parseFloat(undulationAboveWindow8);
			ShellStage3SipTran.setUndulationAboveWindow8(undulationAboveWindow8AsFloat);}
		if(!"".equals(undulationAboveWindow9)){
			float undulationAboveWindow9AsFloat=Float.parseFloat(undulationAboveWindow9);
			ShellStage3SipTran.setUndulationAboveWindow9(undulationAboveWindow9AsFloat);}
		if(!"".equals(undulationAboveWindow10)){
			float undulationAboveWindow10AsFloat=Float.parseFloat(undulationAboveWindow10);
			ShellStage3SipTran.setUndulationAboveWindow10(undulationAboveWindow10AsFloat);}
		if(!"".equals(undulationAboveWindow11)){
			float undulationAboveWindow11AsFloat=Float.parseFloat(undulationAboveWindow11);
			ShellStage3SipTran.setUndulationAboveWindow11(undulationAboveWindow11AsFloat);}
		if(!"".equals(undulationAboveWindow12)){
			float undulationAboveWindow12AsFloat=Float.parseFloat(undulationAboveWindow12);
			ShellStage3SipTran.setUndulationAboveWindow12(undulationAboveWindow12AsFloat);}
		if(!"".equals(undulationAboveWindow13)){
			float undulationAboveWindow13AsFloat=Float.parseFloat(undulationAboveWindow13);
			ShellStage3SipTran.setUndulationAboveWindow13(undulationAboveWindow13AsFloat);}
		if(!"".equals(undulationAboveWindow14)){
			float undulationAboveWindow14AsFloat=Float.parseFloat(undulationAboveWindow14);
			ShellStage3SipTran.setUndulationAboveWindow14(undulationAboveWindow14AsFloat);}
		if(!"".equals(undulationAboveWindow15)){
			float undulationAboveWindow15AsFloat=Float.parseFloat(undulationAboveWindow15);
			ShellStage3SipTran.setUndulationAboveWindow15(undulationAboveWindow15AsFloat);}
		if(!"".equals(undulationAboveWindow16)){
			float undulationAboveWindow16AsFloat=Float.parseFloat(undulationAboveWindow16);
			ShellStage3SipTran.setUndulationAboveWindow16(undulationAboveWindow16AsFloat);}
		if(!"".equals(undulationAboveWindow17)){
			float undulationAboveWindow17AsFloat=Float.parseFloat(undulationAboveWindow17);
			ShellStage3SipTran.setUndulationAboveWindow17(undulationAboveWindow17AsFloat);}
		if(!"".equals(undulationAboveWindow18)){
			float undulationAboveWindow18AsFloat=Float.parseFloat(undulationAboveWindow18);
			ShellStage3SipTran.setUndulationAboveWindow18(undulationAboveWindow18AsFloat);}
		if(!"".equals(undulationAboveWindow19)){
			float undulationAboveWindow19AsFloat=Float.parseFloat(undulationAboveWindow19);
			ShellStage3SipTran.setUndulationAboveWindow19(undulationAboveWindow19AsFloat);}
		if(!"".equals(undulationAboveWindow20)){
			float undulationAboveWindow20AsFloat=Float.parseFloat(undulationAboveWindow20);
			ShellStage3SipTran.setUndulationAboveWindow20(undulationAboveWindow20AsFloat);}
		if(!"".equals(undulationAboveWindow21)){
			float undulationAboveWindow21AsFloat=Float.parseFloat(undulationAboveWindow21);
			ShellStage3SipTran.setUndulationAboveWindow21(undulationAboveWindow21AsFloat);}
		if(!"".equals(undulationAboveWindow22)){
			float undulationAboveWindow22AsFloat=Float.parseFloat(undulationAboveWindow22);
			ShellStage3SipTran.setUndulationAboveWindow22(undulationAboveWindow22AsFloat);}
		if(!"".equals(undulationAboveWindow23)){
			float undulationAboveWindow23AsFloat=Float.parseFloat(undulationAboveWindow23);
			ShellStage3SipTran.setUndulationAboveWindow23(undulationAboveWindow23AsFloat);}
		if(!"".equals(undulationAboveWindow24)){
			float undulationAboveWindow24AsFloat=Float.parseFloat(undulationAboveWindow24);
			ShellStage3SipTran.setUndulationAboveWindow24(undulationAboveWindow24AsFloat);}
		if(!"".equals(undulationAboveWindow25)){
			float undulationAboveWindow25AsFloat=Float.parseFloat(undulationAboveWindow25);
			ShellStage3SipTran.setUndulationAboveWindow25(undulationAboveWindow25AsFloat);}
		if(!"".equals(undulationAboveWindow26)){
			float undulationAboveWindow26AsFloat=Float.parseFloat(undulationAboveWindow26);
			ShellStage3SipTran.setUndulationAboveWindow26(undulationAboveWindow26AsFloat);}
		if(!"".equals(undulationAboveWindow27)){
			float undulationAboveWindow27AsFloat=Float.parseFloat(undulationAboveWindow27);
			ShellStage3SipTran.setUndulationAboveWindow27(undulationAboveWindow27AsFloat);}
		if(!"".equals(undulationAboveWindow28)){
			float undulationAboveWindow28AsFloat=Float.parseFloat(undulationAboveWindow28);
			ShellStage3SipTran.setUndulationAboveWindow28(undulationAboveWindow28AsFloat);}
		if(!"".equals(undulationAboveWindow29)){
			float undulationAboveWindow29AsFloat=Float.parseFloat(undulationAboveWindow29);
			ShellStage3SipTran.setUndulationAboveWindow29(undulationAboveWindow29AsFloat);}
		if(!"".equals(undulationAboveWindow30)){
			float undulationAboveWindow30AsFloat=Float.parseFloat(undulationAboveWindow30);
			ShellStage3SipTran.setUndulationAboveWindow30(undulationAboveWindow30AsFloat);}
		if(!"".equals(undulationAboveWindow31)){
			float undulationAboveWindow31AsFloat=Float.parseFloat(undulationAboveWindow31);
			ShellStage3SipTran.setUndulationAboveWindow31(undulationAboveWindow31AsFloat);}
		if(!"".equals(undulationAboveWindow32)){
			float undulationAboveWindow32AsFloat=Float.parseFloat(undulationAboveWindow32);
			ShellStage3SipTran.setUndulationAboveWindow32(undulationAboveWindow32AsFloat);}
		if(!"".equals(undulationAboveWindow33)){
			float undulationAboveWindow33AsFloat=Float.parseFloat(undulationAboveWindow33);
			ShellStage3SipTran.setUndulationAboveWindow33(undulationAboveWindow33AsFloat);}
		if(!"".equals(undulationAboveWindow34)){
			float undulationAboveWindow34AsFloat=Float.parseFloat(undulationAboveWindow34);
			ShellStage3SipTran.setUndulationAboveWindow34(undulationAboveWindow34AsFloat);}
		if(!"".equals(undulationAboveWindow35)){
			float undulationAboveWindow35AsFloat=Float.parseFloat(undulationAboveWindow35);
			ShellStage3SipTran.setUndulationAboveWindow35(undulationAboveWindow35AsFloat);}
		if(!"".equals(undulationAboveWindow36)){
			float undulationAboveWindow36AsFloat=Float.parseFloat(undulationAboveWindow36);
			ShellStage3SipTran.setUndulationAboveWindow36(undulationAboveWindow36AsFloat);}
		if(!"".equals(undulationAboveWindow37)){
			float undulationAboveWindow37AsFloat=Float.parseFloat(undulationAboveWindow37);
			ShellStage3SipTran.setUndulationAboveWindow37(undulationAboveWindow37AsFloat);}
		if(!"".equals(undulationAboveWindow38)){
			float undulationAboveWindow38AsFloat=Float.parseFloat(undulationAboveWindow38);
			ShellStage3SipTran.setUndulationAboveWindow38(undulationAboveWindow38AsFloat);}
		if(!"".equals(undulationAboveWindow39)){
			float undulationAboveWindow39AsFloat=Float.parseFloat(undulationAboveWindow39);
			ShellStage3SipTran.setUndulationAboveWindow39(undulationAboveWindow39AsFloat);}
		if(!"".equals(undulationAboveWindow40)){
			float undulationAboveWindow40AsFloat=Float.parseFloat(undulationAboveWindow40);
			ShellStage3SipTran.setUndulationAboveWindow40(undulationAboveWindow40AsFloat);}
		if(!"".equals(undulationAboveWindow41)){
			float undulationAboveWindow41AsFloat=Float.parseFloat(undulationAboveWindow41);
			ShellStage3SipTran.setUndulationAboveWindow41(undulationAboveWindow41AsFloat);}
		if(!"".equals(undulationAboveWindow42)){
			float undulationAboveWindow42AsFloat=Float.parseFloat(undulationAboveWindow42);
			ShellStage3SipTran.setUndulationAboveWindow42(undulationAboveWindow42AsFloat);}

		
		if(!"".equals(undulationBelowWindow1)){
			float undulationBelowWindow1AsFLoat=Float.parseFloat(undulationBelowWindow1);
			ShellStage3SipTran.setUndulationBelowWindow1(undulationBelowWindow1AsFLoat);}
		if(!"".equals(undulationBelowWindow2)){
			float undulationBelowWindow2AsFLoat=Float.parseFloat(undulationBelowWindow2);
			ShellStage3SipTran.setUndulationBelowWindow2(undulationBelowWindow2AsFLoat);}
		if(!"".equals(undulationBelowWindow3)){
			float undulationBelowWindow3AsFLoat=Float.parseFloat(undulationBelowWindow3);
			ShellStage3SipTran.setUndulationBelowWindow3(undulationBelowWindow3AsFLoat);}
		if(!"".equals(undulationBelowWindow4)){
			float undulationBelowWindow4AsFLoat=Float.parseFloat(undulationBelowWindow4);
			ShellStage3SipTran.setUndulationBelowWindow4(undulationBelowWindow4AsFLoat);}
		if(!"".equals(undulationBelowWindow5)){
			float undulationBelowWindow5AsFLoat=Float.parseFloat(undulationBelowWindow5);
			ShellStage3SipTran.setUndulationBelowWindow5(undulationBelowWindow5AsFLoat);}
		if(!"".equals(undulationBelowWindow6)){
			float undulationBelowWindow6AsFLoat=Float.parseFloat(undulationBelowWindow6);
			ShellStage3SipTran.setUndulationBelowWindow6(undulationBelowWindow6AsFLoat);}
		if(!"".equals(undulationBelowWindow7)){
			float undulationBelowWindow7AsFLoat=Float.parseFloat(undulationBelowWindow7);
			ShellStage3SipTran.setUndulationBelowWindow7(undulationBelowWindow7AsFLoat);}
		if(!"".equals(undulationBelowWindow8)){
			float undulationBelowWindow8AsFLoat=Float.parseFloat(undulationBelowWindow8);
			ShellStage3SipTran.setUndulationBelowWindow8(undulationBelowWindow8AsFLoat);}
		if(!"".equals(undulationBelowWindow9)){
			float undulationBelowWindow9AsFLoat=Float.parseFloat(undulationBelowWindow9);
			ShellStage3SipTran.setUndulationBelowWindow9(undulationBelowWindow9AsFLoat);}
		if(!"".equals(undulationBelowWindow10)){
			float undulationBelowWindow10AsFLoat=Float.parseFloat(undulationBelowWindow10);
			ShellStage3SipTran.setUndulationBelowWindow10(undulationBelowWindow10AsFLoat);}
		if(!"".equals(undulationBelowWindow11)){
			float undulationBelowWindo11AsFLoat=Float.parseFloat(undulationBelowWindow11);
			ShellStage3SipTran.setUndulationBelowWindow11(undulationBelowWindo11AsFLoat);}
		if(!"".equals(undulationBelowWindow12)){
			float undulationBelowWindow12AsFLoat=Float.parseFloat(undulationBelowWindow12);
			ShellStage3SipTran.setUndulationBelowWindow12(undulationBelowWindow12AsFLoat);}
		if(!"".equals(undulationBelowWindow13)){
			float undulationBelowWindow13AsFLoat=Float.parseFloat(undulationBelowWindow13);
			ShellStage3SipTran.setUndulationBelowWindow13(undulationBelowWindow13AsFLoat);}
		if(!"".equals(undulationBelowWindow14)){
			float undulationBelowWindow14AsFLoat=Float.parseFloat(undulationBelowWindow14);
			ShellStage3SipTran.setUndulationBelowWindow14(undulationBelowWindow14AsFLoat);}
		if(!"".equals(undulationBelowWindow15)){
			float undulationBelowWindow15AsFLoat=Float.parseFloat(undulationBelowWindow15);
			ShellStage3SipTran.setUndulationBelowWindow15(undulationBelowWindow15AsFLoat);}
		if(!"".equals(undulationBelowWindow16)){
			float undulationBelowWindow16AsFLoat=Float.parseFloat(undulationBelowWindow16);
			ShellStage3SipTran.setUndulationBelowWindow16(undulationBelowWindow16AsFLoat);}
		if(!"".equals(undulationBelowWindow17)){
			float undulationBelowWindow17AsFLoat=Float.parseFloat(undulationBelowWindow17);
			ShellStage3SipTran.setUndulationBelowWindow17(undulationBelowWindow17AsFLoat);}
		if(!"".equals(undulationBelowWindow18)){
			float undulationBelowWindow18AsFLoat=Float.parseFloat(undulationBelowWindow18);
			ShellStage3SipTran.setUndulationBelowWindow18(undulationBelowWindow18AsFLoat);}
		if(!"".equals(undulationBelowWindow19)){
			float undulationBelowWindow19AsFLoat=Float.parseFloat(undulationBelowWindow19);
			ShellStage3SipTran.setUndulationBelowWindow19(undulationBelowWindow19AsFLoat);}
		if(!"".equals(undulationBelowWindow20)){
			float undulationBelowWindow20AsFLoat=Float.parseFloat(undulationBelowWindow20);
			ShellStage3SipTran.setUndulationBelowWindow20(undulationBelowWindow20AsFLoat);}
		if(!"".equals(undulationBelowWindow21)){
			float undulationBelowWindow21AsFLoat=Float.parseFloat(undulationBelowWindow21);
			ShellStage3SipTran.setUndulationBelowWindow21(undulationBelowWindow21AsFLoat);}
		if(!"".equals(undulationBelowWindow22)){
			float undulationBelowWindow22AsFLoat=Float.parseFloat(undulationBelowWindow22);
			ShellStage3SipTran.setUndulationBelowWindow22(undulationBelowWindow22AsFLoat);}
		if(!"".equals(undulationBelowWindow23)){
			float undulationBelowWindow23AsFLoat=Float.parseFloat(undulationBelowWindow23);
			ShellStage3SipTran.setUndulationBelowWindow23(undulationBelowWindow23AsFLoat);}
		if(!"".equals(undulationBelowWindow24)){
			float undulationBelowWindow24AsFLoat=Float.parseFloat(undulationBelowWindow24);
			ShellStage3SipTran.setUndulationBelowWindow24(undulationBelowWindow24AsFLoat);}
		if(!"".equals(undulationBelowWindow25)){
			float undulationBelowWindow25AsFLoat=Float.parseFloat(undulationBelowWindow25);
			ShellStage3SipTran.setUndulationBelowWindow25(undulationBelowWindow25AsFLoat);}
		if(!"".equals(undulationBelowWindow26)){
			float undulationBelowWindow26AsFLoat=Float.parseFloat(undulationBelowWindow26);
			ShellStage3SipTran.setUndulationBelowWindow26(undulationBelowWindow26AsFLoat);}
		if(!"".equals(undulationBelowWindow27)){
			float undulationBelowWindow27AsFLoat=Float.parseFloat(undulationBelowWindow27);
			ShellStage3SipTran.setUndulationBelowWindow27(undulationBelowWindow27AsFLoat);}
		if(!"".equals(undulationBelowWindow28)){
			float undulationBelowWindow28AsFLoat=Float.parseFloat(undulationBelowWindow28);
			ShellStage3SipTran.setUndulationBelowWindow28(undulationBelowWindow28AsFLoat);}
		if(!"".equals(undulationBelowWindow29)){
			float undulationBelowWindow29AsFLoat=Float.parseFloat(undulationBelowWindow29);
			ShellStage3SipTran.setUndulationBelowWindow29(undulationBelowWindow29AsFLoat);}
		if(!"".equals(undulationBelowWindow30)){
			float undulationBelowWindow30AsFLoat=Float.parseFloat(undulationBelowWindow30);
			ShellStage3SipTran.setUndulationBelowWindow30(undulationBelowWindow30AsFLoat);}
		if(!"".equals(undulationBelowWindow31)){
			float undulationBelowWindow31AsFLoat=Float.parseFloat(undulationBelowWindow31);
			ShellStage3SipTran.setUndulationBelowWindow31(undulationBelowWindow31AsFLoat);}
		if(!"".equals(undulationBelowWindow32)){
			float undulationBelowWindow32AsFLoat=Float.parseFloat(undulationBelowWindow32);
			ShellStage3SipTran.setUndulationBelowWindow32(undulationBelowWindow32AsFLoat);}
		if(!"".equals(undulationBelowWindow33)){
			float undulationBelowWindow33AsFLoat=Float.parseFloat(undulationBelowWindow33);
			ShellStage3SipTran.setUndulationBelowWindow33(undulationBelowWindow33AsFLoat);}
		if(!"".equals(undulationBelowWindow34)){
			float undulationBelowWindow34AsFLoat=Float.parseFloat(undulationBelowWindow34);
			ShellStage3SipTran.setUndulationBelowWindow34(undulationBelowWindow34AsFLoat);}
		if(!"".equals(undulationBelowWindow35)){
			float undulationBelowWindow35AsFLoat=Float.parseFloat(undulationBelowWindow35);
			ShellStage3SipTran.setUndulationBelowWindow35(undulationBelowWindow35AsFLoat);}
		if(!"".equals(undulationBelowWindow36)){
			float undulationBelowWindow36AsFLoat=Float.parseFloat(undulationBelowWindow36);
			ShellStage3SipTran.setUndulationBelowWindow36(undulationBelowWindow36AsFLoat);}
		if(!"".equals(undulationBelowWindow37)){
			float undulationBelowWindow37AsFLoat=Float.parseFloat(undulationBelowWindow37);
			ShellStage3SipTran.setUndulationBelowWindow37(undulationBelowWindow37AsFLoat);}
		if(!"".equals(undulationBelowWindow38)){
			float undulationBelowWindow38AsFLoat=Float.parseFloat(undulationBelowWindow38);
			ShellStage3SipTran.setUndulationBelowWindow38(undulationBelowWindow38AsFLoat);}
		if(!"".equals(undulationBelowWindow39)){
			float undulationBelowWindow39AsFLoat=Float.parseFloat(undulationBelowWindow39);
			ShellStage3SipTran.setUndulationBelowWindow39(undulationBelowWindow39AsFLoat);}
		if(!"".equals(undulationBelowWindow40)){
			float undulationBelowWindow40AsFLoat=Float.parseFloat(undulationBelowWindow40);
			ShellStage3SipTran.setUndulationBelowWindow40(undulationBelowWindow40AsFLoat);}
		if(!"".equals(undulationBelowWindow41)){
			float undulationBelowWindow41AsFLoat=Float.parseFloat(undulationBelowWindow41);
			ShellStage3SipTran.setUndulationBelowWindow41(undulationBelowWindow41AsFLoat);}
		if(!"".equals(undulationBelowWindow42)){
			float undulationBelowWindow42AsFLoat=Float.parseFloat(undulationBelowWindow42);
			ShellStage3SipTran.setUndulationBelowWindow42(undulationBelowWindow42AsFLoat);}
		
		
		ShellStage3SipTran.setStage3SipDocNo(stage3SipDocNo);
		ShellStage3SipTran.setStage3SipShift(stage3SipShift);
		ShellStage3SipTran.setStage3DrawingNo(stage3DrawingNo);
		ShellStage3SipTran.setStage3WorkBy(stage3WorkBy);
		ShellStage3SipTran.setEndwallPpAboveCenterLh(endwallPpAboveCenterLh);
		ShellStage3SipTran.setEndwallPpAboveCenterRh(endwallPpAboveCenterRh);
		ShellStage3SipTran.setEndwallNppAboveCenterLh(endwallNppAboveCenterLh);
		ShellStage3SipTran.setEndwallNppAboveCenterRh(endwallNppAboveCenterRh);
		ShellStage3SipTran.setEndwallPpMiddleCenterLh(endwallPpMiddleCenterLh);
		ShellStage3SipTran.setEndwallPpMiddleCenterRh(endwallPpMiddleCenterRh);
		ShellStage3SipTran.setEndwallNppMiddleCenterLh(endwallNppMiddleCenterLh);
		ShellStage3SipTran.setEndwallNppMiddleCenterRh(endwallNppMiddleCenterRh);
		ShellStage3SipTran.setEndwallPpBottomCenterLh(endwallPpBottomCenterLh);
		ShellStage3SipTran.setEndwallPpBottomCenterRh(endwallPpBottomCenterRh);
		ShellStage3SipTran.setEndwallNppBottomCenterLh(endwallNppBottomCenterLh);
		ShellStage3SipTran.setEndwallNppBottomCenterRh(endwallNppBottomCenterRh);
		ShellStage3SipTran.setDentReduceSidewallEndwallFlag(dentReduceSidewallEndwallFlag);
		ShellStage3SipTran.setSkinTensioningWiFlag(skinTensioningWiFlag);
		ShellStage3SipTran.setSkinTensioningSidewallEndwallLavFlag(skinTensioningSidewallEndwallLavFlag);
		ShellStage3SipTran.setHeatedSpotFlag(heatedSpotFlag);
		ShellStage3SipTran.setWeldRainWaterFlag(weldRainWaterFlag);
		ShellStage3SipTran.setInsulatingWeldingPinFlag(insulatingWeldingPinFlag);
		ShellStage3SipTran.setFitmentWeldingSidewallFlag(fitmentWeldingSidewallFlag);
		ShellStage3SipTran.setFitmentWeldingBracketarrangementFlag(fitmentWeldingBracketarrangementFlag);
		ShellStage3SipTran.setLevelRainWaterGutterFlag(levelRainWaterGutterFlag);
		ShellStage3SipTran.setFitmentWeldingWindowbarFlag(fitmentWeldingWindowbarFlag);
		ShellStage3SipTran.setFitmentWeldingBracketLavatoryFlag(fitmentWeldingBracketLavatoryFlag);
		ShellStage3SipTran.setDetailsOfM(detailsOfModification);
		ShellStage3SipTran.setDetailsOfT(detailsOfTrial);
		ShellStage3SipTran.setRemark(remarks);
		ShellStage3SipTran.setStage3TestingStatus(stage3TestingStatus);
		ShellStage3SipTran.setEntryBy(userID);
		ShellStage3SipTran.setEntryTime(entryTime);

		
        ShellTransaction shellTran=new ShellTransaction();
		
		shellTran=(ShellTransaction) session.get(ShellTransaction.class,shellAssetIdAsInt);
		shellTran.setJigNo(stage3JigNo);
		shellTran.setShellAssembledBy(stage3ShellAssemblyBy);
		shellTran.setUnderframeCompleteMake(stage3UnderFrameMake);
		shellTran.setRoofMake(stage3RoofMake);
		shellTran.setEndwallMakePp(endwallMakePp);
		shellTran.setEndwallMakeNpp(endwallMakeNpp);
		shellTran.setSideWallMakeNoPp(sideWallMakeLh);
		shellTran.setSideWallMakeNoNpp(sideWallMakeRh);
		shellTran.setStage3SipFlag(1);
		
		
		try
		{
	
			DaoShellStage3Sip dao=new DaoShellStage3Sip();
		    dao.saveStage3(shellTran,ShellStage3SipTran);
		    System.out.println(shellAssetIdAsInt);
		    System.out.println("Shell transaction: "+shellTran.getShellTransactionId());
		    System.out.println(ShellStage3SipTran.getDetailsOfM());
		 
			return "success";
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}	
	}


	public String getShellAssetId() {
		return shellAssetId;
	}


	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}


	public String getStage3SipDocNo() {
		return stage3SipDocNo;
	}


	public void setStage3SipDocNo(String stage3SipDocNo) {
		this.stage3SipDocNo = stage3SipDocNo;
	}


	public String getStage3SipShift() {
		return stage3SipShift;
	}


	public void setStage3SipShift(String stage3SipShift) {
		this.stage3SipShift = stage3SipShift;
	}


	public String getStage3SipDate() {
		return stage3SipDate;
	}


	public void setStage3SipDate(String stage3SipDate) {
		this.stage3SipDate = stage3SipDate;
	}


	public String getStage3WorkBy() {
		return stage3WorkBy;
	}


	public void setStage3WorkBy(String stage3WorkBy) {
		this.stage3WorkBy = stage3WorkBy;
	}


	public String getStage3DrawingNo() {
		return stage3DrawingNo;
	}


	public void setStage3DrawingNo(String stage3DrawingNo) {
		this.stage3DrawingNo = stage3DrawingNo;
	}


	public String getStage3JigNo() {
		return stage3JigNo;
	}


	public void setStage3JigNo(String stage3JigNo) {
		this.stage3JigNo = stage3JigNo;
	}


	public String getStage3ShellAssemblyBy() {
		return stage3ShellAssemblyBy;
	}


	public void setStage3ShellAssemblyBy(String stage3ShellAssemblyBy) {
		this.stage3ShellAssemblyBy = stage3ShellAssemblyBy;
	}


	public String getStage3UnderFrameMake() {
		return stage3UnderFrameMake;
	}


	public void setStage3UnderFrameMake(String stage3UnderFrameMake) {
		this.stage3UnderFrameMake = stage3UnderFrameMake;
	}


	public String getStage3RoofMake() {
		return stage3RoofMake;
	}


	public void setStage3RoofMake(String stage3RoofMake) {
		this.stage3RoofMake = stage3RoofMake;
	}


	public String getEndwallMakePp() {
		return endwallMakePp;
	}


	public void setEndwallMakePp(String endwallMakePp) {
		this.endwallMakePp = endwallMakePp;
	}


	public String getSideWallMakeLh() {
		return sideWallMakeLh;
	}


	public void setSideWallMakeLh(String sideWallMakeLh) {
		this.sideWallMakeLh = sideWallMakeLh;
	}


	public String getEndwallMakeNpp() {
		return endwallMakeNpp;
	}


	public void setEndwallMakeNpp(String endwallMakeNpp) {
		this.endwallMakeNpp = endwallMakeNpp;
	}


	public String getSideWallMakeRh() {
		return sideWallMakeRh;
	}


	public void setSideWallMakeRh(String sideWallMakeRh) {
		this.sideWallMakeRh = sideWallMakeRh;
	}


	public String getUndulationAboveWindow1() {
		return undulationAboveWindow1;
	}


	public void setUndulationAboveWindow1(String undulationAboveWindow1) {
		this.undulationAboveWindow1 = undulationAboveWindow1;
	}


	public String getUndulationBelowWindow1() {
		return undulationBelowWindow1;
	}


	public void setUndulationBelowWindow1(String undulationBelowWindow1) {
		this.undulationBelowWindow1 = undulationBelowWindow1;
	}


	public String getUndulationAboveWindow2() {
		return undulationAboveWindow2;
	}


	public void setUndulationAboveWindow2(String undulationAboveWindow2) {
		this.undulationAboveWindow2 = undulationAboveWindow2;
	}


	public String getUndulationBelowWindow2() {
		return undulationBelowWindow2;
	}


	public void setUndulationBelowWindow2(String undulationBelowWindow2) {
		this.undulationBelowWindow2 = undulationBelowWindow2;
	}


	public String getUndulationAboveWindow3() {
		return undulationAboveWindow3;
	}


	public void setUndulationAboveWindow3(String undulationAboveWindow3) {
		this.undulationAboveWindow3 = undulationAboveWindow3;
	}


	public String getUndulationBelowWindow3() {
		return undulationBelowWindow3;
	}


	public void setUndulationBelowWindow3(String undulationBelowWindow3) {
		this.undulationBelowWindow3 = undulationBelowWindow3;
	}


	public String getUndulationAboveWindow4() {
		return undulationAboveWindow4;
	}


	public void setUndulationAboveWindow4(String undulationAboveWindow4) {
		this.undulationAboveWindow4 = undulationAboveWindow4;
	}


	public String getUndulationBelowWindow4() {
		return undulationBelowWindow4;
	}


	public void setUndulationBelowWindow4(String undulationBelowWindow4) {
		this.undulationBelowWindow4 = undulationBelowWindow4;
	}


	public String getUndulationAboveWindow5() {
		return undulationAboveWindow5;
	}


	public void setUndulationAboveWindow5(String undulationAboveWindow5) {
		this.undulationAboveWindow5 = undulationAboveWindow5;
	}


	public String getUndulationBelowWindow5() {
		return undulationBelowWindow5;
	}


	public void setUndulationBelowWindow5(String undulationBelowWindow5) {
		this.undulationBelowWindow5 = undulationBelowWindow5;
	}


	public String getUndulationAboveWindow6() {
		return undulationAboveWindow6;
	}


	public void setUndulationAboveWindow6(String undulationAboveWindow6) {
		this.undulationAboveWindow6 = undulationAboveWindow6;
	}


	public String getUndulationBelowWindow6() {
		return undulationBelowWindow6;
	}


	public void setUndulationBelowWindow6(String undulationBelowWindow6) {
		this.undulationBelowWindow6 = undulationBelowWindow6;
	}


	public String getUndulationAboveWindow7() {
		return undulationAboveWindow7;
	}


	public void setUndulationAboveWindow7(String undulationAboveWindow7) {
		this.undulationAboveWindow7 = undulationAboveWindow7;
	}


	public String getUndulationBelowWindow7() {
		return undulationBelowWindow7;
	}


	public void setUndulationBelowWindow7(String undulationBelowWindow7) {
		this.undulationBelowWindow7 = undulationBelowWindow7;
	}


	public String getUndulationAboveWindow8() {
		return undulationAboveWindow8;
	}


	public void setUndulationAboveWindow8(String undulationAboveWindow8) {
		this.undulationAboveWindow8 = undulationAboveWindow8;
	}


	public String getUndulationBelowWindow8() {
		return undulationBelowWindow8;
	}


	public void setUndulationBelowWindow8(String undulationBelowWindow8) {
		this.undulationBelowWindow8 = undulationBelowWindow8;
	}


	public String getUndulationAboveWindow9() {
		return undulationAboveWindow9;
	}


	public void setUndulationAboveWindow9(String undulationAboveWindow9) {
		this.undulationAboveWindow9 = undulationAboveWindow9;
	}


	public String getUndulationBelowWindow9() {
		return undulationBelowWindow9;
	}


	public void setUndulationBelowWindow9(String undulationBelowWindow9) {
		this.undulationBelowWindow9 = undulationBelowWindow9;
	}


	public String getUndulationAboveWindow10() {
		return undulationAboveWindow10;
	}


	public void setUndulationAboveWindow10(String undulationAboveWindow10) {
		this.undulationAboveWindow10 = undulationAboveWindow10;
	}


	public String getUndulationBelowWindow10() {
		return undulationBelowWindow10;
	}


	public void setUndulationBelowWindow10(String undulationBelowWindow10) {
		this.undulationBelowWindow10 = undulationBelowWindow10;
	}


	public String getUndulationAboveWindow11() {
		return undulationAboveWindow11;
	}


	public void setUndulationAboveWindow11(String undulationAboveWindow11) {
		this.undulationAboveWindow11 = undulationAboveWindow11;
	}


	public String getUndulationBelowWindow11() {
		return undulationBelowWindow11;
	}


	public void setUndulationBelowWindow11(String undulationBelowWindow11) {
		this.undulationBelowWindow11 = undulationBelowWindow11;
	}


	public String getUndulationAboveWindow12() {
		return undulationAboveWindow12;
	}


	public void setUndulationAboveWindow12(String undulationAboveWindow12) {
		this.undulationAboveWindow12 = undulationAboveWindow12;
	}


	public String getUndulationBelowWindow12() {
		return undulationBelowWindow12;
	}


	public void setUndulationBelowWindow12(String undulationBelowWindow12) {
		this.undulationBelowWindow12 = undulationBelowWindow12;
	}


	public String getUndulationAboveWindow13() {
		return undulationAboveWindow13;
	}


	public void setUndulationAboveWindow13(String undulationAboveWindow13) {
		this.undulationAboveWindow13 = undulationAboveWindow13;
	}


	public String getUndulationBelowWindow13() {
		return undulationBelowWindow13;
	}


	public void setUndulationBelowWindow13(String undulationBelowWindow13) {
		this.undulationBelowWindow13 = undulationBelowWindow13;
	}


	public String getUndulationAboveWindow14() {
		return undulationAboveWindow14;
	}


	public void setUndulationAboveWindow14(String undulationAboveWindow14) {
		this.undulationAboveWindow14 = undulationAboveWindow14;
	}


	public String getUndulationBelowWindow14() {
		return undulationBelowWindow14;
	}


	public void setUndulationBelowWindow14(String undulationBelowWindow14) {
		this.undulationBelowWindow14 = undulationBelowWindow14;
	}


	public String getUndulationAboveWindow15() {
		return undulationAboveWindow15;
	}


	public void setUndulationAboveWindow15(String undulationAboveWindow15) {
		this.undulationAboveWindow15 = undulationAboveWindow15;
	}


	public String getUndulationBelowWindow15() {
		return undulationBelowWindow15;
	}


	public void setUndulationBelowWindow15(String undulationBelowWindow15) {
		this.undulationBelowWindow15 = undulationBelowWindow15;
	}


	public String getUndulationAboveWindow16() {
		return undulationAboveWindow16;
	}


	public void setUndulationAboveWindow16(String undulationAboveWindow16) {
		this.undulationAboveWindow16 = undulationAboveWindow16;
	}


	public String getUndulationBelowWindow16() {
		return undulationBelowWindow16;
	}


	public void setUndulationBelowWindow16(String undulationBelowWindow16) {
		this.undulationBelowWindow16 = undulationBelowWindow16;
	}


	public String getUndulationAboveWindow17() {
		return undulationAboveWindow17;
	}


	public void setUndulationAboveWindow17(String undulationAboveWindow17) {
		this.undulationAboveWindow17 = undulationAboveWindow17;
	}


	public String getUndulationBelowWindow17() {
		return undulationBelowWindow17;
	}


	public void setUndulationBelowWindow17(String undulationBelowWindow17) {
		this.undulationBelowWindow17 = undulationBelowWindow17;
	}


	public String getUndulationAboveWindow18() {
		return undulationAboveWindow18;
	}


	public void setUndulationAboveWindow18(String undulationAboveWindow18) {
		this.undulationAboveWindow18 = undulationAboveWindow18;
	}


	public String getUndulationBelowWindow18() {
		return undulationBelowWindow18;
	}


	public void setUndulationBelowWindow18(String undulationBelowWindow18) {
		this.undulationBelowWindow18 = undulationBelowWindow18;
	}


	public String getUndulationAboveWindow19() {
		return undulationAboveWindow19;
	}


	public void setUndulationAboveWindow19(String undulationAboveWindow19) {
		this.undulationAboveWindow19 = undulationAboveWindow19;
	}


	public String getUndulationBelowWindow19() {
		return undulationBelowWindow19;
	}


	public void setUndulationBelowWindow19(String undulationBelowWindow19) {
		this.undulationBelowWindow19 = undulationBelowWindow19;
	}


	public String getUndulationAboveWindow20() {
		return undulationAboveWindow20;
	}


	public void setUndulationAboveWindow20(String undulationAboveWindow20) {
		this.undulationAboveWindow20 = undulationAboveWindow20;
	}


	public String getUndulationBelowWindow20() {
		return undulationBelowWindow20;
	}


	public void setUndulationBelowWindow20(String undulationBelowWindow20) {
		this.undulationBelowWindow20 = undulationBelowWindow20;
	}


	public String getUndulationAboveWindow21() {
		return undulationAboveWindow21;
	}


	public void setUndulationAboveWindow21(String undulationAboveWindow21) {
		this.undulationAboveWindow21 = undulationAboveWindow21;
	}


	public String getUndulationBelowWindow21() {
		return undulationBelowWindow21;
	}


	public void setUndulationBelowWindow21(String undulationBelowWindow21) {
		this.undulationBelowWindow21 = undulationBelowWindow21;
	}


	public String getUndulationAboveWindow22() {
		return undulationAboveWindow22;
	}


	public void setUndulationAboveWindow22(String undulationAboveWindow22) {
		this.undulationAboveWindow22 = undulationAboveWindow22;
	}


	public String getUndulationBelowWindow22() {
		return undulationBelowWindow22;
	}


	public void setUndulationBelowWindow22(String undulationBelowWindow22) {
		this.undulationBelowWindow22 = undulationBelowWindow22;
	}


	public String getUndulationAboveWindow23() {
		return undulationAboveWindow23;
	}


	public void setUndulationAboveWindow23(String undulationAboveWindow23) {
		this.undulationAboveWindow23 = undulationAboveWindow23;
	}


	public String getUndulationBelowWindow23() {
		return undulationBelowWindow23;
	}


	public void setUndulationBelowWindow23(String undulationBelowWindow23) {
		this.undulationBelowWindow23 = undulationBelowWindow23;
	}


	public String getUndulationAboveWindow24() {
		return undulationAboveWindow24;
	}


	public void setUndulationAboveWindow24(String undulationAboveWindow24) {
		this.undulationAboveWindow24 = undulationAboveWindow24;
	}


	public String getUndulationBelowWindow24() {
		return undulationBelowWindow24;
	}


	public void setUndulationBelowWindow24(String undulationBelowWindow24) {
		this.undulationBelowWindow24 = undulationBelowWindow24;
	}


	public String getUndulationAboveWindow25() {
		return undulationAboveWindow25;
	}


	public void setUndulationAboveWindow25(String undulationAboveWindow25) {
		this.undulationAboveWindow25 = undulationAboveWindow25;
	}


	public String getUndulationBelowWindow25() {
		return undulationBelowWindow25;
	}


	public void setUndulationBelowWindow25(String undulationBelowWindow25) {
		this.undulationBelowWindow25 = undulationBelowWindow25;
	}


	public String getUndulationAboveWindow26() {
		return undulationAboveWindow26;
	}


	public void setUndulationAboveWindow26(String undulationAboveWindow26) {
		this.undulationAboveWindow26 = undulationAboveWindow26;
	}


	public String getUndulationBelowWindow26() {
		return undulationBelowWindow26;
	}


	public void setUndulationBelowWindow26(String undulationBelowWindow26) {
		this.undulationBelowWindow26 = undulationBelowWindow26;
	}


	public String getUndulationAboveWindow27() {
		return undulationAboveWindow27;
	}


	public void setUndulationAboveWindow27(String undulationAboveWindow27) {
		this.undulationAboveWindow27 = undulationAboveWindow27;
	}


	public String getUndulationBelowWindow27() {
		return undulationBelowWindow27;
	}


	public void setUndulationBelowWindow27(String undulationBelowWindow27) {
		this.undulationBelowWindow27 = undulationBelowWindow27;
	}


	public String getUndulationAboveWindow28() {
		return undulationAboveWindow28;
	}


	public void setUndulationAboveWindow28(String undulationAboveWindow28) {
		this.undulationAboveWindow28 = undulationAboveWindow28;
	}


	public String getUndulationBelowWindow28() {
		return undulationBelowWindow28;
	}


	public void setUndulationBelowWindow28(String undulationBelowWindow28) {
		this.undulationBelowWindow28 = undulationBelowWindow28;
	}


	public String getUndulationAboveWindow29() {
		return undulationAboveWindow29;
	}


	public void setUndulationAboveWindow29(String undulationAboveWindow29) {
		this.undulationAboveWindow29 = undulationAboveWindow29;
	}


	public String getUndulationBelowWindow29() {
		return undulationBelowWindow29;
	}


	public void setUndulationBelowWindow29(String undulationBelowWindow29) {
		this.undulationBelowWindow29 = undulationBelowWindow29;
	}


	public String getUndulationAboveWindow30() {
		return undulationAboveWindow30;
	}


	public void setUndulationAboveWindow30(String undulationAboveWindow30) {
		this.undulationAboveWindow30 = undulationAboveWindow30;
	}


	public String getUndulationBelowWindow30() {
		return undulationBelowWindow30;
	}


	public void setUndulationBelowWindow30(String undulationBelowWindow30) {
		this.undulationBelowWindow30 = undulationBelowWindow30;
	}


	public String getUndulationAboveWindow31() {
		return undulationAboveWindow31;
	}


	public void setUndulationAboveWindow31(String undulationAboveWindow31) {
		this.undulationAboveWindow31 = undulationAboveWindow31;
	}


	public String getUndulationBelowWindow31() {
		return undulationBelowWindow31;
	}


	public void setUndulationBelowWindow31(String undulationBelowWindow31) {
		this.undulationBelowWindow31 = undulationBelowWindow31;
	}


	public String getUndulationAboveWindow32() {
		return undulationAboveWindow32;
	}


	public void setUndulationAboveWindow32(String undulationAboveWindow32) {
		this.undulationAboveWindow32 = undulationAboveWindow32;
	}


	public String getUndulationBelowWindow32() {
		return undulationBelowWindow32;
	}


	public void setUndulationBelowWindow32(String undulationBelowWindow32) {
		this.undulationBelowWindow32 = undulationBelowWindow32;
	}


	public String getUndulationAboveWindow33() {
		return undulationAboveWindow33;
	}


	public void setUndulationAboveWindow33(String undulationAboveWindow33) {
		this.undulationAboveWindow33 = undulationAboveWindow33;
	}


	public String getUndulationBelowWindow33() {
		return undulationBelowWindow33;
	}


	public void setUndulationBelowWindow33(String undulationBelowWindow33) {
		this.undulationBelowWindow33 = undulationBelowWindow33;
	}


	public String getUndulationAboveWindow34() {
		return undulationAboveWindow34;
	}


	public void setUndulationAboveWindow34(String undulationAboveWindow34) {
		this.undulationAboveWindow34 = undulationAboveWindow34;
	}


	public String getUndulationBelowWindow34() {
		return undulationBelowWindow34;
	}


	public void setUndulationBelowWindow34(String undulationBelowWindow34) {
		this.undulationBelowWindow34 = undulationBelowWindow34;
	}


	public String getUndulationAboveWindow35() {
		return undulationAboveWindow35;
	}


	public void setUndulationAboveWindow35(String undulationAboveWindow35) {
		this.undulationAboveWindow35 = undulationAboveWindow35;
	}


	public String getUndulationBelowWindow35() {
		return undulationBelowWindow35;
	}


	public void setUndulationBelowWindow35(String undulationBelowWindow35) {
		this.undulationBelowWindow35 = undulationBelowWindow35;
	}


	public String getUndulationAboveWindow36() {
		return undulationAboveWindow36;
	}


	public void setUndulationAboveWindow36(String undulationAboveWindow36) {
		this.undulationAboveWindow36 = undulationAboveWindow36;
	}


	public String getUndulationBelowWindow36() {
		return undulationBelowWindow36;
	}


	public void setUndulationBelowWindow36(String undulationBelowWindow36) {
		this.undulationBelowWindow36 = undulationBelowWindow36;
	}


	public String getUndulationAboveWindow37() {
		return undulationAboveWindow37;
	}


	public void setUndulationAboveWindow37(String undulationAboveWindow37) {
		this.undulationAboveWindow37 = undulationAboveWindow37;
	}


	public String getUndulationBelowWindow37() {
		return undulationBelowWindow37;
	}


	public void setUndulationBelowWindow37(String undulationBelowWindow37) {
		this.undulationBelowWindow37 = undulationBelowWindow37;
	}


	public String getUndulationAboveWindow38() {
		return undulationAboveWindow38;
	}


	public void setUndulationAboveWindow38(String undulationAboveWindow38) {
		this.undulationAboveWindow38 = undulationAboveWindow38;
	}


	public String getUndulationBelowWindow38() {
		return undulationBelowWindow38;
	}


	public void setUndulationBelowWindow38(String undulationBelowWindow38) {
		this.undulationBelowWindow38 = undulationBelowWindow38;
	}


	public String getUndulationAboveWindow39() {
		return undulationAboveWindow39;
	}


	public void setUndulationAboveWindow39(String undulationAboveWindow39) {
		this.undulationAboveWindow39 = undulationAboveWindow39;
	}


	public String getUndulationBelowWindow39() {
		return undulationBelowWindow39;
	}


	public void setUndulationBelowWindow39(String undulationBelowWindow39) {
		this.undulationBelowWindow39 = undulationBelowWindow39;
	}


	public String getUndulationAboveWindow40() {
		return undulationAboveWindow40;
	}


	public void setUndulationAboveWindow40(String undulationAboveWindow40) {
		this.undulationAboveWindow40 = undulationAboveWindow40;
	}


	public String getUndulationBelowWindow40() {
		return undulationBelowWindow40;
	}


	public void setUndulationBelowWindow40(String undulationBelowWindow40) {
		this.undulationBelowWindow40 = undulationBelowWindow40;
	}


	public String getUndulationAboveWindow41() {
		return undulationAboveWindow41;
	}


	public void setUndulationAboveWindow41(String undulationAboveWindow41) {
		this.undulationAboveWindow41 = undulationAboveWindow41;
	}


	public String getUndulationBelowWindow41() {
		return undulationBelowWindow41;
	}


	public void setUndulationBelowWindow41(String undulationBelowWindow41) {
		this.undulationBelowWindow41 = undulationBelowWindow41;
	}


	public String getUndulationAboveWindow42() {
		return undulationAboveWindow42;
	}


	public void setUndulationAboveWindow42(String undulationAboveWindow42) {
		this.undulationAboveWindow42 = undulationAboveWindow42;
	}


	public String getUndulationBelowWindow42() {
		return undulationBelowWindow42;
	}


	public void setUndulationBelowWindow42(String undulationBelowWindow42) {
		this.undulationBelowWindow42 = undulationBelowWindow42;
	}


	public String getEndwallPpAboveCenterLh() {
		return endwallPpAboveCenterLh;
	}


	public void setEndwallPpAboveCenterLh(String endwallPpAboveCenterLh) {
		this.endwallPpAboveCenterLh = endwallPpAboveCenterLh;
	}


	public String getEndwallPpAboveCenterRh() {
		return endwallPpAboveCenterRh;
	}


	public void setEndwallPpAboveCenterRh(String endwallPpAboveCenterRh) {
		this.endwallPpAboveCenterRh = endwallPpAboveCenterRh;
	}


	public String getEndwallNppAboveCenterLh() {
		return endwallNppAboveCenterLh;
	}


	public void setEndwallNppAboveCenterLh(String endwallNppAboveCenterLh) {
		this.endwallNppAboveCenterLh = endwallNppAboveCenterLh;
	}


	public String getEndwallNppAboveCenterRh() {
		return endwallNppAboveCenterRh;
	}


	public void setEndwallNppAboveCenterRh(String endwallNppAboveCenterRh) {
		this.endwallNppAboveCenterRh = endwallNppAboveCenterRh;
	}


	public String getEndwallPpMiddleCenterLh() {
		return endwallPpMiddleCenterLh;
	}


	public void setEndwallPpMiddleCenterLh(String endwallPpMiddleCenterLh) {
		this.endwallPpMiddleCenterLh = endwallPpMiddleCenterLh;
	}


	public String getEndwallPpMiddleCenterRh() {
		return endwallPpMiddleCenterRh;
	}


	public void setEndwallPpMiddleCenterRh(String endwallPpMiddleCenterRh) {
		this.endwallPpMiddleCenterRh = endwallPpMiddleCenterRh;
	}


	public String getEndwallNppMiddleCenterLh() {
		return endwallNppMiddleCenterLh;
	}


	public void setEndwallNppMiddleCenterLh(String endwallNppMiddleCenterLh) {
		this.endwallNppMiddleCenterLh = endwallNppMiddleCenterLh;
	}


	public String getEndwallNppMiddleCenterRh() {
		return endwallNppMiddleCenterRh;
	}


	public void setEndwallNppMiddleCenterRh(String endwallNppMiddleCenterRh) {
		this.endwallNppMiddleCenterRh = endwallNppMiddleCenterRh;
	}


	public String getEndwallPpBottomCenterLh() {
		return endwallPpBottomCenterLh;
	}


	public void setEndwallPpBottomCenterLh(String endwallPpBottomCenterLh) {
		this.endwallPpBottomCenterLh = endwallPpBottomCenterLh;
	}


	public String getEndwallPpBottomCenterRh() {
		return endwallPpBottomCenterRh;
	}


	public void setEndwallPpBottomCenterRh(String endwallPpBottomCenterRh) {
		this.endwallPpBottomCenterRh = endwallPpBottomCenterRh;
	}


	public String getEndwallNppBottomCenterLh() {
		return endwallNppBottomCenterLh;
	}


	public void setEndwallNppBottomCenterLh(String endwallNppBottomCenterLh) {
		this.endwallNppBottomCenterLh = endwallNppBottomCenterLh;
	}


	public String getEndwallNppBottomCenterRh() {
		return endwallNppBottomCenterRh;
	}


	public void setEndwallNppBottomCenterRh(String endwallNppBottomCenterRh) {
		this.endwallNppBottomCenterRh = endwallNppBottomCenterRh;
	}


	public String getDentReduceSidewallEndwallFlag() {
		return dentReduceSidewallEndwallFlag;
	}


	public void setDentReduceSidewallEndwallFlag(String dentReduceSidewallEndwallFlag) {
		this.dentReduceSidewallEndwallFlag = dentReduceSidewallEndwallFlag;
	}


	public String getSkinTensioningWiFlag() {
		return skinTensioningWiFlag;
	}


	public void setSkinTensioningWiFlag(String skinTensioningWiFlag) {
		this.skinTensioningWiFlag = skinTensioningWiFlag;
	}


	public String getSkinTensioningSidewallEndwallLavFlag() {
		return skinTensioningSidewallEndwallLavFlag;
	}


	public void setSkinTensioningSidewallEndwallLavFlag(String skinTensioningSidewallEndwallLavFlag) {
		this.skinTensioningSidewallEndwallLavFlag = skinTensioningSidewallEndwallLavFlag;
	}


	public String getHeatedSpotFlag() {
		return heatedSpotFlag;
	}


	public void setHeatedSpotFlag(String heatedSpotFlag) {
		this.heatedSpotFlag = heatedSpotFlag;
	}


	public String getWeldRainWaterFlag() {
		return weldRainWaterFlag;
	}


	public void setWeldRainWaterFlag(String weldRainWaterFlag) {
		this.weldRainWaterFlag = weldRainWaterFlag;
	}


	public String getInsulatingWeldingPinFlag() {
		return insulatingWeldingPinFlag;
	}


	public void setInsulatingWeldingPinFlag(String insulatingWeldingPinFlag) {
		this.insulatingWeldingPinFlag = insulatingWeldingPinFlag;
	}


	public String getFitmentWeldingSidewallFlag() {
		return fitmentWeldingSidewallFlag;
	}


	public void setFitmentWeldingSidewallFlag(String fitmentWeldingSidewallFlag) {
		this.fitmentWeldingSidewallFlag = fitmentWeldingSidewallFlag;
	}


	public String getFitmentWeldingBracketarrangementFlag() {
		return fitmentWeldingBracketarrangementFlag;
	}


	public void setFitmentWeldingBracketarrangementFlag(String fitmentWeldingBracketarrangementFlag) {
		this.fitmentWeldingBracketarrangementFlag = fitmentWeldingBracketarrangementFlag;
	}


	public String getLevelRainWaterGutterFlag() {
		return levelRainWaterGutterFlag;
	}


	public void setLevelRainWaterGutterFlag(String levelRainWaterGutterFlag) {
		this.levelRainWaterGutterFlag = levelRainWaterGutterFlag;
	}


	public String getFitmentWeldingWindowbarFlag() {
		return fitmentWeldingWindowbarFlag;
	}


	public void setFitmentWeldingWindowbarFlag(String fitmentWeldingWindowbarFlag) {
		this.fitmentWeldingWindowbarFlag = fitmentWeldingWindowbarFlag;
	}


	public String getFitmentWeldingBracketLavatoryFlag() {
		return fitmentWeldingBracketLavatoryFlag;
	}


	public void setFitmentWeldingBracketLavatoryFlag(String fitmentWeldingBracketLavatoryFlag) {
		this.fitmentWeldingBracketLavatoryFlag = fitmentWeldingBracketLavatoryFlag;
	}

	public String getDetailsOfModification() {
		return detailsOfModification;
	}


	public void setDetailsOfModification(String detailsOfModification) {
		this.detailsOfModification = detailsOfModification;
	}


	public String getDetailsOfTrial() {
		return detailsOfTrial;
	}


	public void setDetailsOfTrial(String detailsOfTrial) {
		this.detailsOfTrial = detailsOfTrial;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public String getStage3TestingStatus() {
		return stage3TestingStatus;
	}


	public void setStage3TestingStatus(String stage3TestingStatus) {
		this.stage3TestingStatus = stage3TestingStatus;
	}

	
	
}
