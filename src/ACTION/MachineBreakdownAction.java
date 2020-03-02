package ACTION;
import com.opensymphony.xwork2.ActionSupport;
import dao.*;
import java.io.IOException;
import model.*;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Session;

public class MachineBreakdownAction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  MachineBreakdownDao dao = new MachineBreakdownDao();
	
    private List<MachineBreakdown1> records;
	private String result;
	private String message;
	private MachineBreakdown1 record;
	private Integer machine_id;
	private String breakdown_details;
	private String completionDate;
	//private String jtSorting;//for sorting
	public  MachineBreakdownDao getDao() {
		return dao;
	}

	public void setDao( MachineBreakdownDao dao) {
		this.dao = dao;
	}

	

	public List<MachineBreakdown1> getRecords() {
		return records;
	}

	public void setRecords(List< MachineBreakdown1> records) {
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

	public  MachineBreakdown1 getRecord() {
		return record;
	}

	public void setRecord( MachineBreakdown1 record) {
		this.record = record;
	}

	
	

		public Integer getMachine_id() {
		return machine_id;
	}

	public void setMachine_id(Integer machine_id) {
		this.machine_id = machine_id;
	}

	public String getBreakdown_details() {
		return breakdown_details;
	}

	public void setBreakdown_details(String breakdown_details) {
		this.breakdown_details = breakdown_details;
	}

		public String list() {
		try {
			setRecords(getDao().getAllMachineBreakdownDetails());
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
		
	    
		
		record = new  MachineBreakdown1();
		
	   //record.setMachine_id(machine_id);
		record.setBreakdown_details(breakdown_details);
	
		try {
						
			
			dao.addMachineBreakdownDetails(record);
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
		record = new  MachineBreakdown1();
		Session session=null;
		 //record.setMachine_id(machine_id);
		Criteria cr1 = session.createCriteria(MachineBreakdown1.class);
		
		cr1.add(Restrictions.eq("machine_id", machine_id));
		
		MachineBreakdown1 machine = (MachineBreakdown1)cr1.list().get(0);
			record.setBreakdown_details(breakdown_details);
			try {
		    getDao().updateMachineBreakdownDetails(record);;
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
		Session session=null;
		try {
			
			 //record.setMachine_id(machine_id);
			Criteria cr1 = session.createCriteria(MachineBreakdown1.class);
			
			cr1.add(Restrictions.eq("machine_id", machine_id));
			
			MachineBreakdown1 machine = (MachineBreakdown1)cr1.list().get(0);	
		getDao().deleteMachineBreakdownDetails(machine_id);			
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
}