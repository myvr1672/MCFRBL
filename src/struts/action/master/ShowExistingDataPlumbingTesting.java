package struts.action.master;
import org.hibernate.Session;

import beans.FurnishingTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;
import beans.PaintTransaction;
public class ShowExistingDataPlumbingTesting {
	
	private String furnishingAssetId;
	private String plumbingFurnishingNo;
	private String plumbingDocNo;
	private String plumbingShellType;
	private String plumbingShellNo;
	
	
	
	public String showPlumbingTestData()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		plumbingDocNo="MCF/RBL/QMF 7009 REV NO:01 ";
	Session session=null;
	try
	{
	session=HibernateConfig.getSession();
	FurnishingTransaction furT= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
	Integer shellAssetId=furT.getShellAssetId();
	//
	ShellTransaction shellTransaction= (ShellTransaction) session.get(ShellTransaction.class, shellAssetId);
	plumbingShellNo=shellTransaction.getShellNumber();
	plumbingShellType=shellTransaction.getShellType();
	//shellAssetIdAsInt=shellAssetIdAsInt;
	Integer paintAssetId=furT.getPaintAssetId();
	PaintTransaction paintTrans= (PaintTransaction) session.get(PaintTransaction.class, paintAssetId);
	plumbingFurnishingNo=paintTrans.getFurnishingNumber();
	
	
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



	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}



	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}



	public String getPlumbingDocNo() {
		return plumbingDocNo;
	}



	public void setPlumbingDocNo(String plumbingDocNo) {
		this.plumbingDocNo = plumbingDocNo;
	}



	public String getPlumbingShellType() {
		return plumbingShellType;
	}



	public void setPlumbingShellType(String plumbingShellType) {
		this.plumbingShellType = plumbingShellType;
	}



	public String getPlumbingShellNo() {
		return plumbingShellNo;
	}



	public void setPlumbingShellNo(String plumbingShellNo) {
		this.plumbingShellNo = plumbingShellNo;
	}



	public String getPlumbingFurnishingNo() {
		return plumbingFurnishingNo;
	}



	public void setPlumbingFurnishingNo(String plumbingFurnishingNo) {
		this.plumbingFurnishingNo = plumbingFurnishingNo;
	}
	
	
	
	
}

