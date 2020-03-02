package dao;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.hibernate.Query;
import org.hibernate.Session;

import org.hibernate.transform.Transformers;


import beans.MachineScheduleDue;
import beans.MachineScheduleTransaction;
import common.BundleUtility;
import hibernateConnect.HibernateConfig;

public class DaoMachineScheduleDue {

	@SuppressWarnings("unchecked")
	public List<MachineScheduleDue> getAllScheduleDueMachine(List<String> shoplistArr, String jtSorting) {
		Session session =  null;
		
		List<MachineScheduleDue> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoBogieProduction getAllBogie() methods try Block--");
			session = HibernateConfig.getSession();
			Query query=null;

//String sql= "select DISTINCT ON (A.machine_id) A.machine_id \"machineId\", A.schedule_id \"scheduleId\" ,  B.machine_sr_no \"machineSrNo\", B.machine_description  \"machineDescription\", B.working_shop  \"workingShop\", B.maintenance_shop_id \"maintenanceShopId\", A.schedule_type  \"scheduleType\", A.schedule_date \"scheduleDate\"   from public.machine_schedule_transaction A, public.machine_master B where A.schedule_completed_flag='N' and A.schedule_date+7 >=now()  and A.machine_id = B.machine_id  and dispatchDate_for_schedule is NOT NULL and B.working_shop in ('"+shoplistArr+"') order by A.machine_id, A.schedule_date";
String sql=BundleUtility.getValue("common.queries", "machineMaintenanceSchedule");

			System.out.println("Sql query result:"+sql);			
query= session.createSQLQuery(sql);  //or you can write also createQuery(sql)
query.setParameterList("shoplistArr", shoplistArr);
			list =query.setResultTransformer(Transformers.aliasToBean(MachineScheduleDue.class)).list();
			
			//list = cr.list();
		}catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		
	}
		return list;
	}
	

	@SuppressWarnings("unchecked")
	public List<MachineScheduleDue> getAllTargetScheduleDueMachine(List<String> shoplistArr, String jtSorting) {
		Session session =  null;
		
		List<MachineScheduleDue> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoBogieProduction getAllBogie() methods try Block--");
			session = HibernateConfig.getSession();
			Query query=null;

//String sql= "select DISTINCT ON (A.machine_id) A.machine_id \"machineId\", A.schedule_id \"scheduleId\" ,  B.machine_sr_no \"machineSrNo\", B.machine_description  \"machineDescription\", B.working_shop  \"workingShop\", B.maintenance_shop_id \"maintenanceShopId\", A.schedule_type  \"scheduleType\", A.schedule_date \"scheduleDate\"   from public.machine_schedule_transaction A, public.machine_master B where A.schedule_completed_flag='N' and A.schedule_date+7 >=now()  and A.machine_id = B.machine_id  and dispatchDate_for_schedule is NOT NULL and B.working_shop in ('"+shoplistArr+"') order by A.machine_id, A.schedule_date";
String sql=BundleUtility.getValue("common.queries", "machineMaintenanceSchedule1");

			System.out.println("Sql query result:"+sql);			
query= session.createSQLQuery(sql);  //or you can write also createQuery(sql)
query.setParameterList("shoplistArr", shoplistArr);
			list =query.setResultTransformer(Transformers.aliasToBean(MachineScheduleDue.class)).list();
			
			//list = cr.list();
		}catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		
	}
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<MachineScheduleDue> getAllReleaseScheduleDueMachine(List<String> shoplistArr, String jtSorting) {
		Session session =  null;
		
		List<MachineScheduleDue> list = null;
		String username= null;
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	  
		try{
			System.out.println("--Inside dao.DaoBogieProduction getAllBogie() methods try Block--");
			session = HibernateConfig.getSession();
			Query query=null;

//String sql= "select DISTINCT ON (A.machine_id) A.machine_id \"machineId\", A.schedule_id \"scheduleId\" ,  B.machine_sr_no \"machineSrNo\", B.machine_description  \"machineDescription\", B.working_shop  \"workingShop\", B.maintenance_shop_id \"maintenanceShopId\", A.schedule_type  \"scheduleType\", A.schedule_date \"scheduleDate\"   from public.machine_schedule_transaction A, public.machine_master B where A.schedule_completed_flag='N' and A.schedule_date+7 >=now()  and A.machine_id = B.machine_id  and B.working_shop in ('"+shoplistArr+"') order by A.machine_id, A.schedule_date";
String sql=BundleUtility.getValue("common.queries", "machineReleaseMaintenanceSchedule");

			System.out.println("Sql query result:"+sql);			
query= session.createSQLQuery(sql);  //or you can write also createQuery(sql)
query.setParameterList("shoplistArr", shoplistArr);
			list =query.setResultTransformer(Transformers.aliasToBean(MachineScheduleDue.class)).list();
			
			//list = cr.list();
		}catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				
				session.close();
			}			
		}
		
	}
		return list;
	}
		
	
}