package dao;
import org.hibernate.Session;
import org.hibernate.Transaction;
import beans.BiotankTestingTransaction;
import beans.FurnishingTransaction;
//import beans.PlumbingTestingTransaction;
import hibernateConnect.HibernateConfig;
public class DaoBioTankTesting {
	
	public void saveBioTankTestData(FurnishingTransaction furnishingTran, BiotankTestingTransaction BiotankTestingTrans) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		if(furnishingTran!=null)
		{
		session.update(furnishingTran);
		System.out.println("Inside dao");
		}
		else
		{
			session.saveOrUpdate(furnishingTran);
		}
		//session.update(shellTran);
		System.out.println("inside dao1");
		session.saveOrUpdate(BiotankTestingTrans);
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



