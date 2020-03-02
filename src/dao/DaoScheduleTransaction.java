package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
//import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Restrictions;

import hibernateConnect.HibernateConfig;

import beans.MachineScheduleTransaction;
public class DaoScheduleTransaction {
	

@SuppressWarnings("unchecked")
public List<MachineScheduleTransaction> getAllScheduleTransaction(Integer machineId) {
		Session session =  null;
		List<MachineScheduleTransaction> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria(MachineScheduleTransaction.class);
			
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

	public void addScheduleTransaction(MachineScheduleTransaction asset) {
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
	public void updateScheduleTransaction(MachineScheduleTransaction record){
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
	
	
	public void deleteScheduleTransaction(Integer scheduleId){
		Session session = null;
		MachineScheduleTransaction a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         a1 = (MachineScheduleTransaction) session.load(MachineScheduleTransaction.class,scheduleId);
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
	
	
}
