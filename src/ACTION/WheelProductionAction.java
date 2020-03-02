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

import beans.WheelsetTransaction;
import dao.DaoWheelProduction;

//import dao.DaoSheetCutting;

public class WheelProductionAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoWheelProduction dao = new DaoWheelProduction();
	
	
	
	private List<WheelsetTransaction> records;
	private String result;
	private String message;
	private WheelsetTransaction record;
	private Integer wheelsetAssetId;
    private String stageID;
	
	private String wheelsetTransactionId;	
	private String assemblyStartDate;
	private String axleMake;
	private String axleNumber;
	private String wheeldiscRightNo;
	private String wheeldiscRightMake;
	private String wheeldiscLeftNo;
	private String wheeldiscLeftMake;
	private String rightBrakeDiscMake;
	private String leftBrakeDiscMake;
	private String ctrbRightMake;
	private String ctrbRightNo;
	private String ctrbLeftMake;
	private String ctrbLeftNo;
	private float leftWheelDiscTon;
	private float rightWheelDiscTon;
	private String datefrom;
	private String dateto;
	private String wheelDiscType;
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	
	
	private String jtSorting;//for sorting
	
	Session session=null;
	
	
	
	public String list() {
		try {
			Map session_map=ActionContext.getContext().getSession();
			session = HibernateConfig.getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			setRecords(dao.getAllWheel(stageID, jtSorting, previousStage, datefrom, dateto, startPageIndex, numRecordsPerPage));
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
	public String listSIP() {
		try {
			Map session_map=ActionContext.getContext().getSession();
			session = HibernateConfig.getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			System.out.println("Date From"+datefrom+ "Date To"+dateto);
			setRecords(dao.getAllSIPWheel(stageID, jtSorting, previousStage,datefrom, dateto, startPageIndex, numRecordsPerPage));
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
	public String listQualityClearance()
	{
		try {
			Map session_map=ActionContext.getContext().getSession();
			session = HibernateConfig.getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			System.out.println("Date From"+datefrom+ "Date To"+dateto);
			setRecords(dao.getAllQualityClearanceWheel(stageID, jtSorting, previousStage,datefrom, dateto, startPageIndex, numRecordsPerPage));
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
	public String reportQualityClearance()
	{
		try {
			Map session_map=ActionContext.getContext().getSession();
			session = HibernateConfig.getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			System.out.println("Date From"+datefrom+ "Date To"+dateto);
			setRecords(dao.getQualityClearanceReport(stageID, jtSorting, previousStage,datefrom, dateto, startPageIndex, numRecordsPerPage));
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
	public String display() {
		try {
			Map session_map=ActionContext.getContext().getSession();
			session = HibernateConfig.getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(dao.displayDispatchWheel(jtSorting,startPageIndex,numRecordsPerPage));
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
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);	
			setRecords(dao.dispatchWheel(jtSorting, datefrom, dateto, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
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

	public String available() {
		try {
			
			Map session_map=ActionContext.getContext().getSession();
			int startPageIndex= Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);				
			setRecords(dao.availableWheel(jtSorting, startPageIndex, numRecordsPerPage));
			totalRecordCount=(int)session_map.get("holding_count");
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

	@SuppressWarnings("unchecked")
	public String create() throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new WheelsetTransaction();
		List <WheelsetTransaction> wheelset=null;
		session = HibernateConfig.getSession();
		Criteria cr=session.createCriteria(WheelsetTransaction.class);
		cr.add(Restrictions.eq("axleNumber", axleNumber).ignoreCase());
		
		wheelset = (List<WheelsetTransaction>)cr.list();
		
		System.out.println("Hi "+wheelset);
		
		if(wheelset.isEmpty())
		{
		//To check  previous stage of substage master
		Criteria cr1 = session.createCriteria(SubStagesMaster.class);
		
		cr1.add(Restrictions.eq("substageId", stageID));
		
		SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
		String previousStage=subStagesMaster.getPreviousstageId();
		//
		record.setSubstageId(stageID);
       record.setWheelsetTransactionId(wheelsetTransactionId);
       record.setAxleMake(axleMake);
        record.setAxleNumber(axleNumber);
        record.setWheeldiscRightNo(wheeldiscRightNo);
        record.setWheeldiscRightMake(wheeldiscRightMake);
        record.setWheeldiscLeftNo(wheeldiscLeftNo);
   	record.setWheeldiscLeftMake(wheeldiscLeftMake);
   	record.setRightBrakeDiscMake(rightBrakeDiscMake);
   	record.setLeftBrakeDiscMake(leftBrakeDiscMake);
   	record.setCtrbRightMake(ctrbRightMake);
   	record.setCtrbRightNo(ctrbRightNo);
   	record.setCtrbLeftMake(ctrbLeftMake);
   	record.setCtrbLeftNo(ctrbLeftNo);
   	//record.setLeftWheelDiscTon(leftWheelDiscTon);
   //	record.setRightWheelDiscTon(rightWheelDiscTon);
   	record.setLeftWheelDiscTon(0);
   	record.setRightWheelDiscTon(0);
       record.setPreviousStageId(previousStage);
		record.setTransEntryBy(userID);
		record.setTransEntryTime(sdf.format(timestamp));
		record.setWheelDiscType(wheelDiscType);
		Date createdateD=null;
	    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	    try {
		if(!("".equals(assemblyStartDate)))
					{
		createdateD = df.parse(assemblyStartDate);
		record.setAssemblyStartDate(createdateD);
					}
		else
		{
			record.setAssemblyStartDate(new Date());
		}
		
		if (!("".equals(assemblyStartDate))||(assemblyStartDate!=null)) {record.setAssemblyEndDate(createdateD);}
		else {record.setAssemblyEndDate(new Date());}
			dao.addWheelProgress(record);
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
		else
		{
			message="Axle Number already exist";
			return ActionSupport.SUCCESS;
		}
	}

	@SuppressWarnings("unchecked")
	public String update() throws IOException {			
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		
		session=HibernateConfig.getSession();
		
		
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			
			
			
			//SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			Session session =  null;
			session = HibernateConfig.getSession();
			Criteria cr3 = session.createCriteria(WheelsetTransaction.class);
			cr3.add(Restrictions.eq("wheelsetAssetId", wheelsetAssetId));
			 

			record = (WheelsetTransaction)cr3.list().get(0);
			String axleNumberDB=record.getAxleNumber();
		List	<WheelsetTransaction> wheelset=null;
		Criteria cr=session.createCriteria(WheelsetTransaction.class);
		cr.add(Restrictions.eq("axleNumber", axleNumber).ignoreCase());
		wheelset = (List<WheelsetTransaction>)cr.list();
		if(wheelset.isEmpty()|| (axleNumberDB.equals(axleNumber)) )
		{
			try {
			
		       record.setAxleMake(axleMake);
		        record.setAxleNumber(axleNumber);
		        record.setWheeldiscRightNo(wheeldiscRightNo);
		        record.setWheeldiscRightMake(wheeldiscRightMake);
		        record.setWheeldiscLeftNo(wheeldiscLeftNo);
		   	record.setWheeldiscLeftMake(wheeldiscLeftMake);
		   	record.setRightBrakeDiscMake(rightBrakeDiscMake);
		   	record.setLeftBrakeDiscMake(leftBrakeDiscMake);
		   	record.setCtrbRightMake(ctrbRightMake);
		   	record.setCtrbRightNo(ctrbRightNo);
		   	record.setCtrbLeftMake(ctrbLeftMake);
		   	record.setCtrbLeftNo(ctrbLeftNo);
		   //	record.setLeftWheelDiscTon(leftWheelDiscTon);
		   //	record.setRightWheelDiscTon(rightWheelDiscTon);
		   	record.setLeftWheelDiscTon(0);
		   	record.setRightWheelDiscTon(0);
		       record.setPreviousStageId(previousStage);
				record.setTransEntryBy(userID);
				record.setTransEntryTime(sdf.format(timestamp));
				record.setWheelDiscType(wheelDiscType);
				
			   			   
//				if(!("".equals(assemblyStartDate)))
//							{
//				Date createdateD = df.parse(assemblyStartDate);
//				record.setAssemblyStartDate(createdateD);
//							}
//				else
//				{
//					record.setAssemblyStartDate(new Date());
//				}	
			   
	
  		
			dao.updateWheelProgress(record);  //code here
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
		else
		{
			message="Axle Number already exist";
			return ActionSupport.SUCCESS;	
		}
	}

	

	public DaoWheelProduction getDao() {
		return dao;
	}

	public void setDao(DaoWheelProduction dao) {
		this.dao = dao;
	}

	public List<WheelsetTransaction> getRecords() {
		return records;
	}

	public void setRecords(List<WheelsetTransaction> records) {
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

	public WheelsetTransaction getRecord() {
		return record;
	}

	public void setRecord(WheelsetTransaction record) {
		this.record = record;
	}

	public String getStageID() {
		return stageID;
	}

	public void setStageID(String stageID) {
		this.stageID = stageID;
	}

	

	public String getWheelsetTransactionId() {
		return wheelsetTransactionId;
	}

	public void setWheelsetTransactionId(String wheelsetTransactionId) {
		this.wheelsetTransactionId = wheelsetTransactionId;
	}

	public String getWheeldiscLeftNo() {
		return wheeldiscLeftNo;
	}

	public void setWheeldiscLeftNo(String wheeldiscLeftNo) {
		this.wheeldiscLeftNo = wheeldiscLeftNo;
	}

	
	public String getAssemblyStartDate() {
		return assemblyStartDate;
	}

	public void setAssemblyStartDate(String assemblyStartDate) {
		this.assemblyStartDate = assemblyStartDate;
	}

	

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public Integer getWheelsetAssetId() {
		return wheelsetAssetId;
	}

	public void setWheelsetAssetId(Integer wheelsetAssetId) {
		this.wheelsetAssetId = wheelsetAssetId;
	}
	public String getLeftBrakeDiscMake() {
		return leftBrakeDiscMake;
	}
	public void setLeftBrakeDiscMake(String leftBrakeDiscMake) {
		this.leftBrakeDiscMake = leftBrakeDiscMake;
	}
	
	public String getRightBrakeDiscMake() {
		return rightBrakeDiscMake;
	}
	public void setRightBrakeDiscMake(String rightBrakeDiscMake) {
		this.rightBrakeDiscMake = rightBrakeDiscMake;
	}
	
	public String getAxleMake() {
		return axleMake;
	}
	public void setAxleMake(String axleMake) {
		this.axleMake = axleMake;
	}
	public String getAxleNumber() {
		return axleNumber;
	}
	public void setAxleNumber(String axleNumber) {
		this.axleNumber = axleNumber;
	}
	public String getWheeldiscRightNo() {
		return wheeldiscRightNo;
	}
	public void setWheeldiscRightNo(String wheeldiscRightNo) {
		this.wheeldiscRightNo = wheeldiscRightNo;
	}
	public String getWheeldiscRightMake() {
		return wheeldiscRightMake;
	}
	public void setWheeldiscRightMake(String wheeldiscRightMake) {
		this.wheeldiscRightMake = wheeldiscRightMake;
	}
	public String getWheeldiscLeftMake() {
		return wheeldiscLeftMake;
	}
	public void setWheeldiscLeftMake(String wheeldiscLeftMake) {
		this.wheeldiscLeftMake = wheeldiscLeftMake;
	}
	public String getCtrbRightMake() {
		return ctrbRightMake;
	}
	public void setCtrbRightMake(String ctrbRightMake) {
		this.ctrbRightMake = ctrbRightMake;
	}
	public String getCtrbRightNo() {
		return ctrbRightNo;
	}
	public void setCtrbRightNo(String ctrbRightNo) {
		this.ctrbRightNo = ctrbRightNo;
	}
	public String getCtrbLeftMake() {
		return ctrbLeftMake;
	}
	public void setCtrbLeftMake(String ctrbLeftMake) {
		this.ctrbLeftMake = ctrbLeftMake;
	}
	public String getCtrbLeftNo() {
		return ctrbLeftNo;
	}
	public void setCtrbLeftNo(String ctrbLeftNo) {
		this.ctrbLeftNo = ctrbLeftNo;
	}
	public float getLeftWheelDiscTon() {
		return leftWheelDiscTon;
	}
	public void setLeftWheelDiscTon(float leftWheelDiscTon) {
		this.leftWheelDiscTon = leftWheelDiscTon;
	}
	public float getRightWheelDiscTon() {
		return rightWheelDiscTon;
	}
	public void setRightWheelDiscTon(float rightWheelDiscTon) {
		this.rightWheelDiscTon = rightWheelDiscTon;
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
	public String getWheelDiscType() {
		return wheelDiscType;
	}
	public void setWheelDiscType(String wheelDiscType) {
		this.wheelDiscType = wheelDiscType;
	}
	
	
	

}
