package ACTION;

import java.io.IOException;
//import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import com.opensymphony.xwork2.ActionSupport;

import beans.MachineList;


import dao.MachineListDao;
import hibernateConnect.HibernateConfig;
//import model.machine_operation;

public class MachineListAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private MachineListDao dao = new MachineListDao();

	private List<MachineList> records;
	private String result;
	private String message;
	private MachineList record;
	private Integer machineId;
	private String machineSrNo;
	private String machineDescription;
	private String workingShop;
	//private String maintenanceShopId;
	
	//private String jtSorting;//for sorting
	
	

	public String list() {
		try {
			setRecords(getDao().getAllMachineList());
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
		
	    
		
		record = new MachineList();
		
		 record.setMachineId(machineId);
			record.setMachineSrNo(machineSrNo);
			record.setMachineDescription(machineDescription);
			record.setWorkingShop(workingShop);
		
		try {
						
			
			dao.addMachineList(record);
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
		
		//SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");

		
  
		record = new MachineList();
	    Session session=null;
	    session=HibernateConfig.getSession();
	   record = (MachineList)session.get(MachineList.class,machineId);
	   record.setMachineId(machineId);
		record.setMachineSrNo(machineSrNo);
		record.setMachineDescription(machineDescription);
		record.setWorkingShop(workingShop);
		//record.setMaintenanceShopId(maintenanceShopId);
	    
		try {
			/*if(!"".equals(scheduleDate))	{record.setScheduleDate(sdf.parse(scheduleDate));}
			if(!"".equals(scheduleCompletedDate)) {record.setScheduleCompletedDate(sdf.parse(scheduleCompletedDate));}*/
			session.update(record);
			 session.beginTransaction().commit();
			 getDao().updateMachineList(record);
		    
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
			
		getDao().deleteMachineList(machineId);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}




















	public MachineListDao getDao() {
		return dao;
	}








	public void setDao(MachineListDao dao) {
		this.dao = dao;
	}








	public List<MachineList> getRecords() {
		return records;
	}








	public void setRecords(List<MachineList> records) {
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








	public MachineList getRecord() {
		return record;
	}








	public void setRecord(MachineList record) {
		this.record = record;
	}








	public Integer getMachineId() {
		return machineId;
	}








	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}








	public String getMachineSrNo() {
		return machineSrNo;
	}








	public void setMachineSrNo(String machineSrNo) {
		this.machineSrNo = machineSrNo;
	}








	public String getMachineDescription() {
		return machineDescription;
	}








	public void setMachineDescription(String machineDescription) {
		this.machineDescription = machineDescription;
	}








	public String getWorkingShop() {
		return workingShop;
	}








	public void setWorkingShop(String workingShop) {
		this.workingShop = workingShop;
	}







/*
	public String getMaintenanceShopId() {
		return maintenanceShopId;
	}








	public void setMaintenanceShopId(String maintenanceShopId) {
		this.maintenanceShopId = maintenanceShopId;
	}
*/







	public static long getSerialversionuid() {
		return serialVersionUID;
	}


}
