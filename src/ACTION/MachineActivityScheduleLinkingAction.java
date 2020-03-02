package ACTION;
import com.opensymphony.xwork2.ActionSupport;

import dao.MachineActivityScheduleLinkingDao;

import hibernateConnect.HibernateConfig;
import beans.MachineActivityScheduleLinking;
//import beans.MachineMaster;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;

public class MachineActivityScheduleLinkingAction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  MachineActivityScheduleLinkingDao dao = new MachineActivityScheduleLinkingDao();
	
	private List<MachineActivityScheduleLinking> records;
	private String result;
	private String message;
	private MachineActivityScheduleLinking record;
	
	private Integer machineScheduleLinkId;
	
	private String scheduleType;
	private String activityId;
	//private String activityDescription;
	private Integer machineId;
	private Timestamp entryDate;
    private String entryBy;
	
	public String list() {
		try {
			setRecords(getDao().getAllMachineActivityScheduleLinking(machineId,scheduleType));
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
		
	    
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		record = new MachineActivityScheduleLinking();
		record.setMachineScheduleLinkId(machineScheduleLinkId);
		record.setMachineId(machineId);
		record.setScheduleType(scheduleType);
		//record.setActivityId(activityId);
		record.setActivityId(activityId);
		record.setEntryDate(timestamp);
		record.setEntryBy(entryBy);
		
		//dao.addMachineMaster1(record);
			try {
				/*if(!"".equals(pODate))	{record.setpODate(sdf.parse(pODate));}
				if(!"".equals(dateOfCommissioned)) {record.setDateOfCommissioned(sdf.parse(dateOfCommissioned));}*/
				getDao().addMachineActivityScheduleLinking(record);
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
		
		//SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yy");

		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
  
		record = new MachineActivityScheduleLinking();
	    Session session=null;
	    session=HibernateConfig.getSession();
	   record = (MachineActivityScheduleLinking)session.get(MachineActivityScheduleLinking.class, machineScheduleLinkId);
	   record.setMachineScheduleLinkId(machineScheduleLinkId);
	   record.setEntryDate(timestamp);
		record.setScheduleType(scheduleType);
		//record.setActivityId(activityId);
		record.setActivityId(activityId);
	    
		try {
			/*if(!"".equals(pODate))	{record.setpODate(sdf.parse(pODate));}
			if(!"".equals(dateOfCommissioned)) {record.setDateOfCommissioned(sdf.parse(dateOfCommissioned));}*/
			session.update(record);
			 session.beginTransaction().commit();
			 getDao().updateMachineActivityScheduleLinking(record);;
		    
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
			
		getDao().deleteMachineActivityScheduleLinking(machineScheduleLinkId);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}








	public MachineActivityScheduleLinkingDao getDao() {
		return dao;
	}








	public void setDao(MachineActivityScheduleLinkingDao dao) {
		this.dao = dao;
	}








	public List<MachineActivityScheduleLinking> getRecords() {
		return records;
	}








	public void setRecords(List<MachineActivityScheduleLinking> records) {
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








	public MachineActivityScheduleLinking getRecord() {
		return record;
	}








	public void setRecord(MachineActivityScheduleLinking record) {
		this.record = record;
	}








	public Integer getMachineScheduleLinkId() {
		return machineScheduleLinkId;
	}








	public void setMachineScheduleLinkId(Integer machineScheduleLinkId) {
		this.machineScheduleLinkId = machineScheduleLinkId;
	}








	public String getScheduleType() {
		return scheduleType;
	}








	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}








	public String getActivityId() {
		return activityId;
	}








	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}








	public Integer getMachineId() {
		return machineId;
	}








	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
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








	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	

	
}



