package struts.action.master;
import org.hibernate.Session;
import beans.BogiesetTransaction;

import beans.FurnishingTransaction;
import beans.PaintTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;


public class Showexistingdataofbuffercbcheight {
	private String furnishingAssetId;
	private String docnobuffercbcheight;
	private String shelltype;
	private String shellno;
	private String coachtype;
	private String coachno;
	private String furno;
	private String dampernppa1;
	private String dampernppa2;
	private String damperppa1;
	private String damperppa2;
	private String bogiepp;
	private String bogienpp;
	
	public String fetchdata()
	{
		Integer furnishingAssetIdasint=Integer.parseInt(furnishingAssetId);
		docnobuffercbcheight="MCF/RBL/QMF 5005 Ver 03/2016";
		Session session=null;
		try
		{
			session=HibernateConfig.getSession();
			FurnishingTransaction furnishingTransaction=(FurnishingTransaction) session.get(FurnishingTransaction.class,furnishingAssetIdasint);
			
			coachtype=furnishingTransaction.getCoachType();
			coachno=furnishingTransaction.getCoachNumber();
			dampernppa1=furnishingTransaction.getYawDamperNPPVertical();
			dampernppa2=furnishingTransaction.getYawDamperNPPHorizontal();
			damperppa1=furnishingTransaction.getYawDamperPPVertical();
			damperppa2=furnishingTransaction.getYawDamperPPHorizontal();
		
			//shellno=furnishingTransaction.getShellAssetId();
			//furno
			
			Integer paintaseetid=furnishingTransaction.getPaintAssetId();
			PaintTransaction paintTransaction=(PaintTransaction) session.get(PaintTransaction.class,paintaseetid);
			furno=paintTransaction.getFurnishingNumber();
			Integer shellassetidasint=furnishingTransaction.getShellAssetId();
			System.out.println("shellassetid"+shellassetidasint);
			ShellTransaction shellTransaction=(ShellTransaction) session.get(ShellTransaction.class,shellassetidasint);
			shellno=shellTransaction.getShellNumber();
			shelltype=shellTransaction.getShellType();
			Integer bogieppAssetID=furnishingTransaction.getBogiePpSideAssetId();
			System.out.println("BogiePP"+bogieppAssetID);
			Integer bogienppAssetID=furnishingTransaction.getBogieNppSideAssetId();
			System.out.println("BogieNPP"+bogienppAssetID);
			BogiesetTransaction ppside=(BogiesetTransaction) session.get(BogiesetTransaction.class,bogieppAssetID);
			bogiepp=ppside.getBogieNumber();
			
			BogiesetTransaction nppside=(BogiesetTransaction) session.get(BogiesetTransaction.class,bogienppAssetID);
			bogienpp=nppside.getBogieNumber();
			
			
			
			
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

	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getDocnobuffercbcheight() {
		return docnobuffercbcheight;
	}

	public void setDocnobuffercbcheight(String docnobuffercbcheight) {
		this.docnobuffercbcheight = docnobuffercbcheight;
	}

	
	
	public String getCoachtype() {
		return coachtype;
	}

	public String getShellno() {
		return shellno;
	}

	public void setShellno(String shellno) {
		this.shellno = shellno;
	}

	public void setCoachtype(String coachtype) {
		this.coachtype = coachtype;
	}

	public String getCoachno() {
		return coachno;
	}

	public void setCoachno(String coachno) {
		this.coachno = coachno;
	}

	public String getFurno() {
		return furno;
	}

	public void setFurno(String furno) {
		this.furno = furno;
	}

	public String getDampernppa1() {
		return dampernppa1;
	}

	public void setDampernppa1(String dampernppa1) {
		this.dampernppa1 = dampernppa1;
	}

	public String getDampernppa2() {
		return dampernppa2;
	}

	public void setDampernppa2(String dampernppa2) {
		this.dampernppa2 = dampernppa2;
	}

	public String getDamperppa1() {
		return damperppa1;
	}

	public void setDamperppa1(String damperppa1) {
		this.damperppa1 = damperppa1;
	}

	public String getDamperppa2() {
		return damperppa2;
	}

	public void setDamperppa2(String damperppa2) {
		this.damperppa2 = damperppa2;
	}

	public String getShelltype() {
		return shelltype;
	}

	public void setShelltype(String shelltype) {
		this.shelltype = shelltype;
	}

	public String getBogiepp() {
		return bogiepp;
	}

	public void setBogiepp(String bogiepp) {
		this.bogiepp = bogiepp;
	}

	public String getBogienpp() {
		return bogienpp;
	}

	public void setBogienpp(String bogienpp) {
		this.bogienpp = bogienpp;
	}

	
}
