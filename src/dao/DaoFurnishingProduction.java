package dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;

import beans.BogiesetTransaction;
import beans.CoachTurnoutTransaction;
import beans.FurnishingTransaction;
//import beans.ElectricalTran;
import beans.PaintTransaction;
import beans.TestingMobileClearance;
import hibernateConnect.HibernateConfig;

public class DaoFurnishingProduction {

	public void addFurnishingProgress(FurnishingTransaction furnishingTransaction) {
		Session session = null;
		
		 try{
			
			 session = HibernateConfig.getSession();
			 
			 session.save(furnishingTransaction);
			 
			 //System.out.println("abnormality Id " + abnormality.getAbid());
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	public void addFurnishingProgress(FurnishingTransaction furnishingTransaction, PaintTransaction paintTransaction) {
		Session session = null;
		Transaction tx=null;
		 try{
			
			 session = HibernateConfig.getSession();
			 tx=session.beginTransaction();
			 session.save(furnishingTransaction);
			 
			 session.update(paintTransaction);
			 
			/* Criteria cr2 = session.createCriteria(FurnishingTransaction.class);
				cr2.add(Restrictions.eq("paintAssetId", paintAssetId));
				FurnishingTransaction	furnishingTransaction1=(FurnishingTransaction) cr2.list().get(0);*/
		//Integer furnishingId=furnishingTransaction.getFurnishingAssetId();
		//Create a new record for Testing Mobile Clearance
		TestingMobileClearance testingMobileClearance=new TestingMobileClearance();
		testingMobileClearance.setFurnishingAssetId(furnishingTransaction.getFurnishingAssetId());
		testingMobileClearance.setSubstageId("furn01");
		testingMobileClearance.setTestingStatus("not_ok");
		testingMobileClearance.setTestingStartDate(new Date());
		testingMobileClearance.setNotificationStage("00");
		testingMobileClearance.setSubstageDescription("FLOORING");
		//testingMobileClearance.setSubstageSequence(1);
		 //session=HibernateConfig.getSession();
		session.save(testingMobileClearance);
			 
			 
			 //System.out.println("abnormality Id " + abnormality.getAbid());
			 tx.commit();
			 
			 
		 }catch(Exception ex){
			 if(tx!=null)
			 {
				 tx.rollback();
			 }
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	@SuppressWarnings("unchecked")
	public List<FurnishingTransaction> getAllFurnishing(String stageid,String jtSorting, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		
		List<FurnishingTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(FurnishingTransaction.class);
			cr.add(Restrictions.eq("stageId", stageid));
			
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			
			cr.add(Restrictions.isNull("dispatchDateInQuality"));
			String[] temp;
	         String delimiter = " ";
	         /* given string will be split by the argument delimiter provided. */
	         temp = jtSorting.split(delimiter);
	 if(jtSorting.endsWith("ASC"))
		         {
		        	 cr.addOrder(Order.asc(temp[0]));
		         }
		         else if(jtSorting.endsWith("DESC"))
		         {
		        	 cr.addOrder(Order.desc(temp[0]));	 
		         }
	 int total_rec_count = cr.list().size();  // retrieve total no of record in table mapped to bean class based on condition on criteria
	 System.out.println("Total no of record fount to satisfy criteria " +total_rec_count);
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
			
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoFurnishingProduction getAllFurnishing() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<FurnishingTransaction> getDispatchFurnishing(String jtSorting) {
		Session session =  null;
		
		List<FurnishingTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(FurnishingTransaction.class);
			
			
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			cr.add(Restrictions.isNotNull("assemblyDispatchDate"));
			cr.add(Restrictions.isNull("receiptAtNextStage"));
			String[] temp;
	         String delimiter = " ";
	         /* given string will be split by the argument delimiter provided. */
	         temp = jtSorting.split(delimiter);
	 if(jtSorting.endsWith("ASC"))
		         {
		        	 cr.addOrder(Order.asc(temp[0]));
		         }
		         else if(jtSorting.endsWith("DESC"))
		         {
		        	 cr.addOrder(Order.desc(temp[0]));	 
		         }
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoFurnishingProduction getAllFurnishing() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<FurnishingTransaction> dispatchFurnishing(String jtSorting, String datefrom, String dateto) {
		Session session =  null;
		
		List<FurnishingTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		Date from=null, to=null;
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
		try{
			
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(FurnishingTransaction.class);
			
			
			cr.add(Restrictions.isNotNull("assemblyDispatchDate"));
			if(datefrom!=null)	{
				from=sdf.parse(datefrom);
				cr.add(Restrictions.ge("assemblyDispatchDate", from));
				}
			if(dateto!=null)	{
				to=sdf.parse(dateto);
				cr.add(Restrictions.le("assemblyDispatchDate", to));
				}
			String[] temp;
	         String delimiter = " ";
	         /* given string will be split by the argument delimiter provided. */
	         temp = jtSorting.split(delimiter);
	 if(jtSorting.endsWith("ASC"))
		         {
		        	 cr.addOrder(Order.asc(temp[0]));
		         }
		         else if(jtSorting.endsWith("DESC"))
		         {
		        	 cr.addOrder(Order.desc(temp[0]));	 
		         }
			list = cr.list();
		}catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
	public void updateFurnishingAndBogieProgress(FurnishingTransaction furnishingTransaction, BogiesetTransaction bogieset_old_pp, BogiesetTransaction bogieset_old_npp, BogiesetTransaction bogieset_new_pp, BogiesetTransaction bogieset_new_npp ){
		Session session = null;
		Transaction tx=null;
		
			 try{
				 session = HibernateConfig.getSession();
				 tx=session.beginTransaction();
			 
				 session.saveOrUpdate(furnishingTransaction);
				if(bogieset_old_pp!=null)   {session.update(bogieset_old_pp);}
				if(bogieset_old_npp!=null){ session.update(bogieset_old_npp); }
				if(bogieset_new_pp!=null){ session.update(bogieset_new_pp); }
				 if(bogieset_new_npp!=null) { session.update(bogieset_new_npp); }
				 tx.commit();
				 
			 }catch(Exception ex){
				 if(tx!=null)
				 {
					 tx.rollback();
				 }
				 ex.printStackTrace();
			 }finally{
				
				 if(session != null){
					 session.close();
				 }
			 }
		}
	
	public void updateFurnishingProgress(FurnishingTransaction furnishingTransaction)
	{
		Session session = null;
		try
		{
			session = HibernateConfig.getSession();
			session.beginTransaction();
			session.update(furnishingTransaction); 
			session.getTransaction().commit();
		}
		catch(Exception ex){
			
		}
		finally{
			if(session!=null)
				session.close();
		}
	}
	
	public void updateFurnishingProgress(FurnishingTransaction furnishingTransaction, CoachTurnoutTransaction coachTurnoutTransaction)
	{
		Session session = null;
		Transaction tx=null;
		try
		{
			session = HibernateConfig.getSession();
			tx=session.beginTransaction();
			session.update(furnishingTransaction); 
			session.save(coachTurnoutTransaction);
			session.getTransaction().commit();
		}
		catch(Exception ex){
			if(tx!=null)
			 {
				 tx.rollback();
			 }
		}
		finally{
			if(session!=null)
				session.close();
		}
	}
	public List<FurnishingTransaction> getAllQuality(String stageID, String jtSorting, int startPageIndex, int numRecordsPerPage) {
		
Session session =  null;
		
		List<FurnishingTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(FurnishingTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			
			cr.add(Restrictions.isNotNull("dispatchDateInQuality"));
			cr.add(Restrictions.isNull("assignedFlagQuality"));
			cr.add(Restrictions.isNull("receiptDateAtQuality"));
			String[] temp;
	         String delimiter = " ";
	         /* given string will be split by the argument delimiter provided. */
	         temp = jtSorting.split(delimiter);
	 if(jtSorting.endsWith("ASC"))
		         {
		        	 cr.addOrder(Order.asc(temp[0]));
		         }
		         else if(jtSorting.endsWith("DESC"))
		         {
		        	 cr.addOrder(Order.desc(temp[0]));	 
		         }
	 int total_rec_count = cr.list().size();  // retrieve total no of record in table mapped to bean class based on condition on criteria
	 System.out.println("Total no of record fount to satisfy criteria " +total_rec_count);
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
			
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoFurnishingProduction getAllFurnishing() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
		
		
		
	}
	public List<FurnishingTransaction> getCoachAvailableInQuality(String stageID, String jtSorting, int startPageIndex, int numRecordsPerPage) 
	{
Session session =  null;
		
		List<FurnishingTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoFurnishingProduction getCoachAvailableInQuality() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(FurnishingTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			
			cr.add(Restrictions.isNotNull("dispatchDateInQuality"));
			cr.add(Restrictions.eq("assignedFlagQuality", 1));
		
			String[] temp;
	         String delimiter = " ";
	         /* given string will be split by the argument delimiter provided. */
	         temp = jtSorting.split(delimiter);
	 if(jtSorting.endsWith("ASC"))
		         {
		        	 cr.addOrder(Order.asc(temp[0]));
		         }
		         else if(jtSorting.endsWith("DESC"))
		         {
		        	 cr.addOrder(Order.desc(temp[0]));	 
		         }
	 int total_rec_count = cr.list().size();  // retrieve total no of record in table mapped to bean class based on condition on criteria
	 System.out.println("Total no of record fount to satisfy criteria " +total_rec_count);
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
			
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoFurnishingProduction getCoachAvailableInQuality() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoFurnishingProduction getCoachAvailableInQuality() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
			
		
		
		
		
	}
	public List<FurnishingTransaction> getAllElecSIPFurnishing(String stageID, String jtSorting, Integer startPageIndex, Integer numRecordsPerPage) {
Session session =  null;
		
		List<FurnishingTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(FurnishingTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			Restrictions.isNotNull("bogiePpSideAssetId");
			Restrictions.isNotNull("bogieNppSideAssetId");
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			
			//cr.add(Restrictions.isNull("dispatchDateInQuality"));
			String[] temp;
	         String delimiter = " ";
	         /* given string will be split by the argument delimiter provided. */
	         temp = jtSorting.split(delimiter);
	 if(jtSorting.endsWith("ASC"))
		         {
		        	 cr.addOrder(Order.asc(temp[0]));
		         }
		         else if(jtSorting.endsWith("DESC"))
		         {
		        	 cr.addOrder(Order.desc(temp[0]));	 
		         }
	 int total_rec_count = cr.list().size();  // retrieve total no of record in table mapped to bean class based on condition on criteria
	 System.out.println("Total no of record fount to satisfy criteria " +total_rec_count);
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
			
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoFurnishingProduction getAllFurnishing() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoFurnishingProduction getAllFurnishing() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
}
