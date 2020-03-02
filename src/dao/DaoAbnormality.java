package dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;

import org.hibernate.Session;


import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import hibernateConnect.HibernateConfig;
import model.Abnormality;
import model.User;

public class DaoAbnormality {
		
	@SuppressWarnings("unchecked")
	public List<Abnormality> getAllAbnormaity(String jtSorting) {
		Session session =  null;
		List<Abnormality> list = null;
		String username= null;
		String roles= null;
		String [] role;
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	User loginUser = (User)session.get(User.class,username.trim());
	    
		 roles= loginUser.getRoles();
		System.out.println(roles);
		}

	roles = roles.replaceAll(", ",",");	
	 role= roles.split(",");
		try{
			
			System.out.println("--Inside dao.DaoAbnormality getAllAbnormaity() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(Abnormality.class);
			Calendar startdate = Calendar.getInstance();
			startdate.add(Calendar.MONTH, -6);
			/*
			int current_year= startdate.get(Calendar.YEAR);
			int month=startdate.get(Calendar.MONTH);
			if (month<3)
			{
				current_year=current_year-1;
			}
			*/
			//startdate.set(current_year,0,1);
			Calendar enddate = Calendar.getInstance();
			//enddate.set(current_year+1,3,30);
			
			cr.add(Restrictions.le("createdate",enddate.getTime()));
			cr.add(Restrictions.ge("createdate",startdate.getTime()));
			if(!roles.equals("All")){
			cr.add(Restrictions.in("shop", role));
			}
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
			System.out.println("--- Error Inside dao.DaoAbnormality getAllAbnormaity() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoAbnormality getAllAbnormaity() methods finally Block--");
				session.close();
			}			
		}
		return list;
	}

	public void addAbnormality(Abnormality abnormality) {
		Session session = null;
		
		System.out.println("Abnormality Type " + abnormality.getAbnormalityDescription());
		 try{
			 System.out.println("---Inside dao.DaoAbnormality addAbnormality() methods try block---");
			 session = HibernateConfig.getSession();
			 
			 session.save(abnormality);
			 
			 System.out.println("abnormality Id " + abnormality.getAbid());
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoAbnormality addAbnormality() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoAbnormality addAbnormality() methods finally block---");
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteAbnormality(int abid){
		Session session = null;
		Abnormality a1 = null;
		 try{
			 System.out.println("---Inside dao.DaoAbnormality deleteAbnormality() methods try block---");
			 session = HibernateConfig.getSession();
			 System.out.println("abid->"+abid);
			 a1 = (Abnormality) session.load(Abnormality.class, abid);
			 session.delete(a1);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoAbnormality deleteAbnormality() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoAbnormality deleteAbnormality() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateAbnormality(Abnormality abnormality){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(abnormality);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 System.out.println("---Error Inside dao.DaoAbnormality updateAbnormality() methods catch block---"+abnormality);
				 ex.printStackTrace();
			 }finally{
				 System.out.println("---Inside dao.DaoAbnormality updateAbnormality() methods finally block---");
				 if(session != null){
					 session.close();
				 }
			 }
		}
	
}
