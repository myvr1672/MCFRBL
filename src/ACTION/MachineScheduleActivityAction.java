package ACTION;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.MachineScheduleActivityDao;
import hibernateConnect.HibernateConfig;

import java.io.IOException;
import java.sql.Timestamp;

import beans.*;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

public class MachineScheduleActivityAction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  MachineScheduleActivityDao dao = new MachineScheduleActivityDao();
	
   

	private List<MachineScheduleActivity> records;
	
	private String result;
	private String message;
	private MachineScheduleActivity record;
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	
    
	private MachineScheduleActivity machine=new MachineScheduleActivity();

	
	private String activityNo;
	private String activityDescription;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private Timestamp entryDate;
	public Timestamp getEntryDate() {
		return entryDate;
	}


	public void setEntryDate(Timestamp entryDate) {
		this.entryDate = entryDate;
	}


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


	public MachineScheduleActivityDao getDao() {
		return dao;
	}


	public void setDao(MachineScheduleActivityDao dao) {
		this.dao = dao;
	}


	public List<MachineScheduleActivity> getRecords() {
		return records;
	}


	public void setRecords(List<MachineScheduleActivity> records) {
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


	public MachineScheduleActivity getRecord() {
		return record;
	}


	public void setRecord(MachineScheduleActivity record) {
		this.record = record;
	}


	public MachineScheduleActivity getMachine() {
		return machine;
	}


	public void setMachine(MachineScheduleActivity machine) {
		this.machine = machine;
	}


	public String getActivityNo() {
		return activityNo;
	}


	public void setActivityNo(String activityNo) {
		this.activityNo = activityNo;
	}


	public String getActivityDescription() {
		return activityDescription;
	}


	public void setActivityDescription(String activityDescription) {
		this.activityDescription = activityDescription;
	}


	public String list() {
		try {
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(getDao().getMachineScheduleActivity(startPageIndex, numRecordsPerPage));
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
		
	    
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new MachineScheduleActivity();
		
	    record.setActivityNo(activityNo);
		record.setActivityDescription(activityDescription);
		record.setEntryBy(userID);
		record.setEntryDate(timestamp);
		try {
						
			
			getDao().addMachineScheduleActivity(record);
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
	Session	session=null;
	session=HibernateConfig.getSession();
	record=(MachineScheduleActivity) session.get(MachineScheduleActivity.class, activityNo);
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		// record.setActivityNo(activityNo);
			record.setActivityDescription(activityDescription);	
			record.setEntryBy(userID);
			record.setEntryDate(timestamp);
	
		try {
		    getDao().updateMachineScheduleActivity(record);
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
	
	public String delete() throws IOException {
		try {
			
		getDao().deleteMachineScheduleActivity(activityNo);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
}