package ACTION;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;


public class Details {
	private String furnishingNo;
	private List<String> stageDescList;
	private List<String> remark;
	private List<String> testingEndDateList;
	private List<String> testingStartDateList;
	private String testingstatus;
	
	
	
	@SuppressWarnings("unchecked")
	public String getStageDetails()
	{     List<Object[]> results;
		Session session =  null;
	
		/*HttpSession session_http = ServletActionContext.getRequest().getSession(true);*/
		session = HibernateConfig.getSession();
		String hql="SELECT   C.furnishing_no,  J.substage_description, K.testing_status, K.testing_start_date,K.testing_end_date,K.remark from furnishing_tran A,shell_tran B,paint_tran C,furnishing_stage_master J,testing_mobile_clearance K where A.shell_asset_id  = B.shell_asset_id and B.shell_asset_id= C.shell_asset_id and C.coach_type=J.coach_type and J.substage_id=K.substage_id and A.furnishing_asset_id=K.furnishing_asset_id  and A.assembly_dispatch_date is null and (K.testing_status ='ok')and C.furnishing_no ='"+furnishingNo+"'order by A.furnishing_asset_id";
			Query query = session.createSQLQuery(hql);
			 results = query.list();
			 stageDescList=new ArrayList<String>();
			 testingStartDateList=new ArrayList<String>();
			 testingEndDateList=new ArrayList<String>();
			 remark=new ArrayList<String>();
			 for(Object[] s:results)
				{
					String description=s[1].toString();
					String teststart=s[3].toString();
					String enddate=s[4].toString();
			        stageDescList.add(description);
			        testingStartDateList.add(teststart);
			        testingEndDateList.add(enddate);
			        Object rem=s[5];
			        if(rem=="")
			        {
			        	remark.add("NA");
			        }
			        else
			        {
			        	String remarks=s[5].toString();
			        	remark.add(remarks);
			        }
				}
				
			return "success";
		}
		


	public String getFurnishingNo() {
		return furnishingNo;
	}


	public void setFurnishingNo(String furnishingNo) {
		this.furnishingNo = furnishingNo;
	}

	
	public List<String> getRemark() {
		return remark;
	}



	public void setRemark(List<String> remark) {
		this.remark = remark;
	}
	



	
  public List<String> getTestingEndDateList() {
		return testingEndDateList;
	}



	public void setTestingEndDateList(List<String> testingEndDateList) {
		this.testingEndDateList = testingEndDateList;
	}



	public List<String> getTestingStartDateList() {
		return testingStartDateList;
	}



	public void setTestingStartDateList(List<String> testingStartDateList) {
		this.testingStartDateList = testingStartDateList;
	}



public String getTestingstatus() {
		return testingstatus;
	}



	public void setTestingstatus(String testingstatus) {
		this.testingstatus = testingstatus;
	}



	public List<String> getStageDescList() {
		return stageDescList;
	}



	public void setStageDescList(List<String> stageDescList) {
		this.stageDescList = stageDescList;
	}
}
