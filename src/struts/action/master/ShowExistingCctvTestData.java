package struts.action.master;
import org.hibernate.Session;
import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;
import beans.PaintTransaction;
public class ShowExistingCctvTestData {
	private String furnishingAssetId;
	private String ccTvDocNo;
	private String ccTvCoachNo;
	private String ccTvFurNo;
	
	public String showCctvData()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		ccTvDocNo="MCF/RBL/QMF 7005A REV NO:00 ";
	Session session=null;
	try
	{
	session=HibernateConfig.getSession();
	FurnishingTransaction furT= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
	Integer paintAssetId=furT.getPaintAssetId();
	PaintTransaction paintTrans= (PaintTransaction) session.get(PaintTransaction.class, paintAssetId);
	ccTvCoachNo=furT.getCoachNumber();
	ccTvFurNo=paintTrans.getFurnishingNumber();
	
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

	public String getCcTvDocNo() {
		return ccTvDocNo;
	}

	public void setCcTvDocNo(String ccTvDocNo) {
		this.ccTvDocNo = ccTvDocNo;
	}

	public String getCcTvCoachNo() {
		return ccTvCoachNo;
	}

	public void setCcTvCoachNo(String ccTvCoachNo) {
		this.ccTvCoachNo = ccTvCoachNo;
	}

	public String getCcTvFurNo() {
		return ccTvFurNo;
	}

	public void setCcTvFurNo(String ccTvFurNo) {
		this.ccTvFurNo = ccTvFurNo;
	}
	
	
}
