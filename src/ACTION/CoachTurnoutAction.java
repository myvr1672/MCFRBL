package ACTION;

import java.util.List;


import org.hibernate.Session;


import com.opensymphony.xwork2.ActionSupport;

import beans.CoachTurnoutTransaction;
import dao.DaoCoachTurnoutTransaction;
import hibernateConnect.HibernateConfig;


public class CoachTurnoutAction extends ActionSupport{


	private static final long serialVersionUID = 1L;

	private DaoCoachTurnoutTransaction dao = new DaoCoachTurnoutTransaction();

	private List<CoachTurnoutTransaction> records;
	private String result;
	private String message;
	private CoachTurnoutTransaction record;
	
	private String coachNumber;
	private String coachType;
	private Integer shellAssetId;
	
	
	private Integer bogiePpSideAssetId;
	private Integer bogieNppSideAssetId;
	
	private String coachManufacturedDate;

	private String jtSorting;//for sorting
	
	Session session =null;
	
	
	public String list() {
		 session = HibernateConfig.getSession();
		try {
			
			

			//To check  previous stage of substage master
			
			setRecords(dao.getAllCoach(jtSorting));
			
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


	public DaoCoachTurnoutTransaction getDao() {
		return dao;
	}


	public void setDao(DaoCoachTurnoutTransaction dao) {
		this.dao = dao;
	}


	public List<CoachTurnoutTransaction> getRecords() {
		return records;
	}


	public void setRecords(List<CoachTurnoutTransaction> records) {
		this.records = records;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public CoachTurnoutTransaction getRecord() {
		return record;
	}


	public void setRecord(CoachTurnoutTransaction record) {
		this.record = record;
	}


	public String getCoachNumber() {
		return coachNumber;
	}


	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
	}


	public String getCoachType() {
		return coachType;
	}


	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}


	public Integer getShellAssetId() {
		return shellAssetId;
	}


	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}


	public Integer getBogiePpSideAssetId() {
		return bogiePpSideAssetId;
	}


	public void setBogiePpSideAssetId(Integer bogiePpSideAssetId) {
		this.bogiePpSideAssetId = bogiePpSideAssetId;
	}


	public Integer getBogieNppSideAssetId() {
		return bogieNppSideAssetId;
	}


	public void setBogieNppSideAssetId(Integer bogieNppSideAssetId) {
		this.bogieNppSideAssetId = bogieNppSideAssetId;
	}


	public String getCoachManufacturedDate() {
		return coachManufacturedDate;
	}


	public void setCoachManufacturedDate(String coachManufacturedDate) {
		this.coachManufacturedDate = coachManufacturedDate;
	}


	public String getJtSorting() {
		return jtSorting;
	}


	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}
	
	
}
