package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;
import model.MachineBreakdown1;

public class MachineBreakdownDao {
public List<MachineBreakdown1> getAllMachineBreakdownDetails() {
		Session session =  null;
		List<MachineBreakdown1> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria(MachineBreakdown1.class);
			list =c.list();
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

	public void addMachineBreakdownDetails(MachineBreakdown1 machinebreakdown) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(machinebreakdown);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteMachineBreakdownDetails(int machine_id){
		Session session = null;
		MachineBreakdown1 machinebreakdown = null;
		 try{
			 session = HibernateConfig.getSession();
			 machinebreakdown = (MachineBreakdown1) session.load(MachineBreakdown1.class, machine_id);
			 session.delete(machinebreakdown);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateMachineBreakdownDetails(MachineBreakdown1 machinebreakdown){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 session.update(machinebreakdown);
				 
			 }catch(Exception ex){
					 ex.printStackTrace();
			 }finally{
				if(session != null){
					 session.close();
				 }
			 }
		}

	
}
