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

import hibernateConnect.HibernateConfig;
import beans.CoachOutAfterRackFormation;
public class DaoCoachTurnoutTransaction {

	@SuppressWarnings("unchecked")
	public List<CoachTurnoutTransaction> getAllCoach(String jtSorting) {
		Session session =  null;
		
		List<CoachTurnoutTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
		
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(CoachTurnoutTransaction.class);
			
			
			cr.add(Restrictions.isNull("rackCreated"));
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
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	public void updateCoachTurnoutAndSaveCoachOutAfterRack(List<CoachTurnoutTransaction> coachTurnoutTransactionList, CoachOutAfterRackFormation coachOutAfterRackFormation)
	{
		Session session = null;
		Transaction tx=null;
		try
		{
			session = HibernateConfig.getSession();
			tx=session.beginTransaction();
			for(CoachTurnoutTransaction c:coachTurnoutTransactionList)
			{
			session.update(c);
			}
			session.save(coachOutAfterRackFormation);
			
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

	public List<CoachOutAfterRackFormation> getAllReadyCoach(String jtSorting) {
		
    Session session =  null;
		
		List<CoachOutAfterRackFormation> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
		
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(CoachOutAfterRackFormation.class);
			
			
			cr.add(Restrictions.isNull("dispatchDate"));
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
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		
	}
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<CoachOutAfterRackFormation> getAllSentCoach(String jtSorting) {
	
		  Session session =  null;
			
			List<CoachOutAfterRackFormation> list = null;
			String username= null;
			
			HttpSession session_http = ServletActionContext.getRequest().getSession(true);
			username = (String) session_http.getAttribute("userid");
			
			if (username != null)
			{
		session = HibernateConfig.getSession();
		
		  
			try{
			
				session = HibernateConfig.getSession();
				Criteria cr = session.createCriteria(CoachOutAfterRackFormation.class);
				
				
				cr.add(Restrictions.isNotNull("dispatchDate"));
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
				
				ex.printStackTrace();
			}finally{
				if(session!= null){
					
					session.close();
				}			
			}
			
		}
			return list;
		
	}

	public void updateCoachDispatch(CoachOutAfterRackFormation coachOutAfterRackFormation) {
		Session session = null;
		Transaction tx=null;
		try
		{
			session = HibernateConfig.getSession();
			tx=session.beginTransaction();
			
			session.update(coachOutAfterRackFormation);
			
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
