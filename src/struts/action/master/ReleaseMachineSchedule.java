package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;



import beans.MachineScheduleTransaction;

import dao.DaoMachineScheduleTransaction;
import hibernateConnect.HibernateConfig;

public class ReleaseMachineSchedule {

	private Integer machineId;
	private Integer scheduleId;
	
	private String releaseDate;
	
	
	
	public String assignReleaseDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
MachineScheduleTransaction	machineScheduleTransaction= new	MachineScheduleTransaction();
//First row entry

Criteria cr = session.createCriteria(MachineScheduleTransaction.class);
cr.add(Restrictions.eq("machineId", machineId));
cr.add(Restrictions.eq("scheduleId", scheduleId));

@SuppressWarnings("unchecked")
List<MachineScheduleTransaction> spList=(List<MachineScheduleTransaction>)cr.list();
machineScheduleTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
if(!("".equals(releaseDate))) { machineScheduleTransaction.setDispatchDateForSchedule(df.parse(releaseDate)); }


DaoMachineScheduleTransaction daoMachineScheduleTransaction=new DaoMachineScheduleTransaction();
			
daoMachineScheduleTransaction.updatemachineSchedule(machineScheduleTransaction);
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



	public String getReleaseDate() {
		return releaseDate;
	}



	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	
}
