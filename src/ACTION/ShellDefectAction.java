package ACTION;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import common.DateUtil;

import dao.DaoShellDefect;
import hibernateConnect.HibernateConfig;
import beans.ShellDefectsTransaction;

import model.User;

public class ShellDefectAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoShellDefect dao = new DaoShellDefect();

	private List<ShellDefectsTransaction> records;
	private String result;
	private String message;
	private ShellDefectsTransaction record;

	private ShellDefectsTransaction shellDefectsTransaction = new ShellDefectsTransaction();
	
	
	private Integer abid;
	private Integer shellDefectId;
	private Integer shellAssetId;
	private String detailShellDefectDescription;
	private String defectReportedDate;
	private String actionPerformed;
	private String remarks;
	private String status;
	private String jtSorting;//for sorting
	
	public String list() {
		try {
			setRecords(getDao().getAllShellDefect(jtSorting));
			
			System.out.println("Records = "+getRecords());
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public String create() throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new ShellDefectsTransaction();
		Session session =  null;
		session = HibernateConfig.getSession();
		try {
		record.setShellAssetId(shellAssetId);
		record.setShellDefectId(shellDefectId);
		record.setDetailShellDefectDescription(detailShellDefectDescription);
		if(!("".equals(defectReportedDate))) { record.setDefectReportedDate(DateUtil.convertToDate(defectReportedDate));}
		else
		{
			record.setDefectReportedDate(new Date());
		}
		record.setEntryDate(sdf.format(timestamp));
		record.setEntryBy(userID);
		record.setStatus("Intimated");
			getDao().addShellDefect(record);
				
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally{
			if(session!=null)
			{
				session.close();
			}
		}
		return ActionSupport.SUCCESS;
	}

	public String update() throws IOException {			
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		Session session =  null;
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			session = HibernateConfig.getSession();
			record = (ShellDefectsTransaction)session.get(ShellDefectsTransaction.class,abid);
			
			Integer shellDefectIDFromDB=record.getShellDefectId();
			Integer shellFromDB=record.getShellAssetId();
			String defectReportedDateFromDB=df.format(record.getDefectReportedDate());
			
			record.setShellDefectId(shellDefectId);
			record.setShellAssetId(shellAssetId);
			
			record.setDetailShellDefectDescription(detailShellDefectDescription);
			//record.setCreatedate(new Date());
			
			if(!("".equals(defectReportedDate)))
			{
				
				Date defectReportedDateD = df.parse(defectReportedDate);
			
			record.setDefectReportedDate(defectReportedDateD);
			
			}
			
			else { record.setDefectReportedDate(new Date());  }
		       
			//enter code here for shop
			if((shellDefectIDFromDB!=shellDefectId)||!(defectReportedDateFromDB.equals(defectReportedDate))||(shellFromDB!=shellAssetId))
			{
			record.setEntryDate(sdf.format(timestamp));
			record.setEntryBy(userID);
			}
			if(!("".equals(actionPerformed)))
			//if(actionPerformed!=null)
			{		
			String actionPerformedFromDB=	record.getActionPerformed();
			String remarksFromDB=	record.getRemarks();
			record.setActionPerformed(actionPerformed);
			record.setRemarks(remarks);
			record.setStatus(status);
			if((!actionPerformedFromDB.equals(actionPerformed))||!(remarksFromDB.equals(remarks)))
			{
			record.setRemarkEntryBy(userID);
			record.setRemarkEntryDate(sdf.format(timestamp));
			}
			}
			getDao().updateShellDefect(record);  //code here
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			session.close();
		}
		return ActionSupport.SUCCESS;
	}

	public String delete() throws IOException {
		try {
			
		getDao().deleteShellDefect(abid);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public DaoShellDefect getDao() {
		return dao;
	}

	public void setDao(DaoShellDefect dao) {
		this.dao = dao;
	}

	public List<ShellDefectsTransaction> getRecords() {
		return records;
	}

	public void setRecords(List<ShellDefectsTransaction> records) {
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

	public ShellDefectsTransaction getRecord() {
		return record;
	}

	public void setRecord(ShellDefectsTransaction record) {
		this.record = record;
	}

	public ShellDefectsTransaction getShellDefectsTransaction() {
		return shellDefectsTransaction;
	}

	public void setShellDefectsTransaction(ShellDefectsTransaction shellDefectsTransaction) {
		this.shellDefectsTransaction = shellDefectsTransaction;
	}

	public Integer getAbid() {
		return abid;
	}

	public void setAbid(Integer abid) {
		this.abid = abid;
	}

	public Integer getShellDefectId() {
		return shellDefectId;
	}

	public void setShellDefectId(Integer shellDefectId) {
		this.shellDefectId = shellDefectId;
	}

	public Integer getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getDetailShellDefectDescription() {
		return detailShellDefectDescription;
	}

	public void setDetailShellDefectDescription(String detailShellDefectDescription) {
		this.detailShellDefectDescription = detailShellDefectDescription;
	}

	public String getDefectReportedDate() {
		return defectReportedDate;
	}

	public void setDefectReportedDate(String defectReportedDate) {
		this.defectReportedDate = defectReportedDate;
	}

	public String getActionPerformed() {
		return actionPerformed;
	}

	public void setActionPerformed(String actionPerformed) {
		this.actionPerformed = actionPerformed;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}


}
