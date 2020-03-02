package struts.action.master;
import beans.WheelsetTransaction;
import common.DateUtil;
import dao.DaoWheelAxleSip;
import hibernateConnect.HibernateConfig;

import java.sql.Timestamp;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import beans.WheelSipTransaction;
public class WheelAxleTestingAction {
	private String wheelsetAssetId;
	private String docNoWheelAxle;
	private String	dateOfWheelAxleTesting;
	private String	shiftWheelAxle;
	private String	drawingNoWheelAxle;
	private String	wiNoWheelAxle;
	private String	heatNoWheelAxle;
	// data save in wheelset_tran table
	private String	wheelDiscLeftNoWheelAxle;
	private String	wheelDiscRightNoWheelAxle;
	private String	wheelTypeWheelAxle;
	private String	axleNoWheelAxle;
	private String	axleMakeWheelAxle;
	private String	wheelSetTypeWheelAxle;
	private String	journalDiaLeft;
	private String	journalDiaRight;
	private String	collarDiaLeft;
	private String	collarDiaRight;
		
	private String	wheelDiaLeft;
	private String	wheelDiaRight;
	private String	distanceBetweenWheel;
	private String	distanceBetweenWheelfaceDiscface;
	private String	brakeDiscPressureLeft;
	     
	private String	leftBrakeDiscMake;
	private String	brakeDiscPressureRight;
	private String	rightBrakeDiscMake;
	private String	wheelDiscPressureLeft;
	private String	wheeldiscLeftMake;
	    
	private String	wheelDiscPressureRight;
	private String	wheeldiscRightMake;
	private String	wheelBalancingWeightLeft;
	private String	wheelBalancingWeightRight;
	private String	wheelUnbalanceWeightLeft;
	    
	private String	wheelUnbalanceWeightRight;
	//end of save data in wheelset_tran
	private String	stampParticularsLeftWheel;
	private String	stampParticularsRightWheel;
	private String	stampParticularsWheel;
	private String	stampParticularsAxle;
		
	private String	modificationInWheelAxle;
	private String	trialInWheelAxle;
	private String	remarksInWheelAxle;
	// for save data under ctrb testing
	private String docNoCtrbTesting;
	private String dateOfCtrbTesting;
	private String shiftCtrbTesting;
	private String drawingNoCtrb;
	private String wiNoCtrb;
    private String axleNumber;
    private String axleMake;
	private String wheelSetType;
	private String ctrbItemAsDrawingFlag;
	private String ctrbComplianceWiFlag;
	private String fillingGreaseAxleFlag;
	
	private String 	differenceOfWheelDiaFlag;
	private String damageInJournalCtrb;
	//private String journalDiaLeft;
	// private String journalDiaRight;
	//private String wheellDiaLeft,
	//private String	wheellDiaRight;
	//private String distanceBetweenWheel;
	private String	lateralClearanceLeftCTRB;
	private String	lateralClearanceRightCTRB;
	private String	pressingPressureLeftCTRB;
	private String	pressingPressureRightCTRB;
		
	private String	tighteningHexagonalScrews;
	private String	modificationInCtrb;
		
	private String	trialInCtrb;
	private String	remarksInCtrb;
	
