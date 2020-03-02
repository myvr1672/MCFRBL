package dao;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;

import hibernateConnect.HibernateConfig;
import beans.ShellTransaction;;



public class DaoShellProduction {

	@SuppressWarnings("unchecked")
	public List<ShellTransaction> getAllShell(String stageid,String jtSorting, String previousStage, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction getAllShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("stageId", stageid));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			cr.add(Restrictions.isNull("assemblyDispatchDate"));
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
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction getAllShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction getAllShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<ShellTransaction>displayDispatchShell(String jtSorting, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction displayDispatchShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			cr.add(Restrictions.isNotNull("assemblyDispatchDate"));
			cr.add(Restrictions.isNull("receiptatNextStage"));
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
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction displayDispatchShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction displayDispatchShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<ShellTransaction>dispatchShell(String jtSorting, String dateFrom, String dateTo, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			Date from=null, to=null;
			System.out.println("--Inside dao.DaoShellProduction displayDispatchShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.isNotNull("assemblyDispatchDate"));
			if(dateFrom!=null)	{
				from=sdf.parse(dateFrom);
				cr.add(Restrictions.ge("assemblyDispatchDate", from));
				}
			if(dateTo!=null)	{
				to=sdf.parse(dateTo);
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
	 int total_rec_count = cr.list().size();  // retrieve total no of record in table mapped to bean class based on condition on criteria
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction displayDispatchShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction displayDispatchShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
	
	
	public List<ShellTransaction>availableShell(String jtSorting) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction availableShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			/*cr.add(
			Restrictions.or(
			Restrictions.isNotNull("exitDate"), 
			Restrictions.eq("exitDate","")
			)
			);*/	
			
			//cr.add(Restrictions.or(Restrictions.isNull("asignedFlag"),Restrictions.eq("asignedFlag", "")) );  // ne represent not equal.
			cr.add(Restrictions.isNull("asignedFlag"));
			cr.add(Restrictions.isNotNull("receiptatNextStage"));
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
			System.out.println("--- Error Inside dao.DaoShellProduction displayDispatchShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction displayDispatchShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	public void addShellProgress(ShellTransaction shellTransaction) {
		Session session = null;
		
		 try{
			
			 session = HibernateConfig.getSession();
			 
			 session.save(shellTransaction);
			 
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
	
	public void updateShellProgress(ShellTransaction shellTransaction){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(shellTransaction);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 
				 ex.printStackTrace();
			 }finally{
				
				 if(session != null){
					 session.close();
				 }
			 }
		}

	public List<ShellTransaction> getAllSIPComponentShell(String stageID, String jtSorting, String previousStage, int startPageIndex, int numRecordsPerPage) {
	
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction getAllShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			cr.add(Restrictions.or(Restrictions.ne("finalIspectionReportFlag", 1), Restrictions.isNull("finalIspectionReportFlag")));
			
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
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction getAllShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction getAllShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}

	public List<ShellTransaction> getAllSIPStageShell(String stageID, String jtSorting, String previousStage,int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction getAllShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			cr.add(Restrictions.eq("endwallSipFlag", 1));
			cr.add(Restrictions.eq("roofSipFlag", 1));
			cr.add(Restrictions.eq("underframeSipFlag", 1));
			cr.add(Restrictions.eq("sidewallSipFlag", 1));
			cr.add(Restrictions.eq("lavsidewallSipFlag", 1));
			
			cr.add(Restrictions.or(Restrictions.ne("finalIspectionReportFlag", 1), Restrictions.isNull("finalIspectionReportFlag")));
			
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
	 Integer total_rec_count = cr.list().size();  // retrieve total no of record in table mapped to bean class based on condition on criteria
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction getAllShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction getAllShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}

	public List<ShellTransaction> getAllSIPFinalShell(String stageID, String jtSorting, String previousStage, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction getAllShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			cr.add(Restrictions.eq("endwallSipFlag", 1));
			cr.add(Restrictions.eq("roofSipFlag", 1));
			cr.add(Restrictions.eq("underframeSipFlag", 1));
			cr.add(Restrictions.eq("sidewallSipFlag", 1));
			cr.add(Restrictions.eq("lavsidewallSipFlag", 1));
			cr.add(Restrictions.eq("stage1SipFlag", 1));
			cr.add(Restrictions.eq("stage2SipFlag", 1));
			cr.add(Restrictions.eq("stage3SipFlag", 1));
			cr.add(Restrictions.eq("stage4SipFlag", 1));
			cr.add(Restrictions.or(Restrictions.ne("finalIspectionReportFlag", 1), Restrictions.isNull("finalIspectionReportFlag")));
			
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
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction getAllShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction getAllShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}

	public List<ShellTransaction> getFinalInspectionShell(String stageID, String jtSorting, String previousStage, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction getAllShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			cr.add(Restrictions.eq("finalIspectionReportFlag", 1));
			
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
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction getAllShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction getAllShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;	
	}

	public List<ShellTransaction> getCheckListShell(String stageID, String jtSorting, String previousStage, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction getAllShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			cr.add(Restrictions.eq("finalIspectionReportFlag", 1));
			cr.add(Restrictions.or(Restrictions.ne("checkListFlag", 1), Restrictions.isNull("checkListFlag") ));
			
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
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction getAllShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction getAllShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;	
	}

	public List<ShellTransaction> getQualityClearanceShell(String stageID, String jtSorting, String previousStage, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction getAllShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			cr.add(Restrictions.eq("endwallSipFlag", 1));
			cr.add(Restrictions.eq("roofSipFlag", 1));
			cr.add(Restrictions.eq("underframeSipFlag", 1));
			cr.add(Restrictions.eq("sidewallSipFlag", 1));
			cr.add(Restrictions.eq("lavsidewallSipFlag", 1));
			cr.add(Restrictions.eq("stage1SipFlag", 1));
			cr.add(Restrictions.eq("stage2SipFlag", 1));
			cr.add(Restrictions.eq("stage3SipFlag", 1));
			cr.add(Restrictions.eq("stage4SipFlag", 1));
			//cr.add(Restrictions.eq("finalIspectionReportFlag", 1)); I skip all intermidiate step. If required add cr.add(Restrictions.eq("checkListFlag", 1))
			cr.add(Restrictions.or(Restrictions.ne("testingClearanceMemoFlag", 1), Restrictions.isNull("testingClearanceMemoFlag") ));
			
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
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction getAllShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction getAllShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;	
	}

	public List<ShellTransaction> getReportClearanceShell(String stageID, String jtSorting, String previousStage, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<ShellTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoShellProduction getAllShell() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			cr.add(Restrictions.eq("endwallSipFlag", 1));
			cr.add(Restrictions.eq("roofSipFlag", 1));
			cr.add(Restrictions.eq("underframeSipFlag", 1));
			cr.add(Restrictions.eq("sidewallSipFlag", 1));
			cr.add(Restrictions.eq("lavsidewallSipFlag", 1));
			cr.add(Restrictions.eq("stage1SipFlag", 1));
			cr.add(Restrictions.eq("stage2SipFlag", 1));
			cr.add(Restrictions.eq("stage3SipFlag", 1));
			cr.add(Restrictions.eq("stage4SipFlag", 1));
			cr.add(Restrictions.eq("testingClearanceMemoFlag", 1));
			//cr.add(Restrictions.eq("finalIspectionReportFlag", 1)); I skip all intermidiate step. If required add cr.add(Restrictions.eq("checkListFlag", 1))
			//cr.add(Restrictions.or(Restrictions.ne("testingClearanceMemoFlag", 1), Restrictions.isNull("testingClearanceMemoFlag") ));
			
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
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoShellProduction getAllShell() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction getAllShell() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;	
	}
	
}
