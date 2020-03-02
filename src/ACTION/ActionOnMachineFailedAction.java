package ACTION;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import dao.DaoMachineFailed;
import hibernateConnect.HibernateConfig;
import model.User;
import beans.MachineFailureCustomBean;
public class ActionOnMachineFailedAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoMachineFailed dao = new DaoMachineFailed();
	
	
	
	private List<MachineFailureCustomBean> records;
	private String result;
	private String message;
	private MachineFailureCustomBean record;
	private Short breakdownId;
    private Short machineId;
    private String breakdownDate;
    private String breakdownDetails;
    private String remarks;
    private String dispatchDateForRepair;
    private String machineSrNo;
	private String machineType;
	private String machineDescription;
	private String make;
	private String model;
	private String purchasedBy;
	private String purchaseNo;
	private String workingShop;
	private String maintenanceShopId;
	private String dateOfComissioned;

//private String jtSorting;
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
	
	@SuppressWarnings("unchecked")
	List<String> shopList = queryForShop.list();
	String str=null;
	for(int i=0; i<shopList.size();i++)
	{
		if (str==null){str=shopList.get(i);}
		else {str=str+"','"+shopList.get(i);}
	}
	
System.out.println("Shop List:"+shopList);
				setRecords(dao.getAllFailureMachine(str));
			
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
	
	public String listFailed() {
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
	
	@SuppressWarnings("unchecked")
	List<String> shopList = queryForShop.list();
	String str=null;
	for(int i=0; i<shopList.size();i++)
	{
		if (str==null){str=shopList.get(i);}
		else {str=str+"','"+shopList.get(i);}
	}
	
System.out.println("Shop List:"+shopList);
				setRecords(dao.getAllFailureMachine(str));
			
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
	/*public String listRelease() {
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
	
	@SuppressWarnings("unchecked")
	List<String> shopList = queryForShop.list();
	String str=null;
	for(int i=0; i<shopList.size();i++)
	{
		if (str==null){str=shopList.get(i);}
		else {str=str+"','"+shopList.get(i);}
	}
	
System.out.println("Shop List:"+shopList);
				setRecords(dao.getAllReleaseFailedMachine(str));
			
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
	}*/
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public DaoMachineFailed getDao() {
		return dao;
	}
	public void setDao(DaoMachineFailed dao) {
		this.dao = dao;
	}
	public List<MachineFailureCustomBean> getRecords() {
		return records;
	}
	public void setRecords(List<MachineFailureCustomBean> records) {
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
	public MachineFailureCustomBean getRecord() {
		return record;
	}
	public void setRecord(MachineFailureCustomBean record) {
		this.record = record;
	}
	public Short getBreakdownId() {
		return breakdownId;
	}
	public void setBreakdownId(Short breakdownId) {
		this.breakdownId = breakdownId;
	}
	public Short getMachineId() {
		return machineId;
	}
	public void setMachineId(Short machineId) {
		this.machineId = machineId;
	}
	public String getBreakdownDate() {
		return breakdownDate;
	}
	public void setBreakdownDate(String breakdownDate) {
		this.breakdownDate = breakdownDate;
	}
	public String getBreakdownDetails() {
		return breakdownDetails;
	}
	public void setBreakdownDetails(String breakdownDetails) {
		this.breakdownDetails = breakdownDetails;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getDispatchDateForRepair() {
		return dispatchDateForRepair;
	}
	public void setDispatchDateForRepair(String dispatchDateForRepair) {
		this.dispatchDateForRepair = dispatchDateForRepair;
	}
	public String getMachineSrNo() {
		return machineSrNo;
	}
	public void setMachineSrNo(String machineSrNo) {
		this.machineSrNo = machineSrNo;
	}
	public String getMachineType() {
		return machineType;
	}
	public void setMachineType(String machineType) {
		this.machineType = machineType;
	}
	public String getMachineDescription() {
		return machineDescription;
	}
	public void setMachineDescription(String machineDescription) {
		this.machineDescription = machineDescription;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getPurchasedBy() {
		return purchasedBy;
	}
	public void setPurchasedBy(String purchasedBy) {
		this.purchasedBy = purchasedBy;
	}
	public String getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(String purchaseNo) {
		this.purchaseNo = purchaseNo;
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
	public String getDateOfComissioned() {
		return dateOfComissioned;
	}
	public void setDateOfComissioned(String dateOfComissioned) {
		this.dateOfComissioned = dateOfComissioned;
	}
	
	

	
}
