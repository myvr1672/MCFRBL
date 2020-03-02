package struts.action.master;
import org.hibernate.Session;

import beans.ShellLavSideWallSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShowSaveDataLavSidewall {
	private String shellAssetId;
	private ShellTransaction shellTran;
	private ShellLavSideWallSipTran shellLavSideWallTran;
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
	public ShellLavSideWallSipTran getShellLavSideWallTran() {
		return shellLavSideWallTran;
	}
	public void setShellLavSideWallTran(ShellLavSideWallSipTran shellLavSideWallTran) {
		this.shellLavSideWallTran = shellLavSideWallTran;
	}
	public String showSaveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		try
		{
			shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			shellLavSideWallTran=(ShellLavSideWallSipTran) session.get(ShellLavSideWallSipTran.class, shellAssetIdAsInt);
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
