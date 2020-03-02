package struts.action.master;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import dao.DaoAbnormality;
import hibernateConnect.HibernateConfig;
import model.Abnormality;
import model.User;


public class ActionOnAbnormalityAction {

	private Integer abid;
	private String actionPerformed;
	boolean res;
	private String remarks;
	private String status;
	private DaoAbnormality dao = new DaoAbnormality();
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	Abnormality record = new Abnormality();
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
				record = (Abnormality)session.get(Abnormality.class,abid);	
				
			record.setActionPerformed(actionPerformed);
			record.setRemarks(remarks);
			record.setStatus(status);
			record.setRemarkEntrydate(sdf.format(timestamp));
			record.setRemarkEntryBy(userID);  
			
			}
			getDao().updateAbnormality(record);  
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
	public DaoAbnormality getDao() {
		return dao;
	}
   public void setDao(DaoAbnormality dao) {
		this.dao = dao;
	}

public Abnormality getRecord() {
	return record;
}

public void setRecord(Abnormality record) {
	this.record = record;
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