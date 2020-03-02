package dao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import beans.ShowerTestingTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShowerTesting {
	
	public void saveTesting(ShowerTestingTransaction showerTestingTransaction) {
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
		session.saveOrUpdate(showerTestingTransaction);
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
