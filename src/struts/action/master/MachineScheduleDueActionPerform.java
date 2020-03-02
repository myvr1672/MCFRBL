package struts.action.master;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.CoachTurnoutTransaction;
import beans.MachineMaster;
import beans.MachineScheduleTransaction;
import beans.SpareChangeInSchedule;
import beans.WheelsetTransaction;
import dao.DaoMachineScheduleTransaction;
import hibernateConnect.HibernateConfig;

public class MachineScheduleDueActionPerform {

	private Integer machineId;
	private Integer scheduleId;
	private String actionTaken;
	private String remarks;
	private String spareDescription;
	private String spareSrNo;
	private String scheduleCompletedDate;
	
	
	public String performAction()
	{
		System.out.println("machineId:"+machineId);
		System.out.println("scheduleId:"+scheduleId);
		System.out.println("actionTaken:"+actionTaken);
		System.out.println("remarks:"+remarks);
		System.out.println("spareDescription:"+spareDescription);
		System.out.println("spareSrNo:"+spareSrNo);
		
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		String userID = (String) session_http.getAttribute("userid");
		
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			
			MachineScheduleTransaction	machineScheduleTransaction= new	MachineScheduleTransaction();
			//First row entry   
			
			Criteria cr = session.createCriteria(MachineScheduleTransaction.class);
			cr.add(Restrictions.eq("machineId", machineId));
			cr.add(Restrictions.eq("scheduleId", scheduleId));
			
			machineScheduleTransaction=(MachineScheduleTransaction) cr.list().get(0);
			//update
			
			machineScheduleTransaction.setActionTaken(actionTaken);
			machineScheduleTransaction.setRemarks(remarks);
			machineScheduleTransaction.setScheduleCompletedFlag("Y");
			
			if(!("".equals(scheduleCompletedDate))){machineScheduleTransaction.setScheduleCompletedDate(df.parse(scheduleCompletedDate));}
			
			//List <SpareChangeInSchedule> spareChangeInScheduleList= null;
			List<SpareChangeInSchedule> spareChangeInScheduleList=new ArrayList<SpareChangeInSchedule>();
			
			Criteria c1= session.createCriteria(SpareChangeInSchedule.class);
			c1.add(Restrictions.eq("scheduleId", scheduleId));
			
			List<SpareChangeInSchedule> spList=(List<SpareChangeInSchedule>)c1.list();
		//	spareChangeInSchedule=spList.get(0);
			
			//converting  String to array of String
			String[] spareDescriptionString=spareDescription.split(",");
			String[] spareSrNoString=spareSrNo.split(",");
		//	System.out.println("Action3:"+actionTaken);
			
			
			for(int i=0;i<spareDescriptionString.length;i++)

			{
				Timestamp timestamp= new Timestamp(System.currentTimeMillis());
				SpareChangeInSchedule spareChangeInSchedule= new SpareChangeInSchedule();
				spareChangeInSchedule.setEntryBy(userID);
				spareChangeInSchedule.setEntryDate(timestamp);
				spareChangeInSchedule.setScheduleId(scheduleId);
				spareChangeInSchedule.setSpareDescription(spareDescriptionString[i]);
				spareChangeInSchedule.setSpareSrNo(spareSrNoString[i]);
				spareChangeInScheduleList.add(spareChangeInSchedule);
				
			}
			//save	
		  DaoMachineScheduleTransaction daoMachineScheduleTransaction=new DaoMachineScheduleTransaction();
		  daoMachineScheduleTransaction.updateTargetMachineSchedule(machineScheduleTransaction,spareChangeInScheduleList);
						// Second row entry
						
			
			return "success";
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoAbnormality getAllAbnormaity() methods finally Block--");
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



	public Integer getScheduleId() {
		return scheduleId;
	}



	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}



	public String getActionTaken() {
		return actionTaken;
	}



	public void setActionTaken(String actionTaken) {
		this.actionTaken = actionTaken;
	}



	public String getRemarks() {
		return remarks;
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
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



	public String getScheduleCompletedDate() {
		return scheduleCompletedDate;
	}



	public void setScheduleCompletedDate(String scheduleCompletedDate) {
		this.scheduleCompletedDate = scheduleCompletedDate;
	}



	
	
}
