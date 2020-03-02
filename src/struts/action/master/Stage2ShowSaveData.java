package struts.action.master;

import org.hibernate.Session;

import beans.ShellSideWallSipTran;
import beans.ShellStage2Sip;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class Stage2ShowSaveData {

	private String shellAssetId;
	private ShellTransaction shellTran;
	private ShellSideWallSipTran shellSideWallTran;
	private ShellStage2Sip shellStage2;
	public String showSaveDataStage2()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		try
		{
			shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			shellSideWallTran=(ShellSideWallSipTran) session.get(ShellSideWallSipTran.class, shellAssetIdAsInt);
			shellStage2=(ShellStage2Sip) session.get(ShellStage2Sip.class,shellAssetIdAsInt);
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
	public ShellStage2Sip getShellStage2() {
		return shellStage2;
	}
	public void setShellStage2(ShellStage2Sip shellStage2) {
		this.shellStage2 = shellStage2;
	}
	
}
