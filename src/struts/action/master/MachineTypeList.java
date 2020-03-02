package struts.action.master;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernateConnect.HibernateConfig;

public class MachineTypeList {
	private List <String> workingShop;
	private List <Integer> machineId;
	private Map <String, String> safetyInstructionId;
	

	private List <String> machineSrNo;
	//private List <String> maintenanceShopId;
	private List <String> machineDescription;
	
@SuppressWarnings("unchecked")
public String retrieveMachineTypeList()
{
	Session session=null;
	 session =  HibernateConfig.getSession();
	
	 try {
			session.beginTransaction();
			Query query=null;
			query= session.createSQLQuery("SELECT machine_id FROM public.machine_master");
			machineId=  (List<Integer>)query.list();
	
	
			Query query2=null;
			query2= session.createSQLQuery("SELECT machine_sr_no FROM public.machine_master");
			machineSrNo=  (List<String>)query2.list();

	
			Query query3=null;
			query3= session.createSQLQuery("SELECT DISTINCT working_shop FROM public.machine_master");
			workingShop=  (List<String>)query3.list();
			
			
			
			
			/*Query query5=null;
			query5= session.createSQLQuery("SELECT maintenance_shop_id FROM public.machine_master");
			maintenanceShopId=  (List<String>)query5.list();
	*/
	
	
			Query query5=null;
			query5= session.createSQLQuery("select safety_instruction_id, safety_instruction_description from public.safety_instruction_master");
			List<Object[]> rowList =  query5.list();
			safetyInstructionId=new LinkedHashMap<String, String>();
			for(Object[] row: rowList)
			{
				safetyInstructionId.put(row[0].toString(), row[1].toString());
				
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


/*public List<String> getMaintenanceShopId() {
	return maintenanceShopId;
}


public void setMaintenanceShopId(List<String> maintenanceShopId) {
	this.maintenanceShopId = maintenanceShopId;
}
*/

public List<String> getMachineDescription() {
	return machineDescription;
}


public void setMachineDescription(List<String> machineDescription) {
	this.machineDescription = machineDescription;
}


public List<String> getWorkingShop() {
	return workingShop;
}


public void setWorkingShop(List<String> workingShop) {
	this.workingShop = workingShop;
}


public List<Integer> getMachineId() {
	return machineId;
}


public void setMachineId(List<Integer> machineId) {
	this.machineId = machineId;
}


public List<String> getMachineSrNo() {
	return machineSrNo;
}


public void setMachineSrNo(List<String> machineSrNo) {
	this.machineSrNo = machineSrNo;
}


public Map<String, String> getSafetyInstructionId() {
	return safetyInstructionId;
}


public void setSafetyInstructionId(Map<String, String> safetyInstructionId) {
	this.safetyInstructionId = safetyInstructionId;
}
	
	
}
