package struts.action.master;

import org.hibernate.Session;

import beans.ShellSideWallSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShowSaveDataSideWall {
	private String shellAssetId;
	private ShellTransaction shellTran;
	private ShellSideWallSipTran shellSideWallTran;
	public String showSaveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		try
		{
			shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			shellSideWallTran=(ShellSideWallSipTran) session.get(ShellSideWallSipTran.class, shellAssetIdAsInt);
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
	public ShellSideWallSipTran getShellSideWallTran() {
		return shellSideWallTran;
	}
	public void setShellSideWallTran(ShellSideWallSipTran shellSideWallTran) {
		this.shellSideWallTran = shellSideWallTran;
	}

}
