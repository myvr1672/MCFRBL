package dao;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import hibernateConnect.HibernateConfig;
import beans.ShellProgress;



public class DaoShellMearging {

	@SuppressWarnings("unchecked")
	public List<ShellProgress> getAllShellProgress(String stageid,String jtSorting, String previousStage) {
		Session session =  null;
		List<ShellProgress> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
			
		try{
			System.out.println("--Inside dao.DaoSheetCutting getAllShellProgress() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellProgress.class);
			cr.add(Restrictions.eq("substageId", stageid));
			cr.add(Restrictions.eq("previousStageId", previousStage));
			cr.add(Restrictions.isNull("mergeFunishFlag"));
			/*cr.add(
					Restrictions.or(
					Restrictions.isNotNull("exitDate"), 
					Restrictions.eq("exitDate","")
					)
					);*/
			//cr.add(
					
			//		Restrictions.isNull("exitDate"));
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
			System.out.println("--- Error Inside dao.DaoAbnormality getAllAbnormaity() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoAbnormality getAllAbnormaity() methods finally Block--");
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
	public void updateSheetProgress(ShellProgress shellProgress){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(shellProgress);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 
				 ex.printStackTrace();
			 }finally{
				
				 if(session != null){
					 session.close();
				 }
			 }
		}
	
}
