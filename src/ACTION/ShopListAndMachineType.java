package ACTION;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.hibernate.Query;

import org.hibernate.Session;

import beans.Shop;

import hibernateConnect.HibernateConfig;
import model.User;

public class ShopListAndMachineType {


	private Map <String, String> machineType;
	private Map <String, String> amcAgency;
	private Map <String, String> supplier;
	private Map <String, String> activityList;
	private List <Shop> workingShop;
	private Map <String, String>   failureCategory;
	private Map <Integer, String> safetyInstructionList;
	
	private Map<String,String> maintainenceShop;
	@SuppressWarnings("unchecked")
	public String getAssetType()
	{
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
	
		try {

			
			session.beginTransaction();
			
			
			Query queryForSafetyInstruction=null;
			 
			queryForSafetyInstruction = session.createSQLQuery("select safety_instruction_id, safety_instruction_description from public.safety_instruction_master");
			List<Object[]> rowSafety = queryForSafetyInstruction.list();
			safetyInstructionList= new LinkedHashMap<Integer,String>();
			for(Object[] row : rowSafety){
				safetyInstructionList.put(Integer.parseInt(row[0].toString()), row[1].toString());
			}		
			
			
Query query=null;
			 
query = session.createSQLQuery("select machine_type_id, machine_type_description from public.machine_type");
List<Object[]> rowList = query.list();
machineType= new LinkedHashMap<String,String>();
for(Object[] row : rowList){
	machineType.put(row[0].toString(), row[1].toString());
}			
//retrieve supplier details
Query queryForSupplier=null;

queryForSupplier = session.createSQLQuery("select supplier_code, supplier_name from public.supplier_details");
List<Object[]> rowSupplier = queryForSupplier.list();
supplier= new LinkedHashMap<String,String>();
for(Object[] row : rowSupplier){
	supplier.put(row[0].toString(), row[1].toString());
}			
//end of code
//retrieve Activity details
Query queryForActivity=null;

queryForActivity = session.createSQLQuery("select activity_no, activity_description from public.machine_schedule_activity");
List<Object[]> rowActivity = queryForActivity.list();
activityList= new LinkedHashMap<String,String>();
for(Object[] row : rowActivity){
	activityList.put(row[0].toString(), row[1].toString());
}			
//end of code

//retrieve amc agency details
Query queryForAMCAgency=null;

queryForAMCAgency = session.createSQLQuery("select amc_agency_id, amc_agency_name from public.machine_amc_agency");
List<Object[]> rowAmcAgency = queryForAMCAgency.list();
amcAgency= new LinkedHashMap<String,String>();
for(Object[] row : rowAmcAgency){
	amcAgency.put(row[0].toString(), row[1].toString());
}			
//end of code

//retrieve failure category
Query queryForFailureCategory=null;

queryForFailureCategory = session.createSQLQuery("SELECT failure_code, failure_description FROM public.machine_failure_master");
List<Object[]> rowFailureCategory = queryForFailureCategory.list();
failureCategory= new LinkedHashMap<String,String>();
for(Object[] row : rowFailureCategory){
	failureCategory.put(row[0].toString(), row[1].toString());
}			
//end of code



// code for working shop
Query queryForShop=null;
if(roles.equals("All")){
	queryForShop = session.createSQLQuery("select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
}
else
{
	queryForShop = session.createSQLQuery("select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
}
		
		List<String> result = queryForShop.list();

		
		workingShop=new ArrayList<Shop>();
for(String i:result)
{
	Shop s=new Shop();
	s.setShopId(i);
	s.setShopName(i+" Shop");
	workingShop.add(s);
}
					
		Query queryForMaintenanceShop= null;
		queryForMaintenanceShop = session.createSQLQuery("select shop_id, shop_name from public.maintenance_shop_master");	
		
		List<Object[]> rows = queryForMaintenanceShop.list();
		maintainenceShop= new LinkedHashMap<String,String>();
		for(Object[] row : rows){
			maintainenceShop.put(row[0].toString(), row[1].toString());
		}
			
		
		
			return "success";
		} 
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{session.close(); }
	}
	
	public Map<String, String> getMachineType() {
		return machineType;
	}

	public void setMachineType(Map<String, String> machineType) {
		this.machineType = machineType;
	}

	public List<Shop> getWorkingShop() {
		return workingShop;
	}
	public void setWorkingShop(List<Shop> workingShop) {
		this.workingShop = workingShop;
	}
	public Map<String, String> getMaintainenceShop() {
		return maintainenceShop;
	}
	public void setMaintainenceShop(Map<String, String> maintainenceShop) {
		this.maintainenceShop = maintainenceShop;
	}

	public Map<String, String> getAmcAgency() {
		return amcAgency;
	}

	public void setAmcAgency(Map<String, String> amcAgency) {
		this.amcAgency = amcAgency;
	}

	public Map<String, String> getSupplier() {
		return supplier;
	}

	public void setSupplier(Map<String, String> supplier) {
		this.supplier = supplier;
	}

	public Map<String, String> getActivityList() {
		return activityList;
	}

	public void setActivityList(Map<String, String> activityList) {
		this.activityList = activityList;
	}

	public Map<String, String> getFailureCategory() {
		return failureCategory;
	}

	public void setFailureCategory(Map<String, String> failureCategory) {
		this.failureCategory = failureCategory;
	}

	public Map<Integer, String> getSafetyInstructionList() {
		return safetyInstructionList;
	}

	public void setSafetyInstructionList(Map<Integer, String> safetyInstructionList) {
		this.safetyInstructionList = safetyInstructionList;
	}
	

	
}
