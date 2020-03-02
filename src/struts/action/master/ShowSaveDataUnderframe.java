package struts.action.master;

import org.hibernate.Session;

import beans.ShellTransaction;
import beans.ShellUnderframeSipTrans;
import hibernateConnect.HibernateConfig;

public class ShowSaveDataUnderframe {
	private String shellAssetId;
	private ShellTransaction shellTran;
	private ShellUnderframeSipTrans shellUndeframeSipTrans;
	
	public String showSaveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		try
		{
			shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			shellUndeframeSipTrans=(ShellUnderframeSipTrans) session.get(ShellUnderframeSipTrans.class, shellAssetIdAsInt);
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
	public ShellUnderframeSipTrans getShellUndeframeSipTrans() {
		return shellUndeframeSipTrans;
	}
	public void setShellUnderframeSipTrans(ShellUnderframeSipTrans shellUndeframeSipTrans) {
		this.shellUndeframeSipTrans = shellUndeframeSipTrans;
	}
	
}
