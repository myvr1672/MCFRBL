package dao;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import beans.ShellDefectsTransaction;
import hibernateConnect.HibernateConfig;
import model.User;

public class DaoShellDefect {

	public void updateShellDefect(ShellDefectsTransaction record) {
		
		Session session = null;
		
		 try{
			 session = HibernateConfig.getSession();
			 
		 
			 session.update(record);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoShellDefect updateShellDefect() methods catch block---"+record);
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoShellDefect updateShellDefect() methods finally block---");
			 if(session != null){
				 session.close();
			 }
		 }
		
		
	}

	public List<ShellDefectsTransaction> getAllShellDefect(String jtSorting) {
		Session session =  null;
		List<ShellDefectsTransaction> list = null;
		String username= null;
		String roles= null;
		String [] role;
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	User loginUser = (User)session.get(User.class,username.trim());
	    
		 roles= loginUser.getRoles();
		System.out.println(roles);
		}

	roles = roles.replaceAll(", ",",");	
	 role= roles.split(",");
		try{
			System.out.println("--Inside dao.DaoShellDefect getAllSheetDefect() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellDefectsTransaction.class);
			Calendar startdate = Calendar.getInstance();
			startdate.add(Calendar.MONTH, -6);
			
			Calendar enddate = Calendar.getInstance();
			//enddate.set(current_year+1,3,30);
			cr.add(Restrictions.le("defectReportedDate",enddate.getTime()));
			cr.add(Restrictions.ge("defectReportedDate",startdate.getTime()));
			
			String[] temp;
			
	         /* delimiter */
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
			System.out.println("--- Error Inside dao.DaoShellDefect getAllSheetDefect() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoShellDefect getAllSheetDefect() methods finally Block--");
				session.close();
			}			
		}
		return list;
	}

	public void addShellDefect(ShellDefectsTransaction record) {
Session session = null;
		
		System.out.println("Defect Description " + record.getDetailShellDefectDescription());
		 try{
			 System.out.println("---Inside dao.DaoShellDefect addShellDefect() methods try block---");
			 session = HibernateConfig.getSession();
			 
			 session.save(record);
			 
			 System.out.println("Shell Defect Id " + record.getAbid());
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error dao.DaoShellDefect addShellDefect() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoShellDefect addShellDefect() methods finally block---");
			 if(session != null){
				 session.close();
			 }
		 }
		
	}

	public void deleteShellDefect(Integer abid) {
		Session session = null;
		ShellDefectsTransaction a1 = null;
		 try{
			 System.out.println("---Inside dao.DaoShellDefect deleteShellDefect() methods try block---");
			 session = HibernateConfig.getSession();
			 System.out.println("abid->"+abid);
			 a1 = (ShellDefectsTransaction) session.load(ShellDefectsTransaction.class, abid);
			 session.delete(a1);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error dao.DaoShellDefect deleteShellDefect() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoShellDefect deleteShellDefect() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
		
	}

}
