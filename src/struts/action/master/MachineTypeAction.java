package struts.action.master;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;

public class MachineTypeAction {

	private Map <String, String> machineType;
//	private Map <String, String> workingShop; 
	private Map<String,String> amcAgencyId;
	private Map<String,String> maintenanceShopId;
	private Map<String,String> activityId;
	private Map<String,String> machineId;
	private Map <String, String> supplier;
	private List <String> failureCode;
	private List <String> workingShop;
//	private List <Integer> breakdownId;
	
	


	@SuppressWarnings("unchecked")
	public String retrieveMachineType()
	
	{
		Session session=null;
		 session =  HibernateConfig.getSession();
          try {

			
			session.beginTransaction();
			Query query=null;
			query = session.createSQLQuery("select machine_type_id, machine_type_description from public.machine_type");
			List<Object[]> rowList =  query.list();
			machineType=new LinkedHashMap<String, String>();
			for(Object[] row: rowList)
			{
				machineType.put(row[0].toString(), row[1].toString());
				
			}
			
					

		  
		  Query query2=null;
		query2 = session.createSQLQuery("SELECT substages FROM public.substage_master where substage_validity=1 and parent_stage_id='0'");
		/*List<Object[]> rowList1 =  query2.list();
		workingShop=new LinkedHashMap<String, String>();*/
		workingShop=  (List<String>)query2.list();
		/*for(Object[] row: rowList1)
		{
			workingShop.put(row[0].toString(), row[1].toString());
						}
			*/
		 
			 Query query3=null;
				query3= session.createSQLQuery("select amc_agency_id, amc_agency_name from public.machine_amc_agency");
				List<Object[]> rowList2 =  query3.list();
				amcAgencyId=new LinkedHashMap<String, String>();
				for(Object[] row: rowList2)
				{
					amcAgencyId.put(row[0].toString(), row[1].toString());
					
				}
				Query queryForSupplier=null;

				queryForSupplier = session.createSQLQuery("select supplier_code, supplier_name from public.supplier_details");
				List<Object[]> rowSupplier = queryForSupplier.list();
				supplier= new LinkedHashMap<String,String>();
				for(Object[] row : rowSupplier){
					supplier.put(row[0].toString(), row[1].toString());
				}		
				 Query query4=null;
					query4= session.createSQLQuery("select shop_id, shop_name from public.maintenance_shop_master");
					List<Object[]> rowList3 =  query4.list();
					maintenanceShopId=new LinkedHashMap<String, String>();
					for(Object[] row: rowList3)
					{
						maintenanceShopId.put(row[0].toString(), row[1].toString());
						
					}
					
					 Query query5=null;
						query5 = session.createSQLQuery("select activity_no,activity_description from public.machine_schedule_activity");
						List<Object[]> rowList4 =  query5.list();
						activityId=new LinkedHashMap<String, String>();
						for(Object[] row: rowList4)
						{
							activityId.put(row[0].toString(), row[1].toString());
							
						}  			
					
						Query query6=null;
						query6= session.createSQLQuery("SELECT failure_description FROM public.machine_failure_master;");
						//List<Object[]> rowList4 =  query5.list();
						failureCode=  (List<String>)query6.list();
						/*for(Object[] row: rowList4)
						{
							 failureCode.put(row[0].toString(), row[1].toString());
							
						}*/
						 Query query7=null;
							query7= session.createSQLQuery("select machine_id, machine_description from public.machine_master");
							List<Object[]> rowList5 =  query7.list();
							machineId=new LinkedHashMap<String, String>();
							for(Object[] row: rowList5)
							{
								machineId.put(row[0].toString(), row[1].toString());
							}
			return "success";
          }
          
         
          
		
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{
			session.close();
		}
	}


	public void setMachineType(Map<String, String> machineType) {
		this.machineType = machineType;
	}


	public Map<String, String> getMachineType() {
		return machineType;
	}


	

	public List<String> getWorkingShop() {
		return workingShop;
	}


	public void setWorkingShop(List<String> workingShop) {
		this.workingShop = workingShop;
	}


	public Map<String, String> getAmcAgencyId() {
		return amcAgencyId;
	}


	public void setAmcAgencyId(Map<String, String> amcAgencyId) {
		this.amcAgencyId = amcAgencyId;
	}
	public Map<String, String> getMaintenanceShopId() {
		return maintenanceShopId;
	}


	public void setMaintenanceShopId(Map<String, String> maintenanceShopId) {
		this.maintenanceShopId = maintenanceShopId;
	}


	public Map<String, String> getActivityId() {
		return activityId;
	}


	public void setActivityId(Map<String, String> activityId) {
		this.activityId = activityId;
	}


	public List<String> getFailureCode() {
		return failureCode;
	}


	public void setFailureCode(List<String> failureCode) {
		this.failureCode = failureCode;
	}


	public Map<String, String> getMachineId() {
		return machineId;
	}


	public void setMachineId(Map<String, String> machineId) {
		this.machineId = machineId;
	}


	public Map<String, String> getSupplier() {
		return supplier;
	}


	public void setSupplier(Map<String, String> supplier) {
		this.supplier = supplier;
	}


	


	

	

}