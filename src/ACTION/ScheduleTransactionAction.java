package ACTION;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import com.opensymphony.xwork2.ActionSupport;


import beans.MachineScheduleTransaction;

import dao.DaoScheduleTransaction;
import hibernateConnect.HibernateConfig;


public class ScheduleTransactionAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	/*HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");*/
	private DaoScheduleTransaction dao = new DaoScheduleTransaction();

	private List<MachineScheduleTransaction> records;
	private String result;
	private String message;
	private MachineScheduleTransaction record;
	private Integer machineId;
	private Integer scheduleId;
	private String scheduleType;
	private String scheduleDate;
	private String scheduleCompleted;
	private String scheduleCompletedDate;
	private Integer scheduleSequence;
	private String jtSorting;//for sorting
	
	public String list() {
		try {
			setRecords(getDao().getAllScheduleTransaction(machineId));
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
		
	    
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		record = new MachineScheduleTransaction();
		record.setMachineId(machineId);
		record.setScheduleId(scheduleId);
		record.setScheduleType(scheduleType);
		//record.setScheduleDate(scheduleDate);
		record.setScheduleCompletedFlag(scheduleCompleted);
		//record.setScheduleCompletedDate(scheduleCompletedDate);
		record.setScheduleSequence(scheduleSequence);
		
		
		//dao.addMachineMaster1(record);
			try {
				if(!"".equals(scheduleDate))	{record.setScheduleDate(sdf.parse(scheduleDate));}
				System.out.println(scheduleDate);
				if(!"".equals(scheduleCompletedDate)) {record.setScheduleCompletedDate(sdf.parse(scheduleCompletedDate));}
				getDao().addScheduleTransaction(record);
				setResult("OK");
		} 
			catch (Exception e) {
			// TODO Auto-generated catch block
				setResult("ERROR");
				setMessage(e.getMessage());
				System.err.println(e.getMessage());
		}
		
				return ActionSupport.SUCCESS;	
	}
		

	public String update() throws IOException {			
		
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");

		
  
		record = new MachineScheduleTransaction();
	    Session session=null;
	    session=HibernateConfig.getSession();
	   record = (MachineScheduleTransaction)session.get(MachineScheduleTransaction.class,scheduleId);
	   record.setScheduleId(scheduleId);
		record.setScheduleType(scheduleType);
	//	record.setScheduleDate(scheduleDate);
		record.setScheduleCompletedFlag(scheduleCompleted);
		//record.setScheduleCompletedDate(scheduleCompletedDate);
		record.setScheduleSequence(scheduleSequence);
	    
		try {
			if(!"".equals(scheduleDate))	{record.setScheduleDate(sdf.parse(scheduleDate));}
			if(!"".equals(scheduleCompletedDate)) {record.setScheduleCompletedDate(sdf.parse(scheduleCompletedDate));}
			session.update(record);
			 session.beginTransaction().commit();
			 getDao().updateScheduleTransaction(record);
		    
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return ActionSupport.SUCCESS;
	}
	
	public String delete() throws IOException {
		try {
			
		getDao().deleteScheduleTransaction(scheduleId);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}








	



	public DaoScheduleTransaction getDao() {
		return dao;
	}








	public void setDao(DaoScheduleTransaction dao) {
		this.dao = dao;
	}








	public List<MachineScheduleTransaction> getRecords() {
		return records;
	}








	public void setRecords(List<MachineScheduleTransaction> records) {
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








	public MachineScheduleTransaction getRecord() {
		return record;
	}








	public void setRecord(MachineScheduleTransaction record) {
		this.record = record;
	}








	public Integer getMachineId() {
		return machineId;
	}








	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}








	public Integer getScheduleId() {
		return scheduleId;
	}








	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}








	public String getScheduleType() {
		return scheduleType;
	}








	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}








	public String getScheduleDate() {
		return scheduleDate;
	}








	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}








	public String getScheduleCompleted() {
		return scheduleCompleted;
	}








	public void setScheduleCompleted(String scheduleCompleted) {
		this.scheduleCompleted = scheduleCompleted;
	}








	public String getScheduleCompletedDate() {
		return scheduleCompletedDate;
	}








	public void setScheduleCompletedDate(String scheduleCompletedDate) {
		this.scheduleCompletedDate = scheduleCompletedDate;
	}








	public Integer getScheduleSequence() {
		return scheduleSequence;
	}








	public void setScheduleSequence(Integer scheduleSequence) {
		this.scheduleSequence = scheduleSequence;
	}








	public String getJtSorting() {
		return jtSorting;
	}








	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}








	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
