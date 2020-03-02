package dao;


import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import hibernateConnect.HibernateConfig;
import model.EmployeeJobMaster;

public class DaoEmployeeJobMaster {

	public DaoEmployeeJobMaster() {
		// TODO Auto-generated constructor stub
	}
	@SuppressWarnings("unchecked")
	public List<EmployeeJobMaster> getAllEmployee(String jtSorting) {
			Session session =  null;
			List<EmployeeJobMaster> list = null;
		
			try{
				session = HibernateConfig.getSession();
				session.beginTransaction();
				Criteria cr = session.createCriteria(EmployeeJobMaster.class);
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

		public void addEmployeeJobMaster(EmployeeJobMaster asset) {
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
		
		public void deleteEmployeeJobMaster(String job_id){
			Session session = null;
			EmployeeJobMaster a1 = null;
			 try{
				
				 session = HibernateConfig.getSession();
				 System.out.println("jobid->"+job_id);
				 a1 = (EmployeeJobMaster) session.load(EmployeeJobMaster.class, job_id);
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
		
		public void updateEmployeeJobMaster(EmployeeJobMaster record){
			Session session = null;
				 try{
					 session = HibernateConfig.getSession();
					 session.update(record);
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
