package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import beans.IntrPaintFinalSipTran;
import beans.PaintTransaction;
import hibernateConnect.HibernateConfig;

public class DaoIntrPaintSip {

	public void saveData(IntrPaintFinalSipTran intrPaintFinalSipTran, PaintTransaction paintTransaction) {
		Session session=null;
		Transaction tx=null;
		
		try
		{
			session= HibernateConfig.getSession();
			tx=session.beginTransaction();
			session.saveOrUpdate(intrPaintFinalSipTran);
			session.update(paintTransaction);
			tx.commit();
			
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}

}
