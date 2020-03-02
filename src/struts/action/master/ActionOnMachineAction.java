package struts.action.master;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import dao.DaoMachineMaster;
import dao.MachineMasterDao;
import hibernateConnect.HibernateConfig;
import beans.MachineAction;
import beans.MachineBreakdown;
import beans.MachineMaster;


	public class ActionOnMachineAction {

	private Integer machineId;
	private Integer breakdownId;
	private String actionPerformed;
	private String remarks;
	private String status;
	private String rectificationDate;

	private MachineMasterDao dao = new MachineMasterDao();
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	
	public String assignActionPerformed()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		try {
			
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			Timestamp timestamp= new Timestamp(System.currentTimeMillis());
			//Machine Action
			
			MachineAction machineAction= new MachineAction();
			Criteria c1=session.createCriteria(MachineAction.class);
			c1.add(Restrictions.eq("machineId", machineId));
		
						//First row entry
			machineAction.setMachineId(machineId);
			machineAction.setBreakdownId(breakdownId);
			
			machineAction.setActionPerformed(actionPerformed);
			machineAction.setRemarks(remarks);
			machineAction.setStatus(status);
			machineAction.setCreatedDate(timestamp);
			machineAction.setEntryBy(userID);
			if(status.equals("Resolved"))
			{
				if(!("".equals(rectificationDate))) {machineAction.setRectificationDate(df.parse(rectificationDate));}
				else
				{
					machineAction.setRectificationDate(new Date());
				}

			}

			
			System.out.println("Action Performed:"+actionPerformed);
			System.out.println("rectification Date:"+rectificationDate);
			// end of machine action
			
			
			/*//update machine breakdown
			MachineBreakdown machineBreakdown=new MachineBreakdown();
			Criteria c=session.createCriteria(MachineBreakdown.class);
			c.add(Restrictions.eq("machineId", machineId));
			c.add(Restrictions.eq("breakdownId",breakdownId));
			@SuppressWarnings("unchecked")
			List<MachineBreakdown> spList=(List<MachineBreakdown>)c.list();
			machineBreakdown=spList.get(0);

			if(status.equals("Resolved"))
			{
			if(!("".equals(rectificationDate))) { machineBreakdown.setDispatchDateForRepair(df.parse(rectificationDate)); }
			else
			{
				machineBreakdown.setDispatchDateForRepair(new Date());	
			}
			}
			//end of code
*/			
			
			// update machine master 
			/*MachineMaster machineMaster=new MachineMaster();
             Criteria cr= session.createCriteria(MachineMaster.class);
			cr.add(Restrictions.eq("machineId", machineId));
			machineMaster=(MachineMaster) cr.list().get(0);
			if(status.equals("Resolved"))
			{
				machineMaster.setMachineStatus("OK");	
			}
			*/
			
			DaoMachineMaster MachineMaster1Dao=new DaoMachineMaster();
		//	MachineMaster1Dao.actionPerformedOnMachine(machineAction, machineMaster/*,machineBreakdown*/);
			// Second row entry
		
		
		
		return "success";
	}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "success";
			//return null;
		}
		finally
		{
			session.close();
		}
	}
	public Integer getMachineId() {
		return machineId;
	}
	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}
	public Integer getBreakdownId() {
		return breakdownId;
	}
	public void setBreakdownId(Integer breakdownId) {
		this.breakdownId = breakdownId;
	}
	public String getActionPerformed() {
		return actionPerformed;
	}
	public void setActionPerformed(String actionPerformed) {
		this.actionPerformed = actionPerformed;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	public MachineMasterDao getDao() {
		return dao;
	}
	public void setDao(MachineMasterDao dao) {
		this.dao = dao;
	}
	public String getRectificationDate() {
		return rectificationDate;
	}
	public void setRectificationDate(String rectificationDate) {
		this.rectificationDate = rectificationDate;
	}
	
	
	
	
}