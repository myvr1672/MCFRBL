package common;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;


import org.hibernate.Session;



import beans.BogiesetTransaction;
import hibernateConnect.HibernateConfig;


public class BogieNumById {
	private Integer bogieAssetId;
	private String bogieNo;
	Session session =null;
	public String getBogieDesc()
	{
		session = HibernateConfig.getSession();
		try {
			
			

			
			Criteria cr1 = session.createCriteria(BogiesetTransaction.class);
			
			cr1.add(Restrictions.eq("bogieAssetId", bogieAssetId));
			
			BogiesetTransaction bogiesetTransaction = (BogiesetTransaction)cr1.list().get(0);
			bogieNo=bogiesetTransaction.getBogieNumber();
			
		} catch (Exception e) {
			
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		
		return "success";
	}
	
	public Integer getBogieAssetId() {
		return bogieAssetId;
	}

	public void setBogieAssetId(Integer bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}

	public String getBogieNo() {
		return bogieNo;
	}
	public void setBogieNo(String bogieNo) {
		this.bogieNo = bogieNo;
	}
	
	
	
}
