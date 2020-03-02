package struts.action.master;
import org.hibernate.Session;
import hibernateConnect.HibernateConfig;
import beans.FurnishingTransaction;
import beans.BiotankTestingTransaction;

public class ShowSaveDataBioTank {
	
	private String furnishingAssetId;
	private  FurnishingTransaction furnishingTran;
	private BiotankTestingTransaction biotankTestTrans;
	public String showSaveDataBioTankTest()
	{
		System.out.println("Inside showsave data1");
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt =Integer.parseInt(furnishingAssetId);
		try
		{
			System.out.println("Inside showsave data2");
			furnishingTran= (FurnishingTransaction)session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
			biotankTestTrans=(BiotankTestingTransaction)session.get(BiotankTestingTransaction.class, furnishingAssetIdAsInt);
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
				System.out.println("Inside showsave data3");
			}
		}
		
		
	}
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}
	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}
	public FurnishingTransaction getFurnishingTran() {
		return furnishingTran;
	}
	public void setFurnishingTran(FurnishingTransaction furnishingTran) {
		this.furnishingTran = furnishingTran;
	}
	public BiotankTestingTransaction getBiotankTestTrans() {
		return biotankTestTrans;
	}
	public void setBiotankTestTrans(BiotankTestingTransaction biotankTestTrans) {
		this.biotankTestTrans = biotankTestTrans;
	}
	
	
	



}
