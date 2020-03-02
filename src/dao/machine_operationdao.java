package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;
import model.machine_operation;

public class machine_operationdao {
	

@SuppressWarnings("unchecked")
public List<machine_operation> getAllmachine_operation() {
		Session session =  null;
		List<machine_operation> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria(machine_operation.class);
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

	public void addmachine_operation(machine_operation operation) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(operation);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deletemachine_operation(Integer id){
		Session session = null;
		machine_operation s1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         s1 = (machine_operation) session.load(machine_operation.class, id);
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
	
	public void updatemachine_operation(machine_operation record){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 session.update(record);
				 
			 }catch(Exception ex){
					 ex.printStackTrace();
			 }finally{
				if(session != null){
					 session.close();
				 }
			 }
		}
	
}


