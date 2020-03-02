package dao;
import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellTransaction;
import beans.ShellSideWallSipTran;
import beans.ShellStage1SipTran;
import beans.ShellEndwallSipTran;
import hibernateConnect.HibernateConfig;

public class DaoShellStage1SIP {
	public void saveAssemblyStage1Data(ShellStage1SipTran shellStage1SipTran,ShellSideWallSipTran shellSideWallSipTran,ShellEndwallSipTran shellEndwallSipTran,ShellTransaction shellTran,ShellSideWallSipTran sswallSIP,ShellEndwallSipTran sewallSIP) 
	{
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		session.saveOrUpdate(shellStage1SipTran);
		System.out.println("after shell stage 1");
		session.update(shellTran);
		System.out.println("after shell tran");
		if(shellSideWallSipTran!=null)
		{
		session.update(shellSideWallSipTran);
		System.out.println("after shell sidewall1");
		}
		else
		{
			session.save(sswallSIP);	
			System.out.println("after shell sidewall2");
		}
		if(shellEndwallSipTran!=null)
		{
			session.update(shellEndwallSipTran);
			System.out.println("after shell endwall1");
		}
		else
		{
			session.save(sewallSIP);	
			System.out.println("after shell endwall2");
		}
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
