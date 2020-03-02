package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import hibernateConnect.HibernateConfig;

//import beans.Safety;
import beans.SafetyTransaction;
public class SafetyTransactionDao {
	

@SuppressWarnings("unchecked")
public List<SafetyTransaction> getAllSafetyTransaction(Integer machineId) {
		Session session =  null;
		List<SafetyTransaction> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria(SafetyTransaction.class);
			c.add(Restrictions.eq("machineId", machineId));
			
			
			
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

	public void addSafetyTransaction(SafetyTransaction asset) {
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
	
	
	
	public void deleteSafetyTransaction(SafetyTransaction record){
		Session session = null;
		//SafetyTransaction a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	        // a1 = (SafetyTransaction) session.load(SafetyTransaction.class,safetyInstructionId);
			 session.delete(record);
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
