package struts.action.master;

import org.hibernate.Session;
import dao.DaoShellProduction;
import beans.ShellTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class ShellClearanceMemo {
	 private Integer shellAssetId;
	  private String docNoQualityClearance;
	  private String	testingClearanceMemoDate;
	 private String	testingClearanceMemoStatus;
	 private String	testingClearanceMemoRemark;
	
	
	public String saveData()
	{
	Session session=null;
	session=HibernateConfig.getSession();
	ShellTransaction st=new ShellTransaction();
	st=(ShellTransaction) session.get(ShellTransaction.class, shellAssetId);
	st.setTestingClearanceMemoDocNo(docNoQualityClearance);
	if(!"".equals(testingClearanceMemoDate)) {st.setTestingClearanceMemoDate(DateUtil.convertToDate(testingClearanceMemoDate));}
	st.setTestingClearanceMemoStatus(testingClearanceMemoStatus);
	st.setTestingClearanceMemoRemark(testingClearanceMemoRemark);
	st.setTestingClearanceMemoFlag(1);
	try
	{
		DaoShellProduction dao=new DaoShellProduction();
		dao.updateShellProgress(st);
		return "success";
	}
	catch(Exception e)
	{
		e.printStackTrace();
		return null;
	}
	finally
	{
		if(session!=null)
		{
			session.close();
		}
	}
	}


	public Integer getShellAssetId() {
		return shellAssetId;
	}


	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
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
