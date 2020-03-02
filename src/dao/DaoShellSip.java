package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellSideWallSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShellSip {

	
	public void saveSideWallData(ShellSideWallSipTran shellSideWallSipTran, ShellTransaction shellTran) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		session.saveOrUpdate(shellSideWallSipTran);
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
