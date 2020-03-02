package dao;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import com.opensymphony.xwork2.ActionContext;

import hibernateConnect.HibernateConfig;
import beans.*;

public class MachineScheduleActivityDao {
	

@SuppressWarnings("unchecked")
public List<MachineScheduleActivity> getMachineScheduleActivity( Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<MachineScheduleActivity> list = null;
	
		try{
			session = HibernateConfig.getSession();
		//	session.beginTransaction();
			Criteria c = session.createCriteria(MachineScheduleActivity.class);
			
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

	public void addMachineScheduleActivity(MachineScheduleActivity schedule) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(schedule);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteMachineScheduleActivity(String activityNo){
		Session session = null;
		MachineScheduleActivity a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         a1 = (MachineScheduleActivity) session.load(MachineScheduleActivity.class, activityNo );
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
	
	public void updateMachineScheduleActivity(MachineScheduleActivity record){
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
