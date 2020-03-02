package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellFinalSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShellSIPFinal {

	public void saveData(ShellFinalSipTran shellFinalSipTran, ShellTransaction shellTransaction) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			session.saveOrUpdate(shellFinalSipTran);
			session.update(shellTransaction);
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
		{
			
		}
		
	}


}
