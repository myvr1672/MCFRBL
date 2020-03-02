package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


import beans.MachineBreakdown;

import dao.DaoMachineBreakdown;
import hibernateConnect.HibernateConfig;

public class ReleaseMachineFailed {

	private Integer machineId;
	private Integer breakdownId;
	
	private String releaseDate;
	
	
	
	public String assignReleaseDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
MachineBreakdown	machineBreakdown= new	MachineBreakdown();
//First row entry

Criteria cr = session.createCriteria(MachineBreakdown.class);
cr.add(Restrictions.eq("machineId", machineId));
cr.add(Restrictions.eq("breakdownId", breakdownId));

@SuppressWarnings("unchecked")
List<MachineBreakdown> spList=(List<MachineBreakdown>)cr.list();
machineBreakdown=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
if(!("".equals(releaseDate))) { machineBreakdown.setDispatchDateForRepair(df.parse(releaseDate)); }


DaoMachineBreakdown daoMachineBreakdown=new DaoMachineBreakdown();
			
daoMachineBreakdown.updatemachineBreakDown(machineBreakdown);
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



	public Integer getBreakdownId() {
		return breakdownId;
	}



	public void setBreakdownId(Integer breakdownId) {
		this.breakdownId = breakdownId;
	}



	public String getReleaseDate() {
		return releaseDate;
	}



	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	
}
