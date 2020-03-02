package struts.action.master;


import org.hibernate.Session;

import beans.BogiesetTransaction;
import beans.FurnishingTransaction;
import beans.PaintTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShowExistingDataofAirBrake {
	
	private String furnishingAssetId;
	private String shellNumberType;
	private String furnishingNumber;
	private String cbcPpEndMake;
	private String cbcPpEndSrno;
    private String cbcNppEndMake;
	private String cbcNppEndSrno;
	private String bogiePpEndMake;
	private String bogiePpEndSrno;
    private String bogieNppEndMake;
	private String bogieNppEndSrno;
	private String brakePanelMake;
	private String brakePanelSrno;
	private String distributorValveMake;
	private String distributorValveSrno;
	private String pullBoxMake;
	private String pullBoxNo;
	private String handBrakeMake;
	private String handBrakeNo;
	private String bufferMake;
	private String bufferSrno;
	private String docNoAirbrake;
	public String showAirBrakeData()
	{
		System.out.println("Furnishing:"+furnishingAssetId);
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		Session session=null;
		try{
		session=HibernateConfig.getSession();
		FurnishingTransaction furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		//FunishingTran
		bufferMake=furnishingTransaction.getBufferMake();
		bufferSrno=furnishingTransaction.getBufferSrno();
		brakePanelMake=furnishingTransaction.getBrakePanelMake();
		brakePanelSrno=furnishingTransaction.getBrakePanelSrno();
		distributorValveMake=furnishingTransaction.getDistributorValveMake();
		distributorValveSrno=furnishingTransaction.getDistributorValveSrno();
		pullBoxMake=furnishingTransaction.getPullBoxMake();
		pullBoxNo=furnishingTransaction.getPullBoxNo();
		handBrakeMake=furnishingTransaction.getHandBrakeMake();
		handBrakeNo=furnishingTransaction.getHandBrakeNo();
		
		
		//PaintTran
		Integer paintAsseId=furnishingTransaction.getPaintAssetId();
		PaintTransaction paintTransaction=(PaintTransaction) session.get(PaintTransaction.class, paintAsseId);
		furnishingNumber=paintTransaction.getFurnishingNumber();
		
		//ShellTran
		Integer shellAssetId=furnishingTransaction.getShellAssetId();
		ShellTransaction shellTransaction=(ShellTransaction) session.get(ShellTransaction.class, shellAssetId);
		String shellType=shellTransaction.getShellType();
		String shellNumber=shellTransaction.getShellNumber();
		shellNumberType=shellType+"/"+shellNumber;
		cbcPpEndMake=shellTransaction.getCbcPpEndMake();
		cbcPpEndSrno=shellTransaction.getCbcPpEndSrno();
		cbcNppEndMake=shellTransaction.getCbcNppEndMake();
		cbcNppEndSrno=shellTransaction.getCbcNppEndSrno();
		
		
		//BogieTran
		Integer bogiePPAssetId=furnishingTransaction.getBogiePpSideAssetId();
		System.out.println("BogiePP"+bogiePPAssetId);
		BogiesetTransaction bogiesetTransactionPP=(BogiesetTransaction) session.get(BogiesetTransaction.class,bogiePPAssetId);
		bogiePpEndMake=bogiesetTransactionPP.getBogieType();
		bogiePpEndSrno=bogiesetTransactionPP.getBogieNumber();
		
		Integer bogieNPPAssetId=furnishingTransaction.getBogieNppSideAssetId();
		System.out.println("BogieNPP"+bogieNPPAssetId);
		BogiesetTransaction bogiesetTransactionNPP=(BogiesetTransaction) session.get(BogiesetTransaction.class,bogieNPPAssetId);
		bogieNppEndMake=bogiesetTransactionNPP.getBogieType();
		bogieNppEndSrno=bogiesetTransactionNPP.getBogieNumber();
		
		docNoAirbrake="MCF/RBL/QMF 7011";
	
		System.out.println("Furnishing:"+furnishingAssetIdAsInt);
		System.out.println("Shell:"+shellAssetId);
		System.out.println("paint:"+paintAsseId);
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
		return "success";
	}

	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getShellNumberType() {
		return shellNumberType;
	}

	public void setShellNumberType(String shellNumberType) {
		this.shellNumberType = shellNumberType;
	}

	public String getFurnishingNumber() {
		return furnishingNumber;
	}

	public void setFurnishingNumber(String furnishingNumber) {
		this.furnishingNumber = furnishingNumber;
	}

	public String getCbcPpEndMake() {
		return cbcPpEndMake;
	}

	public void setCbcPpEndMake(String cbcPpEndMake) {
		this.cbcPpEndMake = cbcPpEndMake;
	}

	public String getCbcPpEndSrno() {
		return cbcPpEndSrno;
	}

	public void setCbcPpEndSrno(String cbcPpEndSrno) {
		this.cbcPpEndSrno = cbcPpEndSrno;
	}

	public String getCbcNppEndMake() {
		return cbcNppEndMake;
	}

	public void setCbcNppEndMake(String cbcNppEndMake) {
		this.cbcNppEndMake = cbcNppEndMake;
	}

	public String getCbcNppEndSrno() {
		return cbcNppEndSrno;
	}

	public void setCbcNppEndSrno(String cbcNppEndSrno) {
		this.cbcNppEndSrno = cbcNppEndSrno;
	}

	public String getBogiePpEndMake() {
		return bogiePpEndMake;
	}

	public void setBogiePpEndMake(String bogiePpEndMake) {
		this.bogiePpEndMake = bogiePpEndMake;
	}

	public String getBogiePpEndSrno() {
		return bogiePpEndSrno;
	}

	public void setBogiePpEndSrno(String bogiePpEndSrno) {
		this.bogiePpEndSrno = bogiePpEndSrno;
	}

	public String getBogieNppEndMake() {
		return bogieNppEndMake;
	}

	public void setBogieNppEndMake(String bogieNppEndMake) {
		this.bogieNppEndMake = bogieNppEndMake;
	}

	public String getBogieNppEndSrno() {
		return bogieNppEndSrno;
	}

	public void setBogieNppEndSrno(String bogieNppEndSrno) {
		this.bogieNppEndSrno = bogieNppEndSrno;
	}

	public String getBrakePanelMake() {
		return brakePanelMake;
	}

	public void setBrakePanelMake(String brakePanelMake) {
		this.brakePanelMake = brakePanelMake;
	}

	public String getBrakePanelSrno() {
		return brakePanelSrno;
	}

	public void setBrakePanelSrno(String brakePanelSrno) {
		this.brakePanelSrno = brakePanelSrno;
	}

	public String getDistributorValveMake() {
		return distributorValveMake;
	}

	public void setDistributorValveMake(String distributorValveMake) {
		this.distributorValveMake = distributorValveMake;
	}

	public String getDistributorValveSrno() {
		return distributorValveSrno;
	}

	public void setDistributorValveSrno(String distributorValveSrno) {
		this.distributorValveSrno = distributorValveSrno;
	}

	public String getPullBoxMake() {
		return pullBoxMake;
	}

	public void setPullBoxMake(String pullBoxMake) {
		this.pullBoxMake = pullBoxMake;
	}

	public String getPullBoxNo() {
		return pullBoxNo;
	}

	public void setPullBoxNo(String pullBoxNo) {
		this.pullBoxNo = pullBoxNo;
	}

	public String getHandBrakeMake() {
		return handBrakeMake;
	}

	public void setHandBrakeMake(String handBrakeMake) {
		this.handBrakeMake = handBrakeMake;
	}

	public String getHandBrakeNo() {
		return handBrakeNo;
	}

	public void setHandBrakeNo(String handBrakeNo) {
		this.handBrakeNo = handBrakeNo;
	}

	public String getBufferMake() {
		return bufferMake;
	}

	public void setBufferMake(String bufferMake) {
		this.bufferMake = bufferMake;
	}

	public String getBufferSrno() {
		return bufferSrno;
	}

	public void setBufferSrno(String bufferSrno) {
		this.bufferSrno = bufferSrno;
	}

	public String getDocNoAirbrake() {
		return docNoAirbrake;
	}

	public void setDocNoAirbrake(String docNoAirbrake) {
		this.docNoAirbrake = docNoAirbrake;
	}

}
