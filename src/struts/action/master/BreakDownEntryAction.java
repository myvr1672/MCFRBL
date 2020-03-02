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

import com.opensymphony.xwork2.ActionSupport;
import beans.MachineMaster;
import beans.SupplierDetails;
import common.SentEmail;
import common.SentSms;
import beans.AddAmcAgency;
import beans.MachineBreakdown;
import dao.DaoMachineBreakdown;
import hibernateConnect.HibernateConfig;

public class BreakDownEntryAction extends ActionSupport{
   
	private static final long serialVersionUID = 1L;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private Integer machineId;
    private String dateOfBreakDown;
    private String breakdownDetails;
    private String remarks;
    private String amcAgencyId;
	private String purchasedBy;
	private String machineDescription;
	
	public String reportBreakDown()
	{
		Session session=null;
		session = HibernateConfig.getSession();
	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
Timestamp timestamp= new Timestamp(System.currentTimeMillis());
//Insert data in machine_breakdown table
MachineBreakdown	machineBreakdown= new	MachineBreakdown();
machineBreakdown.setMachineId(machineId);
if(dateOfBreakDown!=null ||!("".equals(dateOfBreakDown))) {machineBreakdown.setBreakdownDate(df.parse(dateOfBreakDown));}
machineBreakdown.setBreakdownDetails(breakdownDetails);
machineBreakdown.setRemarks(remarks);
machineBreakdown.setEntryBy(userID);
machineBreakdown.setCreatedDate(timestamp);			
//end of code
//update data in machine_master table
MachineMaster machineMaster= new MachineMaster();
Criteria cr=session.createCriteria(MachineMaster.class);
cr.add(Restrictions.eq("machineId", machineId));
machineMaster= (MachineMaster) cr.list().get(0);
machineMaster.setMachineStatus("F");
DaoMachineBreakdown daoMachineBreakdown=new DaoMachineBreakdown();
			
daoMachineBreakdown.saveMachineBreakdown(machineBreakdown, machineMaster);
		
//Add below code
SentSms sentSms=new SentSms();
AddAmcAgency addAmcAgency= (AddAmcAgency) session.get(AddAmcAgency.class, amcAgencyId);
SupplierDetails supplierDetails= (SupplierDetails) session.get(SupplierDetails.class, purchasedBy);
String phoneNo[]=new String[2];
phoneNo[0]=addAmcAgency.getMobileNo();
phoneNo[1]=supplierDetails.getMobileNo();
String content=machineDescription+ " Failed in MCF due to " +breakdownDetails+ "on Dated "+df.parse(dateOfBreakDown);
sentSms.sentBulkSms(phoneNo, content)	;
//end of code
		
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				
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

	public String getDateOfBreakDown() {
		return dateOfBreakDown;
	}

	public void setDateOfBreakDown(String dateOfBreakDown) {
		this.dateOfBreakDown = dateOfBreakDown;
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
	
}
