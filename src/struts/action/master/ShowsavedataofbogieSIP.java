   package struts.action.master;	
	import org.hibernate.Session;


	import beans.BogiesetTransaction;

	import beans.BogieStaticSipTran;
	import hibernateConnect.HibernateConfig;

	   public class  ShowsavedataofbogieSIP{
		private String bogieAssetId;
		private BogiesetTransaction bogiesetTransaction;
		private  BogieStaticSipTran bogieStaticSipTran;
		
		
		public String showsavedata()
		{
			System.out.println("Inside showsave data1");
			Session session=null;
			session=HibernateConfig.getSession();
			Integer bogieAssetIdAsInt=Integer.parseInt(bogieAssetId);
			try
			{
				System.out.println("Inside showsave data2");
				
				bogiesetTransaction=(BogiesetTransaction) session.get(BogiesetTransaction.class, bogieAssetIdAsInt);
				bogieStaticSipTran=(BogieStaticSipTran) session.get(BogieStaticSipTran.class, bogieAssetIdAsInt);
				
				
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


		public String getBogieAssetId() {
			return bogieAssetId;
		}


		public void setBogieAssetId(String bogieAssetId) {
			this.bogieAssetId = bogieAssetId;
		}


		public BogiesetTransaction getBogiesetTransaction() {
			return bogiesetTransaction;
		}


		public void setBogiesetTransaction(BogiesetTransaction bogiesetTransaction) {
			this.bogiesetTransaction = bogiesetTransaction;
		}


		public BogieStaticSipTran getBogieStaticSipTran() {
			return bogieStaticSipTran;
		}


		public void setBogieStaticSipTran(BogieStaticSipTran bogieStaticSipTran) {
			this.bogieStaticSipTran = bogieStaticSipTran;
		}
		
		
	   }