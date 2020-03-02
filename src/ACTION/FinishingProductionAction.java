package ACTION;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionSupport;
import hibernateConnect.HibernateConfig;
import model.SubStagesMaster;

import beans.FinishingTransaction;
import dao.DaoFinishingProduction;

//import dao.DaoSheetCutting;

public class FinishingProductionAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoFinishingProduction dao = new DaoFinishingProduction();

	private List<FinishingTransaction> records;
	private String result;
	private String message;
	private FinishingTransaction record;
	private String stageID;
	private Integer finishingAssetId;
	private Integer shellAssetId;
	private Integer bogiePpSideAssetId;
	private Integer bogieNppSideAssetId;
	private String coachNumber;
	private String assemblyStartDate;
	private String expectedExitDate;
	private String remarks;
	
	
	
	
	
	
	
	//private Date exitDate;
	
	private String jtSorting;//for sorting
	
	Session session =null;
	
	public String list() {
		 session = HibernateConfig.getSession();
		try {
			
			

			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllFinishing(stageID, jtSorting, previousStage));
			
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
		session = HibernateConfig.getSession();
		try {
		
			setRecords(dao.getDispatchFinishing(jtSorting));
			
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
//
//	public String available() {
//		try {
//			
//			session = HibernateConfig.getSession();
//			
//			setRecords(dao.availableBogie(jtSorting));
//			
//			System.out.println("Records = "+getRecords());
//			setResult("OK");
//		} catch (Exception e) {
//			setResult("ERROR");
//			setMessage(e.getMessage());
//			System.err.println(e.getMessage());
//		}finally{
//			session.close();
//		}
//		return ActionSupport.SUCCESS;
//	}

	

	public String update() throws IOException {	
		try{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new FinishingTransaction();
		
		session = HibernateConfig.getSession();
		
		// retrieve existing bogie from furnishing shop
   
		Criteria cr = session.createCriteria(FinishingTransaction.class);
		
		cr.add(Restrictions.eq("finishingAssetId", finishingAssetId));
		
		FinishingTransaction record = (FinishingTransaction)cr.list().get(0);
		
			record.setExpectedExitDate(df.parse(expectedExitDate));
			
			record.setTransactionUser(userID);
			record.setTransactionDate(sdf.format(timestamp));
			record.setRemarks(remarks);
	
		dao.updateFinishingProgress(record);
			setResult("OK");
		} 
			    catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		return ActionSupport.SUCCESS;
	}
	public DaoFinishingProduction getDao() {
		return dao;
	}
	public void setDao(DaoFinishingProduction dao) {
		this.dao = dao;
	}
	public List<FinishingTransaction> getRecords() {
		return records;
	}
	public void setRecords(List<FinishingTransaction> records) {
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
	public FinishingTransaction getRecord() {
		return record;
	}
	public void setRecord(FinishingTransaction record) {
		this.record = record;
	}
	public String getStageID() {
		return stageID;
	}
	public void setStageID(String stageID) {
		this.stageID = stageID;
	}
	public Integer getFinishingAssetId() {
		return finishingAssetId;
	}
	public void setFinishingAssetId(Integer finishingAssetId) {
		this.finishingAssetId = finishingAssetId;
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
	public String getCoachNumber() {
		return coachNumber;
	}
	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
	}
	public String getAssemblyStartDate() {
		return assemblyStartDate;
	}
	public void setAssemblyStartDate(String assemblyStartDate) {
		this.assemblyStartDate = assemblyStartDate;
	}
	public String getExpectedExitDate() {
		return expectedExitDate;
	}
	public void setExpectedExitDate(String expectedExitDate) {
		this.expectedExitDate = expectedExitDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getJtSorting() {
		return jtSorting;
	}
	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}
	
	

}
