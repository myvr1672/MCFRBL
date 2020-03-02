package struts.action.master;


import java.util.ArrayList;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;

import beans.Shop;
import model.AbnormalityMaster;
import model.SubStagesMaster;
import model.User;
import hibernateConnect.HibernateConfig;


/**
 * @author NAVINKUMAR
 *
 */
public class StageAction {
	
	
//	String  org_SlNo = "RBL";
	
	private List<Shop> shopList;
	private Map<Integer,String> abnormalityList;

	
	private String[] stages;
	
	public String getStages()
	{
		Session session =  null;
	
		try {

			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria crit = session.createCriteria(SubStagesMaster.class);
		       Projection projection1 = Projections.property("substages");
		       List<String> stages = crit.list();
		
			
			
			
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{
			session.close();
		}
	}

	
	
	
	public void setStages(String[] stages) {
		this.stages = stages;
	}
	
	
	
	public String getShopAndAbnormality()
	{
		Session session =  null;
		String username= null;
		String roles= null;
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	User loginUser = (User)session.get(User.class,username.trim());
	    
		 roles= loginUser.getRoles();
		}

	roles = roles.replaceAll(", ","','");
	
		
		try {

			
			session.beginTransaction();
			Query query=null;
			 if(roles.equals("All")){
query = session.createSQLQuery("select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
			 }
			 else
			 {
query = session.createSQLQuery("select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
			 }
					List<String> result = query.list();
		
					
					shopList=new ArrayList<Shop>();
			for(String i:result)
			{
				Shop s=new Shop();
				s.setShopId(i);
				s.setShopName(i+" Shop");
				shopList.add(s);
			}
			
			Criteria cr = session.createCriteria(AbnormalityMaster.class);
			cr.addOrder(Order.asc("abnormalityID"));
			List<AbnormalityMaster> obj=cr.list();
			//abnormalityList=new ArrayList<String>();
			abnormalityList= new LinkedHashMap<Integer,String>();
			for(AbnormalityMaster a:obj)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				abnormalityList.put(a.getAbnormalityID(), a.getAbnormalityDescription());
			}
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{
			session.close();
		}
	}




	public List<Shop> getShopList() {
		return shopList;
	}




	public void setShopList(List<Shop> shopList) {
		this.shopList = shopList;
	}




	public Map<Integer, String> getAbnormalityList() {
		return abnormalityList;
	}




	public void setAbnormalityList(Map<Integer, String> abnormalityList) {
		this.abnormalityList = abnormalityList;
	}




	




	
	

}

