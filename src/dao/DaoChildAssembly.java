package dao;


import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import beans.MachineSpareLinking;
import hibernateConnect.HibernateConfig;
public class DaoChildAssembly {

	public List<MachineSpareLinking> getAllSubAssembly(String jtSorting, Integer parentId, Integer childLevel) {
		Session session =  null;
		List<MachineSpareLinking> list = null;
		try{
			System.out.println("--Inside dao.DaoChildAssembly getAllSubAssembly() methods try Block--");
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(MachineSpareLinking.class);
	
			cr.add(Restrictions.eq("parentId", parentId));
			cr.add(Restrictions.eq("childLevel", childLevel));
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
		}
		catch(Exception ex){
			System.out.println("--- Error Insidedao.DaoChildAssembly getAllSubAssembly() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoChildAssembly getAllSubAssembly() methods finally Block--");
				session.close();
			}			
		}
		return list;
	}

	public void addAllSubAssembly(MachineSpareLinking record) {
		Session session =  null;
		try{
		session = HibernateConfig.getSession();
		session.save(record);
		session.beginTransaction().commit();
		}
		catch(Exception Ex)
		{
			Ex.printStackTrace();
		}
		finally
		{
			if(session!=null){
				session.close();
			}
		}
		
	}

	public void updateAllSubAssembly(MachineSpareLinking record) {
		Session session =  null;
		try{
		session = HibernateConfig.getSession();
		session.update(record);
		session.beginTransaction().commit();
		}
		catch(Exception Ex)
		{
			Ex.printStackTrace();
		}
		finally
		{
			if(session!=null){
				session.close();
			}
		}
		
	}

}
