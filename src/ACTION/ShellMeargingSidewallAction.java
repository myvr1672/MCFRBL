package ACTION;

import java.io.IOException;
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

import beans.ShellProgress;

import dao.DaoShellMearging;

public class ShellMeargingSidewallAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoShellMearging dao = new DaoShellMearging();
	
	
	
	private List<ShellProgress> records;
	private String result;
	private String message;
	private ShellProgress record;

	private ShellProgress shellProgress = new ShellProgress();
	private String prevStageID;
	
	private Integer assetID;
	private String stageID;
	private String shellNumber;	
	private String shellType;
	private String entryDate;
	private String expectedExitDate;
	
	
	
	
	private String receiptDate;
	
	//private Date exitDate;
	
	private String jtSorting;//for sorting
	

	
	
	
	public String list() {
		try {
			setRecords(dao.getAllShellProgress(stageID, jtSorting,  prevStageID ));
			
			System.out.println("Records = "+getRecords());
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	

	public String update() throws IOException {			
		Session session=null;		
		try {


			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(ShellProgress.class);
		    cr.add(Restrictions.eq("assetID", assetID));
			//cr.add(Restrictions.eq("substageId", stageID));
		//	cr.add(Restrictions.eq("previousStageId", prevStageID));

			record = (ShellProgress)cr.list().get(0);
                  
		
			record.setAssetID(assetID);
			
  			if(!("".equals(receiptDate)))
  			{
      Date receiptDateD = df.parse(receiptDate);
  record.setReceiptDate(receiptDateD);
  			}
  			else{
  				record.setReceiptDate(new Date());
  			}
   		   	
			
			
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

	

	
	

	public DaoShellMearging getDao() {
		return dao;
	}



	public void setDao(DaoShellMearging dao) {
		this.dao = dao;
	}



	public String getPrevStageID() {
		return prevStageID;
	}



	public void setPrevStageID(String prevStageID) {
		this.prevStageID = prevStageID;
	}



	public Integer getAssetID() {
		return assetID;
	}



	public void setAssetID(Integer assetID) {
		this.assetID = assetID;
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
