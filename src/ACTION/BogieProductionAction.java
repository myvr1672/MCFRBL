package ACTION;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
import beans.BogiesetTransaction;
import beans.WheelsetTransaction;
import dao.DaoBogieProduction;

//import dao.DaoSheetCutting;

public class BogieProductionAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoBogieProduction dao = new DaoBogieProduction();
	
	private List<BogiesetTransaction> records;
	private String result;
	private String message;
	private BogiesetTransaction record;
	private Integer bogieAssetId;
    private String stageID;
	private String bogiesetTrxId;
	private String assemblyStartDate;
	private Integer leftWheelAssetId;
	private Integer leftWheelAssetId1;
	private Integer rightWheelAssetId;
	private Integer rightWheelAssetId1;
	private String assemblyExpectedExtDate;
	private String productionBy;
	private String remarks;
	private String datefrom;
	private String dateto;

	//private Date exitDate;
	
	private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	
	Session session =null;
	
	
	
	public String list() {
		 session = HibernateConfig.getSession();
		try {
			
			Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);

			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllBogie(stageID, jtSorting,datefrom, dateto, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
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
	
	public String listSIP()
	{
		 session = HibernateConfig.getSession();
		 try
		 {
			 
		 Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);

			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllSIPBogie(stageID, jtSorting,datefrom, dateto, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
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
	public String listQualityClearance()
	{
		 session = HibernateConfig.getSession();
		 try
		 {
			 
		 Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);

			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllQualityClearanceBogie(stageID, jtSorting, previousStage,datefrom, dateto, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
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
	public String display() {
		session = HibernateConfig.getSession();
		try {
			
             Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			setRecords(dao.displayDispatchBogie(jtSorting, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
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
	
	public String dispatch() {
		session = HibernateConfig.getSession();
		try {
             Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			
			setRecords(dao.dispatchBogie(jtSorting, datefrom, dateto, startPageIndex,numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
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

	public String available() {
		try {
             Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			session = HibernateConfig.getSession();
			
			setRecords(dao.availableBogie(jtSorting, startPageIndex,numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}finally{
			session.close();
		}
		return ActionSupport.SUCCESS;
	}

	public String create() throws IOException {
		try{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		SimpleDateFormat df= new SimpleDateFormat("dd-MM-yyyy");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new BogiesetTransaction();
		session = HibernateConfig.getSession();
		
		
		//To check  previous stage of substage master
		Criteria cr1 = session.createCriteria(SubStagesMaster.class);
		
		cr1.add(Restrictions.eq("substageId", stageID));
		
		SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
		String previousStage=subStagesMaster.getPreviousstageId();
		//
		record.setSubstageId(stageID);
		record.setPrevStageId(previousStage);
		//record.setBogieAssetId(bogieAssetId);
		record.setBogiesetTrxId(bogiesetTrxId);
		record.setAssemblyStartDate(df.parse(assemblyStartDate));
		record.setAssemblyExpectedExtDate(df.parse(assemblyExpectedExtDate));
		record.setProductionBy(productionBy);
	    record.setRemarks(remarks); 	
      
		record.setTrxUser(userID);
		record.setTrxDate(sdf.format(timestamp));

		WheelsetTransaction wheelsetTransaction_left=null;
        // if(!("".equals(leftWheelAssetId1)))
         if(leftWheelAssetId1!=null)
         {
		Criteria cr2 = session.createCriteria(WheelsetTransaction.class);
		cr2.add(Restrictions.eq("wheelsetAssetId", leftWheelAssetId1));
		
		wheelsetTransaction_left = (WheelsetTransaction)cr2.list().get(0);
		record.setLeftWheelAssetId(leftWheelAssetId1);
		wheelsetTransaction_left.setAsignedFlag(1);
         }
         WheelsetTransaction wheelsetTransaction_right=null;
        
         if(rightWheelAssetId1!=null)
         {
        	 record.setRightWheelAssetId(rightWheelAssetId1);
Criteria cr3 = session.createCriteria(WheelsetTransaction.class);
		
		cr3.add(Restrictions.eq("wheelsetAssetId", rightWheelAssetId1));
		
		 wheelsetTransaction_right = (WheelsetTransaction)cr3.list().get(0);
		
		 wheelsetTransaction_right.setAsignedFlag(1);	
         }
		
		dao.addBogieProgressAndUpdateWheel(record, wheelsetTransaction_left, wheelsetTransaction_right);
		
	   
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
		try{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new BogiesetTransaction();
		
		session = HibernateConfig.getSession();
		
		// retrieve existing wheelset from bogie
   
		Criteria cr = session.createCriteria(BogiesetTransaction.class);
		
		cr.add(Restrictions.eq("bogieAssetId", bogieAssetId));
		
		BogiesetTransaction record = (BogiesetTransaction)cr.list().get(0);
		Integer old_leftWheelAssetId=null;
		Integer old_rightWheelAssetId=null;
		
		old_leftWheelAssetId=record.getLeftWheelAssetId();
		 old_rightWheelAssetId=record.getRightWheelAssetId();
		 WheelsetTransaction wheelsetTransaction_oldleft=null;
		 // update record
		    
			
			record.setProductionBy(productionBy);
	        record.setRemarks(remarks); 	
	        record.setLeftWheelAssetId(leftWheelAssetId1);
	        record.setRightWheelAssetId(rightWheelAssetId1);
			record.setTrxUser(userID);
			record.setTrxDate(sdf.format(timestamp));
			
		 //end of update record
		 
		 if(old_leftWheelAssetId!=null)
		 {
Criteria crol = session.createCriteria(WheelsetTransaction.class);
		crol.add(Restrictions.eq("wheelsetAssetId", old_leftWheelAssetId));
		
		wheelsetTransaction_oldleft = (WheelsetTransaction)crol.list().get(0);
		wheelsetTransaction_oldleft.setAsignedFlag(null);
		}
		WheelsetTransaction wheelsetTransaction_oldright=null;
		if(old_rightWheelAssetId!=null){
Criteria cror = session.createCriteria(WheelsetTransaction.class);
		
cror.add(Restrictions.eq("wheelsetAssetId", old_rightWheelAssetId));

		 wheelsetTransaction_oldright = (WheelsetTransaction)cror.list().get(0);
		 wheelsetTransaction_oldright.setAsignedFlag(null);	

		}
		
		
		
		//end of code
		
		//WheelsetTransaction wheelsetTransaction=new WheelsetTransaction();
		WheelsetTransaction wheelsetTransaction_left=null;
		 if(leftWheelAssetId1!=null) {
			
		Criteria cr2 = session.createCriteria(WheelsetTransaction.class);
		cr2.add(Restrictions.eq("wheelsetAssetId", leftWheelAssetId1));
		
		 wheelsetTransaction_left = (WheelsetTransaction)cr2.list().get(0);
		wheelsetTransaction_left.setAsignedFlag(1);
		 }
		 
		 WheelsetTransaction wheelsetTransaction_right=null;
		 if(rightWheelAssetId1!=null) {
			 
Criteria cr3 = session.createCriteria(WheelsetTransaction.class);
		
		cr3.add(Restrictions.eq("wheelsetAssetId", rightWheelAssetId1));
		
	 wheelsetTransaction_right = (WheelsetTransaction)cr3.list().get(0);
		
		 }
		
		dao.updateBogieAndWheelProgress(record, wheelsetTransaction_left, wheelsetTransaction_right, wheelsetTransaction_oldleft, wheelsetTransaction_oldright);
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
	
	public String listClearanceReport()
	{
		 session = HibernateConfig.getSession();
		 try
		 {
			 
		 Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);

			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllQualityClearanceReportBogie(stageID, jtSorting, previousStage,datefrom, dateto, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
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
	
	
	
	public Integer getBogieAssetId() {
		return bogieAssetId;
	}
	public void setBogieAssetId(Integer bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}
	public String getStageID() {
		return stageID;
	}
	public void setStageID(String stageID) {
		this.stageID = stageID;
	}
	public String getBogiesetTrxId() {
		return bogiesetTrxId;
	}
	public void setBogiesetTrxId(String bogiesetTrxId) {
		this.bogiesetTrxId = bogiesetTrxId;
	}
	public String getAssemblyStartDate() {
		return assemblyStartDate;
	}
	public void setAssemblyStartDate(String assemblyStartDate) {
		this.assemblyStartDate = assemblyStartDate;
	}
	
	public Integer getLeftWheelAssetId() {
		return leftWheelAssetId;
	}
	public void setLeftWheelAssetId(Integer leftWheelAssetId) {
		this.leftWheelAssetId = leftWheelAssetId;
	}
	public Integer getRightWheelAssetId() {
		return rightWheelAssetId;
	}
	public void setRightWheelAssetId(Integer rightWheelAssetId) {
		this.rightWheelAssetId = rightWheelAssetId;
	}
	public String getAssemblyExpectedExtDate() {
		return assemblyExpectedExtDate;
	}
	public void setAssemblyExpectedExtDate(String assemblyExpectedExtDate) {
		this.assemblyExpectedExtDate = assemblyExpectedExtDate;
	}
	public String getProductionBy() {
		return productionBy;
	}
	public void setProductionBy(String productionBy) {
		this.productionBy = productionBy;
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
	public DaoBogieProduction getDao() {
		return dao;
	}
	public void setDao(DaoBogieProduction dao) {
		this.dao = dao;
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
	public List<BogiesetTransaction> getRecords() {
		return records;
	}
	public void setRecords(List<BogiesetTransaction> records) {
		this.records = records;
	}
	public BogiesetTransaction getRecord() {
		return record;
	}
	public void setRecord(BogiesetTransaction record) {
		this.record = record;
	}
	public Integer getLeftWheelAssetId1() {
		return leftWheelAssetId1;
	}
	public void setLeftWheelAssetId1(Integer leftWheelAssetId1) {
		this.leftWheelAssetId1 = leftWheelAssetId1;
	}
	public Integer getRightWheelAssetId1() {
		return rightWheelAssetId1;
	}
	public void setRightWheelAssetId1(Integer rightWheelAssetId1) {
		this.rightWheelAssetId1 = rightWheelAssetId1;
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
	public int getTotalRecordCount() {
		return totalRecordCount;
	}
	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}
	

}
