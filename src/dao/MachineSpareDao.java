package dao;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;

import hibernateConnect.HibernateConfig;

import beans.MachineSpare;


public class MachineSpareDao {
	

@SuppressWarnings("unchecked")
public List< MachineSpare> getAllMachineSpare() {
		Session session =  null;
		List<MachineSpare> list = null;
	
		try{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria c = session.createCriteria( MachineSpare.class);
			

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

	public void addMachineSpare(MachineSpare machinespare) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
	         session.save(machinespare);
			 
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
		MachineSpare s1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         s1 = (MachineSpare) session.load(MachineSpare.class, spareId);
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
	
	public void updateMachineSpare(MachineSpare record){
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


