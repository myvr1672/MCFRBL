package dao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;


import beans.MachineScheduleTransaction;
import beans.SpareChangeInSchedule;
import hibernateConnect.HibernateConfig;


public class DaoMachineScheduleTransaction {

	@SuppressWarnings("unchecked")
	public List<MachineScheduleTransaction> getAllSchedule(String jtSorting, Integer machineId) {
		Session session =  null;
		List<MachineScheduleTransaction> list = null;
		
		
		try{
			
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(MachineScheduleTransaction.class);
			
			cr.add(Restrictions.eq("machineId", machineId));
			
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
			list = cr.list();
		}catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		return list;
	}

	public void updatemachineSchedule(MachineScheduleTransaction machineScheduleTransaction)
	{
		Transaction tx=null;
	Session	session = null;
	
		try{
		session=HibernateConfig.getSession();
		tx= session.beginTransaction();
		session.update(machineScheduleTransaction);
		
		tx.commit();
		}
		catch(Exception ex){
			if(tx!=null) {tx.rollback();}
			ex.printStackTrace();
		}
		finally{
			if(session!=null) {session.close(); }
		}
		
	}
	
	public void addSchedule(MachineScheduleTransaction machineScheduleTransaction) {
		Session session = null;
		
		
		 try{
			
			 session = HibernateConfig.getSession();
			 
			 session.save(machineScheduleTransaction);
			 
			
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			
			 if(session != null){
				 session.close();
			 }
		 }
	}	
	public void deleteSchedule(int scheduleId){
		Session session = null;
		MachineScheduleTransaction a1 = null;
		 try{
			 
			 session = HibernateConfig.getSession();
			
			 a1 = (MachineScheduleTransaction) session.load(MachineScheduleTransaction.class, scheduleId);
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
	
	public void updateSchedule(MachineScheduleTransaction machineScheduleTransaction){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(machineScheduleTransaction);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 
				 ex.printStackTrace();
			 }finally{
				
				 if(session != null){
					 session.close();
				 }
			 }
		}

	public void updateTargetMachineSchedule(MachineScheduleTransaction machineScheduleTransaction,
			List<SpareChangeInSchedule> spareChangeInScheduleList) {
	
		Session session = null;
		Transaction tx=null;
		 try{
			 session = HibernateConfig.getSession();
			 
			 tx= session.beginTransaction();
			 session.update(machineScheduleTransaction);
			 for(SpareChangeInSchedule s:spareChangeInScheduleList)
			 {
				 session.save(s);
			 }
			 
			 tx.commit();
			 
		 }catch(Exception ex){
			 if(tx!=null) {tx.rollback();}
			 ex.printStackTrace();
		 }finally{
			
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
}
