package struts.action.master;
import org.hibernate.Session;
import beans.PlumbingTestingTransaction;
import hibernateConnect.HibernateConfig;
public class ShowSaveDataPlumbing {
	
	private String furnishingAssetId;
	private  PlumbingTestingTransaction plumbingTestingTransaction;
	public String showSaveDataPlumbingTest()
	{
		System.out.println("Inside showsave data1");
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt =Integer.parseInt(furnishingAssetId);
		try
		{
			System.out.println("Inside showsave data2");
			plumbingTestingTransaction= (PlumbingTestingTransaction) session.get(PlumbingTestingTransaction.class, furnishingAssetIdAsInt);
			
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


	public PlumbingTestingTransaction getPlumbingTestingTransaction() {
		return plumbingTestingTransaction;
	}


	public void setPlumbingTestingTransaction(PlumbingTestingTransaction plumbingTestingTransaction) {
		this.plumbingTestingTransaction = plumbingTestingTransaction;
	}
	
	
	
}
