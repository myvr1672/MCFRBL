package ACTION;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernateConnect.HibernateConfig;

public class GetFurnNo {

	private List<String> furnNoList; 
	
	
	public List<String> getFurnNoList() {
		return furnNoList;
	}


	public void setFurnNoList(List<String> furnNoList) {
		this.furnNoList = furnNoList;
	}


	public String getFurnNo()
	{
		Session session =  null;
		try
		{
		
		session = HibernateConfig.getSession();
		String hql="select  distinct P.furnishing_no from testing_mobile_clearance T, furnishing_tran F ,paint_tran P where T.furnishing_asset_id=F.furnishing_asset_id and p.paint_asset_id=F.paint_asset_id";
		Query query = session.createSQLQuery(hql);
		List<String> results1 = query.list();
		 furnNoList=new ArrayList<String>();
	 
	for(int s1=0;s1<results1.size();s1++)
	{
		String description1=results1.get(s1);
		furnNoList.add(description1);
        
	}
		return "success";
	}
	
	catch(Exception e)
	{
		e.printStackTrace();
		return null;
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
