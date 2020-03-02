package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;
import model.Emp_master;

public class Emp_masterdao {
	

@SuppressWarnings("unchecked")
public List<Emp_master> getAllEmp_master(String jtSorting) {
		Session session =  null;
		List<Emp_master> list = null;
	
		try{
			session = HibernateConfig.getSession();
		//	session.beginTransaction();
			Criteria c = session.createCriteria(Emp_master.class);
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

	public void addEmp_master(Emp_master asset) {
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
	
	public void deleteEmp_master(String emp_no){
		Session session = null;
		Emp_master a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         a1 = (Emp_master) session.load(Emp_master.class, emp_no);
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
	
	public void updateEmp_master(Emp_master record){
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
