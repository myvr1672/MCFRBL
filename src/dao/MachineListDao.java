package dao;

import java.util.List;



import org.hibernate.Criteria;
import org.hibernate.Session;
//import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import beans.MachineList;

import hibernateConnect.HibernateConfig;


public class MachineListDao {

	@SuppressWarnings("unchecked")
	public List<MachineList> getAllMachineList() {
		Session session =  null;
		List<MachineList> list = null;
		
		
		try{
			
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(MachineList.class);
			
			//cr.add(Restrictions.eq("machineId", machineId));
			
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

	public void addMachineList(MachineList machineScheduleTransaction) {
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
	public void deleteMachineList(int machineId){
		Session session = null;
		MachineList a1 = null;
		 try{
			 
			 session = HibernateConfig.getSession();
			
			 a1 = (MachineList) session.load(MachineList.class, machineId);
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
	
	public void updateMachineList(MachineList machineScheduleTransaction){
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
	
}
