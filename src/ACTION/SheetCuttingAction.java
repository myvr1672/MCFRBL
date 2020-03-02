package ACTION;

import java.io.IOException;
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
import hibernateConnect.HibernateConfig;
import model.SubStagesMaster;
import beans.ShellProgress;


import dao.DaoSheetCutting;

public class SheetCuttingAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoSheetCutting dao = new DaoSheetCutting();
	
	
	
	private List<ShellProgress> records;
	private String result;
	private String message;
	private ShellProgress record;

	private ShellProgress shellProgress = new ShellProgress();
	private String shellNumber;	
	private String wheelNumber;
	private String shellType;
	private String entryDate;
	private String expectedExitDate;
	private String remarks;
	private String stageID;
	private String receiptDate;
	private Integer assetID;
	private String bogieNumber;
	private String coachNumber;
	//private Date exitDate;
	
	private String jtSorting;//for sorting
	
	Session session=null;
	
	
	
	public String list() {
		try {
			
			session = HibernateConfig.getSession();
			
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllShellProgress(stageID,jtSorting, previousStage));
			
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

	public String create() throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new ShellProgress();
		
		session = HibernateConfig.getSession();
		
		
		//To check  previous stage of substage master
		Criteria cr1 = session.createCriteria(SubStagesMaster.class);
		
		cr1.add(Restrictions.eq("substageId", stageID));
		
		SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
		String previousStage=subStagesMaster.getPreviousstageId();
		//
		
	if(stageID.equals("3")) 
	
	{
		
		record.setShellNumber(shellNumber);
	}
		if(stageID.equals("1")) { record.setWheelNumber(wheelNumber);}
		// record.setShellNumber(shellNumber);
	    record.setShellType(shellType);
	    record.setSubstageId(stageID);
        record.setRemarks(remarks);
        
        record.setPreviousStageId(previousStage);
		record.setEntryBy(userID);
		record.setSystemEntryTime(sdf.format(timestamp));
	    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	    try {
		if(!("".equals(entryDate)))
					{
		Date createdateD = df.parse(entryDate);
		record.setEntryDate(createdateD);
					}
		else
		{
			record.setEntryDate(new Date());
		}
		if(previousStage.equals("START"))
		{
			Date createdateD = df.parse(entryDate);
			record.setReceiptDate(createdateD);
			
		}
		else
		{
			if(!("".equals(receiptDate)))
			{
Date receiptDateD = df.parse(receiptDate);
record.setReceiptDate(receiptDateD);
			}
   else
   {
	record.setEntryDate(new Date());
    }	
		}
		
	    record.setExpectedExitDate(df.parse(expectedExitDate));
		
		
		
			
			
			dao.addSheetProgress(record);
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

	public String update() throws IOException {			
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		try {
			session=HibernateConfig.getSession();
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			
			
			//
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			Session session =  null;
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellProgress.class);
			cr.add(Restrictions.eq("assetID", assetID));
			

			record = (ShellProgress)cr.list().get(0);
			
                   if(previousStage.equals("START"))
  		   {
        	  
  			Date createdateD = df.parse(entryDate);
  			record.setReceiptDate(createdateD);
  			
  		}
  		else
  		{
  			if(!("".equals(receiptDate)))
  			{
  Date receiptDateD = df.parse(receiptDate);
  record.setReceiptDate(receiptDateD);
  			}
     else
     {
  	record.setEntryDate(new Date());
      }	
  		}
                   
                if(stageID.equals("3")||stageID.equals("4")) { record.setShellNumber(shellNumber);}
           		if(stageID.equals("1")) { record.setWheelNumber(wheelNumber);}
           		if(stageID.equals("6")) { record.setWheelNumber(wheelNumber);record.setBogieNumber(bogieNumber);record.setShellNumber(shellNumber); record.setCoachNumber(coachNumber);}
           		if(stageID.equals("8")) { record.setWheelNumber(wheelNumber);record.setBogieNumber(bogieNumber);record.setShellNumber(shellNumber); record.setCoachNumber(coachNumber);}
			record.setSubstageId(stageID);
			record.setEntryBy(userID);
		
		
			record.setSystemEntryTime(sdf.format(timestamp));
			record.setRemarks(remarks);
			 record.setExpectedExitDate(df.parse(expectedExitDate));		
			
			
			dao.updateSheetProgress(record);  //code here
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

	public List<ShellProgress> getRecords() {
		return records;
	}

	public void setRecords(List<ShellProgress> records) {
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

	public ShellProgress getRecord() {
		return record;
	}

	public void setRecord(ShellProgress record) {
		this.record = record;
	}

	public ShellProgress getShellProgress() {
		return shellProgress;
	}

	public void setShellProgress(ShellProgress shellProgress) {
		this.shellProgress = shellProgress;
	}

	public String getShellNumber() {
		return shellNumber;
	}

	public void setShellNumber(String shellNumber) {
		this.shellNumber = shellNumber;
	}

	public String getShellType() {
		return shellType;
	}

	public void setShellType(String shellType) {
		this.shellType = shellType;
	}

	

	public String getWheelNumber() {
		return wheelNumber;
	}

	public void setWheelNumber(String wheelNumber) {
		this.wheelNumber = wheelNumber;
	}

	public Integer getAssetID() {
		return assetID;
	}

	public void setAssetID(Integer assetID) {
		this.assetID = assetID;
	}

	public String getBogieNumber() {
		return bogieNumber;
	}

	public void setBogieNumber(String bogieNumber) {
		this.bogieNumber = bogieNumber;
	}

	public String getCoachNumber() {
		return coachNumber;
	}

	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getExpectedExitDate() {
		return expectedExitDate;
	}

	public void setExpectedExitDate(String expectedExitDate) {
		this.expectedExitDate = expectedExitDate;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public DaoSheetCutting getDao() {
		return dao;
	}

	public void setDao(DaoSheetCutting dao) {
		this.dao = dao;
	}

	public String getStageID() {
		return stageID;
	}

	public void setStageID(String stageID) {
		this.stageID = stageID;
	}

	public String getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}

	

	

}
