package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellTransaction;
import beans.ShellStage4SipTran;
import beans.ShellSideWallSipTran;
import hibernateConnect.HibernateConfig;

public class DaoShellStage4 {
	
	public void saveShellStage4Data(ShellStage4SipTran shellStage4SipTran, ShellTransaction shellTran,ShellSideWallSipTran shellSideWallSipTran, ShellSideWallSipTran shellSideWallSipTranNew) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		if(shellSideWallSipTran!=null)
		{
		session.update(shellSideWallSipTran);
		System.out.println("Inside dao");
		}
		else
		{
			session.saveOrUpdate(shellSideWallSipTranNew);
		}
		session.update(shellTran);
		session.saveOrUpdate(shellStage4SipTran);
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