	public String saveWheelAxleTesting()
	{
	Integer	wheelsetAssetIdAsInt= Integer.parseInt(wheelsetAssetId);
	System.out.println("Asset Id"+wheelsetAssetId);
		Session session=null;
		session=HibernateConfig.getSession();
		WheelsetTransaction wheelsetTransaction=new WheelsetTransaction();
		wheelsetTransaction= (WheelsetTransaction) session.get(WheelsetTransaction.class, wheelsetAssetIdAsInt);
	
		wheelsetTransaction.setWheeldiscLeftNo(wheelDiscLeftNoWheelAxle);
		wheelsetTransaction.setWheeldiscRightNo(wheelDiscRightNoWheelAxle);
		wheelsetTransaction.setWheelDiscType(wheelTypeWheelAxle);
		wheelsetTransaction.setAxleNumber(axleNoWheelAxle);
		wheelsetTransaction.setAxleMake(axleMakeWheelAxle);
		wheelsetTransaction.setWheelSetType(wheelSetTypeWheelAxle);
		if(!"".equals(journalDiaLeft))
		{
			System.out.println("Journal Dia Left"+journalDiaLeft);
		double journalDiaLeftAsFloat=Double.parseDouble(journalDiaLeft);
		wheelsetTransaction.setJournalDiaLeft(journalDiaLeftAsFloat);
		}
		if(!"".equals(journalDiaRight))
		{
			System.out.println("Journal Dia Right"+journalDiaRight);
		double journalDiaRighttAsFloat=Double.parseDouble(journalDiaRight);
		wheelsetTransaction.setJournalDiaRight(journalDiaRighttAsFloat);
		}
		if(!"".equals(collarDiaLeft))
		{
			System.out.println("Collar Dia Right"+collarDiaLeft);
			double collarlDiaLeftAsFloat=Double.parseDouble(collarDiaLeft);
			wheelsetTransaction.setCollarDiaLeft(collarlDiaLeftAsFloat);
		}
		if(!"".equals(collarDiaRight))
		{
			System.out.println("Collar Dia Right"+collarDiaRight);
			double collarDiaRightAsFloat=Double.parseDouble(collarDiaRight);
			wheelsetTransaction.setCollarDiaRight(collarDiaRightAsFloat);
		}
		if(!"".equals(wheelDiaLeft))
		{
			System.out.println("Wheel Dia Left "+wheelDiaLeft);
			double wheellDiaLeftAsFloat=Double.parseDouble(wheelDiaLeft);
			wheelsetTransaction.setWheelDiaLeft(wheellDiaLeftAsFloat);
		}
		if(!"".equals(wheelDiaRight))
		{
			System.out.println("Wheel Dia Right "+wheelDiaRight);
			double wheelDiaRightAsFloat=Double.parseDouble(wheelDiaRight);
			wheelsetTransaction.setWheelDiaRight(wheelDiaRightAsFloat);
		}
		if(!"".equals(distanceBetweenWheel))
		{
			System.out.println("Distance between wheel "+distanceBetweenWheel);
			double distanceBetweenWheelAsFloat= Double.parseDouble(distanceBetweenWheel);
			wheelsetTransaction.setDistanceBetweenWheel(distanceBetweenWheelAsFloat);
		}
		if(!"".equals(distanceBetweenWheelfaceDiscface))
		{
			System.out.println("Distance between wheel and Face"+distanceBetweenWheelfaceDiscface);
			double distanceBetweenWheelfaceDiscfaceAsFloat= Double.parseDouble(distanceBetweenWheelfaceDiscface);
			wheelsetTransaction.setDistanceBetweenWheelfaceDiscface(distanceBetweenWheelfaceDiscfaceAsFloat);
		}
		if(!"".equals(brakeDiscPressureLeft))
		{
			Integer brakeDiscPressureLeftAsInt=Integer.parseInt(brakeDiscPressureLeft);
			wheelsetTransaction.setBrakeDiscPressureLeft(brakeDiscPressureLeftAsInt);
		}
		wheelsetTransaction.setLeftBrakeDiscMake(leftBrakeDiscMake);
		if(!"".equals(brakeDiscPressureRight))
		{
			Integer brakeDiscPressureRightAsInt= Integer.parseInt(brakeDiscPressureRight);
		wheelsetTransaction.setBrakeDiscPressureRight(brakeDiscPressureRightAsInt);
		}
		wheelsetTransaction.setRightBrakeDiscMake(rightBrakeDiscMake);
		if(!"".equals(wheelDiscPressureLeft))
		{
		Integer	wheelDiscPressureLeftAsInt=Integer.parseInt(wheelDiscPressureLeft);
		wheelsetTransaction.setWheelDiscPressureLeft(wheelDiscPressureLeftAsInt);
		}
		wheelsetTransaction.setWheeldiscLeftMake(wheeldiscLeftMake);
		if(!"".equals(wheelDiscPressureRight))
		{
		Integer wheelDiscPressureRightAsInt=Integer.parseInt(wheelDiscPressureRight);
		wheelsetTransaction.setWheelDiscPressureRight(wheelDiscPressureRightAsInt);
		}
		wheelsetTransaction.setWheeldiscRightMake(wheeldiscRightMake); 
		
		if(!"".equals(wheelBalancingWeightLeft))
		{
			Integer wheelBalancingWeightLeftAsInt= Integer.parseInt(wheelBalancingWeightLeft);
		wheelsetTransaction.setWheelBalancingWeightLeft(wheelBalancingWeightLeftAsInt);
		}
	
		if(!"".equals(wheelBalancingWeightRight))
		{
			Integer wheelBalancingWeightRightAsInt= Integer.parseInt(wheelBalancingWeightRight);
		wheelsetTransaction.setWheelBalancingWeightRight(wheelBalancingWeightRightAsInt);
		}
		if(!"".equals(wheelUnbalanceWeightLeft))
		{
			Integer wheelUnbalanceWeightLeftAsInt=Integer.parseInt(wheelUnbalanceWeightLeft);
			wheelsetTransaction.setWheelUnbalanceWeightLeft(wheelUnbalanceWeightLeftAsInt);
		}
		if(!"".equals(wheelUnbalanceWeightRight))
		{
			Integer wheelUnbalanceWeightRightAsInt=Integer.parseInt(wheelUnbalanceWeightRight);
			wheelsetTransaction.setWheelUnbalanceWeightRight(wheelUnbalanceWeightRightAsInt);
		}
		wheelsetTransaction.setSipWheelAssemblyFlag(1);
		//insert into wheel_sip_transaction
		WheelSipTransaction wheelSipTransaction=new WheelSipTransaction();
		wheelSipTransaction.setWheelsetAssetId(wheelsetAssetIdAsInt);
		wheelSipTransaction.setDocNoWheelAxleTesting(docNoWheelAxle);
		if(!"".equals(dateOfWheelAxleTesting)) {wheelSipTransaction.setDateOfWheelAxleTesting(DateUtil.convertToDate(dateOfWheelAxleTesting));}
		wheelSipTransaction.setShiftWheelAxleTesting(shiftWheelAxle);
		wheelSipTransaction.setDrawingNoWheelAxle(drawingNoWheelAxle);
		wheelSipTransaction.setWiNoWheelAxle(wiNoWheelAxle);
		wheelSipTransaction.setHeatNoWheelAxle(heatNoWheelAxle);
		wheelSipTransaction.setStampParticularsLeftWheel(stampParticularsLeftWheel);
		wheelSipTransaction.setStampParticularsRightWheel(stampParticularsRightWheel);
		wheelSipTransaction.setStampParticularsWheel(stampParticularsWheel);
		wheelSipTransaction.setStampParticularsAxle(stampParticularsAxle);
		wheelSipTransaction.setModificationInWheelAxle(modificationInWheelAxle);
		wheelSipTransaction.setTrialInWheelAxle(trialInWheelAxle);
		wheelSipTransaction.setRemarksInWheelAxle(remarksInWheelAxle);
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		String userID = (String) session_http.getAttribute("userid");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		wheelSipTransaction.setEntryBy(userID);
		wheelSipTransaction.setEntryDate(timestamp);
		// retireve already existing data from table
		WheelSipTransaction wst=null;
		wst= (WheelSipTransaction) session.get(WheelSipTransaction.class, wheelsetAssetIdAsInt);
		
		
		
		
		if(wst!=null)
		{
			wheelSipTransaction.setDocNoCtrbTesting(wst.getDocNoCtrbTesting());
			if(!"".equals(wst.getDateOfCtrbTesting())){
			wheelSipTransaction.setDateOfCtrbTesting(wst.getDateOfCtrbTesting());
			}
			wheelSipTransaction.setShiftCtrbTesting(wst.getShiftCtrbTesting());
			wheelSipTransaction.setDrawingNoCtrb(wst.getDrawingNoCtrb());
			wheelSipTransaction.setWiNoCtrb(wst.getWiNoCtrb());
			wheelSipTransaction.setDocNoQualityClearance(wst.getDocNoQualityClearance());
			wheelSipTransaction.setCtrbItemAsDrawingFlag(wst.getCtrbItemAsDrawingFlag());
			wheelSipTransaction.setCtrbComplianceWiFlag(wst.getCtrbComplianceWiFlag());
			wheelSipTransaction.setFillingGreaseAxleFlag(wst.getFillingGreaseAxleFlag());
			wheelSipTransaction.setDifferenceOfWheelDiaFlag(wst.getDifferenceOfWheelDiaFlag());
			wheelSipTransaction.setDamageInJournalCtrb(wst.getDamageInJournalCtrb());
			wheelSipTransaction.setTighteningHexagonalScrews(wst.getTighteningHexagonalScrews());
			wheelSipTransaction.setModificationInCtrb(wst.getModificationInCtrb());
			wheelSipTransaction.setTrialInCtrb(wst.getTrialInCtrb());
			wheelSipTransaction.setRemarksInCtrb(wst.getRemarksInCtrb());
		}
		//end of code
		DaoWheelAxleSip dao=new DaoWheelAxleSip();
	System.out.println("Hi navin end of code here");	
		try
		{
			dao.saveTesting(wheelsetTransaction, wheelSipTransaction);
			return "success";
		}
		catch(Exception ex)
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
   public String saveCTRBTesting()
   {
	    Session session=null;
		session=HibernateConfig.getSession();
		Integer	wheelsetAssetIdAsInt= Integer.parseInt(wheelsetAssetId);
		System.out.println("Wheel Id "+wheelsetAssetIdAsInt);
		
		WheelsetTransaction wheelsetTransaction=new WheelsetTransaction();
		wheelsetTransaction= (WheelsetTransaction) session.get(WheelsetTransaction.class, wheelsetAssetIdAsInt);
		wheelsetTransaction.setAxleNumber(axleNumber);
		wheelsetTransaction.setAxleMake(axleMake);
		wheelsetTransaction.setWheelSetType(wheelSetType);
		wheelsetTransaction.setSipWheelCtrbFlag(1);
		if(journalDiaLeft!=null)
		{
		if(!"".equals(journalDiaLeft))
		{
			System.out.println("Journal Dia Left"+journalDiaLeft);
		double journalDiaLeftAsFloat=Double.parseDouble(journalDiaLeft);
		wheelsetTransaction.setJournalDiaLeft(journalDiaLeftAsFloat);
		}
		}
		if(journalDiaRight!=null)
		{
		if(!"".equals(journalDiaRight))
		{
			System.out.println("Journal Dia Right"+journalDiaRight);
		double journalDiaRighttAsFloat=Double.parseDouble(journalDiaRight);
		wheelsetTransaction.setJournalDiaRight(journalDiaRighttAsFloat);
		}
		}
		if(wheelDiaLeft!=null)
		{
		if(!"".equals(wheelDiaLeft))
		{
			System.out.println("Wheel Dia Left "+wheelDiaLeft);
			double wheellDiaLeftAsFloat=Double.parseDouble(wheelDiaLeft);
			wheelsetTransaction.setWheelDiaLeft(wheellDiaLeftAsFloat);
		}
		}
		if(wheelDiaRight!=null)
		{
		if(!"".equals(wheelDiaRight))
		{
			System.out.println("Wheel Dia Right "+wheelDiaRight);
			double wheelDiaRightAsFloat=Double.parseDouble(wheelDiaRight);
			wheelsetTransaction.setWheelDiaRight(wheelDiaRightAsFloat);
		}
		}
		if(distanceBetweenWheel!=null)
		{
		if(!"".equals(distanceBetweenWheel))
		{
			System.out.println("Distance between wheel "+distanceBetweenWheel);
			double distanceBetweenWheelAsFloat= Double.parseDouble(distanceBetweenWheel);
			wheelsetTransaction.setDistanceBetweenWheel(distanceBetweenWheelAsFloat);
		}
		}
		wheelsetTransaction.setLateralClearanceLeftCTRB(lateralClearanceLeftCTRB);
		wheelsetTransaction.setLateralClearanceRightCTRB(lateralClearanceRightCTRB);
		wheelsetTransaction.setPressingPressureLeftCTRB(pressingPressureLeftCTRB);
		wheelsetTransaction.setPressingPressureRightCTRB(pressingPressureRightCTRB);
		
		WheelSipTransaction wheelSipTransaction=new WheelSipTransaction();
		wheelSipTransaction.setWheelsetAssetId(wheelsetAssetIdAsInt);
		wheelSipTransaction.setDocNoCtrbTesting(docNoCtrbTesting);
	if(!"".equals(dateOfCtrbTesting))	{wheelSipTransaction.setDateOfCtrbTesting(DateUtil.convertToDate(dateOfCtrbTesting));}
	wheelSipTransaction.setShiftCtrbTesting(shiftCtrbTesting);
	wheelSipTransaction.setDrawingNoCtrb(drawingNoCtrb);
	wheelSipTransaction.setWiNoCtrb(wiNoCtrb);
	wheelSipTransaction.setCtrbItemAsDrawingFlag(ctrbItemAsDrawingFlag);
	wheelSipTransaction.setCtrbComplianceWiFlag(ctrbComplianceWiFlag);
	wheelSipTransaction.setFillingGreaseAxleFlag(fillingGreaseAxleFlag);
	wheelSipTransaction.setDifferenceOfWheelDiaFlag(differenceOfWheelDiaFlag);
	wheelSipTransaction.setDamageInJournalCtrb(damageInJournalCtrb);
	wheelSipTransaction.setTighteningHexagonalScrews(tighteningHexagonalScrews);
	wheelSipTransaction.setModificationInCtrb(modificationInCtrb);
	wheelSipTransaction.setTrialInCtrb(trialInCtrb);
	wheelSipTransaction.setRemarksInCtrb(remarksInCtrb);
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	Timestamp timestamp= new Timestamp(System.currentTimeMillis());
	wheelSipTransaction.setEntryBy(userID);
	wheelSipTransaction.setEntryDate(timestamp);
	WheelSipTransaction wst=null;
	wst= (WheelSipTransaction) session.get(WheelSipTransaction.class, wheelsetAssetIdAsInt);
	if(wst!=null)
	{
		wheelSipTransaction.setDocNoWheelAxleTesting(wst.getDocNoWheelAxleTesting());
		
		if(!"".equals(wst.getDateOfWheelAxleTesting())){
		wheelSipTransaction.setDateOfWheelAxleTesting(wst.getDateOfWheelAxleTesting());
		}
		wheelSipTransaction.setShiftWheelAxleTesting(wst.getShiftWheelAxleTesting());
		wheelSipTransaction.setDrawingNoWheelAxle(wst.getDrawingNoWheelAxle());
		wheelSipTransaction.setWiNoWheelAxle(wst.getWiNoWheelAxle());
		wheelSipTransaction.setHeatNoWheelAxle(wst.getHeatNoWheelAxle());
		wheelSipTransaction.setDocNoQualityClearance(wst.getDocNoQualityClearance());
		wheelSipTransaction.setStampParticularsLeftWheel(wst.getStampParticularsLeftWheel());
		wheelSipTransaction.setStampParticularsRightWheel(wst.getStampParticularsRightWheel());
		wheelSipTransaction.setStampParticularsWheel(wst.getStampParticularsWheel());
		wheelSipTransaction.setStampParticularsAxle(wst.getStampParticularsAxle());
		
		wheelSipTransaction.setModificationInWheelAxle(wst.getModificationInWheelAxle());
		wheelSipTransaction.setTrialInWheelAxle(wst.getTrialInWheelAxle());
		wheelSipTransaction.setRemarksInWheelAxle(wst.getRemarksInWheelAxle());

	}
	//end of code
	
	
	
	DaoWheelAxleSip dao=new DaoWheelAxleSip();
	   try
	   {
			dao.saveTesting(wheelsetTransaction, wheelSipTransaction);
		  return "success"; 
	   }
	   catch(Exception ex)
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

	public String getWheelsetAssetId() {
		return wheelsetAssetId;
	}


	public void setWheelsetAssetId(String wheelsetAssetId) {
		this.wheelsetAssetId = wheelsetAssetId;
	}


	public String getDocNoWheelAxle() {
		return docNoWheelAxle;
	}


	public void setDocNoWheelAxle(String docNoWheelAxle) {
		this.docNoWheelAxle = docNoWheelAxle;
	}


	public String getDateOfWheelAxleTesting() {
		return dateOfWheelAxleTesting;
	}


	public void setDateOfWheelAxleTesting(String dateOfWheelAxleTesting) {
		this.dateOfWheelAxleTesting = dateOfWheelAxleTesting;
	}


	public String getShiftWheelAxle() {
		return shiftWheelAxle;
	}


	public void setShiftWheelAxle(String shiftWheelAxle) {
		this.shiftWheelAxle = shiftWheelAxle;
	}


	public String getDrawingNoWheelAxle() {
		return drawingNoWheelAxle;
	}


	public void setDrawingNoWheelAxle(String drawingNoWheelAxle) {
		this.drawingNoWheelAxle = drawingNoWheelAxle;
	}


	public String getWiNoWheelAxle() {
		return wiNoWheelAxle;
	}


	public void setWiNoWheelAxle(String wiNoWheelAxle) {
		this.wiNoWheelAxle = wiNoWheelAxle;
	}


	public String getHeatNoWheelAxle() {
		return heatNoWheelAxle;
	}


	public void setHeatNoWheelAxle(String heatNoWheelAxle) {
		this.heatNoWheelAxle = heatNoWheelAxle;
	}


	public String getWheelDiscLeftNoWheelAxle() {
		return wheelDiscLeftNoWheelAxle;
	}


	public void setWheelDiscLeftNoWheelAxle(String wheelDiscLeftNoWheelAxle) {
		this.wheelDiscLeftNoWheelAxle = wheelDiscLeftNoWheelAxle;
	}


	public String getWheelDiscRightNoWheelAxle() {
		return wheelDiscRightNoWheelAxle;
	}


	public void setWheelDiscRightNoWheelAxle(String wheelDiscRightNoWheelAxle) {
		this.wheelDiscRightNoWheelAxle = wheelDiscRightNoWheelAxle;
	}


	public String getWheelTypeWheelAxle() {
		return wheelTypeWheelAxle;
	}


	public void setWheelTypeWheelAxle(String wheelTypeWheelAxle) {
		this.wheelTypeWheelAxle = wheelTypeWheelAxle;
	}


	public String getAxleNoWheelAxle() {
		return axleNoWheelAxle;
	}


	public void setAxleNoWheelAxle(String axleNoWheelAxle) {
		this.axleNoWheelAxle = axleNoWheelAxle;
	}


	public String getAxleMakeWheelAxle() {
		return axleMakeWheelAxle;
	}


	public void setAxleMakeWheelAxle(String axleMakeWheelAxle) {
		this.axleMakeWheelAxle = axleMakeWheelAxle;
	}


	public String getWheelSetTypeWheelAxle() {
		return wheelSetTypeWheelAxle;
	}


	public void setWheelSetTypeWheelAxle(String wheelSetTypeWheelAxle) {
		this.wheelSetTypeWheelAxle = wheelSetTypeWheelAxle;
	}


	public String getJournalDiaLeft() {
		return journalDiaLeft;
	}


	public void setJournalDiaLeft(String journalDiaLeft) {
		this.journalDiaLeft = journalDiaLeft;
	}


	public String getJournalDiaRight() {
		return journalDiaRight;
	}


	public void setJournalDiaRight(String journalDiaRight) {
		this.journalDiaRight = journalDiaRight;
	}


	


	public String getCollarDiaRight() {
		return collarDiaRight;
	}


	public void setCollarDiaRight(String collarDiaRight) {
		this.collarDiaRight = collarDiaRight;
	}




	public String getCollarDiaLeft() {
		return collarDiaLeft;
	}
	public void setCollarDiaLeft(String collarDiaLeft) {
		this.collarDiaLeft = collarDiaLeft;
	}
	public String getWheelDiaLeft() {
		return wheelDiaLeft;
	}
	public void setWheelDiaLeft(String wheelDiaLeft) {
		this.wheelDiaLeft = wheelDiaLeft;
	}
	public String getWheelDiaRight() {
		return wheelDiaRight;
	}


	public void setWheelDiaRight(String wheelDiaRight) {
		this.wheelDiaRight = wheelDiaRight;
	}


	public String getDistanceBetweenWheel() {
		return distanceBetweenWheel;
	}


	public void setDistanceBetweenWheel(String distanceBetweenWheel) {
		this.distanceBetweenWheel = distanceBetweenWheel;
	}


	public String getDistanceBetweenWheelfaceDiscface() {
		return distanceBetweenWheelfaceDiscface;
	}


	public void setDistanceBetweenWheelfaceDiscface(String distanceBetweenWheelfaceDiscface) {
		this.distanceBetweenWheelfaceDiscface = distanceBetweenWheelfaceDiscface;
	}


	public String getBrakeDiscPressureLeft() {
		return brakeDiscPressureLeft;
	}


	public void setBrakeDiscPressureLeft(String brakeDiscPressureLeft) {
		this.brakeDiscPressureLeft = brakeDiscPressureLeft;
	}


	public String getLeftBrakeDiscMake() {
		return leftBrakeDiscMake;
	}


	public void setLeftBrakeDiscMake(String leftBrakeDiscMake) {
		this.leftBrakeDiscMake = leftBrakeDiscMake;
	}


	public String getBrakeDiscPressureRight() {
		return brakeDiscPressureRight;
	}


	public void setBrakeDiscPressureRight(String brakeDiscPressureRight) {
		this.brakeDiscPressureRight = brakeDiscPressureRight;
	}


	public String getRightBrakeDiscMake() {
		return rightBrakeDiscMake;
	}


	public void setRightBrakeDiscMake(String rightBrakeDiscMake) {
		this.rightBrakeDiscMake = rightBrakeDiscMake;
	}


	public String getWheelDiscPressureLeft() {
		return wheelDiscPressureLeft;
	}


	public void setWheelDiscPressureLeft(String wheelDiscPressureLeft) {
		this.wheelDiscPressureLeft = wheelDiscPressureLeft;
	}


	public String getWheeldiscLeftMake() {
		return wheeldiscLeftMake;
	}


	public void setWheeldiscLeftMake(String wheeldiscLeftMake) {
		this.wheeldiscLeftMake = wheeldiscLeftMake;
	}


	public String getWheelDiscPressureRight() {
		return wheelDiscPressureRight;
	}


	public void setWheelDiscPressureRight(String wheelDiscPressureRight) {
		this.wheelDiscPressureRight = wheelDiscPressureRight;
	}


	public String getWheeldiscRightMake() {
		return wheeldiscRightMake;
	}


	public void setWheeldiscRightMake(String wheeldiscRightMake) {
		this.wheeldiscRightMake = wheeldiscRightMake;
	}


	public String getWheelBalancingWeightLeft() {
		return wheelBalancingWeightLeft;
	}


	public void setWheelBalancingWeightLeft(String wheelBalancingWeightLeft) {
		this.wheelBalancingWeightLeft = wheelBalancingWeightLeft;
	}


	public String getWheelBalancingWeightRight() {
		return wheelBalancingWeightRight;
	}


	public void setWheelBalancingWeightRight(String wheelBalancingWeightRight) {
		this.wheelBalancingWeightRight = wheelBalancingWeightRight;
	}


	public String getWheelUnbalanceWeightLeft() {
		return wheelUnbalanceWeightLeft;
	}


	public void setWheelUnbalanceWeightLeft(String wheelUnbalanceWeightLeft) {
		this.wheelUnbalanceWeightLeft = wheelUnbalanceWeightLeft;
	}


	public String getWheelUnbalanceWeightRight() {
		return wheelUnbalanceWeightRight;
	}


	public void setWheelUnbalanceWeightRight(String wheelUnbalanceWeightRight) {
		this.wheelUnbalanceWeightRight = wheelUnbalanceWeightRight;
	}


	public String getStampParticularsLeftWheel() {
		return stampParticularsLeftWheel;
	}


	public void setStampParticularsLeftWheel(String stampParticularsLeftWheel) {
		this.stampParticularsLeftWheel = stampParticularsLeftWheel;
	}


	public String getStampParticularsRightWheel() {
		return stampParticularsRightWheel;
	}


	public void setStampParticularsRightWheel(String stampParticularsRightWheel) {
		this.stampParticularsRightWheel = stampParticularsRightWheel;
	}


	public String getStampParticularsWheel() {
		return stampParticularsWheel;
	}


	public void setStampParticularsWheel(String stampParticularsWheel) {
		this.stampParticularsWheel = stampParticularsWheel;
	}


	public String getStampParticularsAxle() {
		return stampParticularsAxle;
	}


	public void setStampParticularsAxle(String stampParticularsAxle) {
		this.stampParticularsAxle = stampParticularsAxle;
	}


	public String getModificationInWheelAxle() {
		return modificationInWheelAxle;
	}


	public void setModificationInWheelAxle(String modificationInWheelAxle) {
		this.modificationInWheelAxle = modificationInWheelAxle;
	}


	public String getTrialInWheelAxle() {
		return trialInWheelAxle;
	}


	public void setTrialInWheelAxle(String trialInWheelAxle) {
		this.trialInWheelAxle = trialInWheelAxle;
	}


	public String getRemarksInWheelAxle() {
		return remarksInWheelAxle;
	}


	public void setRemarksInWheelAxle(String remarksInWheelAxle) {
		this.remarksInWheelAxle = remarksInWheelAxle;
	}
	public String getDocNoCtrbTesting() {
		return docNoCtrbTesting;
	}
	public void setDocNoCtrbTesting(String docNoCtrbTesting) {
		this.docNoCtrbTesting = docNoCtrbTesting;
	}
	public String getDateOfCtrbTesting() {
		return dateOfCtrbTesting;
	}
	public void setDateOfCtrbTesting(String dateOfCtrbTesting) {
		this.dateOfCtrbTesting = dateOfCtrbTesting;
	}
	public String getShiftCtrbTesting() {
		return shiftCtrbTesting;
	}
	public void setShiftCtrbTesting(String shiftCtrbTesting) {
		this.shiftCtrbTesting = shiftCtrbTesting;
	}
	public String getDrawingNoCtrb() {
		return drawingNoCtrb;
	}
	public void setDrawingNoCtrb(String drawingNoCtrb) {
		this.drawingNoCtrb = drawingNoCtrb;
	}
	public String getWiNoCtrb() {
		return wiNoCtrb;
	}
	public void setWiNoCtrb(String wiNoCtrb) {
		this.wiNoCtrb = wiNoCtrb;
	}
	public String getAxleNumber() {
		return axleNumber;
	}
	public void setAxleNumber(String axleNumber) {
		this.axleNumber = axleNumber;
	}
	public String getAxleMake() {
		return axleMake;
	}
	public void setAxleMake(String axleMake) {
		this.axleMake = axleMake;
	}
	public String getWheelSetType() {
		return wheelSetType;
	}
	public void setWheelSetType(String wheelSetType) {
		this.wheelSetType = wheelSetType;
	}
	public String getCtrbItemAsDrawingFlag() {
		return ctrbItemAsDrawingFlag;
	}
	public void setCtrbItemAsDrawingFlag(String ctrbItemAsDrawingFlag) {
		this.ctrbItemAsDrawingFlag = ctrbItemAsDrawingFlag;
	}
	public String getCtrbComplianceWiFlag() {
		return ctrbComplianceWiFlag;
	}
	public void setCtrbComplianceWiFlag(String ctrbComplianceWiFlag) {
		this.ctrbComplianceWiFlag = ctrbComplianceWiFlag;
	}
	public String getFillingGreaseAxleFlag() {
		return fillingGreaseAxleFlag;
	}
	public void setFillingGreaseAxleFlag(String fillingGreaseAxleFlag) {
		this.fillingGreaseAxleFlag = fillingGreaseAxleFlag;
	}
	public String getDifferenceOfWheelDiaFlag() {
		return differenceOfWheelDiaFlag;
	}
	public void setDifferenceOfWheelDiaFlag(String differenceOfWheelDiaFlag) {
		this.differenceOfWheelDiaFlag = differenceOfWheelDiaFlag;
	}
	public String getDamageInJournalCtrb() {
		return damageInJournalCtrb;
	}
	public void setDamageInJournalCtrb(String damageInJournalCtrb) {
		this.damageInJournalCtrb = damageInJournalCtrb;
	}
	public String getLateralClearanceLeftCTRB() {
		return lateralClearanceLeftCTRB;
	}
	public void setLateralClearanceLeftCTRB(String lateralClearanceLeftCTRB) {
		this.lateralClearanceLeftCTRB = lateralClearanceLeftCTRB;
	}
	public String getLateralClearanceRightCTRB() {
		return lateralClearanceRightCTRB;
	}
	public void setLateralClearanceRightCTRB(String lateralClearanceRightCTRB) {
		this.lateralClearanceRightCTRB = lateralClearanceRightCTRB;
	}
	public String getPressingPressureLeftCTRB() {
		return pressingPressureLeftCTRB;
	}
	public void setPressingPressureLeftCTRB(String pressingPressureLeftCTRB) {
		this.pressingPressureLeftCTRB = pressingPressureLeftCTRB;
	}
	public String getPressingPressureRightCTRB() {
		return pressingPressureRightCTRB;
	}
	public void setPressingPressureRightCTRB(String pressingPressureRightCTRB) {
		this.pressingPressureRightCTRB = pressingPressureRightCTRB;
	}
	public String getTighteningHexagonalScrews() {
		return tighteningHexagonalScrews;
	}
	public void setTighteningHexagonalScrews(String tighteningHexagonalScrews) {
		this.tighteningHexagonalScrews = tighteningHexagonalScrews;
	}
	public String getModificationInCtrb() {
		return modificationInCtrb;
	}
	public void setModificationInCtrb(String modificationInCtrb) {
		this.modificationInCtrb = modificationInCtrb;
	}
	public String getTrialInCtrb() {
		return trialInCtrb;
	}
	public void setTrialInCtrb(String trialInCtrb) {
		this.trialInCtrb = trialInCtrb;
	}
	public String getRemarksInCtrb() {
		return remarksInCtrb;
	}
	public void setRemarksInCtrb(String remarksInCtrb) {
		this.remarksInCtrb = remarksInCtrb;
	}
	
}
