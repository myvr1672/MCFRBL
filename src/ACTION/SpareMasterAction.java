package ACTION;
import com.opensymphony.xwork2.ActionSupport;


import dao.*;
import hibernateConnect.HibernateConfig;

import java.io.IOException;
import java.sql.Timestamp;


import beans.SpareMaster;


import java.util.List;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.hibernate.Session;



@SuppressWarnings("serial")
public class SpareMasterAction extends ActionSupport{ 
	



	private  SpareMasterDao dao = new SpareMasterDao();
	
    private List<SpareMaster> records;
	private String result;
	private String message;
	private SpareMaster record;
	private Integer spareId;
	private String spareDescription;
	private String drawingNo;
	private Integer selfLife;
	private Integer unitPrice;
	private Timestamp entryDate;
	private String entryBy;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	
	


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
		record = new SpareMaster();
		record.setSpareId(spareId);
		record.setSpareDescription(spareDescription);
		record.setDrawingNo(drawingNo);
		record.setSelfLife(selfLife);
		record.setUnitPrice(unitPrice);
	    record.setEntryDate(timestamp);
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
				record = new SpareMaster();
				
				
				record=(SpareMaster) session.get(SpareMaster.class, spareId);
				record.setSpareDescription(spareDescription);
				record.setDrawingNo(drawingNo);
				record.setSelfLife(selfLife);
				record.setUnitPrice(unitPrice);
				record.setEntryDate(timestamp);  
				record.setEntryBy(entryBy);
				   
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




	public SpareMasterDao getDao() {
		return dao;
	}




	public void setDao(SpareMasterDao dao) {
		this.dao = dao;
	}




	public List<SpareMaster> getRecords() {
		return records;
	}




	public void setRecords(List<SpareMaster> records) {
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




	public SpareMaster getRecord() {
		return record;
	}




	public void setRecord(SpareMaster record) {
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




	public Timestamp getEntryDate() {
		return entryDate;
	}




	public void setEntryDate(Timestamp entryDate) {
		this.entryDate = entryDate;
	}




	public String getEntryBy() {
		return entryBy;
	}




	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}




	public String getDrawingNo() {
		return drawingNo;
	}




	public void setDrawingNo(String drawingNo) {
		this.drawingNo = drawingNo;
	}




	public Integer getSelfLife() {
		return selfLife;
	}




	public void setSelfLife(Integer selfLife) {
		this.selfLife = selfLife;
	}




	public Integer getUnitPrice() {
		return unitPrice;
	}




	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}


	

	
}