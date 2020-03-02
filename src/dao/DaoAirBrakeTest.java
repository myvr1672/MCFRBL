package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.AirbrakeTestingTransaction;
import beans.FurnishingTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoAirBrakeTest {
	
	public void saveAirBrakeTest(AirbrakeTestingTransaction airbrakeTestingTransaction,ShellTransaction shellTransaction,FurnishingTransaction furnishingTransaction)
	{
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		session.saveOrUpdate(airbrakeTestingTransaction);
		session.update(shellTransaction);
		session.update(furnishingTransaction);
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
