package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellStage3SipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShellStage3Sip {
	public void saveStage3( ShellTransaction shellTran, ShellStage3SipTran ShellStage3SipTran) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		session.update(shellTran);
		session.saveOrUpdate(ShellStage3SipTran);
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
