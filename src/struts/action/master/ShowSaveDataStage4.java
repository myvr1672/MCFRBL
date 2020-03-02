   package struts.action.master;	
	import org.hibernate.Session;
	import beans.ShellStage4SipTran;
	import beans.ShellTransaction;
	import beans.ShellSideWallSipTran;
	import hibernateConnect.HibernateConfig;

	   public class ShowSaveDataStage4 {
		private String shellAssetId;
		private ShellTransaction shellTran;
		private ShellStage4SipTran shellStage4SipTran;
		private ShellSideWallSipTran shellSideWallSipTran;
		private ShellSideWallSipTran shellSideWallSipTranNew;
		
		public String SaveDataStage4()
		{
			System.out.println("Inside showsave data1");
			Session session=null;
			session=HibernateConfig.getSession();
			Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
			try
			{
				System.out.println("Inside showsave data2");
				shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
				shellStage4SipTran=(ShellStage4SipTran) session.get(ShellStage4SipTran.class, shellAssetIdAsInt);
				shellSideWallSipTran=(ShellSideWallSipTran) session.get(ShellSideWallSipTran.class, shellAssetIdAsInt);
				shellSideWallSipTranNew=(ShellSideWallSipTran) session.get(ShellSideWallSipTran.class, shellAssetIdAsInt);
				
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
		public ShellStage4SipTran getShellStage4SipTran() {
			return shellStage4SipTran;
		}
		public void setShellStage4SipTran(ShellStage4SipTran shellStage4SipTran) {
			this.shellStage4SipTran = shellStage4SipTran;
		}
		public ShellSideWallSipTran getShellSideWallSipTran() {
			return shellSideWallSipTran;
		}
		public void setShellSideWallSipTran(ShellSideWallSipTran shellSideWallSipTran) {
			this.shellSideWallSipTran = shellSideWallSipTran;
		}
		public ShellSideWallSipTran getShellSideWallSipTranNew() {
			return shellSideWallSipTranNew;
		}
		public void setShellSideWallSipTranNew(ShellSideWallSipTran shellSideWallSipTranNew) {
			this.shellSideWallSipTranNew = shellSideWallSipTranNew;
		}
		
									
  }


