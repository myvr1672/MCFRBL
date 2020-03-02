package struts.action.master;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import dao.DaoMaterialShortage;
import hibernateConnect.HibernateConfig;
import beans.MaterialShortage;

public class ActionOnMaterialShortageAction {

	private Integer abid;
	private String actionPerformed;
	boolean res;
	private String remarks;
	private String status;
	private DaoMaterialShortage dao = new DaoMaterialShortage();
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	MaterialShortage record = new MaterialShortage();
	public String assignActionPerformed()
	{
		Session session = null;
	
		try {
		         
			if(abid!=null)
			{
			
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
				Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
				//record.setAbid(abid);
				
				session = HibernateConfig.getSession();
				record = (MaterialShortage)session.get(MaterialShortage.class,abid);	
				
			record.setActionPerformed(actionPerformed);
			record.setRemarks(remarks);
			record.setStatus(status);
			record.setRemarkEntryDate(sdf.format(timestamp));
			record.setRemarkEntryBy(userID);  
			
			}
			getDao().updateMaterialShortage(record);  
				res=true;	
			return "success";
			}
		
		
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			return null;
			}
		finally{
			session.close();
		}
	}
	
	

	public DaoMaterialShortage getDao() {
		return dao;
	}



	public void setDao(DaoMaterialShortage dao) {
		this.dao = dao;
	}



	public MaterialShortage getRecord() {
		return record;
	}



	public void setRecord(MaterialShortage record) {
		this.record = record;
	}



	public Integer getAbid() {
		return abid;
	}



	public void setAbid(Integer abid) {
		this.abid = abid;
	}



	public String getActionPerformed() {
		return actionPerformed;
	}

	public void setActionPerformed(String actionPerformed) {
		this.actionPerformed = actionPerformed;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	

public boolean isRes() {
	return res;
}



public String getStatus() {
	return status;
}



public void setStatus(String status) {
	this.status = status;
}



public void setRes(boolean res) {
	this.res = res;
}

}
