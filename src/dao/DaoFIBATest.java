package dao;

import org.hibernate.Session;

import org.hibernate.Transaction;

import beans.FibaTestingTransaction;
import beans.FurnishingTransaction;
import hibernateConnect.HibernateConfig;

public class DaoFIBATest {

	public void saveFIBATestData(FibaTestingTransaction fibaTestingTransaction, FurnishingTransaction furnishingTran) {
		Session session=null;
		Transaction tx=null;
		try
		{
	     session=HibernateConfig.getSession();
		 tx=session.beginTransaction();
		 session.saveOrUpdate(fibaTestingTransaction);
		 session.update(furnishingTran);
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