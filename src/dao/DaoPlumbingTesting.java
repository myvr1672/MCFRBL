package dao;
import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.FurnishingTransaction;
import beans.PlumbingTestingTransaction;
import hibernateConnect.HibernateConfig;
public class DaoPlumbingTesting {

	public void saveTesting(PlumbingTestingTransaction plumbingTestingTransaction,FurnishingTransaction ft) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		/*if(shellSideWallSipTran!=null)
		{
		session.update(shellSideWallSipTran);
		System.out.println("Inside dao");
		}
		else
		{
			session.saveOrUpdate(shellSideWallSipTranNew);
		}
		session.update(shellTran);*/
		System.out.println("inside dao1");
		session.saveOrUpdate(plumbingTestingTransaction);
		session.update(ft);
		System.out.println("inside dao2");
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
