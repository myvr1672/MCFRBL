package struts.action.master;

import org.hibernate.Session;
import beans.BogiesetTransaction;
import common.DateUtil;
import dao.DaoBogieProduction;
import hibernateConnect.HibernateConfig;

public class BogieClearanceMemo {

	private String bogieAssetId;
	private String docNoQualityClearance;
	private String testingClearanceMemoDate;
	private String testingClearanceMemoStatus;
	private String testingClearanceMemoRemark;
	
	public String saveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
	Integer	bogieAssetIdAsInt=Integer.parseInt(bogieAssetId);
	BogiesetTransaction bogiesetTransaction= (BogiesetTransaction) session.get(BogiesetTransaction.class, bogieAssetIdAsInt);
	bogiesetTransaction.setTestingClearanceMemoDate(DateUtil.convertToDate(testingClearanceMemoDate));
	bogiesetTransaction.setTestingClearanceMemoDocNo(docNoQualityClearance);
	bogiesetTransaction.setTestingClearanceMemoStatus(testingClearanceMemoStatus);
	bogiesetTransaction.setTestingClearanceMemoRemark(testingClearanceMemoRemark);
	bogiesetTransaction.setTestingClearanceMemoFlag(1);
	DaoBogieProduction dao= new DaoBogieProduction();
	dao.updateBogieProgress(bogiesetTransaction);
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

	public String getBogieAssetId() {
		return bogieAssetId;
	}

	public void setBogieAssetId(String bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
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
