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

import beans.MachineActivityScheduleLinking;
import beans.MachineScheduleTransaction;
//import beans.Safety;
import beans.SafetyTransaction;
//import dao.DaoSafety;
import dao.SafetyTransactionDao;
import hibernateConnect.HibernateConfig;
import model.MachineBreakdown1;
import model.machine_operation;


public class SafetyTransactionAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	/*HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");*/
	private SafetyTransactionDao dao = new SafetyTransactionDao();

	private List<SafetyTransaction> records;
	private String result;
	private String message;
	private SafetyTransaction record;
	private Integer safetyInstructionId;
	private Integer machineId;
	private String safetyFlag;
//	private Timestamp entryDate;
	//private String entryBy;
	
	
	//private String jtSorting;//for sorting
	
	

	
	public String list() {
		try {
			setRecords(getDao().getAllSafetyTransaction(machineId));
			
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
		record = new SafetyTransaction();
		record.setSafetyInstructionId(safetyInstructionId);
		record.setMachineId(machineId);
		record.setSafetyFlag(safetyFlag);
		
		try {
						
			
			dao.addSafetyTransaction(record);
			setResult("OK");
		} 
		catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
				return ActionSupport.SUCCESS;	
	}


	
	public String delete() throws IOException {
		try {
			record = new SafetyTransaction();
			Session session=null;
		    session=HibernateConfig.getSession();
		    Criteria c = session.createCriteria(SafetyTransaction.class);
			c.add(Restrictions.eq("machineId", machineId));
			c.add(Restrictions.eq("safetyInstructionId", safetyInstructionId));
			System.out.println(machineId+" "+safetyInstructionId);
			record= (SafetyTransaction) c.list().get(0);
			
		getDao().deleteSafetyTransaction(record);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public SafetyTransactionDao getDao() {
		return dao;
	}

	public void setDao(SafetyTransactionDao dao) {
		this.dao = dao;
	}

	public List<SafetyTransaction> getRecords() {
		return records;
	}

	public void setRecords(List<SafetyTransaction> records) {
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

	public SafetyTransaction getRecord() {
		return record;
	}

	public void setRecord(SafetyTransaction record) {
		this.record = record;
	}

	public Integer getSafetyInstructionId() {
		return safetyInstructionId;
	}

	public void setSafetyInstructionId(Integer safetyInstructionId) {
		this.safetyInstructionId = safetyInstructionId;
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public String getSafetyFlag() {
		return safetyFlag;
	}

	public void setSafetyFlag(String safetyFlag) {
		this.safetyFlag = safetyFlag;
	}


	

	

}
