package struts.action.master;

import org.hibernate.Session;

import beans.WheelsetTransaction;
import hibernateConnect.HibernateConfig;
public class ShowExistingDataOfWheel {
	private String wheelsetAssetId;
	private String docNoWheelAxle;
	private String drawingNoWheelAxle;
	private String wiNoWheelAxle;
	private String wheeldiscLeftNo;
	private String wheeldiscRightNo;
	private String axleNumber;
	private String axleMake;
	private String wheelSetType;
	private String leftBrakeDiscMake;
	private String rightBrakeDiscMake;
	private String wheeldiscLeftMake;
	private String wheeldiscRightMake;
	private String docNoCTRB;
	private String drawingNoCTRB;
	private String wiNoCTRB;
	private Double journalDiaLeft;
	private Double journalDiaRight;
	private Double wheelDiaLeft;
	private Double wheelDiaRight;
	private Double distanceBetweenWheel;

	public String showData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer wheelsetAssetIdAsInt= Integer.parseInt(wheelsetAssetId);
		docNoWheelAxle= "RCF/RBL/QMF-4002 Ver. 01/2015";
		drawingNoWheelAxle="LW02001, GC-K6016, T02102 & EM02101";
		wiNoWheelAxle="PLW4701";
		wheelSetType="LHB";
		docNoCTRB="RCF/RBL/QMF 4001 01/2015";
		drawingNoCTRB="E-48999/PART No. H127746H-90010";
		wiNoCTRB="PLW 4705";
		WheelsetTransaction wheelsetTransaction= new WheelsetTransaction();
		wheelsetTransaction =(WheelsetTransaction) session.get(WheelsetTransaction.class, wheelsetAssetIdAsInt);
		wheeldiscLeftNo=wheelsetTransaction.getWheeldiscLeftNo();
		wheeldiscRightNo=wheelsetTransaction.getWheeldiscRightNo();
		axleNumber=wheelsetTransaction.getAxleNumber();
		axleMake=wheelsetTransaction.getAxleMake();
		leftBrakeDiscMake=wheelsetTransaction.getLeftBrakeDiscMake();
		rightBrakeDiscMake=wheelsetTransaction.getRightBrakeDiscMake();
		wheeldiscLeftMake=wheelsetTransaction.getWheeldiscLeftMake();
		wheeldiscRightMake=wheelsetTransaction.getWheeldiscRightMake();
		journalDiaLeft=wheelsetTransaction.getJournalDiaLeft();
		journalDiaRight= wheelsetTransaction.getJournalDiaRight();
		wheelDiaLeft=wheelsetTransaction.getWheelDiaLeft();
		wheelDiaRight=wheelsetTransaction.getWheelDiaRight();
		distanceBetweenWheel=wheelsetTransaction.getDistanceBetweenWheel();
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			
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
	public String getWheeldiscLeftNo() {
		return wheeldiscLeftNo;
	}
	public void setWheeldiscLeftNo(String wheeldiscLeftNo) {
		this.wheeldiscLeftNo = wheeldiscLeftNo;
	}
	public String getWheeldiscRightNo() {
		return wheeldiscRightNo;
	}
	public void setWheeldiscRightNo(String wheeldiscRightNo) {
		this.wheeldiscRightNo = wheeldiscRightNo;
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
	public String getLeftBrakeDiscMake() {
		return leftBrakeDiscMake;
	}
	public void setLeftBrakeDiscMake(String leftBrakeDiscMake) {
		this.leftBrakeDiscMake = leftBrakeDiscMake;
	}
	public String getRightBrakeDiscMake() {
		return rightBrakeDiscMake;
	}
	public void setRightBrakeDiscMake(String rightBrakeDiscMake) {
		this.rightBrakeDiscMake = rightBrakeDiscMake;
	}
	public String getWheeldiscLeftMake() {
		return wheeldiscLeftMake;
	}
	public void setWheeldiscLeftMake(String wheeldiscLeftMake) {
		this.wheeldiscLeftMake = wheeldiscLeftMake;
	}
	public String getWheeldiscRightMake() {
		return wheeldiscRightMake;
	}
	public void setWheeldiscRightMake(String wheeldiscRightMake) {
		this.wheeldiscRightMake = wheeldiscRightMake;
	}
	public String getDocNoCTRB() {
		return docNoCTRB;
	}
	public void setDocNoCTRB(String docNoCTRB) {
		this.docNoCTRB = docNoCTRB;
	}
	public String getDrawingNoCTRB() {
		return drawingNoCTRB;
	}
	public void setDrawingNoCTRB(String drawingNoCTRB) {
		this.drawingNoCTRB = drawingNoCTRB;
	}
	public String getWiNoCTRB() {
		return wiNoCTRB;
	}
	public void setWiNoCTRB(String wiNoCTRB) {
		this.wiNoCTRB = wiNoCTRB;
	}
	public Double getJournalDiaLeft() {
		return journalDiaLeft;
	}
	public void setJournalDiaLeft(Double journalDiaLeft) {
		this.journalDiaLeft = journalDiaLeft;
	}
	public Double getJournalDiaRight() {
		return journalDiaRight;
	}
	public void setJournalDiaRight(Double journalDiaRight) {
		this.journalDiaRight = journalDiaRight;
	}
	public Double getWheelDiaLeft() {
		return wheelDiaLeft;
	}
	public void setWheelDiaLeft(Double wheelDiaLeft) {
		this.wheelDiaLeft = wheelDiaLeft;
	}
	public Double getWheelDiaRight() {
		return wheelDiaRight;
	}
	public void setWheelDiaRight(Double wheelDiaRight) {
		this.wheelDiaRight = wheelDiaRight;
	}
	public Double getDistanceBetweenWheel() {
		return distanceBetweenWheel;
	}
	public void setDistanceBetweenWheel(Double distanceBetweenWheel) {
		this.distanceBetweenWheel = distanceBetweenWheel;
	}
	
}
