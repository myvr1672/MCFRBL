package ACTION;

import java.util.List;


import org.hibernate.Session;


import com.opensymphony.xwork2.ActionSupport;

import beans.CoachOutAfterRackFormation;

import dao.DaoCoachTurnoutTransaction;
import hibernateConnect.HibernateConfig;



public class CoachProductionAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private Integer coachOutID;
	private String rackId;
	private String coachNumbers;
	private String rackFormationDate;
	private String remarks;
	private String dispatchDate;
	private String comissionedDate;
	private String dispatchedRailway;
	private String jtSorting;//for sorting
	private String result;
	private String message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	private DaoCoachTurnoutTransaction dao = new DaoCoachTurnoutTransaction();
	
	
	
	private List<CoachOutAfterRackFormation> records;
	Session session=HibernateConfig.getSession();
	public String list() {
		try {
			
			session = HibernateConfig.getSession();
		
			setRecords(dao.getAllReadyCoach(jtSorting));
			
			System.out.println("Records = "+getRecords());
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		return ActionSupport.SUCCESS;
	}
	
	public String display() {
		try {
			
			session = HibernateConfig.getSession();
		
			setRecords(dao.getAllSentCoach(jtSorting));
			
			System.out.println("Records = "+getRecords());
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		return ActionSupport.SUCCESS;
	}
	
	public String getJtSorting() {
		return jtSorting;
	}



	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}



	public DaoCoachTurnoutTransaction getDao() {
		return dao;
	}



	public void setDao(DaoCoachTurnoutTransaction dao) {
		this.dao = dao;
	}



	public List<CoachOutAfterRackFormation> getRecords() {
		return records;
	}



	public void setRecords(List<CoachOutAfterRackFormation> records) {
		this.records = records;
	}



	public Integer getCoachOutID() {
		return coachOutID;
	}
	public void setCoachOutID(Integer coachOutID) {
		this.coachOutID = coachOutID;
	}
	public String getRackId() {
		return rackId;
	}
	public void setRackId(String rackId) {
		this.rackId = rackId;
	}
	public String getCoachNumbers() {
		return coachNumbers;
	}
	public void setCoachNumbers(String coachNumbers) {
		this.coachNumbers = coachNumbers;
	}
	public String getRackFormationDate() {
		return rackFormationDate;
	}
	public void setRackFormationDate(String rackFormationDate) {
		this.rackFormationDate = rackFormationDate;
	}


	public String getResult() {
		return result;
	}



	public void setResult(String result) {
		this.result = result;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getDispatchDate() {
		return dispatchDate;
	}

	public void setDispatchDate(String dispatchDate) {
		this.dispatchDate = dispatchDate;
	}

	public String getComissionedDate() {
		return comissionedDate;
	}

	public void setComissionedDate(String comissionedDate) {
		this.comissionedDate = comissionedDate;
	}

	public String getDispatchedRailway() {
		return dispatchedRailway;
	}

	public void setDispatchedRailway(String dispatchedRailway) {
		this.dispatchedRailway = dispatchedRailway;
	}
	
	
}
