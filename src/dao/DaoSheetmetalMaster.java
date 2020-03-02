package dao;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;


import hibernateConnect.HibernateConfig;
import beans.SheetmetalMaster;


public class DaoSheetmetalMaster {

	@SuppressWarnings("unchecked")
	public List<SheetmetalMaster> getAllSheetMetal(String jtSorting) {
		Session session =  null;
		List<SheetmetalMaster> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
				
		try{
			System.out.println("--Inside dao.DaoSheetmetalMaster getAllSheetMetal() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(SheetmetalMaster.class);
			
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
			System.out.println("--- Error Inside dao.DaoSheetMetalMaster getAllSheetMetal() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoSheetMetalMaster getAllSheetMetal() methods finally Block--");
				session.close();
			}			
		}
		return list;
	}

	public void addSheetmetalMaster(SheetmetalMaster sheetmetalMaster) {
		Session session = null;
		
		System.out.println("Sheet Metal Description " + sheetmetalMaster.getDescription());
		 try{
			 System.out.println("---Inside dao.DaoSheetmetalMaster addSheetmetalMaster() methods try block---");
			 session = HibernateConfig.getSession();
			 
			 session.save(sheetmetalMaster);
			 
			 System.out.println("Drawing No"  + sheetmetalMaster.getDrawingNo());
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoSheetmetalMaster addSheetmetalMaster() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoSheetmetalMaster addSheetmetalMaster() methods finally block---");
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteSheetmetalMaster(String drawingNo){
		Session session = null;
		SheetmetalMaster a1 = null;
		 try{
			 System.out.println("---Inside dao.DaoSheetmetalMaster deleteAbnormality() methods try block---");
			 session = HibernateConfig.getSession();
			// System.out.println("abid->"+abid);
			 a1 = (SheetmetalMaster) session.load(SheetmetalMaster.class, drawingNo);
			 session.delete(a1);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoSheetmetalMaster deleteAbnormality() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoSheetmetalMaster deleteAbnormality() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateSheetmetalMaster(SheetmetalMaster sheetmetalMaster){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(sheetmetalMaster);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 System.out.println("---Error Inside dao.DaoSheetmetalMaster updateSheetmetalMaster() methods catch block---"+sheetmetalMaster);
				 ex.printStackTrace();
			 }finally{
				 System.out.println("---Inside dao.DaoSheetmetalMaster updateSheetmetalMaster() methods finally block---");
				 if(session != null){
					 session.close();
				 }
			 }
		}
	
	
	
}
