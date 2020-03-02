package struts.action.master;
import org.hibernate.Session;
import hibernateConnect.HibernateConfig;
import beans.CctvTestingTransaction;
public class ShowSaveDataCctv {
	private String furnishingAssetId;
	private  CctvTestingTransaction cctvTestingTrans;
	public String showSaveDataCctvTest()
	{
		System.out.println("Inside showsave data1");
		Session session=null;
		session=HibernateConfig.getSession();
		Integer furnishingAssetIdAsInt =Integer.parseInt(furnishingAssetId);
		try
		{
			System.out.println("Inside showsave data2");
			cctvTestingTrans=(CctvTestingTransaction)session.get(CctvTestingTransaction.class, furnishingAssetIdAsInt);
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
	public CctvTestingTransaction getCctvTestingTrans() {
		return cctvTestingTrans;
	}
	public void setCctvTestingTrans(CctvTestingTransaction cctvTestingTrans) {
		this.cctvTestingTrans = cctvTestingTrans;
	}

}
