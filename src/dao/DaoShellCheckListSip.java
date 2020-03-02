package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellCheckListSip;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShellCheckListSip {

	public void saveData(ShellCheckListSip shellCheckListSip, ShellTransaction shellTransaction) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			session.saveOrUpdate(shellCheckListSip);
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
