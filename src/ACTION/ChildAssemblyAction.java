package ACTION;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;

import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionSupport;


import beans.MachineSpareLinking;

import dao.DaoChildAssembly;
import hibernateConnect.HibernateConfig;

public class ChildAssemblyAction extends ActionSupport{
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoChildAssembly dao = new DaoChildAssembly();
private static final long serialVersionUID = 1L;
private List<MachineSpareLinking> records;
private MachineSpareLinking record;
private String message;
private String result;
private Integer parentId;
private Integer childLevel;
private Integer spareId;
private Integer qty;
private String jtSorting;//for sorting

public String list() {
	try {
		setRecords(getDao().getAllSubAssembly(jtSorting, parentId, childLevel));
		
		System.out.println("Records = "+getRecords());
		setResult("OK");
	} catch (Exception e) {
		setResult("ERROR");
		setMessage(e.getMessage());
		System.err.println(e.getMessage());
	}
	return ActionSupport.SUCCESS;
}

public String create() throws IOException {
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Timestamp timestamp= new Timestamp(System.currentTimeMillis());
	record = new MachineSpareLinking();
	Session session =  null;
	session = HibernateConfig.getSession();
	record.setSpareId(spareId);
	record.setParentId(parentId);
	record.setChildLevel(childLevel);
	record.setQty(qty);
     record.setEntryBy(userID);
     record.setEntryDate(timestamp);
	System.out.println("Add Assembly call");
	try {
		
		
		getDao().addAllSubAssembly(record);
		
		
		setResult("OK");
	} catch (Exception e) {
		setResult("ERROR");
		setMessage(e.getMessage());
		System.err.println(e.getMessage());
	}
	finally{
		if(session!=null)
		{
			session.close();
		}
	}
	return ActionSupport.SUCCESS;
}

public String update() throws IOException {			
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
	Session session =  null;
	try {
	
		
		session = HibernateConfig.getSession();
		Criteria cr=session.createCriteria(MachineSpareLinking.class);
		cr.add(Restrictions.eq("spareId", spareId));
		cr.add(Restrictions.eq("parentId",parentId));
		cr.add(Restrictions.eq("childLevel",childLevel));
		record = (MachineSpareLinking) cr.list().get(0);
		record.setQty(qty);
		record.setEntryDate(timestamp);
		record.setEntryBy(userID);
	  
		getDao().updateAllSubAssembly(record);  //code here
		setResult("OK");
	} catch (Exception e) {
		setResult("ERROR");
		setMessage(e.getMessage());
		System.err.println(e.getMessage());
	}
	finally
	{
		session.close();
	}
	return ActionSupport.SUCCESS;
}

public DaoChildAssembly getDao() {
	return dao;
}
public void setDao(DaoChildAssembly dao) {
	this.dao = dao;
}
public List<MachineSpareLinking> getRecords() {
	return records;
}
public void setRecords(List<MachineSpareLinking> records) {
	this.records = records;
}
public MachineSpareLinking getRecord() {
	return record;
}
public void setRecord(MachineSpareLinking record) {
	this.record = record;
}
public String getResult() {
	return result;
}
public void setResult(String result) {
	this.result = result;
}
public Integer getParentId() {
	return parentId;
}
public void setParentId(Integer parentId) {
	this.parentId = parentId;
}
public Integer getSpareId() {
	return spareId;
}
public void setSpareId(Integer spareId) {
	this.spareId = spareId;
}
public Integer getQty() {
	return qty;
}
public void setQty(Integer qty) {
	this.qty = qty;
}
public String getJtSorting() {
	return jtSorting;
}
public void setJtSorting(String jtSorting) {
	this.jtSorting = jtSorting;
}


public String getMessage() {
	return message;
}


public void setMessage(String message) {
	this.message = message;
}

public Integer getChildLevel() {
	return childLevel;
}

public void setChildLevel(Integer childLevel) {
	this.childLevel = childLevel;
}





}
