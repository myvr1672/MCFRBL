package dao;
import beans.BogiesetTransaction;

import beans.BogieStaticSipTran;

import org.hibernate.Session;
import org.hibernate.Transaction;


import hibernateConnect.HibernateConfig;

public class DaoBogieStaticSip {
	
	public void saveBogieStaticSip(BogieStaticSipTran  bogieStaticSipTran,BogiesetTransaction bogiesetTransaction) {
		Session session=null;
		Transaction tx=null;
		try
		{ session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		
		session.update(bogiesetTransaction);
		session.saveOrUpdate(bogieStaticSipTran);
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
