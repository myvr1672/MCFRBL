package struts.action.master;
import org.hibernate.Session;

import beans.WheelsetTransaction;
import beans.BogiesetTransaction;

import hibernateConnect.HibernateConfig;

public class ShowexistingdataofbogieSIP {
	private String fiatbogieDocNo;
	private String fiatbogiedrawingNo;
    private String bogieType;
	private String bogieNo;
	private String frameMake;
	private String frameno;
	private String brakeCylinderNo1;
	private String brakeCylinderNo2;
	private String brakeCylinderNo3;
	private String brakeCylinderNo4;
	private String vsaprimemake;
	private String vsaprimeno;
	private String vsasecmake;
	private String vsasecno;
	private String lateralshockmake;
	private String lateralshockno;
	private String bolstermake;
	private String bolsNo;
	private String typeofwheel;
	private String airspringmakeno1;
	private String airspringmakeno2;
	private String bogieAssetId;
	
	public String axleNoLeft;
	public String axleNoRight;
	
	
    public String fetchdata()
    {
    	System.out.println("hii");
          
		Integer bogieAssetIdAsInt=Integer.parseInt(bogieAssetId);
	
		System.out.println("hii2");
		//Integer wheelsetAssetIdAsInt=Integer.parseInt(wheelsetAssetId);
		System.out.println("hii3");
		
		fiatbogieDocNo="MCF/RBL/QMF 5005 Ver 03/2016";
		fiatbogiedrawingNo="LW90033 Alt.-b";
		

		Session session=null;
		try{
		session=HibernateConfig.getSession();
        BogiesetTransaction bogieSetTran=(BogiesetTransaction) session.get(BogiesetTransaction.class, bogieAssetIdAsInt);
       //WheelsetTransaction wheelsetTransaction=(WheelsetTransaction) session.get(WheelsetTransaction.class,wheelsetAssetIdAsInt);
      //  BogieStaticSipTran bogieStaticSipTran=(BogieStaticSipTran) session.get(BogieStaticSipTran.class,bogieAssetIdAsInt);
        bogieNo=bogieSetTran.getBogieNumber();
        frameno=bogieSetTran.getFrameNo();
        frameMake=bogieSetTran.getFrameMake();
        bogieType=bogieSetTran.getBogieType();
        brakeCylinderNo1=bogieSetTran.getBrakeCylinderNo1();
        brakeCylinderNo2=bogieSetTran.getBrakeCylinderNo2();
        brakeCylinderNo3=bogieSetTran.getBrakeCylinderNo3();
        brakeCylinderNo4=bogieSetTran.getBrakeCylinderNo4();
        vsaprimemake=bogieSetTran.getVsaAtPrimarySuspMake();
        vsaprimeno=bogieSetTran.getVsaAtPrimarySuspNo();
        vsasecmake=bogieSetTran.getVsaAtSecondarySuspMake();
        vsasecno=bogieSetTran.getVsaAtSecondarySuspNo();
        lateralshockmake=bogieSetTran.getLateralShockAbsorberMake();
        lateralshockno=bogieSetTran.getLateralShockAbsorberNo();
        bolstermake=bogieSetTran.getBolsterMake();
        bolsNo=bogieSetTran.getBolsNo();
       // typeofwheel=wheelsetTransaction.getWheelSetType();
        airspringmakeno1=bogieSetTran.getSecAirSpringNo1();
        airspringmakeno2=bogieSetTran.getSecAirSpringNo2();
        
        
        
        
   //Axle no...
		Integer leftAxleId=bogieSetTran.getLeftWheelAssetId();
		WheelsetTransaction wt_left=(WheelsetTransaction) session.get(WheelsetTransaction.class, leftAxleId);
		
	   String	axleNumberLeft=wt_left.getAxleNumber();
		String axleMakeLeft=wt_left.getAxleMake();
		typeofwheel=wt_left.getWheelSetType();
		System.out.println("Type"+typeofwheel);
		System.out.println("ID"+leftAxleId);
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


	public String getTypeofwheel() {
		return typeofwheel;
	}


	public void setTypeofwheel(String typeofwheel) {
		this.typeofwheel = typeofwheel;
	}


	public String getFiatbogieDocNo() {
		return fiatbogieDocNo;
	}


	public void setFiatbogieDocNo(String fiatbogieDocNo) {
		this.fiatbogieDocNo = fiatbogieDocNo;
	}


	
	public String getFrameMake() {
		return frameMake;
	}


	public void setFrameMake(String frameMake) {
		this.frameMake = frameMake;
	}


	public String getFrameno() {
		return frameno;
	}


	public void setFrameno(String frameno) {
		this.frameno = frameno;
	}


	

	
	public String getVsaprimemake() {
		return vsaprimemake;
	}


	public void setVsaprimemake(String vsaprimemake) {
		this.vsaprimemake = vsaprimemake;
	}


	public String getVsaprimeno() {
		return vsaprimeno;
	}


	public void setVsaprimeno(String vsaprimeno) {
		this.vsaprimeno = vsaprimeno;
	}


	public String getVsasecmake() {
		return vsasecmake;
	}


	public void setVsasecmake(String vsasecmake) {
		this.vsasecmake = vsasecmake;
	}


	public String getVsasecno() {
		return vsasecno;
	}


	public void setVsasecno(String vsasecno) {
		this.vsasecno = vsasecno;
	}


	public String getLateralshockmake() {
		return lateralshockmake;
	}


	public void setLateralshockmake(String lateralshockmake) {
		this.lateralshockmake = lateralshockmake;
	}


	public String getLateralshockno() {
		return lateralshockno;
	}


	public void setLateralshockno(String lateralshockno) {
		this.lateralshockno = lateralshockno;
	}


	public String getBolstermake() {
		return bolstermake;
	}


	public void setBolstermake(String bolstermake) {
		this.bolstermake = bolstermake;
	}


	

	public String getBogieType() {
		return bogieType;
	}


	public void setBogieType(String bogieType) {
		this.bogieType = bogieType;
	}


	public String getBogieNo() {
		return bogieNo;
	}


	public void setBogieNo(String bogieNo) {
		this.bogieNo = bogieNo;
	}


	public String getBolsNo() {
		return bolsNo;
	}


	public void setBolsNo(String bolsNo) {
		this.bolsNo = bolsNo;
	}


	public String getAirspringmakeno1() {
		return airspringmakeno1;
	}


	public void setAirspringmakeno1(String airspringmakeno1) {
		this.airspringmakeno1 = airspringmakeno1;
	}


	public String getAirspringmakeno2() {
		return airspringmakeno2;
	}


	public void setAirspringmakeno2(String airspringmakeno2) {
		this.airspringmakeno2 = airspringmakeno2;
	}


	public String getBogieAssetId() {
		return bogieAssetId;
	}


	public void setBogieAssetId(String bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
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
    
	
	public String getFiatbogiedrawingNo() {
		return fiatbogiedrawingNo;
	}


	public void setFiatbogiedrawingNo(String fiatbogiedrawingNo) {
		this.fiatbogiedrawingNo = fiatbogiedrawingNo;
	}
    
	
	    }



