package struts.action.master;

import java.util.List;


import org.hibernate.Criteria;

import org.hibernate.Session;

import beans.SpareMaster;
import hibernateConnect.HibernateConfig;
public class OptionforAssemblyDropdown {
	private Integer parentId;
	
	private List <SpareMaster> spareList;
	Session session =null;
	@SuppressWarnings("unchecked")
	public String getsSubAssebly()
	{
		Session session = HibernateConfig.getSession();
		try
		{
			Criteria cr= session.createCriteria(SpareMaster.class);
			spareList=  cr.list();
			System.out.println(spareList.size());
	//	for (SpareMaster s: spareList)
			for (int i=0; i<spareList.size();i++)
		{
			System.out.print(spareList.get(i).getSpareDescription());
		}
		}
		catch(Exception ex)
		{
		ex.printStackTrace();
		return null;
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		
		return "success";
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public List<SpareMaster> getSpareList() {
		return spareList;
	}
	public void setSpareList(List<SpareMaster> spareList) {
		this.spareList = spareList;
	}
	
	
	
}
