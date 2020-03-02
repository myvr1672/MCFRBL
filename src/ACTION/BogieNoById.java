package ACTION;

import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import beans.BogiesetTransaction;

import hibernateConnect.HibernateConfig;

public class BogieNoById {
	private Map<Integer,String> bogieNumberListForStatic;
	private Map<Integer,String> bogieNumberListForFinal;
	
	public String getBogieNo()
	{
		Session session =  null;
		
		session = HibernateConfig.getSession();
		try
		{
		session.beginTransaction();
		//retrieve bogieNumberListForStatic 
		Criteria cr = session.createCriteria(BogiesetTransaction.class);
		cr.add(Restrictions.eq("staticSipBogieFlag", 1));
		cr.addOrder(Order.asc("bogieNumber"));
	    List<BogiesetTransaction> bogieList= cr.list();
	    for(BogiesetTransaction b:bogieList)
	    {
	    	bogieNumberListForStatic.put(b.getBogieAssetId(), b.getBogieNumber());
	    }
	    
	     //retrieve bogieNumberListForFinal 
	    Criteria cr1 = session.createCriteria(BogiesetTransaction.class);
		cr1.add(Restrictions.eq("sipFinalFlag", 1));
		cr1.addOrder(Order.asc("bogieNumber"));
	    List<BogiesetTransaction> bogieListFinal= cr1.list();
	    for(BogiesetTransaction b:bogieListFinal)
	    {
	    	bogieNumberListForFinal.put(b.getBogieAssetId(), b.getBogieNumber());
	    }
	  
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		
		return "success";
	}

	public Map<Integer, String> getBogieNumberListForStatic() {
		return bogieNumberListForStatic;
	}

	public void setBogieNumberListForStatic(Map<Integer, String> bogieNumberListForStatic) {
		this.bogieNumberListForStatic = bogieNumberListForStatic;
	}

	public Map<Integer, String> getBogieNumberListForFinal() {
		return bogieNumberListForFinal;
	}

	public void setBogieNumberListForFinal(Map<Integer, String> bogieNumberListForFinal) {
		this.bogieNumberListForFinal = bogieNumberListForFinal;
	}
	
}
