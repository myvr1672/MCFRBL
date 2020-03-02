package ACTION;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.MachineMaster;
import dao.DaoMachineMaster;
import hibernateConnect.HibernateConfig;


public class MachineMasterAction {

	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoMachineMaster dao = new DaoMachineMaster();
	
	
	
	private List<MachineMaster> records;
	private String result;
	private String message;
	private MachineMaster record;
	private Integer machineId;
	private String machineType;
	private String machineSrNo;
	private String machineDescription;
	private String model;
	private String make;
	private String purchasedBy;
	private String purchaseNo;
	private String workingShop;
	private String maintenanceShopId;
	private String dateOfComissioned;
	private Float machineCost;
	private Float machineLife;
	private String amcAgencyId;
	private String poDate;
	private String shopFilter;
	
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	private String jtSorting;//for sorting
	
	Session session =null;
	
	
	
	public String list() {
		 session = HibernateConfig.getSession();
		try {
		System.out.println("Shop Filter Option: "+shopFilter);
		System.out.println("Shorting Field: "+jtSorting);
			setRecords(dao.getAllMachine(jtSorting, shopFilter));
			
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
	
	public String listForAssembly() {
		session = HibernateConfig.getSession();
		Map session_map=ActionContext.getContext().getSession();
		try {
		int startPageIndex= Integer.parseInt(jtStartIndex);
		int numRecordsPerPage=Integer.parseInt(jtPageSize);
		setRecords(dao.getAllMachine(jtSorting,startPageIndex,numRecordsPerPage));
		totalRecordCount=(int)session_map.get("holding_count");
		session_map.remove("holding_count");
		System.out.println("Records = "+getRecords());
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
	public String listAdd() {
		 session = HibernateConfig.getSession();
		try {
		System.out.println("Shop Filter Option: "+shopFilter);
		System.out.println("Shorting Field: "+jtSorting);
			setRecords(dao.getAllMachine(jtSorting, shopFilter));
			
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

	public String create() throws IOException {
		try{
		
		SimpleDateFormat df= new SimpleDateFormat("dd-mm-yyyy");
		
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new MachineMaster();
		session = HibernateConfig.getSession();
		
		record.setMachineSrNo(machineSrNo);
		record.setMachineType(machineType);
		record.setMachineDescription(machineDescription);
		record.setMake(make);
		record.setModel(model);
		record.setPurchasedBy(purchasedBy);
		record.setPurchaseNo(purchaseNo);
		record.setWorkingShop(workingShop);
		record.setMaintenanceShopId(maintenanceShopId);
		if(!("".equals(dateOfComissioned))){record.setDateOfComissioned(df.parse(dateOfComissioned));}
		record.setCreatedDate(timestamp);
		record.setEntryBy(userID);
		record.setMachineStatus("OK");
		record.setMachineCost(machineCost);
		record.setMachineLife(machineLife);
		record.setAmcAgencyId(amcAgencyId);
		if(poDate!=null)
		{
		if(!("".equals(poDate)))	{record.setPoDate(df.parse(poDate));}
		}
		dao.addMachine(record);
		
		
		
	   
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
	//	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			SimpleDateFormat df= new SimpleDateFormat("dd-mm-yyyy");	
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		session = HibernateConfig.getSession();
		record = (MachineMaster)session.get(MachineMaster.class,machineId);
		record.setMachineType(machineType);
			record.setMachineDescription(machineDescription);
			record.setMake(make);
			record.setModel(model);
			record.setPurchasedBy(purchasedBy);
			record.setPurchaseNo(purchaseNo);
			record.setWorkingShop(workingShop);
			record.setMaintenanceShopId(maintenanceShopId);
			//record.setDateOfComissioned(df.parse(dateOfComissioned));
			record.setCreatedDate(timestamp);
			record.setEntryBy(userID);
			record.setMachineCost(machineCost);
			record.setMachineLife(machineLife);
			record.setAmcAgencyId(amcAgencyId);
			System.out.println("Run code");
			if(poDate!=null)
			{
			if(!"".equals(poDate))	{record.setPoDate(df.parse(poDate));}
			}
		 //end of update record
			System.out.println("Run code1");
		 
		
		dao.updateMachine(record);
		System.out.println("Run code2");
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
	public DaoMachineMaster getDao() {
		return dao;
	}
	public void setDao(DaoMachineMaster dao) {
		this.dao = dao;
	}
	public List<MachineMaster> getRecords() {
		return records;
	}
	public void setRecords(List<MachineMaster> records) {
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
	public MachineMaster getRecord() {
		return record;
	}
	public void setRecord(MachineMaster record) {
		this.record = record;
	}
	public Integer getMachineId() {
		return machineId;
	}
	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}
	public String getMachineType() {
		return machineType;
	}
	public void setMachineType(String machineType) {
		this.machineType = machineType;
	}
	public String getMachineSrNo() {
		return machineSrNo;
	}
	public void setMachineSrNo(String machineSrNo) {
		this.machineSrNo = machineSrNo;
	}
	public String getMachineDescription() {
		return machineDescription;
	}
	public void setMachineDescription(String machineDescription) {
		this.machineDescription = machineDescription;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getPurchasedBy() {
		return purchasedBy;
	}
	public void setPurchasedBy(String purchasedBy) {
		this.purchasedBy = purchasedBy;
	}
	public String getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(String purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	public String getWorkingShop() {
		return workingShop;
	}
	public void setWorkingShop(String workingShop) {
		this.workingShop = workingShop;
	}
	public String getMaintenanceShopId() {
		return maintenanceShopId;
	}
	public void setMaintenanceShopId(String maintenanceShopId) {
		this.maintenanceShopId = maintenanceShopId;
	}
	public String getDateOfComissioned() {
		return dateOfComissioned;
	}
	public void setDateOfComissioned(String dateOfComissioned) {
		this.dateOfComissioned = dateOfComissioned;
	}
	public String getJtSorting() {
		return jtSorting;
	}
	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}




	public Float getMachineCost() {
		return machineCost;
	}




	public void setMachineCost(Float machineCost) {
		this.machineCost = machineCost;
	}




	public Float getMachineLife() {
		return machineLife;
	}




	public void setMachineLife(Float machineLife) {
		this.machineLife = machineLife;
	}




	public String getAmcAgencyId() {
		return amcAgencyId;
	}




	public void setAmcAgencyId(String amcAgencyId) {
		this.amcAgencyId = amcAgencyId;
	}




	public String getPoDate() {
		return poDate;
	}




	public void setPoDate(String poDate) {
		this.poDate = poDate;
	}




	public String getShopFilter() {
		return shopFilter;
	}




	public void setShopFilter(String shopFilter) {
		this.shopFilter = shopFilter;
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
