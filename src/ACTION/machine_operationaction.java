package ACTION;
import com.opensymphony.xwork2.ActionSupport;
import dao.*;
import java.io.IOException;
import model.*;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class machine_operationaction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  machine_operationdao dao = new machine_operationdao();
	
    private List<machine_operation> records;
	private String result;
	private String message;
	private machine_operation record;
	private Integer id;
	private String operation;
	
	//private String jtSorting;//for sorting
	
	public machine_operationdao getDao() {
		return dao;
	}


	public void setDao(machine_operationdao dao) {
		this.dao = dao;
	}


	public List<machine_operation> getRecords() {
		return records;
	}


	public void setRecords(List<machine_operation> records) {
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


	public machine_operation getRecord() {
		return record;
	}


	public void setRecord(machine_operation record) {
		this.record = record;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getOperation() {
		return operation;
	}


	public void setOperation(String operation) {
		this.operation = operation;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	


	public String list() {
		try {
			setRecords(getDao().getAllmachine_operation());
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
		
	    
		
		record = new machine_operation();
		
	   record.setId(id);
		record.setOperation(operation);
		
		try {
						
			
			dao.addmachine_operation(record);
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
		record = new machine_operation();
		
		 record.setId(id);
			record.setOperation(operation);
			Session session=null;
			 //record.setMachine_id(machine_id);
			Criteria cr1 = session.createCriteria(MachineBreakdown1.class);
			
			cr1.add(Restrictions.eq("id", id));
			
	
		try {
		    getDao().updatemachine_operation(record);;
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		
		return ActionSupport.SUCCESS;
	}
	
	public String delete() throws IOException {
		try {
			
		getDao().deletemachine_operation(id);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
}