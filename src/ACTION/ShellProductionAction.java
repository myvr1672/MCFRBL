package ACTION;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import hibernateConnect.HibernateConfig;
import model.SubStagesMaster;

import beans.ShellTransaction;
import dao.DaoPaintProduction;
import dao.DaoShellProduction;

//import dao.DaoSheetCutting;

public class ShellProductionAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoShellProduction dao = new DaoShellProduction();
	private DaoPaintProduction daoPaint = new DaoPaintProduction();
	
	
	private List<ShellTransaction> records;
	
	private String result;
	private String message;
	private ShellTransaction record;
	private Integer shellAssetId;
    private String stageID;
	private ShellTransaction shellProgress = new ShellTransaction();
	private String shellTransactionId;	
	private String shellType;
	private String assemblyStartDate;
	private String expectedExitDate;
	private String remarks;
	//private Date exitDate;
	private String datefrom;
	private String dateto;
	private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private Integer totalRecordCount;
	Session session=null;
	
	
	
	public String list() {
		try {
			
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllShell(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
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
	public String listSIPComonent()
	{
		try
		{
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllSIPComponentShell(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
		}
		catch (Exception e)
		{
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			
		}
		return ActionSupport.SUCCESS;
	}
	public String listSIPStage()
	{
		try
		{
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllSIPStageShell(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(Integer)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
		}
		catch (Exception e)
		{
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			
		}
		return ActionSupport.SUCCESS;
	}
	
	public String listSIPFinal()
	{
		try
		{
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllSIPFinalShell(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
		}
		catch (Exception e)
		{
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			
		}
		return ActionSupport.SUCCESS;
	}
	public String listFinalInspection()
	{
		try
		{
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getFinalInspectionShell(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
		}
		catch (Exception e)
		{
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			
		}
		return ActionSupport.SUCCESS;
	}
	public String checkListForm()
	{
		try
		{
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getCheckListShell(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
		}
		catch (Exception e)
		{
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			
		}
		return ActionSupport.SUCCESS;	
	}
	
	public String qualityClearanceForm()
	{
		try
		{
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getQualityClearanceShell(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
		}
		catch (Exception e)
		{
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			
		}
		return ActionSupport.SUCCESS;	
	}
	public String qualityClearanceReport()
	{
		try
		{
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getReportClearanceShell(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
		}
		catch (Exception e)
		{
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			
		}
		return ActionSupport.SUCCESS;	
	}
	
	
	
	public String display() {
		try {
			
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(dao.displayDispatchShell(jtSorting, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
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
	public String dispatch() {
		try {
			
			session = HibernateConfig.getSession();
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(dao.dispatchShell(jtSorting, datefrom, dateto, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
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
	

	public String create() throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new ShellTransaction();
		
		session = HibernateConfig.getSession();
		
		
		//To check  previous stage of substage master
		Criteria cr1 = session.createCriteria(SubStagesMaster.class);
		
		cr1.add(Restrictions.eq("substageId", stageID));
		
		SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
		String previousStage=subStagesMaster.getPreviousstageId();
		//
		record.setStageId(stageID);
       record.setShellTransactionId(shellTransactionId);  
       record.setShellType(shellType);
       record.setRemarks(remarks); 	
       record.setPreviousStageId(previousStage);
		record.setTransactionUser(userID);
		record.setTransactionDate(sdf.format(timestamp));
		
	    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	    try {
		if(!("".equals(assemblyStartDate)))
					{
		Date createdateD = df.parse(assemblyStartDate);
		record.setAssemblyStartDate(createdateD);
					}
		else
		{
			record.setAssemblyStartDate(new Date());
		}
		
		
			if(!("".equals(expectedExitDate)))
			{

	    record.setExpectedExitDate(df.parse(expectedExitDate));
		
			}
		
			dao.addShellProgress(record);
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

	public String update() throws IOException {			
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		session = HibernateConfig.getSession();
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
		
			//SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			
			Criteria cr = session.createCriteria(ShellTransaction.class);
			cr.add(Restrictions.eq("shellAssetId", shellAssetId));
			 try {

			record = (ShellTransaction)cr.list().get(0);
			
		       record.setShellType(shellType);
		      
		       record.setRemarks(remarks); 	
		       record.setPreviousStageId(previousStage);
				record.setTransactionUser(userID);
				record.setTransactionDate(sdf.format(timestamp));
			
			dao.updateShellProgress(record);  //code here
			setResult("OK");
		} 
			    catch (Exception e) {
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

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	public DaoShellProduction getDao() {
		return dao;
	}
	public void setDao(DaoShellProduction dao) {
		this.dao = dao;
	}
	public List<ShellTransaction> getRecords() {
		return records;
	}
	public void setRecords(List<ShellTransaction> records) {
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
	public ShellTransaction getRecord() {
		return record;
	}
	public void setRecord(ShellTransaction record) {
		this.record = record;
	}
	public Integer getShellAssetId() {
		return shellAssetId;
	}
	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}
	public String getStageID() {
		return stageID;
	}
	public void setStageID(String stageID) {
		this.stageID = stageID;
	}
	public ShellTransaction getShellProgress() {
		return shellProgress;
	}
	public void setShellProgress(ShellTransaction shellProgress) {
		this.shellProgress = shellProgress;
	}
	public String getShellTransactionId() {
		return shellTransactionId;
	}
	public void setShellTransactionId(String shellTransactionId) {
		this.shellTransactionId = shellTransactionId;
	}
	public String getShellType() {
		return shellType;
	}
	public void setShellType(String shellType) {
		this.shellType = shellType;
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
	public DaoPaintProduction getDaoPaint() {
		return daoPaint;
	}
	public void setDaoPaint(DaoPaintProduction daoPaint) {
		this.daoPaint = daoPaint;
	}
	public String getDatefrom() {
		return datefrom;
	}
	public void setDatefrom(String datefrom) {
		this.datefrom = datefrom;
	}
	public String getDateto() {
		return dateto;
	}
	public void setDateto(String dateto) {
		this.dateto = dateto;
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
	public Integer getTotalRecordCount() {
		return totalRecordCount;
	}
	public void setTotalRecordCount(Integer totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}
	
	

}
