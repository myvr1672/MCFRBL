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
import beans.PaintTransaction;



public class DaoPaintProduction {

	@SuppressWarnings("unchecked")
	public List<PaintTransaction> getAllPaint(String stageid,String jtSorting, String previousStage, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<PaintTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoPaintProduction getAllPaint() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(PaintTransaction.class);
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
			 Integer total_rec_count=cr.list().size();
			 Map session_map=ActionContext.getContext().getSession();
			 session_map.put("holding_count", total_rec_count);
			 cr.setFirstResult(startPageIndex);
			 cr.setMaxResults(numRecordsPerPage);

			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoPaintProduction getAllPaint() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoPaintProduction getAllPaint() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	public void addPaintProgress(PaintTransaction paintTransaction) {
		Session session = null;
		
		 try{
			
			 session = HibernateConfig.getSession();
			 
			 session.save(paintTransaction);
			 
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
	
	public void updatePaintProgress(PaintTransaction paintTransaction){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(paintTransaction);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 
				 ex.printStackTrace();
			 }finally{
				
				 if(session != null){
					 session.close();
				 }
			 }
		}
	
	@SuppressWarnings("unchecked")
	public List<PaintTransaction>displayDispatchPaint(String jtSorting) {
		Session session =  null;
		List<PaintTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoPaintProduction displayDispatchPaint() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(PaintTransaction.class);
			
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
			System.out.println("--- Error Inside dao.DaoPaintProduction displayDispatchPaint() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction displayDispatchPaint() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<PaintTransaction>dispatchPaint(String jtSorting, String datefrom, String dateto, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<PaintTransaction> list = null;
		String username= null;
		Date from=null, to=null;
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoPaintProduction dispatchPaint() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(PaintTransaction.class);
			
			//cr.add(Restrictions.ne("mergeFunishFlag", 1));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
//cr.add(Restrictions.isNull("mergeFunishFlag"));
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
	 Integer total_rec_count=cr.list().size();
	 Map session_map=ActionContext.getContext().getSession();
	 session_map.put("holding_count", total_rec_count);
	 cr.setFirstResult(startPageIndex);
	 cr.setMaxResults(numRecordsPerPage);
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoPaintProduction dispatchPaint() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellProduction dispatchPaint() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<PaintTransaction>availablePaint(String jtSorting,Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<PaintTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoPaintProduction availablePaint() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(PaintTransaction.class);
			/*cr.add(
			Restrictions.or(
			Restrictions.isNotNull("exitDate"), 
			Restrictions.eq("exitDate","")
			)
			);*/	
			
			//cr.add(Restrictions.or(Restrictions.isNull("asignedFlag"),Restrictions.eq("asignedFlag", "")) );  // ne represent not equal.
			cr.add(Restrictions.isNull("asignedFlag"));
			cr.add(Restrictions.isNull("assemblyEndDate"));
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
	 Integer total_rec_count=cr.list().size();
	 Map session_map=ActionContext.getContext().getSession();
	 session_map.put("holding_count", total_rec_count);
	 cr.setFirstResult(startPageIndex);
	 cr.setMaxResults(numRecordsPerPage);

			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoPaintProduction displayDispatchPaint() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoPaintProduction displayDispatchPaint() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<PaintTransaction>availableShell(String jtSorting)
{
	Session session =  null;
	List<PaintTransaction> list = null;
	String username= null;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	username = (String) session_http.getAttribute("userid");
	
	if (username != null)
	{
session = HibernateConfig.getSession();

  
	try{
		System.out.println("--Inside dao.DaoPaintProduction availablePaint() methods try Block--");
		session = HibernateConfig.getSession();
		Criteria cr = session.createCriteria(PaintTransaction.class);
		/*cr.add(
		Restrictions.or(
		Restrictions.isNotNull("exitDate"), 
		Restrictions.eq("exitDate","")
		)
		);*/	
		
		//cr.add(Restrictions.or(Restrictions.isNull("asignedFlag"),Restrictions.eq("asignedFlag", "")) );  // ne represent not equal.
		cr.add(Restrictions.isNull("asignedFlag"));
		cr.add(Restrictions.isNull("assemblyEndDate"));
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
		System.out.println("--- Error Inside dao.DaoPaintProduction displayDispatchPaint() methods catch block---");
		ex.printStackTrace();
	}finally{
		if(session!= null){
			System.out.println("--Inside dao.DaoPaintProduction displayDispatchPaint() methods finally Block--");
			session.close();
		}			
	}
	
}
	return list;
}

	public List<PaintTransaction> getSIPPaint(String stageID, String jtSorting, String previousStage, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<PaintTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoPaintProduction getAllPaint() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(PaintTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			/* start code  manoj */
			cr.add(Restrictions.or(Restrictions.ne("testingClearanceMemoFlag",1),Restrictions.isNull("testingClearanceMemoFlag")));
			
			/* end code  manoj */
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
			 Integer total_rec_count=cr.list().size();
			 Map session_map=ActionContext.getContext().getSession();
			 session_map.put("holding_count", total_rec_count);
			 cr.setFirstResult(startPageIndex);
			 cr.setMaxResults(numRecordsPerPage);

			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoPaintProduction getAllPaint() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoPaintProduction getAllPaint() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
		
	}
	
	
	public List<PaintTransaction> qualityClearancePaint(String stageID, String jtSorting, String previousStage, int startPageIndex, int numRecordsPerPage) {
		Session session =  null;
		List<PaintTransaction> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoPaintProduction getAllPaint() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(PaintTransaction.class);
			cr.add(Restrictions.eq("stageId", stageID));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			/* start code  manoj */
			cr.add(Restrictions.eq("intrPaintSipFlag",1));
			cr.add(Restrictions.eq("intrPaintFinalFlag",1));
			cr.add(Restrictions.eq("extrPaintSipFlag",1));
			cr.add(Restrictions.eq("extrPaintFinalFlag",1));
			
			cr.add(Restrictions.or(Restrictions.ne("testingClearanceMemoFlag",1),Restrictions.isNull("testingClearanceMemoFlag")));
			
			/* end code  manoj */
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
			 Integer total_rec_count=cr.list().size();
			 Map session_map=ActionContext.getContext().getSession();
			 session_map.put("holding_count", total_rec_count);
			 cr.setFirstResult(startPageIndex);
			 cr.setMaxResults(numRecordsPerPage);

			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoPaintProduction getAllPaint() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoPaintProduction getAllPaint() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
		
	}

}
	

