package struts.action.master;
import org.hibernate.Session;

import beans.ShellCheckListSip;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShowShellCheckListSip {

	ShellCheckListSip shellCheckListSip;
	ShellTransaction shellTransaction;
	String shellAssetId;
	public String showData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		shellCheckListSip=(ShellCheckListSip) session.get(ShellCheckListSip.class, shellAssetIdAsInt);
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
	public ShellCheckListSip getShellCheckListSip() {
		return shellCheckListSip;
	}
	public void setShellCheckListSip(ShellCheckListSip shellCheckListSip) {
		this.shellCheckListSip = shellCheckListSip;
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
