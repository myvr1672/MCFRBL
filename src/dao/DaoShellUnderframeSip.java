package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellUnderframeSipTrans;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShellUnderframeSip {

	public void saveUnderframeData(ShellUnderframeSipTrans shellUnderframeSipTrans, ShellTransaction shellTran) {
		Session session=null;
		Transaction tx=null;
		try
		{
			session=HibernateConfig.getSession();
		 tx=session.beginTransaction();
		 session.saveOrUpdate(shellUnderframeSipTrans);
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