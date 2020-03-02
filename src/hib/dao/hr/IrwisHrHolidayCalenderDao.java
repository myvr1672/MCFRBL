package hib.dao.hr;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import java.util.List;
import java.util.Map;

//import common.BundleUtility;
import hibernateConnect.HibernateConfig;


import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Projection;

import com.opensymphony.xwork2.ActionContext;

import beans.IrwisHrPltCalidMapM;
import beans.IrwisHrPltCalidMapMId;
import beans.IrwisHrPltLieuCalM;
import beans.IrwisHrPltcalM;
import beans.IrwisHrPubhodyM;


public class IrwisHrHolidayCalenderDao {
	Map session_map=ActionContext.getContext().getSession();
	String  hq_session = (String)session_map.get("hqId");
	String  div_session = (String)session_map.get("divId");
	String  shed_session = (String)session_map.get("shedId");
	Long roleid_session = (Long)session_map.get("roleId");
	//String loco_num[] = (String[])session_map.get("locoArray");
	String  user_session = (String)session_map.get("userId");
	String  org_SlNo = "RBL";
	public static final double HALFDAY = 0.5;
	public static final double FULLDAY = 1.0;
	

	
	public double getCurrentWorkingDaysUptoPositionDateYearly(Date positionDate) {
		 Session session = HibernateConfig.getSession();
		 
		
		 try {
			 Calendar calPositionDate = Calendar.getInstance();   // this takes current date
			 calPositionDate.setTime(positionDate);
			 
			 Calendar c = Calendar.getInstance();   // this takes current date
			 	c.setTime(positionDate);
			    c.set(Calendar.DAY_OF_YEAR, 1);
			    Date startDate = c.getTime();
			    //c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			    Date endDate = positionDate;
			int workingDaysExceptSatSun= calculateDuration(startDate, endDate);
			int totalSatUptoPositionDate=countSaturdaysUptoPositionDateYear(calPositionDate);
			double workingDays;
			
			//workingDays=workingDaysExceptSatSun+(totalSatUptoPositionDate*0.5);
			String pcalId=new String();
			String satType=new String();
		       session.beginTransaction();
		       //fetching cal id for org in session
		       Criteria crit = session.createCriteria(IrwisHrPltCalidMapM.class);
		       Projection projection1 = Projections.property("id.pcalId");
		       Projection projection2 = Projections.property("satType");  
		       
		       ProjectionList p1=Projections.projectionList();
		        // p1.add(Projections.property("id.pcalId"));
		        // p1.add(Projections.property());

		       p1.add(projection1);
		       p1.add(projection2);
		       crit.setProjection(p1);
		       crit.add(Restrictions.eq("id.plant", org_SlNo));
		       if(crit.list().size()!=0)
		       {
			       //List<String> list = (List<String>)crit.list();
			       
			       List<Object[]> rows = crit.list();
				   
				   for(Object[] row : rows){
					   
					   //iohBogieOutTurn.setS_No(row[0].toString());
				   	
					   pcalId=row[0].toString();
					   satType=row[1].toString();
					   
					  
				   }
			       
			       
			       
			       //System.out.println("calid"+list.get(0)+"sattype"+list.get(1));
			      //pcalId=list.get(0);
			      //satType=list.get(1);
			      
		       }
		       
		       if("HALFDAY".equals(satType))
		       {
		    	   workingDays=workingDaysExceptSatSun+(totalSatUptoPositionDate*HALFDAY);   
		       }
		       else if("OFF".equals(satType))
		       {
		    	   workingDays=workingDaysExceptSatSun;
		       }
		       else
		       {
		    	   workingDays=workingDaysExceptSatSun+(totalSatUptoPositionDate*FULLDAY);
		       }
		     //fetching all holiday dates for the month of positionDate
		       List<Date> hodyDateList=new ArrayList<Date>();
		       Criteria critToFetchHodyDates = session.createCriteria(IrwisHrPltcalM.class);
		       
		       critToFetchHodyDates.add(Restrictions.eq("id.pcalId", pcalId));
		       critToFetchHodyDates.add(Restrictions.ge("id.calHodyDate", startDate));
		       critToFetchHodyDates.add(Restrictions.le("id.calHodyDate", endDate));
		       List<IrwisHrPltcalM> irwisHrPltcalMHodyDatesList=critToFetchHodyDates.list();
		       int j=0;
		       if(irwisHrPltcalMHodyDatesList.size()!=0)
		       {
		       for(IrwisHrPltcalM i:irwisHrPltcalMHodyDatesList)
		       {
		    	   hodyDateList.add(i.getId().getCalHodyDate());
		    	   Calendar cHodyDate = Calendar.getInstance();
		    	   cHodyDate.setTime(hodyDateList.get(j));
		    	   int dayOfWeek = cHodyDate.get(Calendar.DAY_OF_WEEK);
		    	   
		    	 //if holiday comes in a working day (Mon to Friday) then we are subtracting 1 from workingDays 
		    	   if(dayOfWeek>=2 && dayOfWeek<=6 )
		    	   {
		    		   workingDays=workingDays-1;
		    	   }
		    	   //if holiday comes in a saturday then we are subtracting 0.5 from workingDays
		    	   else if(dayOfWeek==7)
		    	   {
		    		   if("HALFDAY".equals(satType))
				       {
		    			   workingDays=workingDays-HALFDAY;   
				       }
		    		   else if("OFF".equals(satType))
				       {
		    			   workingDays=workingDays+0;
				       }
				       else
				       {
				    	   workingDays=workingDays-FULLDAY;
				       }
		    		   //workingDays=workingDays-0.5;
		    	   }
		    	       	   
		    	   j++;
		       }
		       }
		       //fetching all lieu dates which falls in the month of positionDate
		       Criteria critToFetchLieuDates = session.createCriteria(IrwisHrPltLieuCalM.class);
		       
		       critToFetchLieuDates.add(Restrictions.eq("id.pcalId", pcalId));
		       critToFetchLieuDates.add(Restrictions.eq("id.plant", org_SlNo));
		       critToFetchLieuDates.add(Restrictions.ge("id.lieuDate", startDate));
		       critToFetchLieuDates.add(Restrictions.le("id.lieuDate", endDate));
		       List<IrwisHrPltLieuCalM> irwisHrPltLieuCalMLieuDatesList=critToFetchLieuDates.list();
		       
		           
		       int k=0;
		       if(irwisHrPltLieuCalMLieuDatesList.size()!=0)
		       {
		       for(IrwisHrPltLieuCalM i:irwisHrPltLieuCalMLieuDatesList)
		       {
		    	   
		    	   Calendar cLieuDate = Calendar.getInstance();
		    	   cLieuDate.setTime(i.getId().getLieuDate());
		    	   int dayOfWeek = cLieuDate.get(Calendar.DAY_OF_WEEK);
		    	   
		    	 //if lieu comes in a working day (Mon to Friday) then we are subtracting nothing from workingDays 
		    	   if(dayOfWeek>=2 && dayOfWeek<=6 )
		    	   {
		    		   
		    	   }
		    	   //if holiday comes in a saturday then we are subtracting 0.5 from workingDays
		    	   else if(dayOfWeek==7)
		    	   {
		    		   
		    		   if("HALFDAY".equals(satType))
				       {
		    			   workingDays=workingDays+HALFDAY;   
				       }
		    		   else if("OFF".equals(satType))
				       {
		    			   workingDays=workingDays+1;   
				       }
				       else
				       {
				    	   workingDays=workingDays;
				       }
		    		  // workingDays=workingDays+0.5;
		    	   }
		    	   else if(dayOfWeek==1)
		    	   {
		    		   workingDays=workingDays+1;   
		    	   } 	   
		    	   k++;
		       }
		       }
		       
		       return workingDays;
		       
		   }catch(Exception e){
			   System.out.println("inside getTotalWorkingDaysOfMonth of IrwisHrHolidayCalenderDao exception fetching workingDays"+e);
			   return 0;
		   }
		   finally {
		       session.close();
		   }
	}
	
	
	public double getCurrentWorkingDaysUptoPositionDate(Date positionDate) {
		 Session session = HibernateConfig.getSession();
		 
		
		 try {
			 Calendar calPositionDate = Calendar.getInstance();   // this takes current date
			 calPositionDate.setTime(positionDate);
			 
			 Calendar c = Calendar.getInstance();   // this takes current date
			 	c.setTime(positionDate);
			    c.set(Calendar.DAY_OF_MONTH, 1);
			    Date startDate = c.getTime();
			    //c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			    Date endDate = positionDate;
			int workingDaysExceptSatSun= calculateDuration(startDate, endDate);
			int totalSatUptoPositionDate=countSaturdaysUptoPositionDate(c.get(Calendar.YEAR),c.get(Calendar.MONTH),calPositionDate.get(Calendar.DAY_OF_MONTH));
			double workingDays;
			
			//workingDays=workingDaysExceptSatSun+(totalSatUptoPositionDate*0.5);
			String pcalId=new String();
			String satType=new String();
		       session.beginTransaction();
		       //fetching cal id for org in session
		       Criteria crit = session.createCriteria(IrwisHrPltCalidMapM.class);
		       Projection projection1 = Projections.property("id.pcalId");
		       Projection projection2 = Projections.property("satType");  
		       
		       ProjectionList p1=Projections.projectionList();
		        // p1.add(Projections.property("id.pcalId"));
		        // p1.add(Projections.property());

		       p1.add(projection1);
		       p1.add(projection2);
		       crit.setProjection(p1);
		       crit.add(Restrictions.eq("id.plant", org_SlNo));
		       if(crit.list().size()!=0)
		       {
			       //List<String> list = (List<String>)crit.list();
			       
			       List<Object[]> rows = crit.list();
				   
				   for(Object[] row : rows){
					   
					   //iohBogieOutTurn.setS_No(row[0].toString());
				   	
					   pcalId=row[0].toString();
					   satType=row[1].toString();
					   
					  
				   }
			       
			       
			       
			       //System.out.println("calid"+list.get(0)+"sattype"+list.get(1));
			      //pcalId=list.get(0);
			      //satType=list.get(1);
			      
		       }
		       
		       if("HALFDAY".equals(satType))
		       {
		    	   workingDays=workingDaysExceptSatSun+(totalSatUptoPositionDate*HALFDAY);   
		       }
		       else if("OFF".equals(satType))
		       {
		    	   workingDays=workingDaysExceptSatSun;
		       }
		       else
		       {
		    	   workingDays=workingDaysExceptSatSun+(totalSatUptoPositionDate*FULLDAY);
		       }
		     //fetching all holiday dates for the month of positionDate
		       List<Date> hodyDateList=new ArrayList<Date>();
		       Criteria critToFetchHodyDates = session.createCriteria(IrwisHrPltcalM.class);
		       
		       critToFetchHodyDates.add(Restrictions.eq("id.pcalId", pcalId));
		       critToFetchHodyDates.add(Restrictions.ge("id.calHodyDate", startDate));
		       critToFetchHodyDates.add(Restrictions.le("id.calHodyDate", endDate));
		       List<IrwisHrPltcalM> irwisHrPltcalMHodyDatesList=critToFetchHodyDates.list();
		       int j=0;
		       if(irwisHrPltcalMHodyDatesList.size()!=0)
		       {
		       for(IrwisHrPltcalM i:irwisHrPltcalMHodyDatesList)
		       {
		    	   hodyDateList.add(i.getId().getCalHodyDate());
		    	   Calendar cHodyDate = Calendar.getInstance();
		    	   cHodyDate.setTime(hodyDateList.get(j));
		    	   int dayOfWeek = cHodyDate.get(Calendar.DAY_OF_WEEK);
		    	   
		    	 //if holiday comes in a working day (Mon to Friday) then we are subtracting 1 from workingDays 
		    	   if(dayOfWeek>=2 && dayOfWeek<=6 )
		    	   {
		    		   workingDays=workingDays-1;
		    	   }
		    	   //if holiday comes in a saturday then we are subtracting 0.5 from workingDays
		    	   else if(dayOfWeek==7)
		    	   {
		    		   if("HALFDAY".equals(satType))
				       {
		    			   workingDays=workingDays-HALFDAY;   
				       }
		    		   else if("OFF".equals(satType))
				       {
		    			   workingDays=workingDays;   
				       }
				       else
				       {
				    	   workingDays=workingDays-FULLDAY;
				       }
		    		   //workingDays=workingDays-0.5;
		    	   }
		    	       	   
		    	   j++;
		       }
		       }
		       //fetching all lieu dates which falls in the month of positionDate
		       Criteria critToFetchLieuDates = session.createCriteria(IrwisHrPltLieuCalM.class);
		       
		       critToFetchLieuDates.add(Restrictions.eq("id.pcalId", pcalId));
		       critToFetchLieuDates.add(Restrictions.eq("id.plant", org_SlNo));
		       critToFetchLieuDates.add(Restrictions.ge("id.lieuDate", startDate));
		       critToFetchLieuDates.add(Restrictions.le("id.lieuDate", endDate));
		       List<IrwisHrPltLieuCalM> irwisHrPltLieuCalMLieuDatesList=critToFetchLieuDates.list();
		       
		           
		       int k=0;
		       if(irwisHrPltLieuCalMLieuDatesList.size()!=0)
		       {
		       for(IrwisHrPltLieuCalM i:irwisHrPltLieuCalMLieuDatesList)
		       {
		    	   
		    	   Calendar cLieuDate = Calendar.getInstance();
		    	   cLieuDate.setTime(i.getId().getLieuDate());
		    	   int dayOfWeek = cLieuDate.get(Calendar.DAY_OF_WEEK);
		    	   
		    	 //if lieu comes in a working day (Mon to Friday) then we are subtracting nothing from workingDays 
		    	   if(dayOfWeek>=2 && dayOfWeek<=6 )
		    	   {
		    		   
		    	   }
		    	   //if holiday comes in a saturday then we are subtracting 0.5 from workingDays
		    	   else if(dayOfWeek==7)
		    	   {
		    		   
		    		   if("HALFDAY".equals(satType))
				       {
		    			   workingDays=workingDays+HALFDAY;   
				       }
		    		   else if("OFF".equals(satType))
				       {
		    			   workingDays=workingDays+1;   
				       }
				       else
				       {
				    	   workingDays=workingDays;
				       }
		    		  // workingDays=workingDays+0.5;
		    	   }
		    	   else if(dayOfWeek==1)
		    	   {
		    		   workingDays=workingDays+1;   
		    	   }   	   
		    	   k++;
		       }
		       }
		       
		       return workingDays;
		       
		   }catch(Exception e){
			   System.out.println("inside getTotalWorkingDaysOfMonth of IrwisHrHolidayCalenderDao exception fetching workingDays"+e);
			   return 0;
		   }
		   finally {
		       session.close();
		   }
	}
	
	
	
public double getTotalWorkingDaysOfMonth(Date positionDate) {
	 Session session = HibernateConfig.getSession();
	 
	
	 try {
		 Calendar c = Calendar.getInstance();   // this takes current date
		 	c.setTime(positionDate);
		    c.set(Calendar.DAY_OF_MONTH, 1);
		    Date startDate = c.getTime();
		    c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		    Date endDate = c.getTime();
		int workingDaysExceptSatSun= calculateDuration(startDate, endDate);
		int totalSatInMonth=countSaturdaysInMonth(c.get(Calendar.YEAR),c.get(Calendar.MONTH));
		double workingDays;
		//workingDays=workingDaysExceptSatSun+(totalSatInMonth*0.5);
		String pcalId=new String();
		String satType=new String();
	       session.beginTransaction();
	       //fetching cal id for org in session
	       Criteria crit = session.createCriteria(IrwisHrPltCalidMapM.class);
	       Projection projection1 = Projections.property("id.pcalId");
	       Projection projection2 = Projections.property("satType");  
	       
	       ProjectionList p1=Projections.projectionList();
	        // p1.add(Projections.property("id.pcalId"));
	        // p1.add(Projections.property());

	       p1.add(projection1);
	       p1.add(projection2);

	       
	       
	         //ProjectionList p1=Projections.projectionList();
	         //p1.add(Projections.property("id.pcalId"));

	         crit.setProjection(p1);
	       crit.add(Restrictions.eq("id.plant", org_SlNo));
	       if(crit.list().size()!=0)
	       {
		       
	    	   List<Object[]> rows = crit.list();
			   
			   for(Object[] row : rows){
				   
				   //iohBogieOutTurn.setS_No(row[0].toString());
			   	
				   pcalId=row[0].toString();
				   satType=row[1].toString();
				   
				  
			   }
	    	   
	    	   
	    	   //List<String> list = (List<String>)crit.list();
		       //pcalId=list.get(0);
	       }
	       
	       if("HALFDAY".equals(satType))
	       {
	    	   workingDays=workingDaysExceptSatSun+(totalSatInMonth*HALFDAY);   
	       }
	       else if("OFF".equals(satType))
	       {
	    	   workingDays=workingDaysExceptSatSun;   
	       }
	       else
	       {
	    	   workingDays=workingDaysExceptSatSun+(totalSatInMonth*FULLDAY);
	       }
	       
	       
	     //fetching all holiday dates for the month of positionDate
	       List<Date> hodyDateList=new ArrayList<Date>();
	       Criteria critToFetchHodyDates = session.createCriteria(IrwisHrPltcalM.class);
	       
	       critToFetchHodyDates.add(Restrictions.eq("id.pcalId", pcalId));
	       critToFetchHodyDates.add(Restrictions.ge("id.calHodyDate", startDate));
	       critToFetchHodyDates.add(Restrictions.le("id.calHodyDate", endDate));
	       //critToFetchHodyDates.add(Restrictions.eq("calMonthCode", c.get(Calendar.MONTH)+1));
	       //critToFetchHodyDates.add(Restrictions.eq("id.calYr", c.get(Calendar.YEAR)));
	       List<IrwisHrPltcalM> irwisHrPltcalMHodyDatesList=critToFetchHodyDates.list();
	       int j=0;
	       if(irwisHrPltcalMHodyDatesList.size()!=0)
	       {
	       for(IrwisHrPltcalM i:irwisHrPltcalMHodyDatesList)
	       {
	    	   hodyDateList.add(i.getId().getCalHodyDate());
	    	   Calendar cHodyDate = Calendar.getInstance();
	    	   cHodyDate.setTime(hodyDateList.get(j));
	    	   int dayOfWeek = cHodyDate.get(Calendar.DAY_OF_WEEK);
	    	   
	    	 //if holiday comes in a working day (Mon to Friday) then we are subtracting 1 from workingDays 
	    	   if(dayOfWeek>=2 && dayOfWeek<=6 )
	    	   {
	    		   workingDays=workingDays-1;
	    	   }
	    	   //if holiday comes in a saturday then we are subtracting 0.5 from workingDays
	    	   else if(dayOfWeek==7)
	    	   {
	    		  
	    		   if("HALFDAY".equals(satType))
			       {
	    			   workingDays=workingDays-HALFDAY;   
			       }
			       else
			       {
			    	   workingDays=workingDays-FULLDAY;
			       }
	    		   //workingDays=workingDays-0.5;
	    	   }
	    	       	   
	    	   j++;
	       }
	       }
	       //fetching all lieu dates which falls in the month of positionDate
	       Criteria critToFetchLieuDates = session.createCriteria(IrwisHrPltLieuCalM.class);
	       
	       critToFetchLieuDates.add(Restrictions.eq("id.pcalId", pcalId));
	       critToFetchLieuDates.add(Restrictions.eq("id.plant", org_SlNo));
	       critToFetchLieuDates.add(Restrictions.ge("id.lieuDate", startDate));
	       critToFetchLieuDates.add(Restrictions.le("id.lieuDate", endDate));
	       List<IrwisHrPltLieuCalM> irwisHrPltLieuCalMLieuDatesList=critToFetchLieuDates.list();
	                  
	       int k=0;
	       if(irwisHrPltLieuCalMLieuDatesList.size()!=0)
	       {
	       for(IrwisHrPltLieuCalM i:irwisHrPltLieuCalMLieuDatesList)
	       {
	    	   
	    	   Calendar cLieuDate = Calendar.getInstance();
	    	   cLieuDate.setTime(i.getId().getLieuDate());
	    	   int dayOfWeek = cLieuDate.get(Calendar.DAY_OF_WEEK);
	    	   
	    	 //if lieu comes in a working day (Mon to Friday) then we are subtracting nothing from workingDays 
	    	   if(dayOfWeek>=2 && dayOfWeek<=6 )
	    	   {
	    		   if(hodyDateList.contains(cLieuDate))
	    		   {
	    			   workingDays=workingDays+1;   
	    		   }
	    		   else
	    		   {
	    			   workingDays=workingDays;
	    		   }
	    	   }
	    	   //if holiday comes in a saturday then we are subtracting 0.5 from workingDays
	    	   else if(dayOfWeek==7)
	    	   {
	    		   
	    		   if("HALFDAY".equals(satType))
			       {
	    			   workingDays=workingDays+HALFDAY;   
			       }
	    		   if("OFF".equals(satType))
			       {
	    			   workingDays=workingDays+1;   
			       }
			       else
			       {
			    	   workingDays=workingDays;
			       }
	    		   //workingDays=workingDays+0.5;
	    	   }
	    	   else if(dayOfWeek==1)
	    	   {
	    		   workingDays=workingDays+1;   
	    	   }
	    	       	   
	    	   k++;
	       }
	       }
	       
	       return workingDays;
	       
	   }catch(Exception e){
		   System.out.println("inside getTotalWorkingDaysOfMonth of IrwisHrHolidayCalenderDao exception fetching workingDays"+e);
		   return 0;
	   }
	   finally {
	       session.close();
	   }
}
public static int calculateDuration(Date startDate, Date endDate)
{
  Calendar startCal = Calendar.getInstance();
  startCal.setTime(startDate);

  Calendar endCal = Calendar.getInstance();
  endCal.setTime(endDate);

  int workDays = 0;

  if (startCal.getTimeInMillis() > endCal.getTimeInMillis())
  {
    startCal.setTime(endDate);
    endCal.setTime(startDate);
  }

  while (startCal.getTimeInMillis() <= endCal.getTimeInMillis()) {
	    if (startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY &&
	        startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {

	        workDays++;
	    }

	    startCal.add(Calendar.DAY_OF_MONTH, 1);
	}

  return workDays;
}

public int countSaturdaysInMonth(int year, int month) {
    Calendar calendar = Calendar.getInstance();
    // Note that month is 0-based in calendar, bizarrely.
    calendar.set(year, month, 1);
    int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

    int count = 0;
    for (int day = 1; day <= daysInMonth; day++) {
        calendar.set(year, month, day);
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        if (dayOfWeek == Calendar.SATURDAY) {
            count++;
            
        }
    }
    return count;
}
public int countSaturdaysUptoPositionDate(int year, int month, int positionDate) {
    Calendar calendar = Calendar.getInstance();
    // Note that month is 0-based in calendar, bizarrely.
    calendar.set(year, month, 1);
    
    int daysUptoPositionDate=positionDate;
    int count = 0;
    for (int day = 1; day <= daysUptoPositionDate; day++) {
        calendar.set(year, month, day);
        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        if (dayOfWeek == Calendar.SATURDAY) {
            count++;
            
        }
    }
    return count;
}

public int countSaturdaysUptoPositionDateYear(Calendar positionDate) {
    Calendar from = Calendar.getInstance();
    // Note that month is 0-based in calendar, bizarrely.
    from.set(positionDate.get(Calendar.YEAR), 0, 1);
    System.out.println("From Date->"+from.getTime());
    int sat=0;
	while(positionDate.after(from))
    {
    	if(from.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY)
    		sat++;
    	from.add(Calendar.DATE,1);
    	
    }
    
    
    return sat;
}



public boolean isDatePresentInHolidayCalendar(Date d) {
	 Session session = HibernateConfig.getSession();
	 
	
	 try {
		
		String pcalId=new String();
		String satType=new String();
	       session.beginTransaction();
	       //fetching cal id for org in session
	       Criteria crit = session.createCriteria(IrwisHrPltCalidMapM.class);
	       Projection projection1 = Projections.property("id.pcalId");
	       Projection projection2 = Projections.property("satType");  
	       
	       ProjectionList p1=Projections.projectionList();
	   
	       p1.add(projection1);
	       p1.add(projection2);

	       

	         crit.setProjection(p1);
	       crit.add(Restrictions.eq("id.plant", org_SlNo));
	       if(crit.list().size()!=0)
	       {
		       
	    	   List<Object[]> rows = crit.list();
			   
			   for(Object[] row : rows){
				   
	
			   	
				   pcalId=row[0].toString();
				   satType=row[1].toString();
				   
				  
			   }
	    	   
	    	   
	       }
	   
	       Criteria critToFetchHodyDates = session.createCriteria(IrwisHrPltcalM.class);
	       
	       critToFetchHodyDates.add(Restrictions.eq("id.pcalId", pcalId));
	       critToFetchHodyDates.add(Restrictions.eq("id.calHodyDate", d));
	       
	       List<IrwisHrPltcalM> irwisHrPltcalMHodyDatesList=critToFetchHodyDates.list();
	       
	       if(irwisHrPltcalMHodyDatesList.size()==0)
	       {
	      return false;
	       }
	       else 
	       {
	       return true;
	       }
	
	   }catch(Exception e){
		   System.out.println("inside isDatePresentInHolidayCalendar of IrwisHrHolidayCalenderDao exception fetching workingDays"+e);
		   return false;
	   }
	   finally {
	       session.close();
	   }
}

public List<IrwisHrPltcalM> getHolidayDates(String plant, int year) {
	 Session session = HibernateConfig.getSession();
	 
	
	 try {
		 session.beginTransaction();
		 Criteria critToFetchHodyDates = session.createCriteria(IrwisHrPltcalM.class);
	       
	       critToFetchHodyDates.add(Restrictions.eq("id.pcalId", plant));
	       critToFetchHodyDates.add(Restrictions.eq("id.calYr", year));
	      
	       List<IrwisHrPltcalM> irwisHrPltcalMHodyDatesList=critToFetchHodyDates.list();
	       
	       
	       return irwisHrPltcalMHodyDatesList;
	           
	   }catch(Exception e){
		   System.out.println("inside getHolidayDates of IrwisHrHolidayCalenderDao exception fetching getHolidayDates"+e);
		   return null;
	   }
	   finally {
	       session.close();
	   }
}

public String getOrg_SlNo() {
	return org_SlNo;
}



public void setOrg_SlNo(String org_SlNo) {
	this.org_SlNo = org_SlNo;
}



public void createHolidayDate(IrwisHrPltcalM record) {
	Session session = HibernateConfig.getSession();
	 
	
	 try {
		 session.beginTransaction();
		 
		 //IrwisHrPltcalM h=(IrwisHrPltcalM)session.get(IrwisHrPltcalM.class, record.getId());
		 
		 session.save(record);
	     session.getTransaction().commit();  
	       
	     
	           
	   }catch(Exception e){
		   System.out.println("inside createHolidayDate of IrwisHrHolidayCalenderDao exception creating HolidayDates"+e);
		 
	   }
	   finally {
	       session.close();
	   }
}



public List<IrwisHrPubhodyM> getHolidayCodesAndNames() {
	Session session = HibernateConfig.getSession();
	try {
		 session.beginTransaction();
		 Criteria critToFetchHody = session.createCriteria(IrwisHrPubhodyM.class);
	     List<IrwisHrPubhodyM> irwisHrPltcalMHodyDatesList=critToFetchHody.list();
	     return irwisHrPltcalMHodyDatesList;
	           
	   }catch(Exception e){
		   System.out.println("inside getHolidayCodesAndNames of IrwisHrHolidayCalenderDao exception fetching getHolidayCodesAndNames"+e);
		   return null;
	   }
	   finally {
	       session.close();
	   }
}

public List<IrwisHrPubhodyM> getHolidayNameByCode(String holiday_code) {
	Session session = HibernateConfig.getSession();
	try {
		 session.beginTransaction();
		 Criteria critToFetchHody = session.createCriteria(IrwisHrPubhodyM.class);
		   critToFetchHody.add(Restrictions.eq("hodyCode", holiday_code));
	     List<IrwisHrPubhodyM> irwisHrPltcalMHodyDatesList=critToFetchHody.list();
	     return irwisHrPltcalMHodyDatesList;
	           
	   }catch(Exception e){
		   System.out.println("inside getHolidayCodesAndNames of IrwisHrHolidayCalenderDao exception fetching getHolidayCodesAndNames"+e);
		   return null;
	   }
	   finally {
	       session.close();
	   }
}



public List<IrwisHrPltcalM> getHolidayDates(String plant, int year, String jtSorting) {
	 Session session = HibernateConfig.getSession();
	 
		
	 try {
		 String[] temp;
		/* delimiter */
        String delimiter = " ";
        /* given string will be split by the argument delimiter provided. */
        temp = jtSorting.split(delimiter);
		 
		 
		 session.beginTransaction();
		 Criteria critToFetchHodyDates = session.createCriteria(IrwisHrPltcalM.class);
	       
	       critToFetchHodyDates.add(Restrictions.eq("id.pcalId", plant));
	       critToFetchHodyDates.add(Restrictions.eq("id.calYr", year));
	       if(jtSorting.endsWith("ASC"))
	         {
	    	   critToFetchHodyDates.addOrder(Order.asc("id."+temp[0]));
	         }
	         else if(jtSorting.endsWith("DESC"))
	         {
	        	 critToFetchHodyDates.addOrder(Order.desc("id."+temp[0]));	 
	         }
	       
	       
	       List<IrwisHrPltcalM> irwisHrPltcalMHodyDatesList=critToFetchHodyDates.list();
	       
	       
	       return irwisHrPltcalMHodyDatesList;
	           
	   }catch(Exception e){
		   System.out.println("inside getHolidayDates of IrwisHrHolidayCalenderDao exception fetching getHolidayDates"+e);
		   return null;
	   }
	   finally {
	       session.close();
	   }
}


public void deleteHolidayDate(IrwisHrPltcalM record) {
	Session session = HibernateConfig.getSession();
	 Transaction tx=null;
	
	 try {
		 tx=session.beginTransaction();
		 
		 Criteria critToFetchLieuDates = session.createCriteria(IrwisHrPltLieuCalM.class);
	       
		 critToFetchLieuDates.add(Restrictions.eq("id.pcalId", record.getId().getPcalId()));
		 critToFetchLieuDates.add(Restrictions.eq("id.plant", record.getId().getPcalId()));
		 critToFetchLieuDates.add(Restrictions.eq("id.calHodyDate", record.getId().getCalHodyDate()));
		 critToFetchLieuDates.add(Restrictions.eq("id.hodyCode", record.getId().getHodyCode()));  
	       
	       List<IrwisHrPltLieuCalM> irwisHrPltcalMLieuDatesList=critToFetchLieuDates.list();
	       
	       if(irwisHrPltcalMLieuDatesList.size()==0)
	       {
	    	   session.delete(record);
	       }
	       else
	       {
	    	   for(IrwisHrPltLieuCalM l:irwisHrPltcalMLieuDatesList)
	    	   {
	    		   session.delete(l);
	    	   }
	    	   session.delete(record);
	       }
		 
		 //IrwisHrPltcalM h=(IrwisHrPltcalM)session.get(IrwisHrPltcalM.class, record.getId());
		 
		 
	     tx.commit();  
	       
	     
	           
	   }catch (HibernateException e) { 
			if (tx!=null) 
				tx.rollback(); 
			System.out.println("HibernateException deleting holioday: "+e);
			
			
		}catch (Exception e) { 
    			if (tx!=null) 
    				tx.rollback(); 
    			System.out.println("Exception deleting holioday"+e);
    			
    			
    	}finally {
    		
    		session.close();
    		}
	
}

public boolean assignLieuDate(IrwisHrPltLieuCalM record) {
	Session session = HibernateConfig.getSession();
	 
	
	 try {
			 
		 
		 session.beginTransaction();
		 Criteria critToFetchLieuDates = session.createCriteria(IrwisHrPltLieuCalM.class);
	       
		 critToFetchLieuDates.add(Restrictions.eq("id.pcalId", org_SlNo));
		 critToFetchLieuDates.add(Restrictions.eq("id.plant", org_SlNo));
		 critToFetchLieuDates.add(Restrictions.eq("id.calHodyDate", record.getId().getCalHodyDate()));
	       
	       
	       List<IrwisHrPltLieuCalM> irwisHrPltcalMLieuDatesList=critToFetchLieuDates.list();
	       
	       if(irwisHrPltcalMLieuDatesList.size()==0)
	       {
	    	   session.save(record);
	    	   session.getTransaction().commit();
	    	   return true;
	       }
	       else
	       {
	    	   return false;
	       }
	           
	   }catch(Exception e){
		   System.out.println("inside getHolidayDates of IrwisHrHolidayCalenderDao exception fetching getHolidayDates"+e);
		   return false;
	   }
	   finally {
	       session.close();
	   }
}



public List<IrwisHrPltLieuCalM> getLieuDate(String org_SlNo, Date calHody_Date, String hodyCode) {
	// TODO Auto-generated method stub
	Session session = HibernateConfig.getSession();
	
     try {
         session.beginTransaction();
	Criteria critToFetchLieuDates = session.createCriteria(IrwisHrPltLieuCalM.class);
    
    critToFetchLieuDates.add(Restrictions.eq("id.pcalId", org_SlNo));
    critToFetchLieuDates.add(Restrictions.eq("id.plant", org_SlNo));
    critToFetchLieuDates.add(Restrictions.eq("id.calHodyDate", calHody_Date));
    critToFetchLieuDates.add(Restrictions.eq("id.hodyCode", hodyCode));
    
    return critToFetchLieuDates.list();
     }catch(Exception e){
		   System.out.println("inside assignLieuDate of IrwisHrHolidayCalenderDao exception creating LieuDate"+e);
		 return null;
	   }
	   finally {
	       session.close();
	       
	   }
     
}


public boolean isFestivalAvailableInCalendarYear(String org_SlNo, String hodyCode, int yr) {
	Session session = HibernateConfig.getSession();
	 
	
	 try {
			 
		 
		 session.beginTransaction();
		 Criteria critToFetchHodyDates = session.createCriteria(IrwisHrPltcalM.class);
	       
	       critToFetchHodyDates.add(Restrictions.eq("id.pcalId", org_SlNo));
	       critToFetchHodyDates.add(Restrictions.eq("id.calYr", yr));
	       critToFetchHodyDates.add(Restrictions.eq("id.hodyCode", hodyCode));
	       
	       
	       List<IrwisHrPltcalM> irwisHrPltcalMHodyDatesList=critToFetchHodyDates.list();
	       
	       if(irwisHrPltcalMHodyDatesList.size()>0)
	       return true;
	       else
	    	   return false;
	           
	   }catch(Exception e){
		   System.out.println("inside getHolidayDates of IrwisHrHolidayCalenderDao exception fetching getHolidayDates"+e);
		   return true;
	   }
	   finally {
	       session.close();
	   }
}


public void deleteLieuDate(IrwisHrPltLieuCalM record) {
	// TODO Auto-generated method stub
	Session session = HibernateConfig.getSession();
	 
	
	 try {
		 session.beginTransaction();
		 
		 
		 //IrwisHrPltcalM h=(IrwisHrPltcalM)session.get(IrwisHrPltcalM.class, record.getId());
		 
		 session.delete(record);
	     session.getTransaction().commit();  
	       
	     
	           
	   }catch(Exception e){
		   System.out.println("inside createHolidayDate of IrwisHrHolidayCalenderDao exception creating HolidayDates"+e);
		 
	   }
	   finally {
	       session.close();
	   }

}


public String checkHolidayOnEnterDate(Date calHody_Date) {
	Session session = HibernateConfig.getSession();
	
	
	 try {
			 
		 
		 session.beginTransaction();
		 Criteria critToFetchHodyDates = session.createCriteria(IrwisHrPltcalM.class);
	       
	       critToFetchHodyDates.add(Restrictions.eq("id.pcalId", org_SlNo));
	       critToFetchHodyDates.add(Restrictions.eq("id.calHodyDate", calHody_Date));
	       
	       
	       
	       List<IrwisHrPltcalM> irwisHrPltcalMHodyDatesList=critToFetchHodyDates.list();
	       
	       if(irwisHrPltcalMHodyDatesList.size()>0)
	       {
	    	   
	    	   List<IrwisHrPubhodyM> holidayDesc=getHolidayNameByCode(irwisHrPltcalMHodyDatesList.get(0).getId().getHodyCode());
	    	   return holidayDesc.get(0).getHodyDesc();
	    	   
	    	   
	       //return true;
	       }
	       else
	    	   return "false";
	           
	   }
	 catch(Exception e){
		   System.out.println("inside getHolidayDates of IrwisHrHolidayCalenderDao exception fetching getHolidayDates"+e);
		   return "Database connection Failed";
	   }
	   finally {
	       session.close();
	   }
}



}