package struts.action.master;
import java.util.Date;



import org.hibernate.Session;

import beans.FurnishingTransaction;
import beans.PaintTransaction;
import beans.ShellTransaction;
import beans.BogiesetTransaction;
import hibernateConnect.HibernateConfig;

public class ShowFIBATestData {

   private String furnishingAssetId;
   private String shellType;
   private String shellNo;
   private String fibaDocNo;
   private String fibaRevno;
   public String getFibaDocNo() {
	return fibaDocNo;
}
public void setFibaDocNo(String fibaDocNo) {
	this.fibaDocNo = fibaDocNo;
}
public String getFibaRevno() {
	return fibaRevno;
}
public void setFibaRevno(String fibaRevno) {
	this.fibaRevno = fibaRevno;
}
private String furnishingNo;
   private String coachNumber;
   private String coachType;
   private String bogiePPEndMake;
   private String bogiePPEndSerial;
   private Date	 bogiePPMfgDate;
  private String bogieNPPEndMake;
  private String bogieNPPEndSerial;
  private Date	bogieNPPMfgDate;
   private String fibaPPMake;
   private String fibaPPSerial;
   private Date fibaPPMfgDate;
   private String fibaNPPMake;
   private String fibaNPPSerial;
   private Date fibaNPPMfgDate;
   private String indicatorPPMake;
   private String indicatorPPSerial;
   private Date indicatorPPMfgDate;
   private String indicatorNPPMake;
   private String indicatorNPPSerial;
   private Date indicatorNPPMfgDate;
   public String getFurnishingAssetId() {
	return furnishingAssetId;
}
public void setFurnishingAssetId(String furnishingAssetId) {
	this.furnishingAssetId = furnishingAssetId;
}
public String getShellType() {
	return shellType;
}
public void setShellType(String shellType) {
	this.shellType = shellType;
}
public String getShellNo() {
	return shellNo;
}
public void setShellNo(String shellNo) {
	this.shellNo = shellNo;
}
public String getFurnishingNo() {
	return furnishingNo;
}
public void setFurnishingNo(String furnishingNo) {
	this.furnishingNo = furnishingNo;
}
public String getCoachNumber() {
	return coachNumber;
}
public void setCoachNumber(String coachNumber) {
	this.coachNumber = coachNumber;
}
public String getCoachType() {
	return coachType;
}
public void setCoachType(String coachType) {
	this.coachType = coachType;
}

public String getBogiePPEndMake() {
	return bogiePPEndMake;
}
public void setBogiePPEndMake(String bogiePPEndMake) {
	this.bogiePPEndMake = bogiePPEndMake;
}
public String getBogiePPEndSerial() {
	return bogiePPEndSerial;
}
public void setBogiePPEndSerial(String bogiePPEndSerial) {
	this.bogiePPEndSerial = bogiePPEndSerial;
}
public Date getBogiePPMfgDate() {
	return bogiePPMfgDate;
}
public void setBogiePPMfgDate(Date bogiePPMfgDate) {
	this.bogiePPMfgDate = bogiePPMfgDate;
}
public String getBogieNPPEndMake() {
	return bogieNPPEndMake;
}
public void setBogieNPPEndMake(String bogieNPPEndMake) {
	this.bogieNPPEndMake = bogieNPPEndMake;
}
public String getBogieNPPEndSerial() {
	return bogieNPPEndSerial;
}
public void setBogieNPPEndSerial(String bogieNPPEndSerial) {
	this.bogieNPPEndSerial = bogieNPPEndSerial;
}
public Date getBogieNPPMfgDate() {
	return bogieNPPMfgDate;
}
public void setBogieNPPMfgDate(Date bogieNPPMfgDate) {
	this.bogieNPPMfgDate = bogieNPPMfgDate;
}
public String getFibaPPMake() {
	return fibaPPMake;
}
public void setFibaPPMake(String fibaPPMake) {
	this.fibaPPMake = fibaPPMake;
}

public String getFibaPPSerial() {
	return fibaPPSerial;
}
public void setFibaPPSerial(String fibaPPSerial) {
	this.fibaPPSerial = fibaPPSerial;
}

public Date getFibaPPMfgDate() {
	return fibaPPMfgDate;
}
public void setFibaPPMfgDate(Date fibaPPMfgDate) {
	this.fibaPPMfgDate = fibaPPMfgDate;
}
public Date getFibaNPPMfgDate() {
	return fibaNPPMfgDate;
}
public void setFibaNPPMfgDate(Date fibaNPPMfgDate) {
	this.fibaNPPMfgDate = fibaNPPMfgDate;
}
public String getFibaNPPMake() {
	return fibaNPPMake;
}
public void setFibaNPPMake(String fibaNPPMake) {
	this.fibaNPPMake = fibaNPPMake;
}
public String getFibaNPPSerial() {
	return fibaNPPSerial;
}
public void setFibaNPPSerial(String fibaNPPSerial) {
	this.fibaNPPSerial = fibaNPPSerial;
}

public String getIndicatorPPMake() {
	return indicatorPPMake;
}
public void setIndicatorPPMake(String indicatorPPMake) {
	this.indicatorPPMake = indicatorPPMake;
}
public String getIndicatorPPSerial() {
	return indicatorPPSerial;
}
public void setIndicatorPPSerial(String indicatorPPSerial) {
	this.indicatorPPSerial = indicatorPPSerial;
}


public String getIndicatorNPPMake() {
	return indicatorNPPMake;
}
public void setIndicatorNPPMake(String indicatorNPPMake) {
	this.indicatorNPPMake = indicatorNPPMake;
}
public String getIndicatorNPPSerial() {
	return indicatorNPPSerial;
}

public void setIndicatorNPPSerial(String indicatorNPPSerial) {
	this.indicatorNPPSerial = indicatorNPPSerial;
}

