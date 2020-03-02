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
import beans.PaintTransaction;
import dao.DaoPaintProduction;

//import dao.DaoSheetCutting;

public class PaintProductionAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoPaintProduction dao = new DaoPaintProduction();
	
	
	
	private List<PaintTransaction> records;
	private String result;
	private String message;
	private PaintTransaction record;
	private Integer paintAssetId;
    private String stageID;
	private PaintTransaction paintProgress = new PaintTransaction();
	private Integer shellAssetId;	
	private String shellType;
	private String assemblyStartDate;
	private String expectedExitDate;
	private String colorScheme;
	private String remarks;
	private String datefrom;
	private String dateto;
	//private Date exitDate;
	
	private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	Session session=null;
	
	
	
	public String list() {
		try {
			
			session = HibernateConfig.getSession();
			
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(dao.getAllPaint(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount= (Integer) session_map.get("holding_count");
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
       try {
			
			session = HibernateConfig.getSession();
			
			
			//To check  previous stage of substage master
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String previousStage=subStagesMaster.getPreviousstageId();
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(dao.getSIPPaint(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
			totalRecordCount= (Integer) session_map.get("holding_count");
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
	
	public String qualityClearance()
	{
		 try {
			 System.out.println("Stage id: ");
				session = HibernateConfig.getSession();
				System.out.println("Stage id: " +stageID);
				
				//To check  previous stage of substage master
				Criteria cr1 = session.createCriteria(SubStagesMaster.class);
				
				cr1.add(Restrictions.eq("substageId", stageID));
				
				SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
				String previousStage=subStagesMaster.getPreviousstageId();
				Map session_map= ActionContext.getContext().getSession();
				int startPageIndex=Integer.parseInt(jtStartIndex);
				int numRecordsPerPage=Integer.parseInt(jtPageSize);
				System.out.println("Stage id: " +stageID);
				System.out.println("jtSorting id: " +jtSorting);
				System.out.println("Previous Stage : " +previousStage);
				setRecords(dao.qualityClearancePaint(stageID, jtSorting, previousStage, startPageIndex, numRecordsPerPage));
				totalRecordCount= (Integer) session_map.get("holding_count");
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
	public String display() {
		try {
			
			session = HibernateConfig.getSession();
			
			setRecords(dao.displayDispatchPaint(jtSorting));
			
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
		try {
			
			session = HibernateConfig.getSession();
			@SuppressWarnings({ "unused", "rawtypes" })
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);

			setRecords(dao.dispatchPaint(jtSorting, datefrom, dateto, startPageIndex, numRecordsPerPage));
			totalRecordCount= (Integer) session_map.get("holding_count");
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
			
			session = HibernateConfig.getSession();
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(dao.availablePaint(jtSorting, startPageIndex, numRecordsPerPage));
			totalRecordCount= (Integer) session_map.get("holding_count");
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

	public String update() throws IOException {			
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		
		
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			Session session =  null;
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(PaintTransaction.class);
			cr.add(Restrictions.eq("paintAssetId", paintAssetId));
			 try {

			record = (PaintTransaction)cr.list().get(0);
		       record.setColorScheme(colorScheme);
		       record.setRemarks(remarks); 	
		       if(!("".equals(expectedExitDate)))
				{

		    record.setExpectedExitDate(df.parse(expectedExitDate));
				}
			
				record.setTransEntryBy(userID);
				record.setTransEntryTime(sdf.format(timestamp));
			
			dao.updatePaintProgress(record);  //code here
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
	public DaoPaintProduction getDao() {
		return dao;
	}
	public void setDao(DaoPaintProduction dao) {
		this.dao = dao;
	}
	public List<PaintTransaction> getRecords() {
		return records;
	}
	public void setRecords(List<PaintTransaction> records) {
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
	public PaintTransaction getRecord() {
		return record;
	}
	public void setRecord(PaintTransaction record) {
		this.record = record;
	}
	public Integer getPaintAssetId() {
		return paintAssetId;
	}
	public void setPaintAssetId(Integer paintAssetId) {
		this.paintAssetId = paintAssetId;
	}
	public String getStageID() {
		return stageID;
	}
	public void setStageID(String stageID) {
		this.stageID = stageID;
	}
	public PaintTransaction getPaintProgress() {
		return paintProgress;
	}
	public void setPaintProgress(PaintTransaction paintProgress) {
		this.paintProgress = paintProgress;
	}
	public Integer getShellAssetId() {
		return shellAssetId;
	}
	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
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
	
	public String getColorScheme() {
		return colorScheme;
	}
	public void setColorScheme(String colorScheme) {
		this.colorScheme = colorScheme;
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
