package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import beans.CoachTurnoutTransaction;
import beans.FinishingTransaction;


import hibernateConnect.HibernateConfig;

public class DaoFinishingProduction {

	public void addFurnishingProgress(FinishingTransaction finishingTransaction) {
		Session session = null;
		
		 try{
			
			 session = HibernateConfig.getSession();
			 
			 session.saveOrUpdate(finishingTransaction);
			 
			 //System.out.println("abnormality Id " + abnormality.getAbid());
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	@SuppressWarnings("unchecked")
	public List<FinishingTransaction> getAllFinishing(String stageid,String jtSorting, String previousStage) {
		Session session =  null;
		
		List<FinishingTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoFinishingProduction getAllFurnishing() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(FinishingTransaction.class);
			cr.add(Restrictions.eq("stageId", stageid));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			cr.add(Restrictions.isNull("assemblyDispatchDate"));
			String[] temp;
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
			System.out.println("--- Error Inside dao.DaoFinishingProduction getAllFurnishing() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoFinishingProduction getAllFurnishing() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<FinishingTransaction> getDispatchFinishing(String jtSorting) {
		Session session =  null;
		
		List<FinishingTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(FinishingTransaction.class);
			
			
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			cr.add(Restrictions.isNotNull("assemblyDispatchDate"));
			cr.add(Restrictions.isNull("receiptAtNextStage"));
			String[] temp;
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
			System.out.println("--- Error Inside dao.DaoFurnishingProduction getAllFurnishing() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
	
	
	
	
	public void updateFinishingProgress(FinishingTransaction finishingTransaction)
	{
		Session session = null;
		try
		{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			session.update(finishingTransaction); 
			session.getTransaction().commit();
		}
		catch(Exception ex){
			
		}
		finally{
			if(session!=null)
				session.close();
		}
	}
	
	public void updateFinishingProgress(FinishingTransaction finishingTransaction, CoachTurnoutTransaction coachTurnoutTransaction)
	{
		Session session = null;
		Transaction tx=null;
		try
		{
			session = HibernateConfig.getSession();
			tx=session.beginTransaction();
			session.update(finishingTransaction); 
			session.save(coachTurnoutTransaction);
			session.getTransaction().commit();
		}
		catch(Exception ex){
			if(tx!=null)
			 {
				 tx.rollback();
			 }
		}
		finally{
			if(session!=null)
				session.close();
		}
	}
	
}
