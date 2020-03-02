package ACTION;
import com.opensymphony.xwork2.ActionSupport;

import beans.SafetyInstructionMaster;
import dao.*;
import hibernateConnect.HibernateConfig;

import java.io.IOException;
//import model.*;
import java.util.List;

//import org.hibernate.Criteria;
import org.hibernate.Session;
//import org.hibernate.criterion.Restrictions;


public class SafetyInstructionMasterAction extends ActionSupport{ 
	

private static final long serialVersionUID = 1L;

	private  SafetyInstructionMasterDao dao = new SafetyInstructionMasterDao();
	
    private List<SafetyInstructionMaster> records;
	private String result;
	private String message;
	private SafetyInstructionMaster record;
	private Integer safety_instruction_id;
	private String safety_instruction_description;
	
    
	
	
	


	public SafetyInstructionMasterDao getDao() {
		return dao;
	}





	public void setDao(SafetyInstructionMasterDao dao) {
		this.dao = dao;
	}





	public List<SafetyInstructionMaster> getRecords() {
		return records;
	}





	public void setRecords(List<SafetyInstructionMaster> records) {
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





	public SafetyInstructionMaster getRecord() {
		return record;
	}





	public void setRecord(SafetyInstructionMaster record) {
		this.record = record;
	}





	public Integer getSafety_instruction_id() {
		return safety_instruction_id;
	}





	public void setSafety_instruction_id(Integer safety_instruction_id) {
		this.safety_instruction_id = safety_instruction_id;
	}





	public String getSafety_instruction_description() {
		return safety_instruction_description;
	}





	public void setSafety_instruction_description(String safety_instruction_description) {
		this.safety_instruction_description = safety_instruction_description;
	}





	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	public String list() {
		try {
			
			
			setRecords(getDao().getAllSafetyInstructionMaster());
			
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
		
	    
	    
		
		record = new SafetyInstructionMaster();
		
	   record.setSafety_instruction_id(safety_instruction_id);
		record.setSafety_instruction_description(safety_instruction_description);
		
		try {
						
			
			dao.addSafetyInstructionMaster(record);
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
		record = new SafetyInstructionMaster();
		Session session = null;
		
		
		record.setSafety_instruction_id(safety_instruction_id);
		record.setSafety_instruction_description(safety_instruction_description);
			
			try {
				session = HibernateConfig.getSession();
				 session.update(record);
			 session.beginTransaction().commit();
		    getDao().updateSafetyInstructionMaster(record);;
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
		
		
		
		
		
	}
	
	public String delete() throws IOException {
		try {
			
		getDao().deleteSafetyInstructionMaster(safety_instruction_id);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
}