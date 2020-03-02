package ACTION;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;


public class Interval {
	private String testingStartDate;
	private String testingEndDate;
	public List<Object[]> results;
	private List<String>furnshingnumberList;
	private List<String>descriptionList ;
	private List<String>testingstatusList;
	private List<String> teststartdateList;
	private List<String> testenddateList;
	private List<String>remarkList;
	
	public List<String> getTeststartdateList() {
	return teststartdateList;
	}
	public void setTeststartdateList(List<String> teststartdateList) {
		this.teststartdateList = teststartdateList;
	}
	public List<String> getTestenddateList() {
		return testenddateList;
	}
	public void setTestenddateList(List<String> testenddateList) {
		this.testenddateList = testenddateList;
	}


public List<String> getRemarkList() {
		return remarkList;
	}
	public void setRemarkList(List<String> remarkList) {
		this.remarkList = remarkList;
	}
public List<String> getFurnshingnumberList() {
		return furnshingnumberList;
	}
	public void setFurnshingnumberList(List<String> furnshingnumberList) {
		this.furnshingnumberList = furnshingnumberList;
	}
	public List<String> getDescriptionList() {
		return descriptionList;
	}
	public void setDescriptionList(List<String> descriptionList) {
		this.descriptionList = descriptionList;
	}
	public List<String> getTestingstatusList() {
		return testingstatusList;
	}
	public void setTestingstatusList(List<String> testingstatusList) {
		this.testingstatusList = testingstatusList;
	}
	

public List<Object[]> getResults() {
		return results;
	}
	public void setResults(List<Object[]> results) {
		this.results = results;
	}
public String getTestingStartDate() {
		return testingStartDate;
	}
public void setTestingStartDate( String testingStartDate) {
		this.testingStartDate = testingStartDate;
	}
public String getTestingEndDate() {
		return testingEndDate;
	}
public void setTestingEndDate(String testingEndDate) {
		this.testingEndDate = testingEndDate;
	}



@SuppressWarnings("unchecked")
public String getintervalDetails(){
	//System.out.println("hello");
	Session session =  null;
	session = HibernateConfig.getSession();
	System.out.println("hello");
	System.out.println(testingStartDate);
	
	String hql="SELECT   C.furnishing_no,  J.substage_description, K.testing_status, K.testing_start_date,K.testing_end_date ,K.remark from furnishing_tran A,shell_tran B,paint_tran C,furnishing_stage_master J,testing_mobile_clearance K where A.shell_asset_id  = B.shell_asset_id and B.shell_asset_id= C.shell_asset_id and C.coach_type=J.coach_type and J.substage_id=K.substage_id and A.furnishing_asset_id=K.furnishing_asset_id  and A.assembly_dispatch_date is null and (K.testing_status ='ok') and  K.testing_start_date>='"+testingStartDate+"' and K.testing_end_date<= '"+testingEndDate+"' order by A.furnishing_asset_id";
		Query query = session.createSQLQuery(hql);
		 results = query.list();
		 furnshingnumberList=new ArrayList<String>();
		 descriptionList=new ArrayList<String>();
		 testingstatusList=new ArrayList<String>();
		 teststartdateList=new ArrayList<String>();
		 testenddateList=new ArrayList<String>();
		 remarkList=new ArrayList<String>();
		 
		 for(Object[] s:results)
			{   String furnshingnumber=s[0].toString();
				String description=s[1].toString();
				//String testingstatus=s[2].toString();
				String teststartdate=s[3].toString();
				String testenddate=s[4].toString();
				furnshingnumberList.add(furnshingnumber);
				descriptionList.add(description);
			
				testingstatusList.add("Completed");
				teststartdateList.add(teststartdate);
				testenddateList.add(testenddate);
				   Object rem=s[5];
				    if(rem==null){
				    	remarkList.add("NULL");
				    }
				    
				    else {
				    	String remarks=s[5].toString();
				    	remarkList.add(remarks);
				    	
				    }
		
           }
		 return "success";
	}

}
