package ACTION;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import com.opensymphony.xwork2.ActionSupport;
import beans.MachineScheduleTransaction;
import dao.DaoMachineScheduleTransaction;
import hibernateConnect.HibernateConfig;


public class ScheduleAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoMachineScheduleTransaction dao = new DaoMachineScheduleTransaction();

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
	
	private String jtSorting;//for sorting
	
	

	
	public String list() {
		try {
			setRecords(getDao().getAllSchedule(jtSorting,machineId));
			
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
		//SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		//Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new MachineScheduleTransaction();
		record.setMachineId(machineId);
		record.setScheduleCompletedFlag(scheduleCompleted);
		record.setScheduleType(scheduleType);
		

		
		//record.setEntrydate(sdf.format(timestamp));
		//record.setEntryBy(userID);
	//	record.setStatus("Intimated");
		try {
			if(!("".equals(scheduleCompletedDate))){
				record.setScheduleCompletedDate(df.parse(scheduleCompletedDate));
				}
				if(!("".equals(scheduleDate))){
				record.setScheduleDate(df.parse(scheduleDate));
				}
			
			getDao().addSchedule(record);
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public String update() throws IOException {			
		//SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		//Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		Session session =  null;
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			session = HibernateConfig.getSession();
			record = (MachineScheduleTransaction)session.get(MachineScheduleTransaction.class, scheduleId);
			//record.setMachineId(machineId);
			record.setScheduleCompletedFlag(scheduleCompleted);
			record.setScheduleType(scheduleType);
			if(!("".equals(scheduleCompletedDate))||scheduleCompletedDate!=null){
				record.setScheduleCompletedDate(df.parse(scheduleCompletedDate));
				}
				if(!("".equals(scheduleDate))||scheduleDate!=null){
				record.setScheduleDate(df.parse(scheduleDate));
				}
			//record.setRemarkEntryBy(userID);
			//record.setRemarkEntrydate(sdf.format(timestamp));
			
			getDao().updateSchedule(record);  //code here
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
			
		getDao().deleteSchedule(scheduleId);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public DaoMachineScheduleTransaction getDao() {
		return dao;
	}

	public void setDao(DaoMachineScheduleTransaction dao) {
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

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	

}
