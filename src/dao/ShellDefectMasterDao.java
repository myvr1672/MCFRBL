package dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import com.opensymphony.xwork2.ActionContext;

import beans.ShellDefectsMaster;
import hibernateConnect.HibernateConfig;

public class ShellDefectMasterDao {

	public List<ShellDefectsMaster> getAllShellDefects(int startPageIndex, int numRecordsPerPage, String jtSorting) {
		
		Session session =  null;
		List<ShellDefectsMaster> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria( ShellDefectsMaster.class);
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

	public void addShellDefectMaster(ShellDefectsMaster record) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
	         session.save(record);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		
	}

}

	public void updateShellDefectMaster(ShellDefectsMaster record) {
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

	public void deleteShellDefectMaster(Integer shellDefectId) {
		Session session = null;
		ShellDefectsMaster s1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         s1 = (ShellDefectsMaster) session.load(ShellDefectsMaster.class, shellDefectId);
			 session.delete(s1);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				session.close();
			 }
		 }
		
	}
	
	
}
