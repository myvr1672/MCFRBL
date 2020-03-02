package dao;
import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.BogieFinalSipTran;
import beans.BogiesetTransaction;
import hibernateConnect.HibernateConfig;

public class DaoBogieFinal {
	
	public void saveBogieFinal(BogieFinalSipTran bogieFinalSipTran, BogiesetTransaction bogiesetTran) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		session.saveOrUpdate(bogieFinalSipTran);
		session.update(bogiesetTran);
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
