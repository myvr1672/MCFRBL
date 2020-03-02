package dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import beans.FurnishingStageMaster;
import beans.TestingMobileClearance;
import hibernateConnect.HibernateConfig;
import model.User;
import javax.servlet.http.*;

public class DaoFurnishingShow {
	public DaoFurnishingShow() {
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getCoaches()
	{
		User loginUser = null;
		Session session =  null;
		List<Object[]> results = null;
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		String username = (String) session_http.getAttribute("userid");
		session = HibernateConfig.getSession();
		loginUser = (User)session.get(User.class,username.trim());
		String roles=null;
		roles=	loginUser.getRoles();
		roles=roles.replaceAll(", ", "','");
		String hql=null;
		if(roles.equalsIgnoreCase("All"))
		{
			hql="SELECT  A.furnishing_asset_id,  B.shell_no, C.furnishing_no, C.coach_type,J.substage_id, J.substage_description,J.previous_stage_id, J.next_stage_id,J.stage_sequence, K.testing_status, K.remark, K.notification_stage, K.testing_start_date,K.testing_end_date,K.testing_failed_date "+
							"from furnishing_tran A,shell_tran B,paint_tran C,furnishing_stage_master J,testing_mobile_clearance K "+
							"where A.shell_asset_id  = B.shell_asset_id and B.shell_asset_id= C.shell_asset_id and C.coach_type=J.coach_type and J.substage_id=K.substage_id and A.furnishing_asset_id=K.furnishing_asset_id  and A.assembly_dispatch_date is null and (K.testing_status !='ok' or K.testing_status IS NULL)"+
							"order by A.furnishing_asset_id, K.substage_id";
			
		}
		else
		{
			 hql="SELECT  A.furnishing_asset_id,  B.shell_no, C.furnishing_no, C.coach_type,J.substage_id, J.substage_description,J.previous_stage_id, J.next_stage_id,J.stage_sequence, K.testing_status, K.remark, K.notification_stage, K.testing_start_date,K.testing_end_date,K.testing_failed_date "+
					"from furnishing_tran A,shell_tran B,paint_tran C,furnishing_stage_master J,testing_mobile_clearance K "+
					"where A.shell_asset_id  = B.shell_asset_id and B.shell_asset_id= C.shell_asset_id and C.coach_type=J.coach_type and J.substage_id=K.substage_id and A.furnishing_asset_id=K.furnishing_asset_id  and K.substage_id in ('"+roles+"') A.assembly_dispatch_date is null and (K.testing_status !='ok' or K.testing_status IS NULL)"+
					"order by A.furnishing_asset_id, K.substage_id";	
		}
		Query query = session.createSQLQuery(hql);
		 results = query.list();
		return results ;
	}
	public void updateData(TestingMobileClearance testingClearance) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			System.out.println("updation of row");
			//session.saveOrUpdate(intrPaintFinalSipTran);
			session.update(testingClearance);
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}
	
	
	public void updateData(TestingMobileClearance testingClearance, List<TestingMobileClearance> testingClearanceList) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			System.out.println("updation of row");
			//session.saveOrUpdate(intrPaintFinalSipTran);
			session.update(testingClearance);
			if(testingClearanceList!=null){
			for(TestingMobileClearance tmc:testingClearanceList)
			{
			session.saveOrUpdate(tmc);
			}
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
		
	}
	//to create new record in db 15/01/2020

