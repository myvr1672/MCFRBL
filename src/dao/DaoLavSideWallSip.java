package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellLavSideWallSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoLavSideWallSip {

	public void saveLavSideWallData(ShellLavSideWallSipTran shellLavSideWallSipTran, ShellTransaction shellTran) {
		Session session=null;
		Transaction tx=null;
		try
		{
	     session=HibernateConfig.getSession();
		 tx=session.beginTransaction();
		 session.saveOrUpdate(shellLavSideWallSipTran);
		 session.update(shellTran);
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
