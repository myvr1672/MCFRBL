package ACTION;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;

public class ShellTypeAction {

	private List <String> shellType;

	
	@SuppressWarnings("unchecked")
	public String getAssetType()
	
	{
		Session session =  HibernateConfig.getSession();
          try {

			
			session.beginTransaction();
			Query query=null;
			query = session.createSQLQuery("select asset_subtype from public.asset_master where asset_type='Shell'");
			//List<String> result =  query.list();
			shellType=  (List<String>)query.list();

//			shellType=new ArrayList<String>();
//			for (String i: result)
//			{
//				shellType.add(i);
//			}
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


	public List<String> getShellType() {
		return shellType;
	}


	public void setShellType(List<String> shellType) {
		this.shellType = shellType;
	}



		
	
		

	
	
	
}
