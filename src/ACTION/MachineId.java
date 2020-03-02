package ACTION;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;

import beans.MachineMaster;
import beans.Shop;
import hibernateConnect.HibernateConfig;
import model.User;

public class MachineId {
	
	private Map<Integer,String> machineIds;
	private List <Shop> workingShop;
	public String getMachineId()
	{
		Session session=null;
		try
		{
		
		session=HibernateConfig.getSession();
		
		String username= null;
		String roles= null;
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	
	User loginUser = (User)session.get(User.class,username.trim());
	    
		 roles= loginUser.getRoles();
		}

	roles = roles.replaceAll(", ","','");	
		
		
		Criteria cr = session.createCriteria(MachineMaster.class);
		@SuppressWarnings("unchecked")
		List<MachineMaster> obj=cr.list();
		
		machineIds= new LinkedHashMap<Integer,String>();
		for(MachineMaster a: obj){
			machineIds.put(a.getMachineId(), a.getMachineDescription());
		}
		// retrieve shop
		// code for working shop
		Query queryForShop=null;
		if(roles.equals("All")){
			queryForShop = session.createSQLQuery("select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
		}
		else
		{
			queryForShop = session.createSQLQuery("select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
		}
				
				List<String> result = queryForShop.list();

				
				workingShop=new ArrayList<Shop>();
		for(String i:result)
		{
			Shop s=new Shop();
			s.setShopId(i);
			if(i.equals("Tool"))
			{
			s.setShopName(i+" Room");
			}
			else
			{
			s.setShopName(i+" Shop");
			}
			workingShop.add(s);
		}
		
		
		//end shop
		
		}
		
		catch(Exception e)
		{
		e.printStackTrace();	
		}
		finally
		{
			session.close();
		}
		return "success";	
	}
	public Map<Integer, String> getMachineIds() {
		return machineIds;
	}
	public void setMachineIds(Map<Integer, String> machineIds) {
		this.machineIds = machineIds;
	}
	public List<Shop> getWorkingShop() {
		return workingShop;
	}
	public void setWorkingShop(List<Shop> workingShop) {
		this.workingShop = workingShop;
	}
	
	
}


