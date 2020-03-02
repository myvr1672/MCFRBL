package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;

import beans.SafetyInstructionMaster;
import hibernateConnect.HibernateConfig;



public class SafetyInstructionMasterDao {
	

@SuppressWarnings("unchecked")
public List<SafetyInstructionMaster> getAllSafetyInstructionMaster() {
		Session session =  null;
		List<SafetyInstructionMaster> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria(SafetyInstructionMaster.class);
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

	public void addSafetyInstructionMaster(SafetyInstructionMaster safety_instruction_description) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(safety_instruction_description);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteSafetyInstructionMaster(Integer safety_instruction_description){
		Session session = null;
		SafetyInstructionMaster s1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         s1 = (SafetyInstructionMaster) session.load(SafetyInstructionMaster.class, safety_instruction_description);
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
	
	public void updateSafetyInstructionMaster(SafetyInstructionMaster record){
		Session session = null;
		record = new SafetyInstructionMaster();
		
	     
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

	
		
}


