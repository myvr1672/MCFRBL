package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellSideWallSipTran;
import beans.ShellStage2Sip;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShellStage2Sip {
	
	public void saveStage2(ShellSideWallSipTran shellSideWallSipTran, ShellTransaction shellTran, ShellStage2Sip shellStage2Sip) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		if(shellSideWallSipTran!=null)
		{
		session.update(shellSideWallSipTran);
		}
		session.update(shellTran);
		session.saveOrUpdate(shellStage2Sip);
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
