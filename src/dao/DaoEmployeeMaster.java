package dao;
import java.util.ArrayList;
import java.util.Arrays;
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

import beans.EmployeeTransferHistory;
import hibernateConnect.HibernateConfig;

import model.EmployeeMaster;
import model.User;

public class DaoEmployeeMaster {
	

@SuppressWarnings("unchecked")
public List<EmployeeMaster> getAllEmployee(String jtSorting, String validFrom, String validTo, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<EmployeeMaster> list = null;
		//retrieve roles for login user
				User loginUser = null;
				 
				//private SessionMap<String, Object> sessionMap;
				HttpSession session_http = ServletActionContext.getRequest().getSession(true);

				String username = (String) session_http.getAttribute("userid");
				session = HibernateConfig.getSession();
				loginUser = (User)session.get(User.class,username.trim());
				List<String> roleList=new ArrayList<String>();
				String roles=loginUser.getRoles();	
				if(!roles.equals("All"))
				{
					roleList=Arrays.asList(roles.split("\\s*,\\s*"));
				}
		// end of code
		try{
			session = HibernateConfig.getSession();
		//	SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
			session.beginTransaction();
			
			Date dt=new Date();
			Criteria cr = session.createCriteria(EmployeeMaster.class);
			cr.add(Restrictions.ge("validTo", dt));
			cr.add(Restrictions.le("validFrom", dt));
			cr.add(Restrictions.eq("status", "working"));
			if(!roles.equals("All")){	cr.add(Restrictions.in("shop", roleList));}
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
	 Integer total_rec_count=cr.list().size();
	 Map session_map=ActionContext.getContext().getSession();
	 session_map.put("holding_count", total_rec_count);
	 cr.setFirstResult(startPageIndex);
	 cr.setMaxResults(numRecordsPerPage);
			list=cr.list();
		}
		catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				session.close();
			}			
		}
		return list;
	}

	public void addEmployeeMaster(EmployeeMaster asset) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(asset);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteEmp_master(String emp_no){
		Session session = null;
		EmployeeMaster a1 = null;
		 try{
			
			 session = HibernateConfig.getSession();
			 System.out.println("abid->"+emp_no);
			 a1 = (EmployeeMaster) session.load(EmployeeMaster.class, emp_no);
			 session.delete(a1);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			// System.out.println("---Error Inside dao.DaoAbnormality deleteAbnormality() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 //System.out.println("---Inside dao.DaoAbnormality deleteAbnormality() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateEmployeeMaster(EmployeeMaster record, EmployeeTransferHistory employeeTransfer){
		Session session = null;
		Transaction tx=null;
			 try{
				 session = HibernateConfig.getSession();
				
			 tx= session.beginTransaction();
			 session.update(record);
			session.save(employeeTransfer);
			tx.commit();
				 
			 }catch(Exception ex){
					 ex.printStackTrace();
					 if(tx!=null) {tx.rollback();}
			 }finally{
				if(session != null){
					 session.close();
				 }
			 }
		}

	public void updateEmployeeMaster(EmployeeMaster record) {
		Session session = null;
		Transaction tx=null;
			 try{
				 session = HibernateConfig.getSession();
				
			 tx= session.beginTransaction();
			 session.update(record);
			
			tx.commit();
				 
			 }catch(Exception ex){
					 ex.printStackTrace();
					 if(tx!=null) {tx.rollback();}
			 }finally{
				if(session != null){
					 session.close();
				 }
			 }
		
	}
	
}
