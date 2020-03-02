package struts.action.master;
import org.hibernate.Session;

import beans.ShellFinalSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShowShellSIPFinal {

	ShellFinalSipTran shellFinalSipTran;
	ShellTransaction shellTransaction;
	String shellAssetId;
	public String showData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		shellFinalSipTran=(ShellFinalSipTran) session.get(ShellFinalSipTran.class, shellAssetIdAsInt);
		shellTransaction= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
		try
		{
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
	public ShellFinalSipTran getShellFinalSipTran() {
		return shellFinalSipTran;
	}
	public void setShellFinalSipTran(ShellFinalSipTran shellFinalSipTran) {
		this.shellFinalSipTran = shellFinalSipTran;
	}
	public ShellTransaction getShellTransaction() {
		return shellTransaction;
	}
	public void setShellTransaction(ShellTransaction shellTransaction) {
		this.shellTransaction = shellTransaction;
	}
	public String getShellAssetId() {
		return shellAssetId;
	}
	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}
	

}
