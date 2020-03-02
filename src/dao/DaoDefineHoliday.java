package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import org.hibernate.criterion.Restrictions;

import hibernateConnect.HibernateConfig;
import beans.IrwisHrPubhodyM;;

public class DaoDefineHoliday {

	@SuppressWarnings("unchecked")
	public List<IrwisHrPubhodyM> getAllHoliday(String jtSorting) {
		Session session =  null;
		List<IrwisHrPubhodyM> list = null;
		
		try{
			System.out.println("--Inside dao.DaoIrwisHrPubhodyM getAllHoliday() methods try Block--");
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria cr = session.createCriteria(IrwisHrPubhodyM.class);
			
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
			System.out.println("--- Error Inside dao.DaoIrwisHrPubhodyM getAllHoliday() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoIrwisHrPubhodyM getAllHoliday() methods finally Block--");
				session.close();
			}			
		}
		return list;
	}

	public void addHoliday(IrwisHrPubhodyM defineHoliday) {
		Session session = null;
		List<IrwisHrPubhodyM> list = null;
		//List<IrwisHrPubhodyM> list1 = null;
		String hodyType=defineHoliday.getHodyType();
		System.out.println("Holiday Code " + defineHoliday.getHodyCode());
		 try{
			 
			 System.out.println("---Inside dao.DaoIrwisHrPubhodyM addHoliday() methods try block---");
			 session = HibernateConfig.getSession();
			 session.beginTransaction();
			 
			 Criteria cr = session.createCriteria(IrwisHrPubhodyM.class);
			 //Projection projection1 = Projections.property("seq");
			 //ProjectionList p1=Projections.projectionList();
			 //p1.add(projection1);
			 cr.add(Restrictions.eq("hodyType", defineHoliday.getHodyType()));
			 //cr.setProjection(projection1);
			 cr.addOrder(Order.desc("seq"));
			 list=cr.list();
			 int newseq=0;
			 if(list.size()!=0)
		       {
			   newseq=list.get(0).getSeq();
		       }
			 newseq++;
			 if(newseq<10)
			 {
				 defineHoliday.setHodyCode(hodyType+"0"+newseq);
			 }
			 else
			 {
				 defineHoliday.setHodyCode(hodyType+newseq);
			 }
			 defineHoliday.setSeq(newseq);
			 
//			 Criteria cr1 = session.createCriteria(IrwisHrPubhodyM.class);
//			 //Projection projection1 = Projections.property("seq");
//			 //ProjectionList p1=Projections.projectionList();
//			 //p1.add(projection1);
//			 //cr1.add(Restrictions.eq("hodyType", defineHoliday.getHodyType()));
//			 //cr.setProjection(projection1);
//			 cr1.addOrder(Order.desc("sortSeq"));
//			 list1=cr1.list();
//			 int newsortSeq=0;
//			 if(list1.size()!=0)
//		       {
//				 newsortSeq=list1.get(0).getSortSeq();
//		       }
//			 newsortSeq++;
//			 defineHoliday.setSortSeq(newsortSeq);
			 
			 
			 session.save(defineHoliday);
			 session.getTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoIrwisHrPubhodyM addHoliday() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoIrwisHrPubhodyM addHoliday() methods finally block---");
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteHoliday(String holidayCode){
		Session session = null;
		IrwisHrPubhodyM defineHoliday = null;
		 try{
			 System.out.println("---Inside dao.DaoIrwisHrPubhodyM deleteHoliday() methods try block---");
			 session = HibernateConfig.getSession();
			 
			 defineHoliday = (IrwisHrPubhodyM) session.load(IrwisHrPubhodyM.class, holidayCode);
			 session.delete(defineHoliday);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoIrwisHrPubhodyM deleteHoliday() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoIrwisHrPubhodyM deleteHoliday() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateHoliday(IrwisHrPubhodyM defineHoliday){
		Session session = null;
		IrwisHrPubhodyM defineHoliday1 = null;
			 try{
				 session = HibernateConfig.getSession();
				 
				 defineHoliday1 = (IrwisHrPubhodyM) session.load(IrwisHrPubhodyM.class, defineHoliday.getHodyCode());
				 defineHoliday1.setHodyDesc(defineHoliday.getHodyDesc());
				 session.update(defineHoliday1);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 System.out.println("---Error Inside dao.DaoIrwisHrPubhodyM updateHoliday() methods catch block---"+defineHoliday);
				 ex.printStackTrace();
			 }finally{
				 System.out.println("---Inside dao.DaoIrwisHrPubhodyM updateHoliday() methods finally block---");
				 if(session != null){
					 session.close();
				 }
			 }
		}
}
