package dao;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;

import beans.SpareMaster;
import hibernateConnect.HibernateConfig;



public class SpareMasterDao {
	

@SuppressWarnings("unchecked")
public List< SpareMaster> getAllMachineSpare() {
		Session session =  null;
		List<SpareMaster> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria( SpareMaster.class);
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

	public void addMachineSpare(SpareMaster spareMaster) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
	         session.save(spareMaster);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteMachineSpare(Integer spareId){
		Session session = null;
		SpareMaster s1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         s1 = (SpareMaster) session.load(SpareMaster.class, spareId);
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
	
	public void updateMachineSpare(SpareMaster spareMaster){
		Session session = null;
		
	     
			 try{
				 
				 session = HibernateConfig.getSession();
				 session.update(spareMaster);
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


