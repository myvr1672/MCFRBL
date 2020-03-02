   package struts.action.master;	
	import org.hibernate.Session;


	

	import beans.BuffercbcheightTestingTransaction;
	import hibernateConnect.HibernateConfig;

	   public class  Showsavedataofbuffercbcheight{
		private String furnishingAssetId;
		
		private  BuffercbcheightTestingTransaction buffercbcheightTestingTransaction;
		
		
		public String showsavedata()
		{
			System.out.println("Inside showsave data1");
			Session session=null;
			session=HibernateConfig.getSession();
			Integer furnishingAssetIdasint=Integer.parseInt(furnishingAssetId);
			try
			{
				System.out.println("Inside showsave data2");
				
				buffercbcheightTestingTransaction=(BuffercbcheightTestingTransaction) session.get(BuffercbcheightTestingTransaction.class, furnishingAssetIdasint);
				
				
				
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


		public String getFurnishingAssetId() {
			return furnishingAssetId;
		}


		public void setFurnishingAssetId(String furnishingAssetId) {
			this.furnishingAssetId = furnishingAssetId;
		}


		public BuffercbcheightTestingTransaction getBuffercbcheightTestingTransaction() {
			return buffercbcheightTestingTransaction;
		}


		public void setBuffercbcheightTestingTransaction(BuffercbcheightTestingTransaction buffercbcheightTestingTransaction) {
			this.buffercbcheightTestingTransaction = buffercbcheightTestingTransaction;
		}
                         

			   }