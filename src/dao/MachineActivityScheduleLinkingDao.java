package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import hibernateConnect.HibernateConfig;

import beans.MachineActivityScheduleLinking;
public class MachineActivityScheduleLinkingDao {
	

@SuppressWarnings("unchecked")
public List<MachineActivityScheduleLinking> getAllMachineActivityScheduleLinking(Integer machineId, String scheduleType) {
		Session session =  null;
		List<MachineActivityScheduleLinking> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria(MachineActivityScheduleLinking.class);
			c.add(Restrictions.eq("machineId", machineId));
			c.add(Restrictions.eq("scheduleType", scheduleType));
			
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

	public void addMachineActivityScheduleLinking(MachineActivityScheduleLinking asset) {
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
	public void updateMachineActivityScheduleLinking(MachineActivityScheduleLinking record){
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
	
	
	public void deleteMachineActivityScheduleLinking(Integer machineScheduleLinkId){
		Session session = null;
		MachineActivityScheduleLinking a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         a1 = (MachineActivityScheduleLinking) session.load(MachineActivityScheduleLinking.class,machineScheduleLinkId);
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
