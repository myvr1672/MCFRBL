package struts.action.master;
import org.hibernate.Session;

import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;
public class ShowShellData {
   private String shellAssetId;
	private String sidewallType;
	private String docNoSideWall;
	private String shellNo;
	private String shellType;
	private String lavsidewallSipDocNo;
	private String docNoRoof;
	private String docnounderframe;
	private String endwallSipDocNo;
	private String endwallMakePp;
	private String endwallMakeNpp;
	private String sidewallMakeLh;
	private String sidewallMakeRh;
	private String stage2DocNo;
	private String stage2Shift;
	private String stage3DocNo;
	private String stage3Shift;
	private String dateStage1;
	private String docNoStage1;
	private String shellAssembledBy;
	private String jigNo;
	private String underframeCompleteMake;
	private String underframeNo;
	private String roofMake;
    private String formDocNoFinalInspection;
    private String finalInspectionFormDate;
    private String revNoFinalInspection;
    private String formDocNoShellAssembly;
	private String formRevNoShellAssembly;
	private String formVerShellAssembly;
	private String shellNo_Type;
	private String docnoshellstage4;
	public String showShellData()
	{
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
	sidewallType="Both";
	docNoSideWall="MCF/RBL/QMF 2002 Ver 02";
	docNoRoof="MCF/RBL/QMF 2002 Ver 02";
	lavsidewallSipDocNo="MCF/RBL/QMF 2002A Ver 01";
	docnounderframe="MCF/RBL/QMF 2002 Ver 02";
	endwallSipDocNo="MCF/RBL/QMF 2003 Ver 01";
	stage2DocNo="MCF/RBL/QMF 2006 Rev 01";
	dateStage1= "24/05/2019";
	docNoStage1="MCF/RBL/QMF 2005 Rev No. 03";
	stage2Shift="general";
	stage3DocNo="MCF/RBL/QMF 2006";
	stage3Shift="general";
	formDocNoFinalInspection="MCF/RBL/QMF 2011";
	revNoFinalInspection="00";
	finalInspectionFormDate="01-04-2019";
	formDocNoShellAssembly="MCF/RBL/QMF 2010";
	formRevNoShellAssembly="00";
	formVerShellAssembly="-0.00";	
	docnoshellstage4="MCF/RBL/QMF/2008 Rev 03";
	Session session=null;
	try
	{
	session=HibernateConfig.getSession();
	ShellTransaction shellTransaction= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
	shellNo=shellTransaction.getShellNumber();
	shellType=shellTransaction.getShellType();
	shellNo_Type=shellType+" / "+shellNo;
	endwallMakePp=shellTransaction.getEndwallMakePp();
	endwallMakeNpp=shellTransaction.getEndwallMakeNpp();
	sidewallMakeLh=shellTransaction.getSideWallMakeNoPp();
	sidewallMakeRh=shellTransaction.getSideWallMakeNoNpp();
	shellAssembledBy=shellTransaction.getShellAssembledBy();
	jigNo=shellTransaction.getJigNo();
	 underframeCompleteMake=shellTransaction.getUnderframeCompleteMake();
	underframeNo=shellTransaction.getUnderFrameNumber();
	//underframeCompleteMake=underframeMake +" /"+underframeNo;
	roofMake=shellTransaction.getRoofMake();
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

	public String getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getSideWallType() {
		return sidewallType;
	}

	public void setSideWallType(String sideWallType) {
		this.sidewallType = sideWallType;
	}

	public String getDocNoSideWall() {
		return docNoSideWall;
	}

	public void setDocNoSideWall(String docNoSideWall) {
		this.docNoSideWall = docNoSideWall;
	}

	public String getShellNo() {
		return shellNo;
	}

	public void setShellNo(String shellNo) {
		this.shellNo = shellNo;
	}

	public String getShellType() {
		return shellType;
	}

	public void setShellType(String shellType) {
		this.shellType = shellType;
	}

	public String getSidewallType() {
		return sidewallType;
	}

	public void setSidewallType(String sidewallType) {
		this.sidewallType = sidewallType;
	}

	public String getDocNoRoof() {
		return docNoRoof;
	}

	public void setDocNoRoof(String docNoRoof) {
		this.docNoRoof = docNoRoof;
	}

	public String getLavsidewallSipDocNo() {
		return lavsidewallSipDocNo;
	}

	public void setLavsidewallSipDocNo(String lavsidewallSipDocNo) {
		this.lavsidewallSipDocNo = lavsidewallSipDocNo;
	}

	public String getDocnounderframe() {
		return docnounderframe;
	}

	public void setDocnounderframe(String docnounderframe) {
		this.docnounderframe = docnounderframe;
	}

	public String getEndwallSipDocNo() {
		return endwallSipDocNo;
	}

	public void setEndwallSipDocNo(String endwallSipDocNo) {
		this.endwallSipDocNo = endwallSipDocNo;
	}

	public String getEndwallMakePp() {
		return endwallMakePp;
	}

	public void setEndwallMakePp(String endwallMakePp) {
		this.endwallMakePp = endwallMakePp;
	}

	public String getEndwallMakeNpp() {
		return endwallMakeNpp;
	}

	public void setEndwallMakeNpp(String endwallMakeNpp) {
		this.endwallMakeNpp = endwallMakeNpp;
	}

	public String getStage2DocNo() {
		return stage2DocNo;
	}

	public void setStage2DocNo(String stage2DocNo) {
		this.stage2DocNo = stage2DocNo;
	}

	public String getStage2Shift() {
		return stage2Shift;
	}

	public void setStage2Shift(String stage2Shift) {
		this.stage2Shift = stage2Shift;
	}

	public String getSidewallMakeLh() {
		return sidewallMakeLh;
	}

	public void setSidewallMakeLh(String sidewallMakeLh) {
		this.sidewallMakeLh = sidewallMakeLh;
	}

	public String getSidewallMakeRh() {
		return sidewallMakeRh;
	}

	public void setSidewallMakeRh(String sidewallMakeRh) {
		this.sidewallMakeRh = sidewallMakeRh;
	}

	public String getDateStage1() {
		return dateStage1;
	}

	public void setDateStage1(String dateStage1) {
		this.dateStage1 = dateStage1;
	}

	public String getDocNoStage1() {
		return docNoStage1;
	}

	public void setDocNoStage1(String docNoStage1) {
		this.docNoStage1 = docNoStage1;
	}

	public String getShellAssembledBy() {
		return shellAssembledBy;
	}

	public void setShellAssembledBy(String shellAssembledBy) {
		this.shellAssembledBy = shellAssembledBy;
	}

	public String getJigNo() {
		return jigNo;
	}

	public void setJigNo(String jigNo) {
		this.jigNo = jigNo;
	}

	public String getUnderframeCompleteMake() {
		return underframeCompleteMake;
	}

	public void setUnderframeCompleteMake(String underframeCompleteMake) {
		this.underframeCompleteMake = underframeCompleteMake;
	}

	public String getRoofMake() {
		return roofMake;
	}

	public void setRoofMake(String roofMake) {
		this.roofMake = roofMake;
	}

	public String getStage3DocNo() {
		return stage3DocNo;
	}

	public void setStage3DocNo(String stage3DocNo) {
		this.stage3DocNo = stage3DocNo;
	}

	public String getStage3Shift() {
		return stage3Shift;
	}

	public void setStage3Shift(String stage3Shift) {
		this.stage3Shift = stage3Shift;
	}

	public String getFormDocNoFinalInspection() {
		return formDocNoFinalInspection;
	}

	public void setFormDocNoFinalInspection(String formDocNoFinalInspection) {
		this.formDocNoFinalInspection = formDocNoFinalInspection;
	}

	public String getFinalInspectionFormDate() {
		return finalInspectionFormDate;
	}

	public void setFinalInspectionFormDate(String finalInspectionFormDate) {
		this.finalInspectionFormDate = finalInspectionFormDate;
	}

	public String getRevNoFinalInspection() {
		return revNoFinalInspection;
	}

	public void setRevNoFinalInspection(String revNoFinalInspection) {
		this.revNoFinalInspection = revNoFinalInspection;
	}

	public String getUnderframeNo() {
		return underframeNo;
	}

	public void setUnderframeNo(String underframeNo) {
		this.underframeNo = underframeNo;
	}

	public String getFormDocNoShellAssembly() {
		return formDocNoShellAssembly;
	}

	public void setFormDocNoShellAssembly(String formDocNoShellAssembly) {
		this.formDocNoShellAssembly = formDocNoShellAssembly;
	}

	public String getFormRevNoShellAssembly() {
		return formRevNoShellAssembly;
	}

	public void setFormRevNoShellAssembly(String formRevNoShellAssembly) {
		this.formRevNoShellAssembly = formRevNoShellAssembly;
	}

	public String getFormVerShellAssembly() {
		return formVerShellAssembly;
	}

	public void setFormVerShellAssembly(String formVerShellAssembly) {
		this.formVerShellAssembly = formVerShellAssembly;
	}

	public String getShellNo_Type() {
		return shellNo_Type;
	}

	public void setShellNo_Type(String shellNo_Type) {
		this.shellNo_Type = shellNo_Type;
	}

	public String getDocnoshellstage4() {
		return docnoshellstage4;
	}

	public void setDocnoshellstage4(String docnoshellstage4) {
		this.docnoshellstage4 = docnoshellstage4;
	}
	
}
