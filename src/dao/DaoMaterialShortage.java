package dao;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;

import beans.MaterialShortage;
import hibernateConnect.HibernateConfig;

import model.User;

public class DaoMaterialShortage {

	@SuppressWarnings("unchecked")
	public List<MaterialShortage> getAllMaterialShortage(String jtSorting, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<MaterialShortage> list = null;
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
			System.out.println("--Inside dao.DaoMaterialShortage getAllMaterialShortage() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(MaterialShortage.class);
			Calendar startdate = Calendar.getInstance();
			startdate.add(Calendar.DATE, -15);
			/* int current_year= startdate.get(Calendar.YEAR);
			int month=startdate.get(Calendar.MONTH);
			if (month<3)
			{
				current_year=current_year-1;
			}
			startdate.set(current_year,3,1);
			*/
			Calendar enddate = Calendar.getInstance();
			//enddate.set(current_year+1,3,30);
			cr.add(Restrictions.le("dateOfReport",enddate.getTime()));
			cr.add(Restrictions.ge("dateOfReport",startdate.getTime()));
			if(!roles.equals("All")){
			cr.add(Restrictions.in("shop", role));
			}
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
			list = cr.list();
		}catch(Exception ex){
			System.out.println("--- Error Inside dao.DaoMaterialShortage getAllMaterialShortage() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoMaterialShortage getAllMaterialShortage() methods finally Block--");
				session.close();
			}			
		}
		return list;
	}

	public void addMaterialShortage(MaterialShortage materialShortage) {
		Session session = null;
		
		System.out.println("Material Description " + materialShortage.getPlDesc());
		 try{
			 System.out.println("---Inside dao.DaoMaterialShortage addMaterialShortage() methods try block---");
			 session = HibernateConfig.getSession();
			 
			 session.save(materialShortage);
			 
			 System.out.println("Material Id " + materialShortage.getAbid());
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoMaterialShortage addMaterialShortage() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoMaterialShortage addMaterialShortage() methods finally block---");
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteMaterialShortage(int abid){
		Session session = null;
		MaterialShortage a1 = null;
		 try{
			 System.out.println("---Inside dao.DaoMaterialShortage deleteMaterialShortage() methods try block---");
			 session = HibernateConfig.getSession();
			 System.out.println("abid->"+abid);
			 a1 = (MaterialShortage) session.load(MaterialShortage.class, abid);
			 session.delete(a1);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoMaterialShortage deleteMaterialShortage() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoMaterialShortage deleteMaterialShortage() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateMaterialShortage(MaterialShortage materialShortage){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(materialShortage);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 System.out.println("---Error Inside dao.DaoMaterialShortage updateMaterialShortage() methods catch block---"+materialShortage);
				 ex.printStackTrace();
			 }finally{
				 System.out.println("---Inside dao.DaoMaterialShortage updateMaterialShortage() methods finally block---");
				 if(session != null){
					 session.close();
				 }
			 }
		}

	
	
	
}
