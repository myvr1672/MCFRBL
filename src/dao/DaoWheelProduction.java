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
import beans.WheelsetTransaction;



public class DaoWheelProduction {

	@SuppressWarnings("unchecked")
	public List<WheelsetTransaction> getAllWheel(String stageid,String jtSorting, String previousStage, String datefrom, String dateto, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<WheelsetTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
	
	  
		try{
		Date from=null, to=null;
		
			System.out.println("--Inside dao.DaoWheelProduction getAllWheel() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(WheelsetTransaction.class);
			cr.add(Restrictions.eq("substageId", stageid));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			//cr.add(Restrictions.between("assemblyStartDate", from, to));
		if(datefrom!=null)	{
			from=sdf.parse(datefrom);
			cr.add(Restrictions.ge("assemblyStartDate", from));
			}
		if(dateto!=null)	{
			to=sdf.parse(dateto);
			cr.add(Restrictions.le("assemblyStartDate", to));
			}
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
			System.out.println("--- Error Inside dao.DaoWheelProduction getAllWheel() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoWheelProduction getAllWheel() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<WheelsetTransaction>displayDispatchWheel(String jtSorting, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<WheelsetTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoWheelProduction displayDispatchWheel() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(WheelsetTransaction.class);
			
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
			cr.add(Restrictions.eq("dispatchTo", "bogie"));
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
	 int total_rec_count = cr.list().size();  // retireve total no of record in table mapped to bean class based on condition on criteria
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoWheelProduction displayDispatchWheel() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoWheelProduction displayDispatchWheel() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<WheelsetTransaction>dispatchWheel(String jtSorting, String datefrom, String dateto, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<WheelsetTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			Date from=null, to=null;
			System.out.println("--Inside dao.DaoWheelProduction displayDispatchWheel() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(WheelsetTransaction.class);
			
			
			cr.add(Restrictions.isNotNull("assemblyDispatchDate"));
			//cr.add(Restrictions.isNull("receiptAtNextStage"));
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
	 int total_rec_count = cr.list().size();  // retireve total no of record in table mapped to bean class based on condition on criteria
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoWheelProduction displayDispatchWheel() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoWheelProduction displayDispatchWheel() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<WheelsetTransaction>availableWheel(String jtSorting, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<WheelsetTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoWheelProduction availableWheel() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(WheelsetTransaction.class);
			/*cr.add(
			Restrictions.or(
			Restrictions.isNotNull("exitDate"), 
			Restrictions.eq("exitDate","")
			)
			);*/	
			
			//cr.add(Restrictions.or(Restrictions.isNull("asignedFlag"),Restrictions.eq("asignedFlag", "")) );  // ne represent not equal.
			cr.add(Restrictions.isNull("asignedFlag"));
			cr.add(Restrictions.isNotNull("receiptAtNextStage"));
			cr.add(Restrictions.eq("dispatchTo", "bogie"));
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
	 int total_rec_count = cr.list().size();  // retireve total no of record in table mapped to bean class based on condition on criteria
	 Map session_map=ActionContext.getContext().getSession();      
     session_map.put("holding_count", total_rec_count);
     cr.setFirstResult(startPageIndex);
     cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoWheelProduction displayDispatchWheel() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoWheelProduction displayDispatchWheel() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	public void addWheelProgress(WheelsetTransaction wheelsetTransaction) {
		Session session = null;
		
		 try{
			
			 session = HibernateConfig.getSession();
			 
			 session.save(wheelsetTransaction);
			 
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
	
	public void updateWheelProgress(WheelsetTransaction wheelsetTransaction){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(wheelsetTransaction);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 
				 ex.printStackTrace();
			 }finally{
				
				 if(session != null){
					 session.close();
				 }
			 }
		}

	public List<WheelsetTransaction> getAllSIPWheel(String stageID, String jtSorting, String previousStage,String datefrom, String dateto,  int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<WheelsetTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
	
	  
		try{
		
		
			System.out.println("--Inside dao.DaoWheelProduction getAllWheel() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(WheelsetTransaction.class);
			cr.add(Restrictions.eq("substageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			Date from=null, to=null;
			if(datefrom!=null)	{
				from=sdf.parse(datefrom);
				cr.add(Restrictions.ge("assemblyStartDate", from));
				}
			if(dateto!=null)	{
				to=sdf.parse(dateto);
				cr.add(Restrictions.le("assemblyStartDate", to));
				}
			
			cr.add(Restrictions.or(Restrictions.ne("testingClearanceMemoFlag", 1), Restrictions.isNull("testingClearanceMemoFlag") ));
			//cr.add(Restrictions.between("assemblyStartDate", from, to));
		
		
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			//cr.add(Restrictions.isNull("assemblyDispatchDate"));
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
			System.out.println("--- Error Inside dao.DaoWheelProduction getAllWheel() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoWheelProduction getAllWheel() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}

	public List<WheelsetTransaction> getAllQualityClearanceWheel(String stageID, String jtSorting, String previousStage, String datefrom, String dateto, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<WheelsetTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
	
	  
		try{
		
		
			System.out.println("--Inside dao.DaoWheelProduction getAllWheel() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(WheelsetTransaction.class);
			cr.add(Restrictions.eq("substageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			Date from=null, to=null;
			if(datefrom!=null)	{
				from=sdf.parse(datefrom);
				cr.add(Restrictions.ge("assemblyStartDate", from));
				}
			if(dateto!=null)	{
				to=sdf.parse(dateto);
				cr.add(Restrictions.le("assemblyStartDate", to));
				}
			cr.add(Restrictions.eq("sipWheelAssemblyFlag", 1));
			cr.add(Restrictions.eq("sipWheelCtrbFlag", 1));
			cr.add(Restrictions.or(Restrictions.ne("testingClearanceMemoFlag", 1), Restrictions.isNull("testingClearanceMemoFlag") ));
			//cr.add(Restrictions.between("assemblyStartDate", from, to));
		
		
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
			//cr.add(Restrictions.isNull("assemblyDispatchDate"));
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
			System.out.println("--- Error Inside dao.DaoWheelProduction getAllWheel() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoWheelProduction getAllWheel() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}

	public List<WheelsetTransaction> getQualityClearanceReport(String stageID, String jtSorting, String previousStage, String datefrom, String dateto, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<WheelsetTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
	
	  
		try{
		
		
			System.out.println("--Inside dao.DaoWheelProduction getAllWheel() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(WheelsetTransaction.class);
			cr.add(Restrictions.eq("substageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			Date from=null, to=null;
			if(datefrom!=null)	{
				from=sdf.parse(datefrom);
				cr.add(Restrictions.ge("assemblyStartDate", from));
				}
			if(dateto!=null)	{
				to=sdf.parse(dateto);
				cr.add(Restrictions.le("assemblyStartDate", to));
				}
			cr.add(Restrictions.eq("sipWheelAssemblyFlag", 1));
			cr.add(Restrictions.eq("sipWheelCtrbFlag", 1));
			cr.add(Restrictions.eq("testingClearanceMemoFlag", 1));
			
		
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
			System.out.println("--- Error Inside dao.DaoWheelProduction getAllWheel() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoWheelProduction getAllWheel() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
}
