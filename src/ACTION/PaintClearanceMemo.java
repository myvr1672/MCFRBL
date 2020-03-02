package ACTION;
import java.util.Date;
import dao.DaoPaintProduction;
import org.hibernate.Session;

import beans.PaintTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class PaintClearanceMemo {
	private String paintAssetId;
    
    private String docNoQualityClearance;
    private String testingClearanceMemoDate;
    private String testingClearanceMemoStatus;
    private String testingClearanceMemoRemark;
	
    
    public String saveClearance()
	{
  Integer paintAssetIdAsInt=Integer.parseInt(paintAssetId);
  Session session=null;
  session=HibernateConfig.getSession();
  PaintTransaction paintTransaction= (PaintTransaction) session.get(PaintTransaction.class,paintAssetIdAsInt);
 
 
  paintTransaction.setTestingClearanceMemoDocNo(docNoQualityClearance);
  if(!"".equals(testingClearanceMemoDate))
  {
  paintTransaction.setTestingClearanceMemoDate(DateUtil.convertToDate(testingClearanceMemoDate));
  }
  else
  {
	  paintTransaction.setTestingClearanceMemoDate(new Date());
  }
  paintTransaction.setTestingClearanceMemoStatus(testingClearanceMemoStatus);
  paintTransaction.setTestingClearanceMemoRemark(testingClearanceMemoRemark);
  paintTransaction.setTestingClearanceMemoFlag(1);
 
  
     try
     {
    	 DaoPaintProduction dao= new DaoPaintProduction();
    	 dao.updatePaintProgress(paintTransaction);
    	
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


	public String getPaintAssetId() {
		return paintAssetId;
	}


	public void setPaintAssetId(String paintAssetId) {
		this.paintAssetId = paintAssetId;
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
