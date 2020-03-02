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

import beans.BogiesetTransaction;
import beans.FurnishingTransaction;
import dao.DaoFurnishingProduction;

//import dao.DaoSheetCutting;

public class FurnishingProductionAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoFurnishingProduction dao = new DaoFurnishingProduction();

	private List<FurnishingTransaction> records;
	private String result;
	private String message;
	private FurnishingTransaction record;
	private Integer shellAssetId;
	
	
    private String stageID;
	private String shellType;
	private Integer furnishingAssetId;
	private String assemblyDispatchDate;
	private String assemblyStartDate;
	private Integer bogiePpSideAssetId;
	private Integer bogiePpSideAssetId1;
	private Integer bogieNppSideAssetId;
	private Integer bogieNppSideAssetId1;
	private String expectedExitDate;
	private String productionBy;
	private String remarks;
	private String datefrom;
	private String dateto;
	private String vendorAllotted;
	private String vendorAllottedDate;
	private String jtStartIndex;
	private String jtPageSize;
	private String coachType;
	private Integer showerTestingFlag;
	private int totalRecordCount;
	
	
	
	//private Date exitDate;
	
	private String jtSorting;//for sorting
	
	Session session =null;
	
	
	
	public String list() {
		 session = HibernateConfig.getSession();
		try {
			Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			System.out.println("Stage Id value "+stageID);
			System.out.println("JT Sorting value "+jtSorting);
			System.out.println("Start Page Index "+startPageIndex);
			System.out.println("No of Record Per Page "+numRecordsPerPage);
			//To check  previous stage of substage master
			//Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			//cr1.add(Restrictions.eq("substageId", stageID));
			
		//	SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			//String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllFurnishing(stageID, jtSorting, startPageIndex, numRecordsPerPage));
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
	
	public String listElectricalSIP() {
		 session = HibernateConfig.getSession();
		try {
			Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			System.out.println("Stage Id value "+stageID);
			System.out.println("JT Sorting value "+jtSorting);
			System.out.println("Start Page Index "+startPageIndex);
			System.out.println("No of Record Per Page "+numRecordsPerPage);
			//To check  previous stage of substage master
			//Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			//cr1.add(Restrictions.eq("substageId", stageID));
			
		//	SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			//String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllElecSIPFurnishing(stageID, jtSorting, startPageIndex, numRecordsPerPage));
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
	
	
	public String listQuality() {
		 session = HibernateConfig.getSession();
		try {
			Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			System.out.println("Stage Id value "+stageID);
			System.out.println("JT Sorting value "+jtSorting);
			System.out.println("Start Page Index "+startPageIndex);
			System.out.println("No of Record Per Page "+numRecordsPerPage);
			//To check  previous stage of substage master
			//Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			//cr1.add(Restrictions.eq("substageId", stageID));
			
		//	SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			//String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllQuality(stageID, jtSorting, startPageIndex, numRecordsPerPage));
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
	
	public String availableQuality()
	{
		session= HibernateConfig.getSession();
		try
		{
Map session_map=ActionContext.getContext().getSession();
			
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			System.out.println("Stage Id value "+stageID);
			System.out.println("JT Sorting value "+jtSorting);
			System.out.println("Start Page Index "+startPageIndex);
			System.out.println("No of Record Per Page "+numRecordsPerPage);
			//To check  previous stage of substage master
			//Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			//cr1.add(Restrictions.eq("substageId", stageID));
			
		//	SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			//String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getCoachAvailableInQuality(stageID, jtSorting, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
			session_map.remove("holding_count");
			System.out.println("Records = "+getRecords());
			setResult("OK");	
		}
		catch (Exception ex)
		{
			setResult("ERROR");
			setMessage(ex.getMessage());
			System.err.println(ex.getMessage());
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String display() {
		session = HibernateConfig.getSession();
		try {
			
			setRecords(dao.getDispatchFurnishing(jtSorting));
			
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
			
			
			
			setRecords(dao.dispatchFurnishing(jtSorting,datefrom, dateto));
			
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
		record = new FurnishingTransaction();
		
		session = HibernateConfig.getSession();
		
		// retrieve existing bogie from furnishing shop
   
		Criteria cr = session.createCriteria(FurnishingTransaction.class);
		
		cr.add(Restrictions.eq("furnishingAssetId", furnishingAssetId));
		
		FurnishingTransaction record = (FurnishingTransaction)cr.list().get(0);
		Integer old_ppBogieAssetId=null;
		Integer old_nppBogieAssetId=null;
		
		old_ppBogieAssetId=record.getBogiePpSideAssetId();
		old_nppBogieAssetId=record.getBogieNppSideAssetId();
		 BogiesetTransaction bogiesetTransaction_old_pp=null;
		 // update record
	       
			record.setBogiePpSideAssetId(bogiePpSideAssetId1);
			record.setBogieNppSideAssetId(bogieNppSideAssetId1);
	        record.setRemarks(remarks); 
	        record.setProductionBy(productionBy);
	        record.setVendorAllotted(vendorAllotted);
	        if(vendorAllottedDate!=null)
	        {
	        if(!("".equals(vendorAllottedDate))) 
	        	{ record.setVendorAllottedDate(df.parse(vendorAllottedDate));
	        	}
	        
	        	
	        else
	        {
	        	record.setVendorAllottedDate(new Date());
	        }
		}
	        else
	        {
	        	record.setVendorAllottedDate(new Date());
	        }
	       record.setExpectedExitDate(df.parse(expectedExitDate));
			record.setTransactionUser(userID);
			record.setTransactionDate(sdf.format(timestamp));
			
		 //end of update record
		 
		 if(old_ppBogieAssetId!=null)
		 {
Criteria crol = session.createCriteria(BogiesetTransaction.class);
		crol.add(Restrictions.eq("bogieAssetId", old_ppBogieAssetId));
		
		bogiesetTransaction_old_pp = (BogiesetTransaction)crol.list().get(0);
		bogiesetTransaction_old_pp.setAsignedFlag(null);  //set old pp side bogie flag to null
		}
		BogiesetTransaction bogiesetTransaction_old_npp=null;
		if(old_nppBogieAssetId!=null){
Criteria cror = session.createCriteria(BogiesetTransaction.class);
		
cror.add(Restrictions.eq("bogieAssetId", old_nppBogieAssetId));

bogiesetTransaction_old_npp = (BogiesetTransaction)cror.list().get(0);
bogiesetTransaction_old_npp.setAsignedFlag(null);	  //set old npp side bogie flag to null

		}
		
		
		
		//end of code
		
		// set flag 1 for new pp side bogie
		BogiesetTransaction bogiesetTransaction_pp_new=null;
		 if(bogiePpSideAssetId1!=null) {
			
		Criteria cr2 = session.createCriteria(BogiesetTransaction.class);
		cr2.add(Restrictions.eq("bogieAssetId", bogiePpSideAssetId1));
		
		bogiesetTransaction_pp_new = (BogiesetTransaction)cr2.list().get(0);
		bogiesetTransaction_pp_new.setAsignedFlag(1);
		 }
		
		 // set flag 1 for new npp side bogie
		 
		 BogiesetTransaction bogiesetTransaction_npp_new=null;
		 if(bogieNppSideAssetId1!=null) {
			 
Criteria cr3 = session.createCriteria(BogiesetTransaction.class);
		
		cr3.add(Restrictions.eq("bogieAssetId", bogieNppSideAssetId1));
		
		bogiesetTransaction_npp_new = (BogiesetTransaction)cr3.list().get(0);
		bogiesetTransaction_npp_new.setAsignedFlag(1);
		 }
		
		dao.updateFurnishingAndBogieProgress(record, bogiesetTransaction_old_pp, bogiesetTransaction_old_npp, bogiesetTransaction_pp_new, bogiesetTransaction_npp_new);
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
	public DaoFurnishingProduction getDao() {
		return dao;
	}
	public void setDao(DaoFurnishingProduction dao) {
		this.dao = dao;
	}
	public List<FurnishingTransaction> getRecords() {
		return records;
	}
	public void setRecords(List<FurnishingTransaction> records) {
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
	public FurnishingTransaction getRecord() {
		return record;
	}
	public void setRecord(FurnishingTransaction record) {
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
	public String getShellType() {
		return shellType;
	}
	public void setShellType(String shellType) {
		this.shellType = shellType;
	}
	
	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}



	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}



	public String getAssemblyDispatchDate() {
		return assemblyDispatchDate;
	}
	public void setAssemblyDispatchDate(String assemblyDispatchDate) {
		this.assemblyDispatchDate = assemblyDispatchDate;
	}
	public String getAssemblyStartDate() {
		return assemblyStartDate;
	}
	public void setAssemblyStartDate(String assemblyStartDate) {
		this.assemblyStartDate = assemblyStartDate;
	}
	public Integer getBogiePpSideAssetId() {
		return bogiePpSideAssetId;
	}
	public void setBogiePpSideAssetId(Integer bogiePpSideAssetId) {
		this.bogiePpSideAssetId = bogiePpSideAssetId;
	}
	public Integer getBogiePpSideAssetId1() {
		return bogiePpSideAssetId1;
	}
	public void setBogiePpSideAssetId1(Integer bogiePpSideAssetId1) {
		this.bogiePpSideAssetId1 = bogiePpSideAssetId1;
	}
	public Integer getBogieNppSideAssetId() {
		return bogieNppSideAssetId;
	}
	public void setBogieNppSideAssetId(Integer bogieNppSideAssetId) {
		this.bogieNppSideAssetId = bogieNppSideAssetId;
	}
	public Integer getBogieNppSideAssetId1() {
		return bogieNppSideAssetId1;
	}
	public void setBogieNppSideAssetId1(Integer bogieNppSideAssetId1) {
		this.bogieNppSideAssetId1 = bogieNppSideAssetId1;
	}
	public String getExpectedExitDate() {
		return expectedExitDate;
	}
	public void setExpectedExitDate(String expectedExitDate) {
		this.expectedExitDate = expectedExitDate;
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
	public String getVendorAllotted() {
		return vendorAllotted;
	}
	public void setVendorAllotted(String vendorAllotted) {
		this.vendorAllotted = vendorAllotted;
	}
	public String getVendorAllottedDate() {
		return vendorAllottedDate;
	}
	public void setVendorAllottedDate(String vendorAllottedDate) {
		this.vendorAllottedDate = vendorAllottedDate;
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
	public String getCoachType() {
		return coachType;
	}
	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public Integer getShowerTestingFlag() {
		return showerTestingFlag;
	}

	public void setShowerTestingFlag(Integer showerTestingFlag) {
		this.showerTestingFlag = showerTestingFlag;
	}
	
	

}
