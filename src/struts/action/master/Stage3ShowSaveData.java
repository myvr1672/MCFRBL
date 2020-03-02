package struts.action.master;

import org.hibernate.Session;


import beans.ShellStage3SipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class Stage3ShowSaveData {
	
	private String shellAssetId;
	private ShellTransaction shellTran;
	private ShellStage3SipTran shellStage3Sip;
	public String showSaveDataStage3()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		try
		{
			shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			shellStage3Sip= (ShellStage3SipTran) session.get(ShellStage3SipTran.class,shellAssetIdAsInt);
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
	public ShellStage3SipTran getShellStage3Sip() {
		return shellStage3Sip;
	}
	public void setShellStage3Sip(ShellStage3SipTran shellStage3Sip) {
		this.shellStage3Sip = shellStage3Sip;
	}
	

}
