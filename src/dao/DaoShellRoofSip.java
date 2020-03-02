package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellRoofTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShellRoofSip {

	public void saveRoofData(ShellRoofTransaction shellRoofTransaction, ShellTransaction shellTran) {
		Session session=null;
		Transaction tx=null;
		try
		{
		session=HibernateConfig.getSession();
		tx=session.beginTransaction();
		session.saveOrUpdate(shellRoofTransaction);
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

