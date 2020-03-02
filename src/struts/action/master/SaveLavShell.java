package struts.action.master;
import dao.DaoLavSideWallSip;

import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import beans.ShellLavSideWallSipTran;
import beans.ShellTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;
public class SaveLavShell {
	private String shellAssetId;
	private String lavsidewallSipDocNo;
	private String lavsidewallSipShift;
	private String lavsidewallSipDate;
	private String lavsidewallNo;
	private String lavsidewallShellType;
	private String drawingNo;
	private String wiNo;
	private String frameWorkByLav1;
	private String frameJigRoboticsBoLav1;
	private String frameWorkByLav2;;
	private String frameJigRoboticsBoLav2;
	private String frameWorkByLav3;
	private String frameJigRoboticsBoLav3;
	private String frameWorkByLav4;
    private String frameJigRoboticsBoLav4;
	private String spotWeldingByLav1;
	private String spotWeldingJigRoboticsBoLav1;
    private String spotWeldingByLav2;
	private String spotWeldingJigRoboticsBoLav2;
	private String spotWeldingByLav3;
	private String spotWeldingJigRoboticsBoLav3;
    private String spotWeldingByLav4;
	private String spotWeldingJigRoboticsBoLav4;
	private String interlockJointByLav1;
	private String interlockJointJigRoboticsBoLav1;
	private String interlockJointByLav2;
    private String interlockJointJigRoboticsBoLav2;
	private String interlockJointByLav3;
	private String interlockJointJigRoboticsBoLav3;
	private String interlockJointByLav4;
	private String interlockJointJigRoboticsBoLav4;
	private String lavsidewallMake1;
	private String lavsidewallMake2;
	private String lavsidewallMake3;
	private String lavsidewallMake4;
	private String observationItemsAsPerDrawingFlag;
	private String observationComplianceWiFlag;
	private String observationWeldingThroatFlag;
	private String totalheightLav1;
	private String totalheightLav2;
	private String totalheightLav3;
	private String totalheightLav4;
	private String totalwidthoutsideLav1;
    private String totalwidthoutsideLav2;
	private String totalwidthoutsideLav3;
	private String totalwidthoutsideLav4;
	private String totalwidthinsideLav1;
    private String totalwidthinsideLav2;
	private String totalwidthinsideLav3;
	private String totalwidthinsideLav4;
	private String windowcutOutLav1;
	private String windowcutOutLav2;
	private String windowcutOutLav3;
    private String windowcutOutLav4;
	private String windowcutOutsideLav1;
	private String windowcutOutsideLav2;
	private String windowcutOutsideLav3;
	private String windowcutOutsideLav4;
	private String pillarheightSheetLav1;
	private String pillarheightSheetLav2;
	private String pillarheightSheetLav3;
	private String pillarheightSheetLav4;
    private String windowprofilecutForExhaustLav1;
	private String windowprofilecutForExhaustLav2;
	private String windowprofilecutForExhaustLav3;
	private String windowprofilecutForExhaustLav4;
	private String lavsidewallFrameAsPerDrawingFlag;
    private String lavsidewallMemberWeldingFlag;
	private String conditionLavsidewallMemberJointweldingFlag;
    private String conditionLavsidewallSheetLaserweldingFlag;
    private String detailsOfModification;
    private String detailsOfTrial;
    private String remarks;
    private String lavSidewallTestingStatus;
   
  
	public String LavShell()
    {
    	Session session=null;
    	session=HibernateConfig.getSession();
    	HttpSession httpSession=ServletActionContext.getRequest().getSession();
    	String userID=(String)httpSession.getAttribute("userid");
    	Timestamp entryTime=new Timestamp(System.currentTimeMillis());
    	ShellLavSideWallSipTran shellLavSideWallSipTran=new ShellLavSideWallSipTran();
    	Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
    	shellLavSideWallSipTran.setShellAssetId(shellAssetIdAsInt);
    	shellLavSideWallSipTran.setLavsidewallSipDocNo(lavsidewallSipDocNo);
    	shellLavSideWallSipTran.setLavsidewallSipShift(lavsidewallSipShift);
    	shellLavSideWallSipTran.setLavsidewallNo(lavsidewallNo);
    	shellLavSideWallSipTran.setLavsidewallShellType(lavsidewallShellType);
    	if(!"".equals(lavsidewallSipDate))
    	{
    		 shellLavSideWallSipTran.setLavsidewallSipDate(DateUtil.convertToDate(lavsidewallSipDate));
    	}
    	shellLavSideWallSipTran.setDrawingNo(drawingNo);
    	shellLavSideWallSipTran.setWiNo(wiNo);
    	shellLavSideWallSipTran.setFrameWorkByLav1(frameWorkByLav1);
    	shellLavSideWallSipTran.setFrameWorkByLav2(frameWorkByLav2);
    	shellLavSideWallSipTran.setFrameWorkByLav3(frameWorkByLav3);
    	shellLavSideWallSipTran.setFrameWorkByLav4(frameWorkByLav4);
    	shellLavSideWallSipTran.setFrameJigRoboticsBoLav1(frameJigRoboticsBoLav1);
    	shellLavSideWallSipTran.setFrameJigRoboticsBoLav2(frameJigRoboticsBoLav2);
    	shellLavSideWallSipTran.setFrameJigRoboticsBoLav3(frameJigRoboticsBoLav3);
    	shellLavSideWallSipTran.setFrameJigRoboticsBoLav4(frameJigRoboticsBoLav4);
    	shellLavSideWallSipTran.setSpotWeldingByLav1(spotWeldingByLav1);
    	shellLavSideWallSipTran.setSpotWeldingByLav2(spotWeldingByLav2);
    	shellLavSideWallSipTran.setSpotWeldingByLav3(spotWeldingByLav3);
    	shellLavSideWallSipTran.setSpotWeldingByLav4(spotWeldingByLav4);
    	shellLavSideWallSipTran.setSpotWeldingJigRoboticsBoLav1(spotWeldingJigRoboticsBoLav1);
    	shellLavSideWallSipTran.setSpotWeldingJigRoboticsBoLav2(spotWeldingJigRoboticsBoLav2);
    	shellLavSideWallSipTran.setSpotWeldingJigRoboticsBoLav3(spotWeldingJigRoboticsBoLav3);
    	shellLavSideWallSipTran.setSpotWeldingJigRoboticsBoLav4(spotWeldingJigRoboticsBoLav4);
    	shellLavSideWallSipTran.setInterlockJointByLav1(interlockJointByLav1);
    	shellLavSideWallSipTran.setInterlockJointByLav2(interlockJointByLav2);
    	shellLavSideWallSipTran.setInterlockJointByLav3(interlockJointByLav3);
    	shellLavSideWallSipTran.setInterlockJointByLav4(interlockJointByLav4);
    	shellLavSideWallSipTran.setInterlockJointJigRoboticsBoLav1(interlockJointJigRoboticsBoLav1);
    	shellLavSideWallSipTran.setInterlockJointJigRoboticsBoLav2(interlockJointJigRoboticsBoLav2);
    	shellLavSideWallSipTran.setInterlockJointJigRoboticsBoLav3(interlockJointJigRoboticsBoLav3);
    	shellLavSideWallSipTran.setInterlockJointJigRoboticsBoLav4(interlockJointJigRoboticsBoLav4);
    	shellLavSideWallSipTran.setLavsidewallMake1(lavsidewallMake1);
    	shellLavSideWallSipTran.setLavsidewallMake2(lavsidewallMake2);
    	shellLavSideWallSipTran.setLavsidewallMake3(lavsidewallMake3);
    	shellLavSideWallSipTran.setLavsidewallMake4(lavsidewallMake4);
    	shellLavSideWallSipTran.setObservationItemsAsPerDrawingFlag(observationItemsAsPerDrawingFlag);
    	shellLavSideWallSipTran.setObservationComplianceWiFlag(observationComplianceWiFlag);
    	shellLavSideWallSipTran.setObservationWeldingThroatFlag(observationWeldingThroatFlag);
  
    	
    	if(!"".equals(totalheightLav1))
    	{
    	double totalheightLav1AsDouble = Double.parseDouble(totalheightLav1); 
    	shellLavSideWallSipTran.setTotalheightLav1(totalheightLav1AsDouble);
    	}
    	if(!"".equals(totalheightLav2))
    	{
    	double totalheightLav2AsDouble = Double.parseDouble(totalheightLav2); 
    	shellLavSideWallSipTran.setTotalheightLav2(totalheightLav2AsDouble);
    	}
    	if(!"".equals(totalheightLav3))
    	{
    	double totalheightLav3AsDouble = Double.parseDouble(totalheightLav3); 
    	shellLavSideWallSipTran.setTotalheightLav3(totalheightLav3AsDouble);
    	}
    	System.out.println("hello");
    	if(!"".equals(totalheightLav4))
    	{
    	double totalheightLav4AsDouble = Double.parseDouble(totalheightLav4); 
    	shellLavSideWallSipTran.setTotalheightLav4(totalheightLav4AsDouble);
    	}
    	
    	if(!"".equals(totalwidthoutsideLav1))
    	{
    	double  totalwidthoutsideLav1AsDouble = Double.parseDouble(totalwidthoutsideLav1); 
    	shellLavSideWallSipTran.setTotalwidthoutsideLav1(totalwidthoutsideLav1AsDouble);
    	}
    	
    	if(!"".equals(totalwidthoutsideLav2))
    	{
    	double  totalwidthoutsideLav2AsDouble = Double.parseDouble(totalwidthoutsideLav2); 
    	shellLavSideWallSipTran.setTotalwidthoutsideLav2(totalwidthoutsideLav2AsDouble);
    	}
    	if(!"".equals(totalwidthoutsideLav3))
    	{
    	double  totalwidthoutsideLav3AsDouble = Double.parseDouble(totalwidthoutsideLav3); 
    	shellLavSideWallSipTran.setTotalwidthoutsideLav3(totalwidthoutsideLav3AsDouble);
    	}
    	if(!"".equals(totalwidthoutsideLav4))
    	{
    	double totalwidthoutsideLav4AsDouble = Double.parseDouble(totalwidthoutsideLav4); 
    	shellLavSideWallSipTran.setTotalwidthoutsideLav4(totalwidthoutsideLav4AsDouble);
    	}
    	if(!"".equals(totalwidthinsideLav1))
    	{
    	double totalwidthinsideLav1AsDouble = Double.parseDouble(totalwidthinsideLav1); 
    	shellLavSideWallSipTran.setTotalwidthinsideLav1(totalwidthinsideLav1AsDouble);
    	}
    	if(!"".equals(totalwidthinsideLav2))
    	{
    	double totalwidthinsideLav2AsDouble = Double.parseDouble(totalwidthinsideLav2); 
    	shellLavSideWallSipTran.setTotalwidthinsideLav2(totalwidthinsideLav2AsDouble);
    	}
    	if(!"".equals(totalwidthinsideLav3))
    	{
    	double totalwidthinsideLav3AsDouble = Double.parseDouble(totalwidthinsideLav3); 
    	shellLavSideWallSipTran.setTotalwidthinsideLav3(totalwidthinsideLav3AsDouble);
    	}
    	if(!"".equals(totalwidthinsideLav4))
    	{
    	double totalwidthinsideLav4AsDouble = Double.parseDouble(totalwidthinsideLav4); 
    	shellLavSideWallSipTran.setTotalwidthinsideLav4(totalwidthinsideLav4AsDouble);
    	}
    	if(!"".equals(windowcutOutLav1))
    	{
    	double windowcutOutLav1AsDouble = Double.parseDouble(windowcutOutLav1); 
    	shellLavSideWallSipTran.setWindowcutOutLav1(windowcutOutLav1AsDouble);
    	}
    	if(!"".equals(windowcutOutLav2))
    	{
    	double windowcutOutLav2AsDouble = Double.parseDouble(windowcutOutLav2); 
    	shellLavSideWallSipTran.setWindowcutOutLav2(windowcutOutLav2AsDouble);
    	}
    	if(!"".equals(windowcutOutLav3))
    	{
    	double windowcutOutLav3AsDouble = Double.parseDouble(windowcutOutLav3); 
    	shellLavSideWallSipTran.setWindowcutOutLav3(windowcutOutLav3AsDouble);
    	}
    	if(!"".equals(windowcutOutLav4))
    	{
    	double windowcutOutLav4AsDouble = Double.parseDouble(windowcutOutLav4); 
    	shellLavSideWallSipTran.setWindowcutOutLav4(windowcutOutLav4AsDouble);
    	}
    	if(!"".equals(windowcutOutsideLav1))
    	{
    	double windowcutOutsideLav1AsDouble = Double.parseDouble(windowcutOutsideLav1); 
    	shellLavSideWallSipTran.setWindowcutOutsideLav1(windowcutOutsideLav1AsDouble);
    	}
    	if(!"".equals(windowcutOutsideLav2))
    	{
    	double windowcutOutsideLav2AsDouble = Double.parseDouble(windowcutOutsideLav2); 
    	shellLavSideWallSipTran.setWindowcutOutsideLav2(windowcutOutsideLav2AsDouble);
    	}
    	if(!"".equals(windowcutOutsideLav3))
    	{
    	double windowcutOutsideLav3AsDouble = Double.parseDouble(windowcutOutsideLav3); 
    	shellLavSideWallSipTran.setWindowcutOutsideLav3(windowcutOutsideLav3AsDouble);
    	}
    	if(!"".equals(windowcutOutsideLav4))
    	{
    	double windowcutOutsideLav4AsDouble = Double.parseDouble(windowcutOutsideLav4); 
    	shellLavSideWallSipTran.setWindowcutOutsideLav4(windowcutOutsideLav4AsDouble);
    	}
    	if(!"".equals(pillarheightSheetLav1))
    	{
    	double pillarheightSheetLav1AsDouble = Double.parseDouble(pillarheightSheetLav1); 
    	shellLavSideWallSipTran.setPillarheightSheetLav1(pillarheightSheetLav1AsDouble);
    	}
    	if(!"".equals(pillarheightSheetLav2))
    	{
    	double pillarheightSheetLav2AsDouble = Double.parseDouble(pillarheightSheetLav2); 
    	shellLavSideWallSipTran.setPillarheightSheetLav2(pillarheightSheetLav2AsDouble);
    	}
    	if(!"".equals(pillarheightSheetLav3))
    	{
    	double pillarheightSheetLav3AsDouble = Double.parseDouble(pillarheightSheetLav3); 
    	shellLavSideWallSipTran.setPillarheightSheetLav3(pillarheightSheetLav3AsDouble);
    	}
    	if(!"".equals(pillarheightSheetLav4))
    	{
    	double pillarheightSheetLav4AsDouble = Double.parseDouble(pillarheightSheetLav4); 
    	shellLavSideWallSipTran.setPillarheightSheetLav4(pillarheightSheetLav4AsDouble);
    	}
    	shellLavSideWallSipTran.setWindowprofilecutForExhaustLav1(windowprofilecutForExhaustLav1);
    	shellLavSideWallSipTran.setWindowprofilecutForExhaustLav2(windowprofilecutForExhaustLav2);
    	shellLavSideWallSipTran.setWindowprofilecutForExhaustLav3(windowprofilecutForExhaustLav3);
    	shellLavSideWallSipTran.setWindowprofilecutForExhaustLav4(windowprofilecutForExhaustLav4);
    	shellLavSideWallSipTran.setLavsidewallFrameAsPerDrawingFlag(lavsidewallFrameAsPerDrawingFlag);
    	shellLavSideWallSipTran.setLavsidewallMemberWeldingFlag(lavsidewallMemberWeldingFlag);
    	shellLavSideWallSipTran.setConditionLavsidewallMemberJointweldingFlag(conditionLavsidewallMemberJointweldingFlag);
    	shellLavSideWallSipTran.setConditionLavsidewallSheetLaserweldingFlag(conditionLavsidewallSheetLaserweldingFlag);
    	shellLavSideWallSipTran.setDetailsOfModification(detailsOfModification);
    	shellLavSideWallSipTran.setDetailsOfTrial(detailsOfTrial);
    	shellLavSideWallSipTran.setRemarks(remarks);
    	shellLavSideWallSipTran.setLavSidewallTestingStatus(lavSidewallTestingStatus);
    	shellLavSideWallSipTran.setEntryBy(userID);
    	shellLavSideWallSipTran.setEntryTime(entryTime);
    	
    	// update shell_tran table
    	
    	ShellTransaction shellTran=new ShellTransaction();
        shellTran=(ShellTransaction) session.get(ShellTransaction.class,shellAssetIdAsInt);
    	shellTran.setLavsidewallSipFlag(1);
    	try
    	{
    		DaoLavSideWallSip dao=new DaoLavSideWallSip();
    		dao.saveLavSideWallData(shellLavSideWallSipTran,shellTran);
    		System.out.println(shellAssetIdAsInt);
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


	public String getShellAssetId() {
		return shellAssetId;
	}


	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}


	public String getLavsidewallSipDocNo() {
		return lavsidewallSipDocNo;
	}


	public void setLavsidewallSipDocNo(String lavsidewallSipDocNo) {
		this.lavsidewallSipDocNo = lavsidewallSipDocNo;
	}


	public String getLavsidewallSipShift() {
		return lavsidewallSipShift;
	}


	public void setLavsidewallSipShift(String lavsidewallSipShift) {
		this.lavsidewallSipShift = lavsidewallSipShift;
	}


	public String getLavsidewallSipDate() {
		return lavsidewallSipDate;
	}


	public void setLavsidewallSipDate(String lavsidewallSipDate) {
		this.lavsidewallSipDate = lavsidewallSipDate;
	}


	public String getLavsidewallNo() {
		return lavsidewallNo;
	}


	public void setLavsidewallNo(String lavsidewallNo) {
		this.lavsidewallNo = lavsidewallNo;
	}


	public String getLavsidewallShellType() {
		return lavsidewallShellType;
	}


	public void setLavsidewallShellType(String lavsidewallShellType) {
		this.lavsidewallShellType = lavsidewallShellType;
	}


	public String getDrawingNo() {
		return drawingNo;
	}


	public void setDrawingNo(String drawingNo) {
		this.drawingNo = drawingNo;
	}


	public String getWiNo() {
		return wiNo;
	}


	public void setWiNo(String wiNo) {
		this.wiNo = wiNo;
	}


	public String getFrameWorkByLav1() {
		return frameWorkByLav1;
	}


	public void setFrameWorkByLav1(String frameWorkByLav1) {
		this.frameWorkByLav1 = frameWorkByLav1;
	}


	public String getFrameJigRoboticsBoLav1() {
		return frameJigRoboticsBoLav1;
	}


	public void setFrameJigRoboticsBoLav1(String frameJigRoboticsBoLav1) {
		this.frameJigRoboticsBoLav1 = frameJigRoboticsBoLav1;
	}


	public String getFrameWorkByLav2() {
		return frameWorkByLav2;
	}


	public void setFrameWorkByLav2(String frameWorkByLav2) {
		this.frameWorkByLav2 = frameWorkByLav2;
	}


	public String getFrameJigRoboticsBoLav2() {
		return frameJigRoboticsBoLav2;
	}


	public void setFrameJigRoboticsBoLav2(String frameJigRoboticsBoLav2) {
		this.frameJigRoboticsBoLav2 = frameJigRoboticsBoLav2;
	}


	public String getFrameWorkByLav3() {
		return frameWorkByLav3;
	}


	public void setFrameWorkByLav3(String frameWorkByLav3) {
		this.frameWorkByLav3 = frameWorkByLav3;
	}


	public String getFrameJigRoboticsBoLav3() {
		return frameJigRoboticsBoLav3;
	}


	public void setFrameJigRoboticsBoLav3(String frameJigRoboticsBoLav3) {
		this.frameJigRoboticsBoLav3 = frameJigRoboticsBoLav3;
	}


	public String getFrameWorkByLav4() {
		return frameWorkByLav4;
	}


	public void setFrameWorkByLav4(String frameWorkByLav4) {
		this.frameWorkByLav4 = frameWorkByLav4;
	}


	public String getFrameJigRoboticsBoLav4() {
		return frameJigRoboticsBoLav4;
	}


	public void setFrameJigRoboticsBoLav4(String frameJigRoboticsBoLav4) {
		this.frameJigRoboticsBoLav4 = frameJigRoboticsBoLav4;
	}


	public String getSpotWeldingByLav1() {
		return spotWeldingByLav1;
	}


	public void setSpotWeldingByLav1(String spotWeldingByLav1) {
		this.spotWeldingByLav1 = spotWeldingByLav1;
	}


	public String getSpotWeldingJigRoboticsBoLav1() {
		return spotWeldingJigRoboticsBoLav1;
	}


	public void setSpotWeldingJigRoboticsBoLav1(String spotWeldingJigRoboticsBoLav1) {
		this.spotWeldingJigRoboticsBoLav1 = spotWeldingJigRoboticsBoLav1;
	}


	public String getSpotWeldingByLav2() {
		return spotWeldingByLav2;
	}


	public void setSpotWeldingByLav2(String spotWeldingByLav2) {
		this.spotWeldingByLav2 = spotWeldingByLav2;
	}


	public String getSpotWeldingJigRoboticsBoLav2() {
		return spotWeldingJigRoboticsBoLav2;
	}


	public void setSpotWeldingJigRoboticsBoLav2(String spotWeldingJigRoboticsBoLav2) {
		this.spotWeldingJigRoboticsBoLav2 = spotWeldingJigRoboticsBoLav2;
	}


	public String getSpotWeldingByLav3() {
		return spotWeldingByLav3;
	}


	public void setSpotWeldingByLav3(String spotWeldingByLav3) {
		this.spotWeldingByLav3 = spotWeldingByLav3;
	}


	public String getSpotWeldingJigRoboticsBoLav3() {
		return spotWeldingJigRoboticsBoLav3;
	}


	public void setSpotWeldingJigRoboticsBoLav3(String spotWeldingJigRoboticsBoLav3) {
		this.spotWeldingJigRoboticsBoLav3 = spotWeldingJigRoboticsBoLav3;
	}


	public String getSpotWeldingByLav4() {
		return spotWeldingByLav4;
	}


	public void setSpotWeldingByLav4(String spotWeldingByLav4) {
		this.spotWeldingByLav4 = spotWeldingByLav4;
	}


	public String getSpotWeldingJigRoboticsBoLav4() {
		return spotWeldingJigRoboticsBoLav4;
	}


	public void setSpotWeldingJigRoboticsBoLav4(String spotWeldingJigRoboticsBoLav4) {
		this.spotWeldingJigRoboticsBoLav4 = spotWeldingJigRoboticsBoLav4;
	}


	public String getInterlockJointByLav1() {
		return interlockJointByLav1;
	}


	public void setInterlockJointByLav1(String interlockJointByLav1) {
		this.interlockJointByLav1 = interlockJointByLav1;
	}


	public String getInterlockJointJigRoboticsBoLav1() {
		return interlockJointJigRoboticsBoLav1;
	}


	public void setInterlockJointJigRoboticsBoLav1(String interlockJointJigRoboticsBoLav1) {
		this.interlockJointJigRoboticsBoLav1 = interlockJointJigRoboticsBoLav1;
	}


	public String getInterlockJointByLav2() {
		return interlockJointByLav2;
	}


	public void setInterlockJointByLav2(String interlockJointByLav2) {
		this.interlockJointByLav2 = interlockJointByLav2;
	}


	public String getInterlockJointJigRoboticsBoLav2() {
		return interlockJointJigRoboticsBoLav2;
	}


	public void setInterlockJointJigRoboticsBoLav2(String interlockJointJigRoboticsBoLav2) {
		this.interlockJointJigRoboticsBoLav2 = interlockJointJigRoboticsBoLav2;
	}


	public String getInterlockJointByLav3() {
		return interlockJointByLav3;
	}


	public void setInterlockJointByLav3(String interlockJointByLav3) {
		this.interlockJointByLav3 = interlockJointByLav3;
	}


	public String getInterlockJointJigRoboticsBoLav3() {
		return interlockJointJigRoboticsBoLav3;
	}


	public void setInterlockJointJigRoboticsBoLav3(String interlockJointJigRoboticsBoLav3) {
		this.interlockJointJigRoboticsBoLav3 = interlockJointJigRoboticsBoLav3;
	}


	public String getInterlockJointByLav4() {
		return interlockJointByLav4;
	}


	public void setInterlockJointByLav4(String interlockJointByLav4) {
		this.interlockJointByLav4 = interlockJointByLav4;
	}


	public String getInterlockJointJigRoboticsBoLav4() {
		return interlockJointJigRoboticsBoLav4;
	}


	public void setInterlockJointJigRoboticsBoLav4(String interlockJointJigRoboticsBoLav4) {
		this.interlockJointJigRoboticsBoLav4 = interlockJointJigRoboticsBoLav4;
	}


	public String getLavsidewallMake1() {
		return lavsidewallMake1;
	}


	public void setLavsidewallMake1(String lavsidewallMake1) {
		this.lavsidewallMake1 = lavsidewallMake1;
	}


	public String getLavsidewallMake2() {
		return lavsidewallMake2;
	}


	public void setLavsidewallMake2(String lavsidewallMake2) {
		this.lavsidewallMake2 = lavsidewallMake2;
	}


	public String getLavsidewallMake3() {
		return lavsidewallMake3;
	}


	public void setLavsidewallMake3(String lavsidewallMake3) {
		this.lavsidewallMake3 = lavsidewallMake3;
	}


	public String getLavsidewallMake4() {
		return lavsidewallMake4;
	}


	public void setLavsidewallMake4(String lavsidewallMake4) {
		this.lavsidewallMake4 = lavsidewallMake4;
	}


	public String getObservationItemsAsPerDrawingFlag() {
		return observationItemsAsPerDrawingFlag;
	}


	public void setObservationItemsAsPerDrawingFlag(String observationItemsAsPerDrawingFlag) {
		this.observationItemsAsPerDrawingFlag = observationItemsAsPerDrawingFlag;
	}


	public String getObservationComplianceWiFlag() {
		return observationComplianceWiFlag;
	}


	public void setObservationComplianceWiFlag(String observationComplianceWiFlag) {
		this.observationComplianceWiFlag = observationComplianceWiFlag;
	}


	public String getObservationWeldingThroatFlag() {
		return observationWeldingThroatFlag;
	}


	public void setObservationWeldingThroatFlag(String observationWeldingThroatFlag) {
		this.observationWeldingThroatFlag = observationWeldingThroatFlag;
	}


	public String getTotalheightLav1() {
		return totalheightLav1;
	}


	public void setTotalheightLav1(String totalheightLav1) {
		this.totalheightLav1 = totalheightLav1;
	}


	public String getTotalheightLav2() {
		return totalheightLav2;
	}


	public void setTotalheightLav2(String totalheightLav2) {
		this.totalheightLav2 = totalheightLav2;
	}


	public String getTotalheightLav3() {
		return totalheightLav3;
	}


	public void setTotalheightLav3(String totalheightLav3) {
		this.totalheightLav3 = totalheightLav3;
	}


	public String getTotalheightLav4() {
		return totalheightLav4;
	}


	public void setTotalheightLav4(String totalheightLav4) {
		this.totalheightLav4 = totalheightLav4;
	}


	public String getTotalwidthoutsideLav1() {
		return totalwidthoutsideLav1;
	}


	public void setTotalwidthoutsideLav1(String totalwidthoutsideLav1) {
		this.totalwidthoutsideLav1 = totalwidthoutsideLav1;
	}


	public String getTotalwidthoutsideLav2() {
		return totalwidthoutsideLav2;
	}


	public void setTotalwidthoutsideLav2(String totalwidthoutsideLav2) {
		this.totalwidthoutsideLav2 = totalwidthoutsideLav2;
	}


	public String getTotalwidthoutsideLav3() {
		return totalwidthoutsideLav3;
	}


	public void setTotalwidthoutsideLav3(String totalwidthoutsideLav3) {
		this.totalwidthoutsideLav3 = totalwidthoutsideLav3;
	}


	public String getTotalwidthoutsideLav4() {
		return totalwidthoutsideLav4;
	}


	public void setTotalwidthoutsideLav4(String totalwidthoutsideLav4) {
		this.totalwidthoutsideLav4 = totalwidthoutsideLav4;
	}


	public String getTotalwidthinsideLav1() {
		return totalwidthinsideLav1;
	}


	public void setTotalwidthinsideLav1(String totalwidthinsideLav1) {
		this.totalwidthinsideLav1 = totalwidthinsideLav1;
	}


	public String getTotalwidthinsideLav2() {
		return totalwidthinsideLav2;
	}


	public void setTotalwidthinsideLav2(String totalwidthinsideLav2) {
		this.totalwidthinsideLav2 = totalwidthinsideLav2;
	}


	public String getTotalwidthinsideLav3() {
		return totalwidthinsideLav3;
	}


	public void setTotalwidthinsideLav3(String totalwidthinsideLav3) {
		this.totalwidthinsideLav3 = totalwidthinsideLav3;
	}


	public String getTotalwidthinsideLav4() {
		return totalwidthinsideLav4;
	}


	public void setTotalwidthinsideLav4(String totalwidthinsideLav4) {
		this.totalwidthinsideLav4 = totalwidthinsideLav4;
	}


	public String getWindowcutOutLav1() {
		return windowcutOutLav1;
	}


	public void setWindowcutOutLav1(String windowcutOutLav1) {
		this.windowcutOutLav1 = windowcutOutLav1;
	}


	public String getWindowcutOutLav2() {
		return windowcutOutLav2;
	}


	public void setWindowcutOutLav2(String windowcutOutLav2) {
		this.windowcutOutLav2 = windowcutOutLav2;
	}


	public String getWindowcutOutLav3() {
		return windowcutOutLav3;
	}


	public void setWindowcutOutLav3(String windowcutOutLav3) {
		this.windowcutOutLav3 = windowcutOutLav3;
	}


	public String getWindowcutOutLav4() {
		return windowcutOutLav4;
	}


	public void setWindowcutOutLav4(String windowcutOutLav4) {
		this.windowcutOutLav4 = windowcutOutLav4;
	}


	public String getWindowcutOutsideLav1() {
		return windowcutOutsideLav1;
	}


	public void setWindowcutOutsideLav1(String windowcutOutsideLav1) {
		this.windowcutOutsideLav1 = windowcutOutsideLav1;
	}


	public String getWindowcutOutsideLav2() {
		return windowcutOutsideLav2;
	}


	public void setWindowcutOutsideLav2(String windowcutOutsideLav2) {
		this.windowcutOutsideLav2 = windowcutOutsideLav2;
	}


	public String getWindowcutOutsideLav3() {
		return windowcutOutsideLav3;
	}


	public void setWindowcutOutsideLav3(String windowcutOutsideLav3) {
		this.windowcutOutsideLav3 = windowcutOutsideLav3;
	}


	public String getWindowcutOutsideLav4() {
		return windowcutOutsideLav4;
	}


	public void setWindowcutOutsideLav4(String windowcutOutsideLav4) {
		this.windowcutOutsideLav4 = windowcutOutsideLav4;
	}


	public String getPillarheightSheetLav1() {
		return pillarheightSheetLav1;
	}


	public void setPillarheightSheetLav1(String pillarheightSheetLav1) {
		this.pillarheightSheetLav1 = pillarheightSheetLav1;
	}


	public String getPillarheightSheetLav2() {
		return pillarheightSheetLav2;
	}


	public void setPillarheightSheetLav2(String pillarheightSheetLav2) {
		this.pillarheightSheetLav2 = pillarheightSheetLav2;
	}


	public String getPillarheightSheetLav3() {
		return pillarheightSheetLav3;
	}


	public void setPillarheightSheetLav3(String pillarheightSheetLav3) {
		this.pillarheightSheetLav3 = pillarheightSheetLav3;
	}


	public String getPillarheightSheetLav4() {
		return pillarheightSheetLav4;
	}


	public void setPillarheightSheetLav4(String pillarheightSheetLav4) {
		this.pillarheightSheetLav4 = pillarheightSheetLav4;
	}


	public String getWindowprofilecutForExhaustLav1() {
		return windowprofilecutForExhaustLav1;
	}


	public void setWindowprofilecutForExhaustLav1(String windowprofilecutForExhaustLav1) {
		this.windowprofilecutForExhaustLav1 = windowprofilecutForExhaustLav1;
	}


	public String getWindowprofilecutForExhaustLav2() {
		return windowprofilecutForExhaustLav2;
	}


	public void setWindowprofilecutForExhaustLav2(String windowprofilecutForExhaustLav2) {
		this.windowprofilecutForExhaustLav2 = windowprofilecutForExhaustLav2;
	}


	public String getWindowprofilecutForExhaustLav3() {
		return windowprofilecutForExhaustLav3;
	}


	public void setWindowprofilecutForExhaustLav3(String windowprofilecutForExhaustLav3) {
		this.windowprofilecutForExhaustLav3 = windowprofilecutForExhaustLav3;
	}


	public String getWindowprofilecutForExhaustLav4() {
		return windowprofilecutForExhaustLav4;
	}


	public void setWindowprofilecutForExhaustLav4(String windowprofilecutForExhaustLav4) {
		this.windowprofilecutForExhaustLav4 = windowprofilecutForExhaustLav4;
	}


	public String getLavsidewallFrameAsPerDrawingFlag() {
		return lavsidewallFrameAsPerDrawingFlag;
	}


	public void setLavsidewallFrameAsPerDrawingFlag(String lavsidewallFrameAsPerDrawingFlag) {
		this.lavsidewallFrameAsPerDrawingFlag = lavsidewallFrameAsPerDrawingFlag;
	}


	public String getLavsidewallMemberWeldingFlag() {
		return lavsidewallMemberWeldingFlag;
	}


	public void setLavsidewallMemberWeldingFlag(String lavsidewallMemberWeldingFlag) {
		this.lavsidewallMemberWeldingFlag = lavsidewallMemberWeldingFlag;
	}


	public String getConditionLavsidewallMemberJointweldingFlag() {
		return conditionLavsidewallMemberJointweldingFlag;
	}


	public void setConditionLavsidewallMemberJointweldingFlag(String conditionLavsidewallMemberJointweldingFlag) {
		this.conditionLavsidewallMemberJointweldingFlag = conditionLavsidewallMemberJointweldingFlag;
	}


	public String getConditionLavsidewallSheetLaserweldingFlag() {
		return conditionLavsidewallSheetLaserweldingFlag;
	}


	public void setConditionLavsidewallSheetLaserweldingFlag(String conditionLavsidewallSheetLaserweldingFlag) {
		this.conditionLavsidewallSheetLaserweldingFlag = conditionLavsidewallSheetLaserweldingFlag;
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


	public String getLavSidewallTestingStatus() {
		return lavSidewallTestingStatus;
	}


	public void setLavSidewallTestingStatus(String lavSidewallTestingStatus) {
		this.lavSidewallTestingStatus = lavSidewallTestingStatus;
	}
	
    
}


