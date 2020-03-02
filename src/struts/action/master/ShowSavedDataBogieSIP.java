package struts.action.master;
import org.hibernate.Session;
import beans.BogieFinalSipTran;
import dao.DaoBogieFinal;
import hibernateConnect.HibernateConfig;
public class ShowSavedDataBogieSIP {
	private String bogieAssetId;
	private BogieFinalSipTran bogieFinalSipTran;
	public String showBogieData()
	{
		System.out.print("SHOW");
		Session session=HibernateConfig.getSession();
		Integer bogieAssetIdAsInt=Integer.parseInt(bogieAssetId);
		
		try
		{
			bogieFinalSipTran=(BogieFinalSipTran) session.get(BogieFinalSipTran.class, bogieAssetIdAsInt);
			System.out.println("Inside Try");
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
	public String getBogieAssetId() {
		return bogieAssetId;
	}
	public void setBogieAssetId(String bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}
	public BogieFinalSipTran getBogieFinalSipTran() {
		return bogieFinalSipTran;
	}
	public void setBogieFinalSipTran(BogieFinalSipTran bogieFinalSipTran) {
		this.bogieFinalSipTran = bogieFinalSipTran;
	}
}
