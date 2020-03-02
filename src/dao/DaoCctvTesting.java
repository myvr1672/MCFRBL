package dao;
import org.hibernate.Session;
import beans.FurnishingTransaction;
import org.hibernate.Transaction;
import beans.CctvTestingTransaction;
import hibernateConnect.HibernateConfig;
public class DaoCctvTesting {
	
	public void saveTesting(CctvTestingTransaction cctvTestingTrans, FurnishingTransaction furnishingTran) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		System.out.println("inside dao1");
		session.saveOrUpdate(cctvTestingTrans);
		session.update(furnishingTran);
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
