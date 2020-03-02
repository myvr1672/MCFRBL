package ACTION;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



import dao.DaoJobMaster;
import hibernateConnect.HibernateConfig;


import java.io.IOException;
import java.text.SimpleDateFormat;

import beans.JobTransaction;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;


public class JobMasterAction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  DaoJobMaster dao = new DaoJobMaster();
	
    private List<JobTransaction> records;
	private String result;
	private String message;
	private JobTransaction record;
	
	private JobTransaction Job_master=new JobTransaction();
    private Integer jobSeqNo;
	private String jobId;
	private String jobDescription;
	private String shop;
	private String section;
	private String subSection;
	private Float qty;
	private String unit;
	private String startDate;
	private String expectedCompletionDate;
	private String activityId;
	private Integer machineId;
	
	private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	
	public String list() {
		try {
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(getDao().getAllPendingJob(jtSorting, startPageIndex, numRecordsPerPage));
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
		 SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		record = new JobTransaction();
	    record.setJobDescription(jobDescription);
	    record.setJobId(jobId);
	    record.setActivityId(activityId);
		record.setSection(section);
		record.setShop(shop);
		record.setSection(section);
		record.setSubSection(subSection);
		record.setQty(qty);
	    record.setUnit(unit);
	    record.setStatus("under_progress");
	    record.setActivityId(activityId);
	    record.setMachineId(machineId);
		try {
			 
			    
			    	if(!("".equals(startDate)))
			    	{  record.setStartDate(df.parse(startDate));}
			    	if(!("".equals(expectedCompletionDate)))
			    	{ record.setExpectedCompletionDate(df.parse(expectedCompletionDate));}
			 				
		
			dao.addJobMaster(record);
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
		System.out.println(jobId);
		Session session=null;
	    session=HibernateConfig.getSession();
	    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	    record = (JobTransaction)session.get(JobTransaction.class,jobSeqNo);
	    record.setJobId(jobId);
	    record.setJobDescription(jobDescription);
	    record.setShop(shop);
	    record.setSection(section);
	    record.setSubSection(subSection);
	    record.setQty(qty);
	    record.setUnit(unit);
	    record.setStatus("under_progress");
	    record.setActivityId(activityId);	
	    record.setMachineId(machineId);
	    try {
	    	
	 
	
	
			
		    getDao().updateJobMaster(record);
			
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
	
	public String delete() throws IOException {
		System.out.println(jobSeqNo);
		try {
			
			getDao().deleteJobMaster(jobSeqNo);			
				setResult("OK");
			} catch (Exception e) {
				setResult("ERROR");
				setMessage(e.getMessage());
				System.err.println(e.getMessage());
			}
			return ActionSupport.SUCCESS;
			}


	public DaoJobMaster getDao() {
		return dao;
	}


	public void setDao(DaoJobMaster dao) {
		this.dao = dao;
	}


	public List<JobTransaction> getRecords() {
		return records;
	}


	public void setRecords(List<JobTransaction> records) {
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


	public JobTransaction getRecord() {
		return record;
	}


	public void setRecord(JobTransaction record) {
		this.record = record;
	}


	public JobTransaction getJob_master() {
		return Job_master;
	}


	public void setJob_master(JobTransaction job_master) {
		Job_master = job_master;
	}


	

	public Integer getJobSeqNo() {
		return jobSeqNo;
	}


	public void setJobSeqNo(Integer jobSeqNo) {
		this.jobSeqNo = jobSeqNo;
	}


	public String getJobId() {
		return jobId;
	}


	public void setJobId(String jobId) {
		this.jobId = jobId;
	}


	public String getActivityId() {
		return activityId;
	}


	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}


	public String getJobDescription() {
		return jobDescription;
	}


	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}


	public String getShop() {
		return shop;
	}


	public void setShop(String shop) {
		this.shop = shop;
	}


	public String getSection() {
		return section;
	}


	public void setSection(String section) {
		this.section = section;
	}


	public String getSubSection() {
		return subSection;
	}


	public void setSubSection(String subSection) {
		this.subSection = subSection;
	}


	public String getJtSorting() {
		return jtSorting;
	}


	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}


	public Float getQty() {
		return qty;
	}


	public void setQty(Float qty) {
		this.qty = qty;
	}


	public String getUnit() {
		return unit;
	}


	public void setUnit(String unit) {
		this.unit = unit;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getExpectedCompletionDate() {
		return expectedCompletionDate;
	}


	public void setExpectedCompletionDate(String expectedCompletionDate) {
		this.expectedCompletionDate = expectedCompletionDate;
	}


	public Integer getMachineId() {
		return machineId;
	}


	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
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


	



}