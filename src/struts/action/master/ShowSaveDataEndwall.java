package struts.action.master;
import org.hibernate.Session;

import beans.ShellEndwallSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShowSaveDataEndwall {
	private String shellAssetId;
	private ShellTransaction shellTran;
	private ShellEndwallSipTran shellEndwallSipTran;
	public String getShellAssetId() {
		return shellAssetId;
	}
	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}
	public ShellTransaction getShellTran() {
		return shellTran;
	}
	public void setShellTran(ShellTransaction shellTran) {
		this.shellTran = shellTran;
	}
	
	public ShellEndwallSipTran getShellEndwallSipTran() {
		return shellEndwallSipTran;
	}
	public void setShellEndwallSipTran(ShellEndwallSipTran shellEndwallSipTran) {
		this.shellEndwallSipTran = shellEndwallSipTran;
	}
	public String showEndSaveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		try
		{
			shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			shellEndwallSipTran=(ShellEndwallSipTran) session.get(ShellEndwallSipTran.class, shellAssetIdAsInt);
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
}
