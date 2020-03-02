package common;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.ShellTransaction;
import hibernateConnect.HibernateConfig;

public class ShellNoinPaintShop {
	private Integer shellAssetId;
	private String shellNo;
	
	private Session session;

	public String getShellNoinPainSHop()
	{
		session = HibernateConfig.getSession();
		try {
			
			

			
			Criteria cr1 = session.createCriteria(ShellTransaction.class);
			
			cr1.add(Restrictions.eq("shellAssetId", shellAssetId));
			
			ShellTransaction shellTransaction = (ShellTransaction)cr1.list().get(0);
			shellNo=shellTransaction.getShellNumber();
			
		} catch (Exception e) {
			
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		
		return "success";
	}

	public Integer getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getShellNo() {
		return shellNo;
	}

	public void setShellNo(String shellNo) {
		this.shellNo = shellNo;
	}
	
}
