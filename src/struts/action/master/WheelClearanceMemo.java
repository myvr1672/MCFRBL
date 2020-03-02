package struts.action.master;
import dao.DaoWheelAxleSip;
import org.hibernate.Session;
import beans.WheelsetTransaction;
import common.DateUtil;
import beans.WheelSipTransaction;
import hibernateConnect.HibernateConfig;

public class WheelClearanceMemo {
	    private String wheelsetAssetId;
		private String docNoQualityClearance;
		private String testingClearanceMemoDate;
		private String testingClearanceMemoStatus;
		private String testingClearanceMemoRemark;
	public String saveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
	Integer	wheelsetAssetIdAsInt=Integer.parseInt(wheelsetAssetId);
	WheelsetTransaction wheelsetTransaction= (WheelsetTransaction) session.get(WheelsetTransaction.class, wheelsetAssetIdAsInt);
	wheelsetTransaction.setTestingClearanceMemoDate(DateUtil.convertToDate(testingClearanceMemoDate));
	wheelsetTransaction.setTestingClearanceMemoStatus(testingClearanceMemoStatus);
	wheelsetTransaction.setTestingClearanceMemoRemark(testingClearanceMemoRemark);
	wheelsetTransaction.setTestingClearanceMemoFlag(1);
	
	WheelSipTransaction wheelSipTransaction= (WheelSipTransaction) session.get(WheelSipTransaction.class, wheelsetAssetIdAsInt);
	wheelSipTransaction.setDocNoQualityClearance(docNoQualityClearance);
	DaoWheelAxleSip dao= new DaoWheelAxleSip();
	dao.update(wheelsetTransaction, wheelSipTransaction);
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
			
		}
	}
	public String getWheelsetAssetId() {
		return wheelsetAssetId;
	}
	public void setWheelsetAssetId(String wheelsetAssetId) {
		this.wheelsetAssetId = wheelsetAssetId;
	}
	public String getDocNoQualityClearance() {
		return docNoQualityClearance;
	}
	public void setDocNoQualityClearance(String docNoQualityClearance) {
		this.docNoQualityClearance = docNoQualityClearance;
	}
	public String getTestingClearanceMemoDate() {
		return testingClearanceMemoDate;
	}
	public void setTestingClearanceMemoDate(String testingClearanceMemoDate) {
		this.testingClearanceMemoDate = testingClearanceMemoDate;
	}
	public String getTestingClearanceMemoStatus() {
		return testingClearanceMemoStatus;
	}
	public void setTestingClearanceMemoStatus(String testingClearanceMemoStatus) {
		this.testingClearanceMemoStatus = testingClearanceMemoStatus;
	}
	public String getTestingClearanceMemoRemark() {
		return testingClearanceMemoRemark;
	}
	public void setTestingClearanceMemoRemark(String testingClearanceMemoRemark) {
		this.testingClearanceMemoRemark = testingClearanceMemoRemark;
	}

}
