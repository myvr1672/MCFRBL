package dao;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;
import beans.EmployeeSection;
import hibernateConnect.HibernateConfig;
public class EmployeeSectionDao {

	
	   public List<EmployeeSection>getSectionByShop(String shop)
	   {
		   Session session=null;
		   try{
			   session = HibernateConfig.getSession();
			   session.beginTransaction();
			   Criteria cr= session.createCriteria(EmployeeSection.class);
			   cr.add(Restrictions.eq("parentSubsectionId",shop));
			   @SuppressWarnings("unchecked")
			List<EmployeeSection> sectionList= cr.list();
			   return sectionList;
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
			   return null;
		   }
		   finally{
			   session.close();
		   }
		   
		   
	   }
}
