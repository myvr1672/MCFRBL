package ACTION;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import beans.FurnishingStageMaster;
import beans.TestingMobileClearance;
import dao.DaoFurnishingShow;
import hibernateConnect.HibernateConfig;

public class SaveTestingClearance {
private Integer furnishingAssetId;
private String stageId;
private String remark;
private String status;
private String previousId;
private String nextId;
private String testingStatus;
private String testingEndDate;
private String testingFailedDate;
private String notificationStageId;
private String coachType;
private String substageDescription;




public String saveData()
{
	Session session=null;
	session=HibernateConfig.getSession();
	System.out.println("save testing clearance page");
	System.out.println(status);
	
	try
	{
		
	if(status.equalsIgnoreCase("ok"))
	{
		System.out.println("update testing status and end date");
		System.out.println("fai:"+furnishingAssetId+" testingstatus:"+testingStatus+" radiobtn:"+status+" testingenddate:"+testingEndDate+" nextstageId:"+nextId+" previousstageId:"+previousId);
		// update first row
		System.out.println("Stage id"+ stageId);
		TestingMobileClearance testingClearance=new TestingMobileClearance();
		Criteria cr=session.createCriteria(TestingMobileClearance.class);
		cr.add(Restrictions.eq("furnishingAssetId",furnishingAssetId));
		cr.add(Restrictions.eq("substageId",stageId));
		
		testingClearance=(TestingMobileClearance)cr.list().get(0);
		testingClearance.setTestingStatus("ok");
		testingClearance.setRemark(remark);
		testingClearance.setTestingEndDate(new Date());    
		// end of code for update first row
		// create next row
			 String delimiter = ",";
			 String next=nextId.replaceAll("\\s+","");
	         String nextStages[]=next.split(delimiter);
	         String coachType1=coachType.trim();
	        
	         List<TestingMobileClearance> testingClearanceList= new ArrayList <TestingMobileClearance>();
	         if(!nextId.equalsIgnoreCase("END"))
	         {
	        	 
	        	 for(int i=0;i<nextStages.length;i++)
		         {
	        		 
		        	String subStageDesc=null;
		        	FurnishingStageMaster furn= new FurnishingStageMaster();
		        	Criteria  cr1= session.createCriteria(FurnishingStageMaster.class);
		        	
		        	 cr1.add(Restrictions.eq("coachType",coachType1));
		 			 cr1.add(Restrictions.eq("substageId",nextStages[i]));
		 			 
		 			 System.out.println("Next Stage "+nextStages[i]+"COACH TYPE : " +coachType1);
		 			furn=(FurnishingStageMaster)cr1.list().get(0);
		 			 System.out.println("hi navin");
		 			 
		 			 subStageDesc=furn.getSubstageDescription();
		 	 		 System.out.println(subStageDesc);
		 	 		 String previous=furn.getPreviousStageId();
		 	 		 String prev=previous.replaceAll("\\s+","");
					 String previousStages[]=prev.split(delimiter);
					 System.out.println("Stage Description "+prev);
					 boolean testingstatus=subtest(previousStages,furnishingAssetId,stageId);
			         if(testingstatus )
			         	{
			        	 
			        	 	TestingMobileClearance testingClr=new TestingMobileClearance();
			        	 	System.out.println("substage description"+subStageDesc+"next stage"+nextStages[i]);
			        	 	testingClr.setFurnishingAssetId(furnishingAssetId);
			        	 	testingClr.setSubstageId(nextStages[i]);
			        	 	testingClr.setSubstageDescription(subStageDesc);
			        	 	testingClr.setNotificationStage("00");
			        	 	testingClr.setTestingStatus("not_ok");
			        	 	testingClr.setTestingStartDate(new Date());
			        	 	testingClearanceList.add(testingClr);
			        	 	}
		         }
		        
		         	
		        
	         }
			
		
			DaoFurnishingShow dao=new DaoFurnishingShow();
			dao.updateData(testingClearance, testingClearanceList);
			//dao.getAllStages(furnishingAssetId,stageId,coachType,nextId);
			//dao.updateData(testingClearance, furnishingAssetId, stageId,coachType,nextId);
			
			
		}
		
	
	 if(status.equalsIgnoreCase("running"))
	{
		 
		Criteria cr1=session.createCriteria(TestingMobileClearance.class);
	    cr1.add(Restrictions.eq("furnishingAssetId", furnishingAssetId));
	    cr1.add(Restrictions.eq("substageId", stageId));
	    TestingMobileClearance trestingClearance= new TestingMobileClearance();
	    trestingClearance=(TestingMobileClearance) cr1.list().get(0);
	    trestingClearance.setRemark(remark);
	    trestingClearance.setTestingStatus("running");
	    DaoFurnishingShow dao=new DaoFurnishingShow();
		dao.updateData(trestingClearance);
	    
     
		
	} 
	 if(status.equalsIgnoreCase("failed"))
	{ 
		 System.out.println("Coach Type= "+coachType);
		 System.out.println("Notification Stage= "+notificationStageId);
		 System.out.println("Furnishing Id= "+furnishingAssetId);
		 System.out.println("Satge Id="+stageId);
		 System.out.println("Remark="+remark);
		 notificationStageId=notificationStageId.trim();
		 
		 
		
		 
		    
		  //  furnish=(FurnishingStageMaster)cr1.list().get(0);
		   // notificationStageId=furnish.getSubstageId();
		   // System.out.println(notificationStageId);
		    
		Criteria cr=session.createCriteria(TestingMobileClearance.class);
	    cr.add(Restrictions.eq("furnishingAssetId", furnishingAssetId));
	    cr.add(Restrictions.eq("substageId", stageId));
	    TestingMobileClearance trestingClearance= new TestingMobileClearance();
	    trestingClearance=(TestingMobileClearance) cr.list().get(0);
	    trestingClearance.setTestingStatus("failed");
	    trestingClearance.setNotificationStage(notificationStageId);
	    trestingClearance.setRemark(remark);
	    trestingClearance.setTestingFailedDate(new Date());
	    DaoFurnishingShow dao=new DaoFurnishingShow();
	    dao.updateData(trestingClearance);
	    System.out.println("failed wala");
	    System.out.println(furnishingAssetId+notificationStageId+notificationStageId+stageId);
	  
	}
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
public boolean subtest(String previousStages[] ,Integer furnishingAssetId, String stageid)
{
	Session session1 =  null;
	
try{	
	//System.out.println("subtest method");
	session1 = HibernateConfig.getSession();
		if(previousStages.length==0 || previousStages[0].equalsIgnoreCase("START"))
		{
			return true;
		}
		else
		{
			for (String previousStage : previousStages) {
                  if(previousStage.equals(stageid))
                  {
                	  return true;
                  }
                  else
                  {
				Criteria cr2=session1.createCriteria(TestingMobileClearance.class);
				cr2.add(Restrictions.eq("furnishingAssetId", furnishingAssetId));
				cr2.add(Restrictions.eq("substageId", previousStage));
				
				TestingMobileClearance test= (TestingMobileClearance) cr2.list().get(0);
	        	String subtest=test.getTestingStatus();
	        	//System.out.println(subtest+previousStages[j]);
	        	if(!subtest.equals("ok")){
	        		return false;
	        	}
                 }
	        	
	       return true;
		}
      
    }	       
                                        		       
}

	 
catch(Exception ex){
	
	ex.printStackTrace();
}finally{
	if(session1!= null){
		
		session1.close();
	}			
}
return true;
}




public String getNotificationStageId() {
	return notificationStageId;
}
public void setNotificationStageId(String notificationStageId) {
	this.notificationStageId = notificationStageId;
}
public String getTestingEndDate() {
	return testingEndDate;
}


public void setTestingEndDate(String testingEndDate) {
	this.testingEndDate = testingEndDate;
}

public String getPreviousId() {
	return previousId;
}



public void setPreviousId(String previousId) {
	this.previousId = previousId;
}



public String getNextId() {
	return nextId;
}



public void setNextId(String nextId) {
	this.nextId = nextId;
}



public String getTestingStatus() {
	return testingStatus;
}



public void setTestingStatus(String testingStatus) {
	this.testingStatus = testingStatus;
}



public Integer getFurnishingAssetId() {
	return furnishingAssetId;
}


public void setFurnishingAssetId(Integer furnishingAssetId) {
	this.furnishingAssetId = furnishingAssetId;
}




public String getStageId() {
	return stageId;
}



public void setStageId(String stageId) {
	this.stageId = stageId;
}



public String getRemark() {
	return remark;
}



public void setRemark(String remark) {
	this.remark = remark;
}



public String getStatus() {
	return status;
}



public void setStatus(String status) {
	this.status = status;
}

public String getTestingFailedDate() {
	return testingFailedDate;
}


public void setTestingFailedDate(String testingFailedDate) {
	this.testingFailedDate = testingFailedDate;
}


public String getSubstageDescription() {
	return substageDescription;
}


public void setSubstageDescription(String substageDescription) {
	this.substageDescription = substageDescription;
}


public String getCoachType() {
	return coachType;
}


public void setCoachType(String coachType) {
	this.coachType = coachType;
}

}

