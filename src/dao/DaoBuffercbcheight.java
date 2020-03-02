package dao;
import beans.FurnishingTransaction;

import beans.BuffercbcheightTestingTransaction;

import org.hibernate.Session;
import org.hibernate.Transaction;


import hibernateConnect.HibernateConfig;

public class DaoBuffercbcheight {
	
	public void saveDaoBuffercbcheight(FurnishingTransaction furnishingTransaction,BuffercbcheightTestingTransaction buffercbcheightTestingTransaction) {
		Session session=null;
		Transaction tx=null;
		try
		{ session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		
		session.update(furnishingTransaction);
		session.saveOrUpdate(buffercbcheightTestingTransaction);
		tx.commit();
		}
		catch(Exception ex)
		{
		ex.printStackTrace();
		tx.rollback();
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
