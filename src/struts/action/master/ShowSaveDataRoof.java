package struts.action.master;


import org.hibernate.Session;

import beans.ShellRoofTransaction;
import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;
public class ShowSaveDataRoof {


		private String shellAssetId;
		private ShellTransaction shellTran;
		private ShellRoofTransaction shellRoofTransaction;
		public String showSaveData()
		{
			Session session=null;
			session=HibernateConfig.getSession();
			Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
			try
			{
				shellTran= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
				shellRoofTransaction=(ShellRoofTransaction) session.get(ShellRoofTransaction.class, shellAssetIdAsInt);
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
		public ShellRoofTransaction getShellRoofTransaction() {
			return shellRoofTransaction;
		}
		public void setShellRoofTransaction(ShellRoofTransaction shellRoofTransaction) {
			this.shellRoofTransaction = shellRoofTransaction;
		}
									


}
