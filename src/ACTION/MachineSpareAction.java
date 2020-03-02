package ACTION;
import com.opensymphony.xwork2.ActionSupport;


import dao.*;
import hibernateConnect.HibernateConfig;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import beans.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


@SuppressWarnings("serial")
public class MachineSpareAction extends ActionSupport{ 
	



	private  MachineSpareDao dao = new MachineSpareDao();
	
    private List<MachineSpare> records;
	private String result;
	private String message;
	private MachineSpare record;
	private Integer spareId;
	private String spareDescription;
	private Integer machineId;
	private Timestamp createdDate;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	
	public MachineSpareDao getDao() {
		return dao;
	}




	public void setDao(MachineSpareDao dao) {
		this.dao = dao;
	}




	public List<MachineSpare> getRecords() {
		return records;
	}




	public void setRecords(List<MachineSpare> records) {
		this.records = records;
	}




	public String getResult() {
		return result;
	}




	public void setResult(String result) {
		this.result = result;
	}




	public String getMessage() {
		return message;
	}




	public void setMessage(String message) {
		this.message = message;
	}




	public MachineSpare getRecord() {
		return record;
	}




	public void setRecord(MachineSpare record) {
		this.record = record;
	}




	public Integer getSpareId() {
		return spareId;
	}




	public void setSpareId(Integer spareId) {
		this.spareId = spareId;
	}




	public String getSpareDescription() {
		return spareDescription;
	}




	public void setSpareDescription(String spareDescription) {
		this.spareDescription = spareDescription;
	}




	

	public Integer getMachineId() {
		return machineId;
	}




	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}




	



	public Timestamp getCreatedDate() {
		return createdDate;
	}




	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}




	public String list() {
		try {
			
			
			setRecords(getDao().getAllMachineSpare());
			
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
		
	    
	    try{
	    	
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new MachineSpare();
		record.setSpareId(spareId);
		record.setMachineId(machineId);
		record.setSpareDescription(spareDescription);
	   
	    record.setCreatedDate(timestamp);
		record.setEntryBy(userID);
		
		
		
						
			dao.addMachineSpare(record);
			setResult("OK");
		} 
		catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
				return ActionSupport.SUCCESS;	
	}
		

	public String update() throws IOException {			
		
		Session session = null;
		session = HibernateConfig.getSession();
			try {
			
				
				Timestamp timestamp= new Timestamp(System.currentTimeMillis());
				record = new MachineSpare();
				
				
				record=(MachineSpare) session.get(MachineSpare.class, spareId);
				 record.setSpareDescription(spareDescription);
				   
				   
		    getDao().updateMachineSpare(record);
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
			finally {
				if(session!=null)
				{
					session.close();
				}
			}
		return ActionSupport.SUCCESS;
		
		
		
		
		
	}
	
	public String delete() throws IOException {
		try {
			
		getDao().deleteMachineSpare(spareId);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}


	

	
}