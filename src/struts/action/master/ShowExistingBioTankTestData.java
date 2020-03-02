package struts.action.master;
import java.util.Date;

import org.hibernate.Session;
import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;
import beans.PaintTransaction;
public class ShowExistingBioTankTestData {
	private String furnishingAssetId;
	private String bioTankTestingDocNo;
	private String bioTankTestingFurNo;
	private String bioTankTestingMakeLav1;
	private String bioTankTestingMakeLav2;
	private String bioTankTestingMakeLav3;
	private String bioTankTestingMakeLav4;
	private String bioTankTestingBacteriaType;
	private String bioTankTestingBacteriaMake;
	private Date bioTankTestingBacteriaFeedDate;

	
	
	
	
	public String showBioTankData()
	{
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		bioTankTestingDocNo="MCF/RBL/QMF 7008 REV NO:01 ";
	Session session=null;
	try
	{
	session=HibernateConfig.getSession();
	FurnishingTransaction furT= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
	Integer paintAssetId=furT.getPaintAssetId();
	PaintTransaction paintTrans= (PaintTransaction) session.get(PaintTransaction.class, paintAssetId);
	bioTankTestingFurNo=paintTrans.getFurnishingNumber();
	bioTankTestingMakeLav1=furT.getBiotankLavatoryMake_1();
	bioTankTestingMakeLav2=furT.getBiotankLavatoryMake_2();
	bioTankTestingMakeLav3=furT.getBiotankLavatoryMake_3();
	bioTankTestingMakeLav4=furT.getBiotankLavatoryMake_4();
	bioTankTestingBacteriaType=furT.getBiotankBacteriaType();
	bioTankTestingBacteriaMake=furT.getBiotankBacteriaMake();
	bioTankTestingBacteriaFeedDate=furT.getBiotankBacteriaFeedingDate();
	//System.out.println("Date="+bioTankTestingBacteriaFeedDate);
	
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

	public String getBioTankTestingDocNo() {
		return bioTankTestingDocNo;
	}

	public void setBioTankTestingDocNo(String bioTankTestingDocNo) {
		this.bioTankTestingDocNo = bioTankTestingDocNo;
	}

	public String getBioTankTestingFurNo() {
		return bioTankTestingFurNo;
	}

	public void setBioTankTestingFurNo(String bioTankTestingFurNo) {
		this.bioTankTestingFurNo = bioTankTestingFurNo;
	}

	public String getBioTankTestingMakeLav1() {
		return bioTankTestingMakeLav1;
	}

	public void setBioTankTestingMakeLav1(String bioTankTestingMakeLav1) {
		this.bioTankTestingMakeLav1 = bioTankTestingMakeLav1;
	}

	public String getBioTankTestingMakeLav2() {
		return bioTankTestingMakeLav2;
	}

	public void setBioTankTestingMakeLav2(String bioTankTestingMakeLav2) {
		this.bioTankTestingMakeLav2 = bioTankTestingMakeLav2;
	}

	public String getBioTankTestingMakeLav3() {
		return bioTankTestingMakeLav3;
	}

	public void setBioTankTestingMakeLav3(String bioTankTestingMakeLav3) {
		this.bioTankTestingMakeLav3 = bioTankTestingMakeLav3;
	}

	public String getBioTankTestingMakeLav4() {
		return bioTankTestingMakeLav4;
	}

	public void setBioTankTestingMakeLav4(String bioTankTestingMakeLav4) {
		this.bioTankTestingMakeLav4 = bioTankTestingMakeLav4;
	}

	public String getBioTankTestingBacteriaType() {
		return bioTankTestingBacteriaType;
	}

	public void setBioTankTestingBacteriaType(String bioTankTestingBacteriaType) {
		this.bioTankTestingBacteriaType = bioTankTestingBacteriaType;
	}

	public String getBioTankTestingBacteriaMake() {
		return bioTankTestingBacteriaMake;
	}

	public void setBioTankTestingBacteriaMake(String bioTankTestingBacteriaMake) {
		this.bioTankTestingBacteriaMake = bioTankTestingBacteriaMake;
	}

	public Date getBioTankTestingBacteriaFeedDate() {
		return bioTankTestingBacteriaFeedDate;
	}

	public void setBioTankTestingBacteriaFeedDate(Date bioTankTestingBacteriaFeedDate) {
		this.bioTankTestingBacteriaFeedDate = bioTankTestingBacteriaFeedDate;
	}

	

}
