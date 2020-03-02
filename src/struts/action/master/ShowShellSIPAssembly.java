package struts.action.master;
import org.hibernate.Session;

import beans.ShellSideRoofShellCombineSipTran;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShowShellSIPAssembly {

	ShellSideRoofShellCombineSipTran shellSideRoofShellCombineSipTran;
	ShellTransaction shellTransaction;
	String shellAssetId;
	public String showData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		shellSideRoofShellCombineSipTran=(ShellSideRoofShellCombineSipTran) session.get(ShellSideRoofShellCombineSipTran.class, shellAssetIdAsInt);
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
	public ShellSideRoofShellCombineSipTran getShellSideRoofShellCombineSipTran() {
		return shellSideRoofShellCombineSipTran;
	}
	public void setShellSideRoofShellCombineSipTran(ShellSideRoofShellCombineSipTran shellSideRoofShellCombineSipTran) {
		this.shellSideRoofShellCombineSipTran = shellSideRoofShellCombineSipTran;
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