	public Date getIndicatorPPMfgDate() {
	return indicatorPPMfgDate;
}
public void setIndicatorPPMfgDate(Date indicatorPPMfgDate) {
	this.indicatorPPMfgDate = indicatorPPMfgDate;
}
public Date getIndicatorNPPMfgDate() {
	return indicatorNPPMfgDate;
}
public void setIndicatorNPPMfgDate(Date indicatorNPPMfgDate) {
	this.indicatorNPPMfgDate = indicatorNPPMfgDate;
}

	public String showFIBATestData()
	{
	Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
	Session session=null;
	try
	{
	session=HibernateConfig.getSession();
	FurnishingTransaction furnTransaction= (FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdAsInt);
	fibaDocNo="MCF/RBL/QMF 7011a";
	fibaRevno="01";
	coachNumber=furnTransaction.getCoachNumber();
	coachType=furnTransaction.getCoachType(); 
	fibaPPMake=furnTransaction.getFibaPPMake();
	fibaPPSerial=furnTransaction.getFibaPPSerial();
	fibaPPMfgDate=furnTransaction.getFibaPPMfgDate();
	fibaNPPMake=furnTransaction.getFibaNPPMake();
	fibaPPSerial=furnTransaction.getFibaNPPSerial();
	fibaNPPMfgDate=furnTransaction.getFibaNPPMfgDate();
	indicatorPPMake=furnTransaction.getIndicatorPPMake();
	indicatorPPSerial=furnTransaction.getIndicatorPPSerial();
	indicatorPPMfgDate=furnTransaction.getIndicatorPPMfgDate();
	indicatorNPPMake=furnTransaction.getIndicatorNPPMake();
	indicatorNPPSerial=furnTransaction.getIndicatorNPPSerial();
	indicatorNPPMfgDate=furnTransaction.getIndicatorNPPMfgDate();
	Integer shellAssetId=furnTransaction.getShellAssetId();
	ShellTransaction shellTransaction= (ShellTransaction) session.get(ShellTransaction.class, shellAssetId);
	shellNo=shellTransaction.getShellNumber();
	shellType=shellTransaction.getShellType();
	Integer paintAssetId=furnTransaction.getPaintAssetId();
	PaintTransaction paintTran= (PaintTransaction) session.get(PaintTransaction.class,paintAssetId);
	furnishingNo=paintTran.getFurnishingNumber();
	Integer bogiePPAssetId=furnTransaction.getBogiePpSideAssetId();
	
	
	// bogie pp side detail
	BogiesetTransaction bogieTranPP= (BogiesetTransaction) session.get(BogiesetTransaction.class,bogiePPAssetId);
	if(bogieTranPP != null)
    {
		bogiePPEndMake=bogieTranPP.getBogieType();
		System.out.println("bogietype"+bogiePPEndMake);
        bogiePPEndSerial=bogieTranPP.getBogieNumber();
        bogiePPMfgDate=bogieTranPP.getAssemblyEndDate();
    }
	// bogie npp side detail
	Integer bogieNPPAssetId=furnTransaction.getBogieNppSideAssetId();
	BogiesetTransaction bogieTranNPP= (BogiesetTransaction) session.get(BogiesetTransaction.class,bogieNPPAssetId);
	if(bogieTranNPP != null)
    {
		bogieNPPEndMake=bogieTranNPP.getBogieType();
        bogieNPPEndSerial=bogieTranNPP.getBogieNumber();
        bogieNPPMfgDate=bogieTranNPP.getAssemblyEndDate();
    }
	
	return "success";
	}
	catch(Exception Ex)
	{
		Ex.printStackTrace();
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

	}