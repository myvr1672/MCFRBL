package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import beans.ExtrPaintFinalSipTran;
import beans.PaintTransaction;
import hibernateConnect.HibernateConfig;

public class DaoExtrPaintFinal {

	public void saveData1(ExtrPaintFinalSipTran extrPaintFinalSipTran, PaintTransaction paintTransaction) {
		Session session=null;
		Transaction tx=null;
		
		try
		{
			session= HibernateConfig.getSession();
			tx=session.beginTransaction();
			session.saveOrUpdate(extrPaintFinalSipTran);
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
