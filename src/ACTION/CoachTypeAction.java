package ACTION;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import org.hibernate.criterion.Restrictions;


import hibernateConnect.HibernateConfig;
import beans.BogiesetTransaction;


public class CoachTypeAction {
	private List <String> coachType;
	private Map<Integer,String> bogieNumberList;

	
	
	
	
	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
		Session session =  null;
	
	session = HibernateConfig.getSession();
	
		try {

			
			session.beginTransaction();
			Query query=null;
			 
query = session.createSQLQuery("select asset_subtype from public.asset_master where asset_type='Coach' ");
			
					coachType=  (List<String>)query.list();
					
			
			Criteria cr = session.createCriteria(BogiesetTransaction.class);
			cr.addOrder(Order.asc("bogieAssetId"));
			cr.add(Restrictions.isNull("asignedFlag"));
			cr.add(Restrictions.isNotNull("receiptAtNextStage"));
			List<BogiesetTransaction> obj=cr.list();
			//abnormalityList=new ArrayList<String>();
			bogieNumberList= new LinkedHashMap<Integer,String>();
			for(BogiesetTransaction a:obj)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				bogieNumberList.put(a.getBogieAssetId(), a.getBogieNumber());
			}
		
		
			return "success";
		} 
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{session.close(); }
	}





	public List<String> getCoachType() {
		return coachType;
	}





	public void setCoachType(List<String> coachType) {
		this.coachType = coachType;
	}





	public Map<Integer, String> getBogieNumberList() {
		return bogieNumberList;
	}





	public void setBogieNumberList(Map<Integer, String> bogieNumberList) {
		this.bogieNumberList = bogieNumberList;
	}
	

	
	}
