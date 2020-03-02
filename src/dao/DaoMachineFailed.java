package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import beans.MachineFailureCustomBean;
import hibernateConnect.HibernateConfig;

public class DaoMachineFailed {

	@SuppressWarnings("unchecked")
	public List<MachineFailureCustomBean> getAllFailureMachine(String shoplistArr) {
		Session session =  null;
		
		List<MachineFailureCustomBean> list = null;
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
//String sql="select A.schedule_id \"scheduleId\", A.machine_id  \"machineId\",  B.machine_sr_no \"machineSrNo\", B.machine_description  \"machineDescription\", B.working_shop  \"workingShop\", B.maintenance_shop_id \"maintenanceShopId\", A.schedule_type  \"scheduleType\", min(A.schedule_date) \"scheduleDate\"  from public.machine_schedule_transaction A, public.machine_master B where A.schedule_completed_flag='N' and A.schedule_date+7 >=now() and A.machine_id = B.machine_id  and B.working_shop in ('"+shoplistArr+"')  group by  (A.schedule_id, A.machine_id, B.machine_sr_no,B.machine_description, B.working_shop, B.maintenance_shop_id, A.schedule_type) order by A.machine_id";
String sql= "select A.breakdown_id \"breakdownId\", A.machine_id \"machineId\", A.breakdown_date \"breakdownDate\", A.breakdown_details \"breakdownDetails\", A.remarks \"remarks\", A.dispatch_date_for_repair  \"dispatchDateForRepair\",  B.machine_sr_no  \"machineSrNo\", B.machine_type \"machineType\", B.machine_description  \"machineDescription\", B.make \"make\", B.model \"model\",purchased_by \"purchasedBy\",B.purchase_no \"purchaseNo\", B.working_shop  \"workingShop\", B.maintenance_shop_id \"maintenanceShopId\", B.date_of_commissioned \"dateOfComissioned\"   from public.machine_breakdown A, public.machine_master B where A.dispatch_date_for_repair is NULL and B.machine_status='F' and A.machine_id = B.machine_id  and B.working_shop in ('"+shoplistArr+"') order by A.machine_id, A.breakdown_date";
System.out.println("Sql query result:"+sql);			
query= session.createSQLQuery(sql);
			list = query.setResultTransformer(Transformers.aliasToBean(MachineFailureCustomBean.class)).list();
			
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
	public List<MachineFailureCustomBean> getAllReleaseFailureMachine(String shoplistArr) {
		Session session =  null;
		
		List<MachineFailureCustomBean> list = null;
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
//String sql="select A.schedule_id \"scheduleId\", A.machine_id  \"machineId\",  B.machine_sr_no \"machineSrNo\", B.machine_description  \"machineDescription\", B.working_shop  \"workingShop\", B.maintenance_shop_id \"maintenanceShopId\", A.schedule_type  \"scheduleType\", min(A.schedule_date) \"scheduleDate\"  from public.machine_schedule_transaction A, public.machine_master B where A.schedule_completed_flag='N' and A.schedule_date+7 >=now() and A.machine_id = B.machine_id  and B.working_shop in ('"+shoplistArr+"')  group by  (A.schedule_id, A.machine_id, B.machine_sr_no,B.machine_description, B.working_shop, B.maintenance_shop_id, A.schedule_type) order by A.machine_id";
String sql= "select A.breakdown_id \"breakdownId\", A.machine_id \"machineId\", A.breakdown_date \"breakdownDate\", A.breakdown_details \"breakdownDetails\", A.remarks \"remarks\", A.dispatch_date_for_repair  \"dispatchDateForRepair\",  B.machine_sr_no  \"machineSrNo\", B.machine_type \"machineType\", B.machine_description  \"machineDescription\", B.make \"make\", B.model \"model\",purchased_by \"purchasedBy\",B.purchase_no \"purchaseNo\", B.working_shop  \"workingShop\", B.maintenance_shop_id \"maintenanceShopId\", B.date_of_commissioned \"dateOfComissioned\"   from public.machine_breakdown A, public.machine_master B where A.dispatch_date_for_repair is NOT NULL and B.machine_status='F' and A.completion_date is NULL and A.machine_id = B.machine_id  and B.working_shop in ('"+shoplistArr+"') order by A.machine_id, A.breakdown_date";
System.out.println("Sql query result:"+sql);			
query= session.createSQLQuery(sql);
			list = query.setResultTransformer(Transformers.aliasToBean(MachineFailureCustomBean.class)).list();
			
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
