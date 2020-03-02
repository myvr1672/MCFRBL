package struts.action.master;
import beans.WheelsetTransaction;
import hibernateConnect.HibernateConfig;

import org.hibernate.Session;

import beans.WheelSipTransaction;
public class ShowExistingDataInSIPWheelAxle {
  private String wheelsetAssetId;
  private WheelsetTransaction wheelsetTransaction;
  private Object wheelSipTransaction;
  
  
  public String showData()
  {
	  Session session=null;
		session=HibernateConfig.getSession();
		Integer wheelsetAssetIdAsInt= Integer.parseInt(wheelsetAssetId);
		wheelsetTransaction= (WheelsetTransaction) session.get(WheelsetTransaction.class, wheelsetAssetIdAsInt);
		wheelSipTransaction =session.get(WheelSipTransaction.class, wheelsetAssetIdAsInt);
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


public String getWheelsetAssetId() {
	return wheelsetAssetId;
}


public void setWheelsetAssetId(String wheelsetAssetId) {
	this.wheelsetAssetId = wheelsetAssetId;
}


public WheelsetTransaction getWheelsetTransaction() {
	return wheelsetTransaction;
}


public void setWheelsetTransaction(WheelsetTransaction wheelsetTransaction) {
	this.wheelsetTransaction = wheelsetTransaction;
}


public Object getWheelSipTransaction() {
	return wheelSipTransaction;
}


public void setWheelSipTransaction(Object wheelSipTransaction) {
	this.wheelSipTransaction = wheelSipTransaction;
}
  
}
