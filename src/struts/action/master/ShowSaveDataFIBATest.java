package struts.action.master;
import org.hibernate.Session;

import beans.FibaTestingTransaction;
import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;

public class ShowSaveDataFIBATest {

	private String furnishingAssetId;
	private FurnishingTransaction furnTran;
	private FibaTestingTransaction fibaTestingTran;
    public FibaTestingTransaction getFibaTestingTran() {
		return fibaTestingTran;
	}

	public void setFibaTestingTran(FibaTestingTransaction fibaTestingTran) {
		this.fibaTestingTran = fibaTestingTran;
	}

	
	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public FurnishingTransaction getFurnTran() {
		return furnTran;
	}

	public void setFurnTran(FurnishingTransaction furnTran) {
		this.furnTran = furnTran;
	}
	public String showFIBATestSaveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		try
		{
			furnTran= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
			fibaTestingTran=(FibaTestingTransaction) session.get(FibaTestingTransaction.class, furnishingAssetIdAsInt);
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
			}
		}
	}

	

	
}
