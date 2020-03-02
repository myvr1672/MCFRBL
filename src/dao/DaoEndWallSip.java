package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellEndwallSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoEndWallSip {

	public void saveEndWallData(ShellEndwallSipTran shellEndwallSipTran, ShellTransaction shellTran) {
		// TODO Auto-generated method stub
		Session session=null;
		Transaction tx=null;
		try
		{
	     session=HibernateConfig.getSession();
		 tx=session.beginTransaction();
		 session.saveOrUpdate(shellEndwallSipTran);
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
