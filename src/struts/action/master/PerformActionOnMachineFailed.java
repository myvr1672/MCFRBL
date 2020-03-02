package struts.action.master;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.google.gson.Gson;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import beans.MachineBreakdown;
import beans.MachineMaster;
import beans.MachinePerformAction;
import beans.SpareChangeInMachinefailure;
import common.DateUtil;
import dao.DaoMachineBreakdown;
import hibernateConnect.HibernateConfig;


public class PerformActionOnMachineFailed {

	private Integer machineId;
	private Integer breakdownId;
	
	private String actionPerformed;
	private String remarks;
	private String status;
	private String rectificationDate;
	private String spareDescription;
	private String spareSrNo;
    private String spareReplaced;
	public String performAction()
	{
		Gson gson=new Gson();
		String[] spareDescriptionArr=gson.fromJson(spareDescription, String[].class);
		String[] spareSrNoArr=gson.fromJson(spareSrNo, String[].class);
		System.out.println(machineId +"&&"+ breakdownId);
		
	//	String[] spareDescriptionArr= spareDescription.split("\\s*,\\s*");
	//	String[] spareSrNoArr= spareSrNo.split("\\s*,\\s*");
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		String userID = (String) session_http.getAttribute("userid");
		Session session=null;
		session = HibernateConfig.getSession();
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");

MachinePerformAction	machinePerformedAction= new	MachinePerformAction();
//First row entry
machinePerformedAction.setMachineId(machineId);
machinePerformedAction.setActionPerformed(actionPerformed);
machinePerformedAction.setBreakdownId(breakdownId);
machinePerformedAction.setRemarks(remarks);
machinePerformedAction.setStatus(status);
if(status.equals("Resolved"))
{
	if(!("".equals(rectificationDate))) {machinePerformedAction.setRectificationDate(DateUtil.convertToDate(rectificationDate));}
	else
	{
		machinePerformedAction.setRectificationDate(new Date());
	}

}
machinePerformedAction.setEntryBy(userID);
machinePerformedAction.setCreatedDate(timestamp);

// update machine_breakdown table
MachineBreakdown machineBreakdown =new MachineBreakdown();
Criteria cr = session.createCriteria(MachineBreakdown.class);
cr.add(Restrictions.eq("machineId", machineId));
cr.add(Restrictions.eq("breakdownId", breakdownId));

@SuppressWarnings("unchecked")
List<MachineBreakdown> spList=(List<MachineBreakdown>)cr.list();
machineBreakdown=spList.get(0);

if(status.equals("Resolved"))
{
if(!("".equals(rectificationDate))) { machineBreakdown.setCompletionDate(DateUtil.convertToDate(rectificationDate)); }
else
{
	machineBreakdown.setDispatchDateForRepair(new Date());	
}
}
// end of code

// update machine_master table
MachineMaster machineMaster= new MachineMaster();

Criteria c = session.createCriteria(MachineMaster.class);
c.add(Restrictions.eq("machineId", machineId));

machineMaster=(MachineMaster) c.list().get(0);
if(status.equals("Resolved"))
{
	machineMaster.setMachineStatus("OK");	
}
//end of code
//update spare table
List<SpareChangeInMachinefailure> spareChangeInMachinefailureList= new ArrayList<SpareChangeInMachinefailure>();
//SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
//Timestamp timestamp1 new Timestamp(System.currentTimeMillis());
if(spareReplaced.equals("Yes"))
{
for(int i=0; i<spareDescriptionArr.length;i++)
	//int i=0;
//	for(String s:spareDescriptionArr)
{
	SpareChangeInMachinefailure spare= new 	SpareChangeInMachinefailure();
	spare.setMachineId(machineId);
	spare.setBreakdownId(breakdownId);
	spare.setSpareDescription(spareDescriptionArr[i]);
	//spare.setSpareDescription(s);
	spare.setSpareSrNo(spareSrNoArr[i]);
	spare.setEntryBy(userID);
	spare.setEntryDate(timestamp);
	spareChangeInMachinefailureList.add(spare);
	//i++;
}
}
//end of code
DaoMachineBreakdown daoMachineBreakdown=new DaoMachineBreakdown();
			
daoMachineBreakdown.updatemachineBreakDown(machinePerformedAction, machineBreakdown, machineMaster, spareChangeInMachinefailureList);
			// Second row entry
			
			
			return "success";
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoMachineBreakdown updatemachineBreakDown(object, object, object) methods finally Block--");
				session.close();
			}			
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



	public String getRectificationDate() {
		return rectificationDate;
	}



	public void setRectificationDate(String rectificationDate) {
		this.rectificationDate = rectificationDate;
	}


	public String getSpareDescription() {
		return spareDescription;
	}



	public void setSpareDescription(String spareDescription) {
		this.spareDescription = spareDescription;
	}



	public String getSpareSrNo() {
		return spareSrNo;
	}



	public void setSpareSrNo(String spareSrNo) {
		this.spareSrNo = spareSrNo;
	}



	public String getSpareReplaced() {
		return spareReplaced;
	}



	public void setSpareReplaced(String spareReplaced) {
		this.spareReplaced = spareReplaced;
	}

	
}
