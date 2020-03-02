package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.CoachOutAfterRackFormation;
import dao.DaoCoachTurnoutTransaction;
import hibernateConnect.HibernateConfig;

public class ExitCoachAction {
	private Integer coachOutID;
	private String coachNumbers;
	private String dispatchDate;
	private String commissionDate;
	private String remarks;
	private String railway;
	
	
	
	
	public String assignexitDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
CoachOutAfterRackFormation	coachOutAfterRackFormation= new	CoachOutAfterRackFormation();

//First row entry

Criteria cr = session.createCriteria(CoachOutAfterRackFormation.class);
cr.add(Restrictions.eq("coachOutID", coachOutID));

@SuppressWarnings("unchecked")
List<CoachOutAfterRackFormation> spList=(List<CoachOutAfterRackFormation>)cr.list();
coachOutAfterRackFormation=spList.get(0);
coachOutAfterRackFormation.setDispatchDate(df.parse(dispatchDate));
coachOutAfterRackFormation.setComissionedDate(df.parse(commissionDate));
coachOutAfterRackFormation.setRemarks(remarks);
coachOutAfterRackFormation.setDispatchedRailway(railway);

DaoCoachTurnoutTransaction daoCoachTurnoutTransaction=new DaoCoachTurnoutTransaction();
			
daoCoachTurnoutTransaction.updateCoachDispatch(coachOutAfterRackFormation);
			
			
			
			
			
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
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




	public Integer getCoachOutID() {
		return coachOutID;
	}




	public void setCoachOutID(Integer coachOutID) {
		this.coachOutID = coachOutID;
	}




	public String getCoachNumbers() {
		return coachNumbers;
	}




	public void setCoachNumbers(String coachNumbers) {
		this.coachNumbers = coachNumbers;
	}




	public String getDispatchDate() {
		return dispatchDate;
	}




	public void setDispatchDate(String dispatchDate) {
		this.dispatchDate = dispatchDate;
	}




	public String getCommissionDate() {
		return commissionDate;
	}




	public void setCommissionDate(String commissionDate) {
		this.commissionDate = commissionDate;
	}




	public String getRemarks() {
		return remarks;
	}




	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}




	public String getRailway() {
		return railway;
	}




	public void setRailway(String railway) {
		this.railway = railway;
	}
	
	
	

}
