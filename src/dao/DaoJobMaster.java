package dao;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;

import hibernateConnect.HibernateConfig;
import model.User;
import beans.JobTransaction;

public class DaoJobMaster {

	
	@SuppressWarnings("unchecked")
	public List<JobTransaction> getAllPendingJob(String jtSorting, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<JobTransaction> list = null;
		//retrieve roles of all login user
				User loginUser = null;
				session = HibernateConfig.getSession();
				HttpSession session_http = ServletActionContext.getRequest().getSession(true);

				String username = (String) session_http.getAttribute("userid");
				session = HibernateConfig.getSession();
				session.beginTransaction();
				loginUser = (User)session.get(User.class,username.trim());
				List<String> roleList=new ArrayList<String>();
				String roles=loginUser.getRoles();	
				if(!roles.equals("All"))
				{
					roleList=Arrays.asList(roles.split("\\s*,\\s*"));
				}
				//end of retrieving login user
		try{
			
		//	SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
			
			
			
			Criteria cr = session.createCriteria(JobTransaction.class);
			if(!roles.equals("All")){	cr.add(Restrictions.in("shop", roleList));}
			cr.add(Restrictions.ne("status", "completed"));
			
			String[] temp;
			
	         /* delimiter */
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
	 Integer total_rec_count=cr.list().size();
	 Map session_map=ActionContext.getContext().getSession();
	 session_map.put("holding_count", total_rec_count);
	 cr.setFirstResult(startPageIndex);
	 cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
			
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
	
	public void addJobMaster(JobTransaction job) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(job);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void updateJobMaster(JobTransaction record){
		Session session = null;
		Transaction tx=null;
			 try{
				 session = HibernateConfig.getSession();
				
			 tx= session.beginTransaction();
			 session.update(record);
			
			tx.commit();
				 
			 }catch(Exception ex){
					 ex.printStackTrace();
					 if(tx!=null) {tx.rollback();}
			 }finally{
				if(session != null){
					 session.close();
				 }
			 }
		}
	
	public void deleteJobMaster(Integer jobId){
		Session session = null;
		JobTransaction a1 = null;
		 try{
			
			 session = HibernateConfig.getSession();
	
			 a1 = (JobTransaction) session.load(JobTransaction.class, jobId);
			 session.delete(a1);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			// System.out.println("---Error Inside dao.DaoAbnormality deleteAbnormality() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 //System.out.println("---Inside dao.DaoAbnormality deleteAbnormality() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
	}
	
}
