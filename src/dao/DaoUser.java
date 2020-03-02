package dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import hibernateConnect.HibernateConfig;
import model.User;

public class DaoUser {

	@SuppressWarnings("unchecked")
	public List<User> getAllUser(String jtSorting) {
		Session session =  null;
		List<User> list = null;
		
		try{
			System.out.println("--Inside dao.DaoUser getAllUser() methods try Block--");
			session = HibernateConfig.getSession();
			session.beginTransaction();
			Criteria cr = session.createCriteria(User.class);
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
			System.out.println("--- Error Inside dao.DaoUser getAllUser() methods catch block---");
			ex.printStackTrace();
		}finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoUser getAllUser() methods finally Block--");
				session.close();
			}			
		}
		return list;
	}

	public void addUser(User user) {
		Session session = null;
		
		System.out.println("User Id " + user.getUserid());
		 try{
			 
			 System.out.println("---Inside dao.DaoUser addUser() methods try block---");
			 session = HibernateConfig.getSession();
			 session.beginTransaction();
			 session.save(user);
			 
			 System.out.println("User Id " + user.getUserid());
			 session.getTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoUser addUser() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoUser addUser() methods finally block---");
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteUser(String userid){
		Session session = null;
		User user = null;
		 try{
			 System.out.println("---Inside dao.DaoUser deleteUser() methods try block---");
			 session = HibernateConfig.getSession();
			 System.out.println("abid->"+userid);
			 user = (User) session.load(User.class, userid);
			 session.delete(user);
			 
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			 System.out.println("---Error Inside dao.DaoUser deleteUser() methods catch block---");
			 ex.printStackTrace();
		 }finally{
			 System.out.println("---Inside dao.DaoUser deleteUser() methods finally block---");
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateUser(User user){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 
			 
				 session.update(user);
				 
				 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
				 System.out.println("---Error Inside dao.DaoUser updateUser() methods catch block---"+user);
				 ex.printStackTrace();
			 }finally{
				 System.out.println("---Inside dao.DaoUser updateUser() methods finally block---");
				 if(session != null){
					 session.close();
				 }
			 }
		}
	
}
