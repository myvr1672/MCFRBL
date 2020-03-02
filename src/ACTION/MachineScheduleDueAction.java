package ACTION;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;


import beans.MachineScheduleDue;

import dao.DaoMachineScheduleDue;
import hibernateConnect.HibernateConfig;

import model.User;

public class MachineScheduleDueAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoMachineScheduleDue dao = new DaoMachineScheduleDue();
	
	
	
	private List<MachineScheduleDue> records;
	private String result;
	private String message;
	private MachineScheduleDue record;
	private Integer scheduleId;
	private Integer machineId;
	private String machineSrNo;
	private String machineDescription;
	private String workingShop;
	private String maintenanceShopId;
	private String scheduleType;
	private String scheduleDate;
	private String dispatchDateForSchedule;
	
    
	
	
	//private Date exitDate;
	
	private String jtSorting;//for sorting
	
	Session session =null;
	
	
	
	public String list() {
		 session = HibernateConfig.getSession();
		try {
			// to check list of shops
			Session session =  null;
			String username= null;
			String roles= null;
			HttpSession session_http = ServletActionContext.getRequest().getSession(true);
			username = (String) session_http.getAttribute("userid");
			
			if (username != null)
			{
		session = HibernateConfig.getSession();
		User loginUser = (User)session.get(User.class,username.trim());
		    
			 roles= loginUser.getRoles();
			}

		roles = roles.replaceAll(", ","','");
		session.beginTransaction();
		
//code for working shop
Query queryForShop=null;
if(roles.equals("All")){
queryForShop = session.createSQLQuery("select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
}
else
{
queryForShop = session.createSQLQuery("select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
}
	
	List<String> shopList = queryForShop.list();
	String str=null;
	for(int i=0; i<shopList.size();i++)
	{
		if (str==null){str=shopList.get(i);}
		else {str=str+"','"+shopList.get(i);}
	}
	//str = str.replaceAll(", ","','");
System.out.println("Shop List:"+shopList);
				setRecords(dao.getAllScheduleDueMachine(shopList, jtSorting));
			
			System.out.println("Records = "+getRecords());
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

	public String listRelease() {
		 session = HibernateConfig.getSession();
		try {
			// to check list of shops
			Session session =  null;
			String username= null;
			String roles= null;
			HttpSession session_http = ServletActionContext.getRequest().getSession(true);
			username = (String) session_http.getAttribute("userid");
			
			if (username != null)
			{
		session = HibernateConfig.getSession();
		User loginUser = (User)session.get(User.class,username.trim());
		    
			 roles= loginUser.getRoles();
			}

		roles = roles.replaceAll(", ","','");
		session.beginTransaction();
		
//code for working shop
Query queryForShop=null;
if(roles.equals("All")){
queryForShop = session.createSQLQuery("select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
}
else
{
queryForShop = session.createSQLQuery("select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
}
	
	List<String> shopList = queryForShop.list();
	String str=null;
	for(int i=0; i<shopList.size();i++)
	{
		if (str==null){str=shopList.get(i);}
		else {str=str+"','"+shopList.get(i);}
	}
	//str = str.replaceAll(", ","','");
System.out.println("Shop List:"+shopList);
				setRecords(dao.getAllReleaseScheduleDueMachine(shopList, jtSorting));
			
			System.out.println("Records = "+getRecords());
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
	
	
	

	public DaoMachineScheduleDue getDao() {
		return dao;
	}



	public void setDao(DaoMachineScheduleDue dao) {
		this.dao = dao;
	}



	public List<MachineScheduleDue> getRecords() {
		return records;
	}



	public void setRecords(List<MachineScheduleDue> records) {
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



	public MachineScheduleDue getRecord() {
		return record;
	}



	public void setRecord(MachineScheduleDue record) {
		this.record = record;
	}



	public Integer getScheduleId() {
		return scheduleId;
	}



	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
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



	public String getMaintenanceShopId() {
		return maintenanceShopId;
	}



	public void setMaintenanceShopId(String maintenanceShopId) {
		this.maintenanceShopId = maintenanceShopId;
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



	public String getJtSorting() {
		return jtSorting;
	}



	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public String getDispatchDateForSchedule() {
		return dispatchDateForSchedule;
	}

	public void setDispatchDateForSchedule(String dispatchDateForSchedule) {
		this.dispatchDateForSchedule = dispatchDateForSchedule;
	}
	
	
}
