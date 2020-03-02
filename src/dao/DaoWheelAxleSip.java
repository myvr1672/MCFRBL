package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.WheelsetTransaction;
import beans.WheelSipTransaction;
import hibernateConnect.HibernateConfig;

public class DaoWheelAxleSip {

	public void saveTesting(WheelsetTransaction wheelsetTransaction, WheelSipTransaction wheelSipTransaction) {
	   Session session=null;
	   session=HibernateConfig.getSession();
	   Transaction tx=null;
	   try
	   {
		   tx=session.beginTransaction();
		   session.update(wheelsetTransaction);
		   session.saveOrUpdate(wheelSipTransaction);
		   tx.commit();
	   }
	   catch(Exception ex)
	   {
		   ex.printStackTrace();
		   if(tx!=null)
		   {
			   tx.rollback();
		   }   
	   }
	   finally
	   {
		   if(session!=null)
		   {
			   session.close();
		   }
	   }
		
	}

	public void update(WheelsetTransaction wheelsetTransaction, WheelSipTransaction wheelSipTransaction) {
		Session session=null;
		   session=HibernateConfig.getSession();
		   Transaction tx=null;
		   try
		   {
			   tx=session.beginTransaction();
			   session.update(wheelsetTransaction);
			   session.update(wheelSipTransaction);
			   tx.commit();
		   }
		   catch(Exception ex)
		   {
			   ex.printStackTrace();
			   if(tx!=null)
			   {
				   tx.rollback();
			   }   
		   }
		   finally
		   {
			   if(session!=null)
			   {
				   session.close();
			   }
		   }	
		
	}

}
