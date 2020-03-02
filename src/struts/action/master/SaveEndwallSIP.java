package struts.action.master;
import java.util.Date;


import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import beans.ShellEndwallSipTran;
import beans.ShellTransaction;
import common.DateUtil;
import dao.DaoEndWallSip;
import hibernateConnect.HibernateConfig;

public class SaveEndwallSIP {
	private String  shellAssetId;
	private String endwallSipDocNo;
	private String endwallSipShift;
	private String endwallSipDate;
	private String drawingNo;
	private String wiNo;
	private String observationItemAsPerDrawing;
	private String observationComplianceWi;
	private String observationWeldingThroatLength;
	private String distanceStopperholeUchannel;
	private String distanceUchannelStopperhole;
	private String distanceVestibuleUchannelPp;
	private String distanceVestibuleUchannelNpp;
	private String conditionTailLampHole;
	private String conditionVestibuleHole;
	private String conditionDrainHole;
	private String endwallOuterWidth;
	private String endwallExhaustCutting;
	private String endwallPieceVerstibule;
	private String roofelementWaterejectHole;
	private String backpieceVestibuleDoor;
	private String endwallTestingStatus; 
    private String detailsOfModification;
	private String detailsOfTrial;
	private String remarks;
	public String getShellAssetId() {
		return shellAssetId;
	}




	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}




	public String getEndwallSipDocNo() {
		return endwallSipDocNo;
	}




	public void setEndwallSipDocNo(String endwallSipDocNo) {
		this.endwallSipDocNo = endwallSipDocNo;
	}




	public String getEndwallSipShift() {
		return endwallSipShift;
	}




	public void setEndwallSipShift(String endwallSipShift) {
		this.endwallSipShift = endwallSipShift;
	}




	public String getEndwallSipDate() {
		return endwallSipDate;
	}




	public void setEndwallSipDate(String endwallSipDate) {
		this.endwallSipDate = endwallSipDate;
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




	public String getObservationItemAsPerDrawing() {
		return observationItemAsPerDrawing;
	}




	public void setObservationItemAsPerDrawing(String observationItemAsPerDrawing) {
		this.observationItemAsPerDrawing = observationItemAsPerDrawing;
	}




	public String getObservationComplianceWi() {
		return observationComplianceWi;
	}




	public void setObservationComplianceWi(String observationComplianceWi) {
		this.observationComplianceWi = observationComplianceWi;
	}




	public String getObservationWeldingThroatLength() {
		return observationWeldingThroatLength;
	}




	public void setObservationWeldingThroatLength(String observationWeldingThroatLength) {
		this.observationWeldingThroatLength = observationWeldingThroatLength;
	}




	public String getDistanceStopperholeUchannel() {
		return distanceStopperholeUchannel;
	}




	public void setDistanceStopperholeUchannel(String distanceStopperholeUchannel) {
		this.distanceStopperholeUchannel = distanceStopperholeUchannel;
	}




	public String getDistanceUchannelStopperhole() {
		return distanceUchannelStopperhole;
	}




	public void setDistanceUchannelStopperhole(String distanceUchannelStopperhole) {
		this.distanceUchannelStopperhole = distanceUchannelStopperhole;
	}




	public String getDistanceVestibuleUchannelPp() {
		return distanceVestibuleUchannelPp;
	}




	public void setDistanceVestibuleUchannelPp(String distanceVestibuleUchannelPp) {
		this.distanceVestibuleUchannelPp = distanceVestibuleUchannelPp;
	}




	public String getDistanceVestibuleUchannelNpp() {
		return distanceVestibuleUchannelNpp;
	}




	public void setDistanceVestibuleUchannelNpp(String distanceVestibuleUchannelNpp) {
		this.distanceVestibuleUchannelNpp = distanceVestibuleUchannelNpp;
	}




	public String getConditionTailLampHole() {
		return conditionTailLampHole;
	}




	public void setConditionTailLampHole(String conditionTailLampHole) {
		this.conditionTailLampHole = conditionTailLampHole;
	}




	public String getConditionVestibuleHole() {
		return conditionVestibuleHole;
	}




	public void setConditionVestibuleHole(String conditionVestibuleHole) {
		this.conditionVestibuleHole = conditionVestibuleHole;
	}




	public String getConditionDrainHole() {
		return conditionDrainHole;
	}




	public void setConditionDrainHole(String conditionDrainHole) {
		this.conditionDrainHole = conditionDrainHole;
	}




	public String getEndwallOuterWidth() {
		return endwallOuterWidth;
	}




	public void setEndwallOuterWidth(String endwallOuterWidth) {
		this.endwallOuterWidth = endwallOuterWidth;
	}

	public String getEndwallExhaustCutting() {
		return endwallExhaustCutting;
	}




	public void setEndwallExhaustCutting(String endwallExhaustCutting) {
		this.endwallExhaustCutting = endwallExhaustCutting;
	}




	public String getEndwallPieceVerstibule() {
		return endwallPieceVerstibule;
	}




	public void setEndwallPieceVerstibule(String endwallPieceVerstibule) {
		this.endwallPieceVerstibule = endwallPieceVerstibule;
	}




	public String getRoofelementWaterejectHole() {
		return roofelementWaterejectHole;
	}




	public void setRoofelementWaterejectHole(String roofelementWaterejectHole) {
		this.roofelementWaterejectHole = roofelementWaterejectHole;
	}




	public String getBackpieceVestibuleDoor() {
		return backpieceVestibuleDoor;
	}




	public void setBackpieceVestibuleDoor(String backpieceVestibuleDoor) {
		this.backpieceVestibuleDoor = backpieceVestibuleDoor;
	}




	public String getEndwallTestingStatus() {
		return endwallTestingStatus;
	}




	public void setEndwallTestingStatus(String endwallTestingStatus) {
		this.endwallTestingStatus = endwallTestingStatus;
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
	public String saveEndwall()
	{
		
		Session session=null;
    	session=HibernateConfig.getSession();
    	HttpSession httpSession=ServletActionContext.getRequest().getSession();
    	String userID=(String)httpSession.getAttribute("userid");
    	Timestamp entryTime=new Timestamp(System.currentTimeMillis());
    	ShellEndwallSipTran shellEndwallSipTran=new ShellEndwallSipTran();
    	Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
    	shellEndwallSipTran.setShellAssetId(shellAssetIdAsInt);
    	shellEndwallSipTran.setEndwallSipDocNo(endwallSipDocNo);
    	shellEndwallSipTran.setEndwallSipShift(endwallSipShift);
    	if(!"".equals(endwallSipDate))
    	{
    		shellEndwallSipTran.setEndwallSipDate(DateUtil.convertToDate(endwallSipDate));
    	}
    	shellEndwallSipTran.setDrawingNo(drawingNo);
    	shellEndwallSipTran.setWiNo(wiNo);
    	shellEndwallSipTran.setObservationItemAsPerDrawing(observationItemAsPerDrawing);
    	shellEndwallSipTran.setObservationComplianceWi(observationComplianceWi);
    	shellEndwallSipTran.setObservationWeldingThroatLength(observationWeldingThroatLength);
    	shellEndwallSipTran.setConditionTailLampHole(conditionTailLampHole);
    	shellEndwallSipTran.setConditionVestibuleHole(conditionVestibuleHole);
    	shellEndwallSipTran.setConditionDrainHole(conditionDrainHole);
    	shellEndwallSipTran.setEndwallExhaustCutting(endwallExhaustCutting);
    	shellEndwallSipTran.setEndwallPieceVerstibule(endwallPieceVerstibule);
    	shellEndwallSipTran.setRoofelementWaterejectHole(roofelementWaterejectHole);
    	shellEndwallSipTran.setBackpieceVestibuleDoor(backpieceVestibuleDoor);
    	shellEndwallSipTran.setEndwallTestingStatus(endwallTestingStatus);
    	if(!"".equals(distanceStopperholeUchannel))
    	{
    	int distanceStopperholeUchannelAsInt = Integer.parseInt(distanceStopperholeUchannel); 
    	shellEndwallSipTran.setDistanceStopperholeUchannel(distanceStopperholeUchannelAsInt);
    	}
    	if(!"".equals(distanceUchannelStopperhole))
    	{
    	int distanceUchannelStopperholeAsInt = Integer.parseInt(distanceUchannelStopperhole); 
    	shellEndwallSipTran.setDistanceUchannelStopperhole(distanceUchannelStopperholeAsInt);
    	}
    	if(!"".equals(distanceVestibuleUchannelPp))
    	{
    	int distanceVestibuleUchannelPpAsInt = Integer.parseInt(distanceVestibuleUchannelPp); 
    	shellEndwallSipTran.setDistanceVestibuleUchannelPp(distanceVestibuleUchannelPpAsInt);
    	}
    	if(!"".equals(distanceVestibuleUchannelNpp))
    	{
    	int distanceVestibuleUchannelNppAsInt = Integer.parseInt(distanceVestibuleUchannelNpp); 
    	shellEndwallSipTran.setDistanceVestibuleUchannelNpp(distanceVestibuleUchannelNppAsInt);
    	}
    	if(!"".equals(endwallOuterWidth))
    	{
    	int endwallOuterWidthAsInt = Integer.parseInt(endwallOuterWidth); 
    	shellEndwallSipTran.setEndwallOuterWidth(endwallOuterWidthAsInt);
    	}
    	
    	
    	shellEndwallSipTran.setDetailsOfModification(detailsOfModification);
    	shellEndwallSipTran.setDetailsOfTrial(detailsOfTrial);
    	shellEndwallSipTran.setRemarks(remarks);
    	shellEndwallSipTran.setEntryBy(userID);
    	shellEndwallSipTran.setEntryTime(entryTime);
    	ShellTransaction shellTran=new ShellTransaction();
        shellTran=(ShellTransaction) session.get(ShellTransaction.class,shellAssetIdAsInt);
    	shellTran.setEndwallSipFlag(1);
		try
    	{
			DaoEndWallSip dao=new DaoEndWallSip();
    		dao.saveEndWallData(shellEndwallSipTran,shellTran);
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
	
	

}
