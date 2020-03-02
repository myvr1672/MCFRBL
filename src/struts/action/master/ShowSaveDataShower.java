package struts.action.master;
import org.hibernate.Session;
import beans.ShowerTestingTransaction;
import hibernateConnect.HibernateConfig;
public class ShowSaveDataShower {
	
	
	private String furnishingAssetId;
	private ShowerTestingTransaction showerTestingTransaction;
	
	public String showSaveDataShowerTest()
	{
		System.out.println("Inside showsave data1");
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt =Integer.parseInt(furnishingAssetId);
		try
		{
			System.out.println("Inside showsave data2");
			showerTestingTransaction= (ShowerTestingTransaction) session.get(ShowerTestingTransaction.class, furnishingAssetIdAsInt);
			
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

	public ShowerTestingTransaction getShowerTestingTransaction() {
		return showerTestingTransaction;
	}

	public void setShowerTestingTransaction(ShowerTestingTransaction showerTestingTransaction) {
		this.showerTestingTransaction = showerTestingTransaction;
	}

	
}
