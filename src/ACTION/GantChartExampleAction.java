package ACTION;

import java.util.List;

import org.hibernate.Criteria;

import org.hibernate.Session;

import beans.GantChartExample;
import hibernateConnect.HibernateConfig;
public class GantChartExampleAction {
    
	private List<GantChartExample> gantChartExample;
	Session session =  null;
	@SuppressWarnings("unchecked")
	public String getData()
	{
		
		session = HibernateConfig.getSession();
		session.beginTransaction();
		
		Criteria criteria = session.createCriteria(GantChartExample.class);
		
		gantChartExample= criteria.list();
		//System.out.println("Hi navin"+gantChartExample.toString());
		return "success";
	}
	public List<GantChartExample> getGantChartExample() {
		return gantChartExample;
	}
	public void setGantChartExample(List<GantChartExample> gantChartExample) {
		this.gantChartExample = gantChartExample;
	}
	
	
}
