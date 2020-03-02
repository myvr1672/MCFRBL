package struts.action.master;
import org.hibernate.Session;
import beans.ShellTransaction;
import beans.PaintTransaction;
import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;
public class ShowExistingDataShowerTesting {
	
	
	private String furnishingAssetId;
	//private String paintAssetId;
	private String showerTestingDocNo;
	private String showerTestingShellType;
	private String showerShellNo;
	private String showerTestingCoachNo;
	private String furnishingNo;
	
	
	public String showShowerTestData()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		//Integer paintAssetIdAsInt=Integer.parseInt(paintAssetId);
		showerTestingDocNo="MCF/RBL/QMF 7007 REV NO:01 ";
	Session session=null;
	try
	{
	session=HibernateConfig.getSession();
	FurnishingTransaction furT= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
	showerTestingCoachNo=furT.getCoachNumber();
	Integer shellAssetId=furT.getShellAssetId();
	ShellTransaction shellTransaction= (ShellTransaction) session.get(ShellTransaction.class, shellAssetId);
	showerShellNo=shellTransaction.getShellNumber();
	showerTestingShellType=shellTransaction.getShellType();
	Integer paintAssetId=furT.getPaintAssetId();
	PaintTransaction paintTrans= (PaintTransaction) session.get(PaintTransaction.class, paintAssetId);
	furnishingNo=paintTrans.getFurnishingNumber();
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

	public String getShowerTestingDocNo() {
		return showerTestingDocNo;
	}

	public void setShowerTestingDocNo(String showerTestingDocNo) {
		this.showerTestingDocNo = showerTestingDocNo;
	}

	public String getShowerTestingShellType() {
		return showerTestingShellType;
	}

	public void setShowerTestingShellType(String showerTestingShellType) {
		this.showerTestingShellType = showerTestingShellType;
	}

	public String getShowerShellNo() {
		return showerShellNo;
	}

	public void setShowerShellNo(String showerShellNo) {
		this.showerShellNo = showerShellNo;
	}

	public String getShowerTestingCoachNo() {
		return showerTestingCoachNo;
	}

	public void setShowerTestingCoachNo(String showerTestingCoachNo) {
		this.showerTestingCoachNo = showerTestingCoachNo;
	}

	public String getFurnishingNo() {
		return furnishingNo;
	}

	public void setFurnishingNo(String furnishingNo) {
		this.furnishingNo = furnishingNo;
	}

	/*public String getPaintAssetId() {
		return paintAssetId;
	}

	public void setPaintAssetId(String paintAssetId) {
		this.paintAssetId = paintAssetId;
	}*/
	



	

}
