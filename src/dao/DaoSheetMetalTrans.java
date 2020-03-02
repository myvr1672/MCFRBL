package dao;


import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import hibernateConnect.HibernateConfig;
import beans.SheetmetalTransaction;
public class DaoSheetMetalTrans {

	@SuppressWarnings("unchecked")
	public List<SheetmetalTransaction> getAllSheetDetails(String jtSorting) {
		Session session =  null;
		List<SheetmetalTransaction> list = null;
			session = HibernateConfig.getSession();
			try{
			System.out.println("--Inside dao.DaoSheetMetalTrans getAllSheetDetails() methods try Block--");
			
			Criteria cr = session.createCriteria(SheetmetalTransaction.class);
			
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
			System.out.println("--- Error Inside dao.DaoSheetMetalTrans getAllSheetDetails() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoSheetMetalTrans getAllSheetDetails() methods finally Block--");
				session.close();
			}			
		}
		return list;
	}

	public void addSheetMetalTran(SheetmetalTransaction sheetmetalTransaction) {
		Session session = null;
		
		System.out.println("Drawing No. " + sheetmetalTransaction.getDrawingNo());
		 try{
			 System.out.println("---Inside dao.DaoSheetMetalTrans addSheetMetalTran() methods try block---");
			 session = HibernateConfig.getSession();
			 
			 session.save(sheetmetalTransaction);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoSheetMetalTrans addSheetMetalTran() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoSheetMetalTrans addSheetMetalTran() methods finally block---");
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteSheetMetalTran(String drawingNo){
		Session session = null;
		SheetmetalTransaction a1 = null;
		 try{
			 System.out.println("---Inside dao.DaoSheetMetalTrans deleteSheetMetalTran methods try block---");
			 session = HibernateConfig.getSession();
			 System.out.println("abid->"+drawingNo);
			 a1 = (SheetmetalTransaction) session.load(SheetmetalTransaction.class, drawingNo);
			 session.delete(a1);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoSheetMetalTrans deleteSheetMetalTran methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoSheetMetalTrans deleteSheetMetalTran() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateSheetMetalTran(SheetmetalTransaction sheetmetalTransaction){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(sheetmetalTransaction);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 System.out.println("---Error Inside dao.DaoSheetMetalTrans updateSheetMetalTran() methods catch block---"+sheetmetalTransaction);
				 ex.printStackTrace();
			 }finally{
				 System.out.println("---Inside dao.DaoSheetMetalTrans updateSheetMetalTran() methods finally block---");
				 if(session != null){
					 session.close();
				 }
			 }
		}
	
	
}
