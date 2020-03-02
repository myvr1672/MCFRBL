package struts.action.master;
import org.hibernate.Session;
import beans.WheelsetTransaction;
import beans.BogiesetTransaction;
import hibernateConnect.HibernateConfig;
public class ShowExistingDataofBogie {
   private String bogieAssetId;
   private String drawingNoFinalSip;
   private String formNoFinalSip;
   private String bogieNo;
   private String bogieType;
   private String frameNo;
   private String bolsNo;
   private String axleNoLeft;
   private String axleNoRight;
   private String brakeCylinderNo1;
   private String brakeCylinderNo2;
   private String brakeCylinderNo3;
   private String brakeCylinderNo4;
   private String brakeCaliperNo1;
   private String brakeCaliperNo2;
   private String brakeCaliperNo3;
   private String brakeCaliperNo4;
   
	public String showData()
	{
		Integer bogieAssetIdAsInt=Integer.parseInt(bogieAssetId);
		drawingNoFinalSip="LWL0033 Alt -b";
		formNoFinalSip="MCF/RBL/QMF 5005 Ver 03/2016";
		Session session=null;
		try{
		session=HibernateConfig.getSession();
		
		BogiesetTransaction bogieSetTran=(BogiesetTransaction) session.get(BogiesetTransaction.class, bogieAssetIdAsInt);
		bogieNo=bogieSetTran.getBogieNumber();
		frameNo=bogieSetTran.getFrameNo();;
		bolsNo=bogieSetTran.getBolsNo();
		brakeCylinderNo1=bogieSetTran.getBrakeCylinderNo1();
	
		brakeCylinderNo2=bogieSetTran.getBrakeCylinderNo2();
		brakeCylinderNo3=bogieSetTran.getBrakeCylinderNo3();
		brakeCylinderNo4=bogieSetTran.getBrakeCylinderNo4();
		brakeCaliperNo1=bogieSetTran.getBrakeCaliperNo1();
		brakeCaliperNo2=bogieSetTran.getBrakeCaliperNo2();
		brakeCaliperNo3=bogieSetTran.getBrakeCaliperNo3();
		brakeCaliperNo4=bogieSetTran.getBrakeCaliperNo4();
		bogieType=bogieSetTran.getBogieType();
		//Axle no...
		Integer leftAxleId=bogieSetTran.getLeftWheelAssetId();
		WheelsetTransaction wt_left=(WheelsetTransaction) session.get(WheelsetTransaction.class, leftAxleId);
	   String	axleNumberLeft=wt_left.getAxleNumber();
		String axleMakeLeft=wt_left.getAxleMake();
		axleNoLeft=axleNumberLeft+" /"+axleMakeLeft;
		Integer rightAxleId=bogieSetTran.getRightWheelAssetId();
		WheelsetTransaction wt_right=(WheelsetTransaction) session.get(WheelsetTransaction.class, rightAxleId);
		String axleNumberRight=wt_right.getAxleNumber();
		String axleMakeRight=wt_right.getAxleMake();
		axleNoRight=axleNumberRight+"/"+axleMakeRight;
		return "success";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
			
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}

	public String getBogieAssetId() {
		return bogieAssetId;
	}

	public void setBogieAssetId(String bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}

	public String getDrawingNoFinalSip() {
		return drawingNoFinalSip;
	}

	public void setDrawingNoFinalSip(String drawingNoFinalSip) {
		this.drawingNoFinalSip = drawingNoFinalSip;
	}

	public String getFormNoFinalSip() {
		return formNoFinalSip;
	}

	public void setFormNoFinalSip(String formNoFinalSip) {
		this.formNoFinalSip = formNoFinalSip;
	}

	public String getBogieNo() {
		return bogieNo;
	}

	public void setBogieNo(String bogieNo) {
		this.bogieNo = bogieNo;
	}

	public String getBogieType() {
		return bogieType;
	}

	public void setBogieType(String bogieType) {
		this.bogieType = bogieType;
	}

	public String getFrameNo() {
		return frameNo;
	}

	public void setFrameNo(String frameNo) {
		this.frameNo = frameNo;
	}

	public String getBolsNo() {
		return bolsNo;
	}

	public void setBolsNo(String bolsNo) {
		this.bolsNo = bolsNo;
	}

	public String getAxleNoLeft() {
		return axleNoLeft;
	}

	public void setAxleNoLeft(String axleNoLeft) {
		this.axleNoLeft = axleNoLeft;
	}

	public String getAxleNoRight() {
		return axleNoRight;
	}

	public void setAxleNoRight(String axleNoRight) {
		this.axleNoRight = axleNoRight;
	}

	public String getBrakeCylinderNo1() {
		return brakeCylinderNo1;
	}

	public void setBrakeCylinderNo1(String brakeCylinderNo1) {
		this.brakeCylinderNo1 = brakeCylinderNo1;
	}

	public String getBrakeCylinderNo2() {
		return brakeCylinderNo2;
	}

	public void setBrakeCylinderNo2(String brakeCylinderNo2) {
		this.brakeCylinderNo2 = brakeCylinderNo2;
	}

	public String getBrakeCylinderNo3() {
		return brakeCylinderNo3;
	}

	public void setBrakeCylinderNo3(String brakeCylinderNo3) {
		this.brakeCylinderNo3 = brakeCylinderNo3;
	}

	public String getBrakeCylinderNo4() {
		return brakeCylinderNo4;
	}

	public void setBrakeCylinderNo4(String brakeCylinderNo4) {
		this.brakeCylinderNo4 = brakeCylinderNo4;
	}

	public String getBrakeCaliperNo1() {
		return brakeCaliperNo1;
	}

	public void setBrakeCaliperNo1(String brakeCaliperNo1) {
		this.brakeCaliperNo1 = brakeCaliperNo1;
	}

	public String getBrakeCaliperNo2() {
		return brakeCaliperNo2;
	}

	public void setBrakeCaliperNo2(String brakeCaliperNo2) {
		this.brakeCaliperNo2 = brakeCaliperNo2;
	}

	public String getBrakeCaliperNo3() {
		return brakeCaliperNo3;
	}

	public void setBrakeCaliperNo3(String brakeCaliperNo3) {
		this.brakeCaliperNo3 = brakeCaliperNo3;
	}

	public String getBrakeCaliperNo4() {
		return brakeCaliperNo4;
	}

	public void setBrakeCaliperNo4(String brakeCaliperNo4) {
		this.brakeCaliperNo4 = brakeCaliperNo4;
	}

	
}
