package ACTION;
import java.util.ArrayList;
import java.util.List;

import beans.JobActivityMaster;

import dao.JobActivityDao;
public class GetActivityBysubSection {
	List<JobActivityMaster>  activityList= new ArrayList<JobActivityMaster>();
	  String shop;
	
	
	public String getActivity()
	{
		 try
		  {
			 JobActivityDao   jobActivityDao= new JobActivityDao();
			activityList=jobActivityDao.getActivityBySubSection(shop);
		  }
		  catch(Exception e){
			  e.printStackTrace();
			  return null;
		  }
	  
	  return "success";
}


	public List<JobActivityMaster> getActivityList() {
		return activityList;
	}


	public void setActivityList(List<JobActivityMaster> activityList) {
		this.activityList = activityList;
	}


	public String getShop() {
		return shop;
	}


	public void setShop(String shop) {
		this.shop = shop;
	}


}
