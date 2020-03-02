package ACTION;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;

public class WheelTypeAction {

	private List <String> wheelType;
	private List <String> railway;

	
	@SuppressWarnings("unchecked")
	public String getAssetType()
	
	{
		Session session =  HibernateConfig.getSession();
          try {

			
			session.beginTransaction();
			Query query=null;
			query = session.createSQLQuery("select asset_subtype from public.asset_master where asset_type='RollerBear'");
			//List<String> result =  query.list();
			wheelType=  (List<String>)query.list();
            // Second query to retrieve railway
			
		  Query query1=null;
		  query1 = session.createSQLQuery("select railway_code from public.railway_master");
		  railway=  (List<String>)query1.list();
			return "success";
          }
          
          
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{
			session.close();
		}
	}


	public List<String> getWheelType() {
		return wheelType;
	}


	public void setWheelType(List<String> wheelType) {
		this.wheelType = wheelType;
	}


	public List<String> getRailway() {
		return railway;
	}


	public void setRailway(List<String> railway) {
		this.railway = railway;
	}


	


	


		
	
		

	
	
	
}
