package dao;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;

import hibernateConnect.HibernateConfig;

import beans.MachineFIRMaster;


public class MachineFIRMasterDao {
	

@SuppressWarnings("unchecked")
public List< MachineFIRMaster> getAllMachineFIRMaster(Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<MachineFIRMaster> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria( MachineFIRMaster.class);
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

	public void addMachineFIRMaster(MachineFIRMaster mchineFirCode) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
	         session.save(mchineFirCode);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteMachineFIRMaster(String failure_code){
		Session session = null;
		MachineFIRMaster s1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         s1 = (MachineFIRMaster) session.load(MachineFIRMaster.class, failure_code);
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
	
	public void updateMachineFIRMaster(MachineFIRMaster record){
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

	
		
}


