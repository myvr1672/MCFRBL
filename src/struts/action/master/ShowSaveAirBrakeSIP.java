package struts.action.master;

import org.hibernate.Session;

import beans.AirbrakeTestingTransaction;
import hibernateConnect.HibernateConfig;

public class ShowSaveAirBrakeSIP {
	private String furnishingAssetId;
	private AirbrakeTestingTransaction airbrakeTestingTransaction;
	public String showSavedAirBrakeData()
	{
		Session session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		
		try
		{
			System.out.println("Inside Try");
			airbrakeTestingTransaction=(AirbrakeTestingTransaction) session.get(AirbrakeTestingTransaction.class, furnishingAssetIdAsInt);
			
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("Inside Catch");
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
	public AirbrakeTestingTransaction getAirbrakeTestingTransaction() {
		return airbrakeTestingTransaction;
	}
	public void setAirbrakeTestingTransaction(AirbrakeTestingTransaction airbrakeTestingTransaction) {
		this.airbrakeTestingTransaction = airbrakeTestingTransaction;
	}

}
