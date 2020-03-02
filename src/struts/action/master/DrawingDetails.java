package struts.action.master;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


import org.hibernate.Criteria;

import org.hibernate.Session;



import beans.SheetmetalMaster;

import hibernateConnect.HibernateConfig;

public class DrawingDetails {

	private Map<String,String> drawingList;
	
	@SuppressWarnings("unchecked")
	public String getDrawingDetails()
	{
		
	List<SheetmetalMaster> sheetMasters=null;
		Session session=null;
			session = HibernateConfig.getSession();
	
			try {

			
			session.beginTransaction();
			Criteria cr = session.createCriteria(SheetmetalMaster.class);
			 sheetMasters= cr.list();
						 
			drawingList= new LinkedHashMap<String,String>();
			for(SheetmetalMaster a:sheetMasters)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				drawingList.put(a.getDrawingNo(), a.getDescription());
			}
			
			return "success";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{
			session.close();
			
		}
	}

	public Map<String, String> getDrawingList() {
		return drawingList;
	}

	public void setDrawingList(Map<String, String> drawingList) {
		this.drawingList = drawingList;
	}

	

		
	
}
