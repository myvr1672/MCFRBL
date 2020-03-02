package dao;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;

import hibernateConnect.HibernateConfig;
import model.User;
import beans.MachineMaster;

public class MachineMasterDao {
	
	
@SuppressWarnings("unchecked")
public List<MachineMaster> getAllMachineMaster1(String jtSorting) {
	Session session =  null;
	
	List<MachineMaster> list = null;

	try{
		session = HibernateConfig.getSession();
	//	session.beginTransaction();
		Criteria c = session.createCriteria(MachineMaster.class);
		String[] temp;
        String delimiter = " ";
        /* given string will be split by the argument delimiter provided. */
        temp = jtSorting.split(delimiter);
        	if(jtSorting.endsWith("ASC"))
	         {
	        	 c.addOrder(Order.asc(temp[0]));
	         }
	         else if(jtSorting.endsWith("DESC"))
	         {
	        	 c.addOrder(Order.desc(temp[0]));	 
	         }
		
		list=c.list();
	}
	catch(Exception ex){
		
		ex.printStackTrace();
	}finally{
		if(session!= null){
			session.close();
		}			
	}
	return list;
}
public List<MachineMaster> getAllMachineMasterFailure(String shop, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<MachineMaster> list = null;
	
		try{
			session = HibernateConfig.getSession();
		//	session.beginTransaction();
			Criteria c = session.createCriteria(MachineMaster.class);
			if(!shop.equals("All"))
			{
				c.add(Restrictions.eq("workingShop", shop));
			}
			Integer total_rec_count=c.list().size();
			 Map session_map=ActionContext.getContext().getSession();
			 session_map.put("holding_count", total_rec_count);
			 c.setFirstResult(startPageIndex);
			 c.setMaxResults(numRecordsPerPage);
			list=c.list();
		}
		catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				session.close();
			}			
		}
		return list;
	}
@SuppressWarnings("unchecked")
public List<MachineMaster> getAllMachineMasterAdd() {
	Session session =  null;
	List<MachineMaster> list = null;

	try{
		session = HibernateConfig.getSession();
	//	session.beginTransaction();
		Criteria c = session.createCriteria(MachineMaster.class);
		list=c.list();
	}
	catch(Exception ex){
		
		ex.printStackTrace();
	}finally{
		if(session!= null){
			session.close();
		}			
	}
	return list;
}

public List<MachineMaster> getAllMachineScheduleActivityAdd(String shop) {
	Session session =  null;
	List<MachineMaster> list = null;

	try{
		session = HibernateConfig.getSession();
	//	session.beginTransaction();
		Criteria c = session.createCriteria(MachineMaster.class);
		if(!shop.equals("All"))
		{
			c.add(Restrictions.eq("workingShop", shop));
			
		}
		list=c.list();
	}
	catch(Exception ex){
		
		ex.printStackTrace();
	}finally{
		if(session!= null){
			session.close();
		}			
	}
	return list;
}
public List<MachineMaster> getAllMachineScheduleAdd(String shop) {
	Session session =  null;
	List<MachineMaster> list = null;

	try{
		session = HibernateConfig.getSession();
	//	session.beginTransaction();
		Criteria c = session.createCriteria(MachineMaster.class);
		if(!shop.equals("All"))
		{
			c.add(Restrictions.eq("workingShop", shop));
			
		}
		list=c.list();
	}
	catch(Exception ex){
		
		ex.printStackTrace();
	}finally{
		if(session!= null){
			session.close();
		}			
	}
	return list;
}

	public void addMachineMaster1(MachineMaster asset) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(asset);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	public void updateMachineMaster1(MachineMaster record){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 session.update(record);
			 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
					 ex.printStackTrace();
			 }finally{
				if(session != null){
					 session.close();
				 }
			 }
		}
	
	
	public void deleteMachineMaster1(Integer machine_id){
		Session session = null;
		MachineMaster a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         a1 = (MachineMaster) session.load(MachineMaster.class,machine_id);
			 session.delete(a1);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				session.close();
			 }
		 }
	}
	@SuppressWarnings("unchecked")
	public List<MachineMaster> getAllMachinePerformAction(String jtSorting) {
		Session session =  null;
		List<MachineMaster> list = null;

		try{
			session = HibernateConfig.getSession();
		//	session.beginTransaction();
			Criteria c = session.createCriteria(MachineMaster.class);
			c.add(Restrictions.eq("machineStatus", "F"));
			list=c.list();
		}
		catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				session.close();
			}			
		}
		return list;
		
	}
	public List<MachineMaster> getAllMachine(String jtSorting, int startPageIndex, int numRecordsPerPage) {
Session session =  null;
		
		List<MachineMaster> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		String roles=null;
		String role[]= null;
		User loginUser = null;
		if (username != null)
		{
			session = HibernateConfig.getSession();
			loginUser = (User)session.get(User.class,username.trim());
			roles= loginUser.getRoles();
			role=roles.split(", ");
		
		try{
			
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(MachineMaster.class);
			
			String[] temp;
	         String delimiter = " ";
	         /* given string will be split by the argument delimiter provided. */
	         temp = jtSorting.split(delimiter);
	 if(jtSorting.endsWith("ASC"))
		         {
		        	 cr.addOrder(Order.asc(temp[0]));
		         }
		         else if(jtSorting.endsWith("DESC"))
		         {
		        	 cr.addOrder(Order.desc(temp[0]));	 
		         }
	 
	 int total_rec_count = cr.list().size();  // retrieve total no of record in table mapped to bean class based on condition on criteria
	 Map<String, Object> session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
}