	public List<FurnishingStageMaster> getAllStages(Integer furnishingAssetId ,String stageId,String coach,String nextId) {
		Session session =  null;
		List<FurnishingStageMaster> list = null;
		session = HibernateConfig.getSession();
		try{
			 String delimiter = ",";
			 String next=nextId.replaceAll("\\s+","");
	         String nextStages[]=next.split(delimiter);
	         String coachType=coach.replaceAll("\\s+","");
	         Criteria cr1=null;
	         List<TestingMobileClearance> testingClearanceList= new ArrayList <TestingMobileClearance>();
	         if(!nextId.equalsIgnoreCase("END"))
	         {
	        	 for(int i=0;i<nextStages.length;i++)
		         {
		        	String subStageDesc=null;
		        	FurnishingStageMaster furn= new FurnishingStageMaster();
		        	  cr1= session.createCriteria(FurnishingStageMaster.class);
		        	 cr1.add(Restrictions.eq("coachType",coachType));
		 			 cr1.add(Restrictions.eq("substageId",nextStages[i]));
		 			 
		 			 System.out.println(nextStages[i]+coachType);
		 			furn=(FurnishingStageMaster)cr1.list().get(0);
		 			 
		 			 
		 			 subStageDesc=furn.getSubstageDescription();
		 	 		 System.out.println(subStageDesc);
		 	 		 String previous=furn.getPreviousStageId();
		 	 		 String prev=previous.replaceAll("\\s+","");
					 String previousStages[]=prev.split(delimiter);
					 System.out.println("Stage Description "+prev);
					 boolean testingstatus=subtest (previousStages,furnishingAssetId);
			         if(testingstatus )
			         	{
			        	 
			        	 	TestingMobileClearance testingClearance=new TestingMobileClearance();
			        	 	System.out.println("substage description"+subStageDesc+"next stage"+nextStages[i]);
			        	 	testingClearance.setFurnishingAssetId(furnishingAssetId);
			        	 	testingClearance.setSubstageId(nextStages[i]);
			        	 	testingClearance.setSubstageDescription(subStageDesc);
			        	 	testingClearance.setNotificationStage("00");
			        	 	testingClearance.setTestingStatus("not_ok");
			        	 	testingClearance.setTestingStartDate(new Date());
			        	 	testingClearanceList.add(testingClearance);
			        	 	}
		         }
		        
		         	insertRow(testingClearanceList);  
		        
	         }
	         
			
		}catch(Exception ex){
			System.out.println("catch for next stages");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		return list;
	}
	@SuppressWarnings("unused")
	public boolean subtest(String previousStages[] ,Integer furnishingAssetId){
		Session session =  null;
		
	try{	
		//System.out.println("subtest method");
			session = HibernateConfig.getSession();
			if(previousStages.length==0 || previousStages[0].equalsIgnoreCase("START"))
			{
				return true;
			}
			else
			{
				for(int j=0;j<previousStages.length;j++){
					session = HibernateConfig.getSession();
					Criteria cr2=session.createCriteria(TestingMobileClearance.class);
					cr2.add(Restrictions.eq("furnishingAssetId", furnishingAssetId));
					cr2.add(Restrictions.eq("substageId", previousStages[j]));
					
					TestingMobileClearance test= (TestingMobileClearance) cr2.list().get(0);
		        	String subtest=test.getTestingStatus();
		        	//System.out.println(subtest+previousStages[j]);
		        	if(!subtest.equals("ok")){
		        		return false;
		        	}
		        	
		       return true;
			}
          
        }	       
                                            		       
	}
	
    	 
	catch(Exception ex){
		
		ex.printStackTrace();
	}finally{
		if(session!= null){
			
			session.close();
		}			
	}
	return true;
	}
		
		
	public void insertRow(List<TestingMobileClearance> testingClearanceList) {
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			for(TestingMobileClearance tmc:testingClearanceList)
			{
			session.saveOrUpdate(tmc);
			
			System.out.println("insertion of new row");
			}
			tx.commit();
		}
		catch(Exception ex)
		{
			System.out.println("catch exception insert row");
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}

	public void updateData(TestingMobileClearance testingClearance, Integer furnishingAssetId, String stageId, String coach, String nextId) {
	
		Session session=null;
		Transaction tx=null;
		session= HibernateConfig.getSession();
		tx=session.beginTransaction();
		try
		{
			System.out.println("updation of row");
			//session.saveOrUpdate(intrPaintFinalSipTran);
			session.update(testingClearance);
			
			 String delimiter = ",";
			 String next=nextId.replaceAll("\\s+","");
	         String nextStages[]=next.split(delimiter);
	         String coachType=coach.replaceAll("\\s+","");
	         Criteria cr1=null;
	         List<TestingMobileClearance> testingClearanceList= new ArrayList <TestingMobileClearance>();
	         if(!nextId.equalsIgnoreCase("END"))
	         {
	        	 for(int i=0;i<nextStages.length;i++)
		         {
		        	String subStageDesc=null;
		        	FurnishingStageMaster furn= new FurnishingStageMaster();
		        	  cr1= session.createCriteria(FurnishingStageMaster.class);
		        	 cr1.add(Restrictions.eq("coachType",coachType));
		 			 cr1.add(Restrictions.eq("substageId",nextStages[i]));
		 			 
		 			 System.out.println(nextStages[i]+coachType);
		 			furn=(FurnishingStageMaster)cr1.list().get(0);
		 			 
		 			 
		 			 subStageDesc=furn.getSubstageDescription();
		 	 		 System.out.println(subStageDesc);
		 	 		 String previous=furn.getPreviousStageId();
		 	 		 String prev=previous.replaceAll("\\s+","");
					 String previousStages[]=prev.split(delimiter);
					 System.out.println("Stage Description "+prev);
					 boolean testingstatus=subtest (previousStages,furnishingAssetId);
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
		        
		         	insertRow(testingClearanceList);  
		        
	         }
			
			
			
			
			
			
			tx.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			tx.rollback();
		}
		finally {
			if(session!=null)
			{
				session.close();
			}
		}
		
	}


	
}

