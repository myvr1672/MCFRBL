package ACTION;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernateConnect.HibernateConfig;

public class RailwayAction {



Map<String,String> railway=new HashMap<String,String>();  
	
	@SuppressWarnings("unchecked")
	public String getRailways()
	
	{
		Session session =  HibernateConfig.getSession();
          try {

			
			session.beginTransaction();
			Query query=null;
			query = session.createSQLQuery("select railway_code, description from public.railway_master");
			
			List<Object[]> rows = query.list();
			for(Object[] row : rows){
				railway.put(row[0].toString(), row[1].toString());
			}
			
		
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

	public Map<String, String> getRailway() {
		return railway;
	}

	public void setRailway(Map<String, String> railway) {
		this.railway = railway;
	}




	

	

	

	



		
	
	
	
}
