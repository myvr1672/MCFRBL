package dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import hibernateConnect.HibernateConfig;
import beans.AddAmcAgency;

public class AmcAgencyDao {
	

@SuppressWarnings("unchecked")
public List<AddAmcAgency> getAmcAgency(String jtSorting) {
		Session session =  null;
		List<AddAmcAgency> list = null;
	
		try{
			session = HibernateConfig.getSession();
		//	session.beginTransaction();
			Criteria c = session.createCriteria(AddAmcAgency.class);
			String[] temp;
			
	         /* delimiter */
	         String delimiter = " ";
	         /* given string will be split by the argument delimiter provided. */
	         temp = jtSorting.split(delimiter);
	 if(jtSorting.endsWith("ASC"))
		         {
		        	 c.addOrder(Order.asc(temp[0]));
		         }
		         else if(jtSorting.endsWith("DESC"))
		         {
		        	 c.addOrder(Order.desc(temp[0]));	 
		         }
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

	public void addAmcAgency(AddAmcAgency amc) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(amc);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteAmcAgency(String amc_agency_id){
		Session session = null;
		AddAmcAgency a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         a1 = (AddAmcAgency) session.load(AddAmcAgency.class, amc_agency_id );
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
	
	public void updateAmcAgency(AddAmcAgency record){
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
