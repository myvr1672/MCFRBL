package ACTION;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import dao.*;
import hibernateConnect.HibernateConfig;

import java.io.IOException;
import beans.*;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


public class MachineFIRMasterAction extends ActionSupport{ 
	

private static final long serialVersionUID = 1L;

	private  MachineFIRMasterDao dao = new MachineFIRMasterDao();
	
    private List<MachineFIRMaster> records;
	private String result;
	private String message;
	private MachineFIRMaster record;
	private String failure_code;
	private String failure_description;
	    
	
	//private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	
	public String getJtStartIndex() {
		return jtStartIndex;
	}





	public void setJtStartIndex(String jtStartIndex) {
		this.jtStartIndex = jtStartIndex;
	}





	public String getJtPageSize() {
		return jtPageSize;
	}





	public void setJtPageSize(String jtPageSize) {
		this.jtPageSize = jtPageSize;
	}





	public int getTotalRecordCount() {
		return totalRecordCount;
	}





	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}





	public MachineFIRMasterDao getDao() {
		return dao;
	}





	public void setDao(MachineFIRMasterDao dao) {
		this.dao = dao;
	}





	public List<MachineFIRMaster> getRecords() {
		return records;
	}





	public void setRecords(List<MachineFIRMaster> records) {
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





	public MachineFIRMaster getRecord() {
		return record;
	}





	public void setRecord(MachineFIRMaster record) {
		this.record = record;
	}





	public String getFailure_code() {
		return failure_code;
	}





	public void setFailure_code(String failure_code) {
		this.failure_code = failure_code;
	}





	public String getFailure_description() {
		return failure_description;
	}





	public void setFailure_description(String failure_description) {
		this.failure_description = failure_description;
	}





	



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String list() {
		try {
			
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);

			setRecords(getDao().getAllMachineFIRMaster(startPageIndex, numRecordsPerPage));
			totalRecordCount= (Integer) session_map.get("holding_count");
			session_map.remove("holding_count");


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
		
	    
	    
		
		record = new MachineFIRMaster();
		
	   record.setFailure_code(failure_code);
		record.setFailure_description(failure_description);
		
		try {
						
			
			dao.addMachineFIRMaster(record);
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
		record = new MachineFIRMaster();
		Session session = null;
		session = HibernateConfig.getSession();
		
			
			try {
				record=(MachineFIRMaster) session.get(MachineFIRMaster.class, failure_code);
				record.setFailure_description(failure_description);
		    getDao().updateMachineFIRMaster(record);
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
			
		getDao().deleteMachineFIRMaster(failure_code);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
}