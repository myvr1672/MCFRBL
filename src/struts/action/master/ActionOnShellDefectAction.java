package struts.action.master;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import dao.DaoShellDefect;
import hibernateConnect.HibernateConfig;
import beans.ShellDefectsTransaction;

public class ActionOnShellDefectAction {
	private Integer abid;
	private String actionPerformed;
	boolean res;
	private String remarks;
	private String status;
	private DaoShellDefect dao = new DaoShellDefect();
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	ShellDefectsTransaction record = new ShellDefectsTransaction();
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
				record = (ShellDefectsTransaction)session.get(ShellDefectsTransaction.class,abid);	
				
			record.setActionPerformed(actionPerformed);
			record.setRemarks(remarks);
			record.setStatus(status);
			record.setRemarkEntryDate(sdf.format(timestamp));
			record.setRemarkEntryBy(userID);  
			
			}
			getDao().updateShellDefect(record);  
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
	public boolean isRes() {
		return res;
	}
	public void setRes(boolean res) {
		this.res = res;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public DaoShellDefect getDao() {
		return dao;
	}
	public void setDao(DaoShellDefect dao) {
		this.dao = dao;
	}
	
	public ShellDefectsTransaction getRecord() {
		return record;
	}
	public void setRecord(ShellDefectsTransaction record) {
		this.record = record;
	}
	
	

	
}
