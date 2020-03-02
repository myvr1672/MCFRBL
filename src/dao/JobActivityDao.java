package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.JobActivityMaster;
import hibernateConnect.HibernateConfig;

public class JobActivityDao {

	public List<JobActivityMaster>getActivityBySubSection(String shop)
	   {
		   Session session=null;
		   try{
			   session = HibernateConfig.getSession();
			   session.beginTransaction();
			   Criteria cr= session.createCriteria(JobActivityMaster.class);
			   cr.add(Restrictions.eq("subsectionId",shop));
			   @SuppressWarnings("unchecked")
			List<JobActivityMaster> activityList= cr.list();
			   return activityList;
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
			   return null;
		   }
		   finally{
			   session.close();
		   }
		   
		   
	   }
	
}
