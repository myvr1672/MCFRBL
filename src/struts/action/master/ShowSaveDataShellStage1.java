package struts.action.master;
import org.hibernate.Session;
import beans.ShellTransaction;
import beans.ShellSideWallSipTran;
import beans.ShellStage1SipTran;
import beans.ShellEndwallSipTran;
import hibernateConnect.HibernateConfig;

public class ShowSaveDataShellStage1 {
	

	private String shellAssetId;
	private ShellTransaction shellTran;
	private ShellStage1SipTran shellStage1SipTran;
	private ShellSideWallSipTran shellSideWallSipTran;
	private ShellEndwallSipTran shellEndwallSipTran;
	
	public String showSaveDataStage1()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		System.out.println("inside function");
		try
		{
			shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
			shellStage1SipTran=(ShellStage1SipTran) session.get(ShellStage1SipTran.class, shellAssetIdAsInt);
			shellSideWallSipTran=(ShellSideWallSipTran) session.get(ShellSideWallSipTran.class, shellAssetIdAsInt);
			shellEndwallSipTran=(ShellEndwallSipTran) session.get(ShellEndwallSipTran.class, shellAssetIdAsInt);
			System.out.println("inside try save show");
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			System.out.println("  inside catch save show");
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

	public ShellStage1SipTran getShellStage1SipTran() {
		return shellStage1SipTran;
	}

	public void setShellStage1SipTran(ShellStage1SipTran shellStage1SipTran) {
		this.shellStage1SipTran = shellStage1SipTran;
	}

	public ShellSideWallSipTran getShellSideWallSipTran() {
		return shellSideWallSipTran;
	}

	public void setShellSideWallSipTran(ShellSideWallSipTran shellSideWallSipTran) {
		this.shellSideWallSipTran = shellSideWallSipTran;
	}

	public ShellEndwallSipTran getShellEndwallSipTran() {
		return shellEndwallSipTran;
	}

	public void setShellEndwallSipTran(ShellEndwallSipTran shellEndwallSipTran) {
		this.shellEndwallSipTran = shellEndwallSipTran;
	}
								


}
