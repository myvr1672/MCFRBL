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

import beans.MachineMaster;
import model.User;
import hibernateConnect.HibernateConfig;

public class DaoMachineMaster {
	@SuppressWarnings("unchecked")
	public List<MachineMaster> getAllMachine(String jtSorting, String shopFilter) {
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
			if(!roles.equals("All"))
			{
				if(!shopFilter.equals("All")) {cr.add(Restrictions.eq("workingShop", shopFilter));}
				else {cr.add(Restrictions.in("workingShop", role));}
			}
			else
			{
				if(!shopFilter.equals("All")) {cr.add(Restrictions.eq("workingShop", shopFilter));}	
			}
			
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
	
	public List<MachineMaster>getMachineByShop(String shop)
	   {
		   Session session=null;
		   try{
			   session = HibernateConfig.getSession();
			   session.beginTransaction();
			   Criteria cr= session.createCriteria(MachineMaster.class);
			   cr.add(Restrictions.eq("workingShop",shop));
			   @SuppressWarnings("unchecked")
			List<MachineMaster> machineList= cr.list();
			   return machineList;
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
			   return null;
		   }
		   finally{
			   session.close();
		   }
		   
		   
	   }

	
	
	public void addMachine(MachineMaster machineMaster) {
		Session session = null;
		
		 try{
			
			 session = HibernateConfig.getSession();
			 
			 session.save(machineMaster);
			 
			 //System.out.println("abnormality Id " + abnormality.getAbid());
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	
	public void updateMachine(MachineMaster machineMaster){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(machineMaster);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 
				 ex.printStackTrace();
			 }finally{
				
				 if(session != null){
					 session.close();
				 }
			 }
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
