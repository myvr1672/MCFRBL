package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.ShellSideRoofShellCombineSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class DaoShellAssemblySIP {

	public void saveData(ShellSideRoofShellCombineSipTran shellSideRoofShellCombineSipTran, ShellTransaction shellTransaction) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			session.saveOrUpdate(shellSideRoofShellCombineSipTran);
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
