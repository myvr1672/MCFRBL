package ACTION;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.ShellDefectsMaster;
import dao.ShellDefectMasterDao;
import hibernateConnect.HibernateConfig;

public class ShellDefectMasterAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	private  ShellDefectMasterDao dao = new ShellDefectMasterDao();
	
    private List<ShellDefectsMaster> records;
	private String result;
	private String message;
	private ShellDefectsMaster record;
	private Integer shellDefectId;
	private String shellDefectDescription;
	    
	
	//private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	private String jtSorting;//for sorting

	public String list() {
		try {
			
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);

			setRecords(getDao().getAllShellDefects(startPageIndex, numRecordsPerPage, jtSorting));
			totalRecordCount= (Integer) session_map.get("holding_count");
			session_map.remove("holding_count");


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
		
	   record = new ShellDefectsMaster();
		record.setShellDefectDescription(shellDefectDescription);
		
		try {
						
			
			dao.addShellDefectMaster(record);
			setResult("OK");
		} 
		catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
				return ActionSupport.SUCCESS;	
	}
		

	public String update() throws IOException {			
		record = new ShellDefectsMaster();
		Session session = null;
		session = HibernateConfig.getSession();
		record= (ShellDefectsMaster) session.get(ShellDefectsMaster.class, shellDefectId);
		
		record.setShellDefectDescription(shellDefectDescription);
			
			try {
			
		    getDao().updateShellDefectMaster(record);
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
			
		getDao().deleteShellDefectMaster(shellDefectId);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}




	public ShellDefectMasterDao getDao() {
		return dao;
	}




	public void setDao(ShellDefectMasterDao dao) {
		this.dao = dao;
	}




	public List<ShellDefectsMaster> getRecords() {
		return records;
	}




	public void setRecords(List<ShellDefectsMaster> records) {
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




	public ShellDefectsMaster getRecord() {
		return record;
	}




	public void setRecord(ShellDefectsMaster record) {
		this.record = record;
	}




	public Integer getShellDefectId() {
		return shellDefectId;
	}




	public void setShellDefectId(Integer shellDefectId) {
		this.shellDefectId = shellDefectId;
	}




	public String getShellDefectDescription() {
		return shellDefectDescription;
	}




	public void setShellDefectDescription(String shellDefectDescription) {
		this.shellDefectDescription = shellDefectDescription;
	}




	public String getJtStartIndex() {
		return jtStartIndex;
	}




	public void setJtStartIndex(String jtStartIndex) {
		this.jtStartIndex = jtStartIndex;
	}




	public String getJtPageSize() {
		return jtPageSize;
	}




	public void setJtPageSize(String jtPageSize) {
		this.jtPageSize = jtPageSize;
	}




	public int getTotalRecordCount() {
		return totalRecordCount;
	}




	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}




	public String getJtSorting() {
		return jtSorting;
	}




	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}
	
	
}
