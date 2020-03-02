package ACTION;
import com.opensymphony.xwork2.ActionSupport;

import dao.MachineMaster1Dao;
import hibernateConnect.HibernateConfig;

//import beans.MachineMaster;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import model.MachineMaster1;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

public class MachineMaster1Action extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  MachineMaster1Dao dao = new MachineMaster1Dao();
	
	private List<MachineMaster1> records;
	private String result;
	private String message;
	private MachineMaster1 record;
	private Integer machineId;
	private String machineSrNo;
	private String machineType;
	private String machineDescription;
	private String make;
	private String model;
	private String purchasedBy;
	private String purchaseNo;
    private String purchaseDate;
	private String workingShop;
	private String maintenanceShopId;
	private String dateOfCommissioned;
	private String machineStatus;
	private Float machineCost;
	private Float machineLife;
	private String amcAgencyId;
	
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	//private String entryBy;
	private Timestamp createdDate;
	public String list() {
		try {
			setRecords(getDao().getAllMachineMaster1());
			System.out.println("Records = "+getRecords());
			setResult("OK");
			
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	
	public Timestamp getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}


	public MachineMaster1Dao getDao() {
		return dao;
	}


	public void setDao(MachineMaster1Dao dao) {
		this.dao = dao;
	}


	public List<MachineMaster1> getRecords() {
		return records;
	}


	public void setRecords(List<MachineMaster1> records) {
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


	public MachineMaster1 getRecord() {
		return record;
	}


	public void setRecord(MachineMaster1 record) {
		this.record = record;
	}


	public Integer getMachineId() {
		return machineId;
	}


	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}


	public String getMachineSrNo() {
		return machineSrNo;
	}


	public void setMachineSrNo(String machineSrNo) {
		this.machineSrNo = machineSrNo;
	}


	public String getMachineType() {
		return machineType;
	}


	public void setMachineType(String machineType) {
		this.machineType = machineType;
	}


	public String getMachineDescription() {
		return machineDescription;
	}


	public void setMachineDescription(String machineDescription) {
		this.machineDescription = machineDescription;
	}


	public String getMake() {
		return make;
	}


	public void setMake(String make) {
		this.make = make;
	}


	public String getModel() {
		return model;
	}


	public void setModel(String model) {
		this.model = model;
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


	public String getMachineStatus() {
		return machineStatus;
	}


	public void setMachineStatus(String machineStatus) {
		this.machineStatus = machineStatus;
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

	

	

	public String getPurchaseDate() {
		return purchaseDate;
	}


	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}


	public String getDateOfCommissioned() {
		return dateOfCommissioned;
	}


	public void setDateOfCommissioned(String dateOfCommissioned) {
		this.dateOfCommissioned = dateOfCommissioned;
	}


	public String create() throws IOException {
		try{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		//SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		System.out.println("podate:"+purchaseDate);
		System.out.println("Machine Sr No:"+machineSrNo);
		System.out.println("Purchase no"+purchaseNo);

		record = new MachineMaster1();
		record.setMachineSrNo(machineSrNo);
		
		record.setMachineType(machineType);
		record.setMachineDescription(machineDescription);
		record.setMake(make);
		record.setModel(model);
		record.setPurchasedBy(purchasedBy);
		record.setPurchaseNo(purchaseNo);
		//record.setEntryBy(entryBy);
		record.setMachineStatus("OK");
		record.setMachineCost(machineCost);
		record.setMachineLife(machineLife);
		record.setAmcAgencyId(amcAgencyId);
		record.setMaintenanceShopId(maintenanceShopId);
		//record.setCreatedDate(createdDate);
		record.setWorkingShop(workingShop);
		record.setCreatedDate(timestamp);
		record.setEntryBy(userID);
		//	record.setpODate(sdf.parse(pODate));
		//System.out.println("date:"+sdf.parse(pODate));
		//record.setpODate(pODate);

		//dao.addMachineMaster1(record);
				
				SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
				if(!("".equals(purchaseDate))){	record.setPurchaseDate(df.parse(purchaseDate));}
				if(!("".equals(dateOfCommissioned))){record.setDateOfCommissioned(df.parse(dateOfCommissioned));}
				/*if(!"".equals(pODate))	{record.setpODate(sdf.parse(pODate));}
				if(!"".equals(dateOfCommissioned)) {record.setDateOfCommissioned(sdf.parse(dateOfCommissioned));}*/
				getDao().addMachineMaster1(record);
				setResult("OK");
		} 
			catch (Exception e) {
			// TODO Auto-generated catch block
				setResult("ERROR");
				setMessage(e.getMessage());
				System.err.println(e.getMessage());
		}
		
				return ActionSupport.SUCCESS;	
	}
		

	

	public String update() throws IOException {			
		try{
		SimpleDateFormat sdf=new SimpleDateFormat("dd-mm-yyyy");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
  
		record = new MachineMaster1();
	    Session session=null;
	    session=HibernateConfig.getSession();
	   record = (MachineMaster1)session.get(MachineMaster1.class, machineId);
	    record.setMachineSrNo(machineSrNo);
		record.setMachineType(machineType);
		record.setMachineDescription(machineDescription);
		record.setMake(make);
		record.setModel(model);
		record.setPurchasedBy(purchasedBy);
		record.setPurchaseNo(purchaseNo);
		record.setWorkingShop(workingShop);
		record.setMaintenanceShopId(maintenanceShopId);
		
		record.setCreatedDate(timestamp);
		//record.setEntryBy(entryBy);
		record.setMachineStatus(machineStatus);
		record.setMachineCost(machineCost);
		record.setMachineLife(machineLife);
		record.setAmcAgencyId(amcAgencyId);    
	//	record.setpODate(sdf.parse(pODate));
		record.setAmcAgencyId(amcAgencyId);    
		record.setCreatedDate(timestamp);
		record.setEntryBy(userID);

		System.out.println("po date="+purchaseDate);
		//record.setpODate(pODate);

        
	
			/*SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			if(!("".equals(pODate)))
						{
							Date createdateD = df.parse(pODate);
						record.setpODate(createdateD);
						}*/
			//if(!"".equals(pODate))	{record.setpODate(sdf.parse(pODate));}
		//	if(!"".equals(dateOfCommissioned)) {record.setDateOfCommissioned(sdf.parse(dateOfCommissioned));}
		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		if(!("".equals(purchaseDate))){record.setPurchaseDate(df.parse(purchaseDate));}
		if(!("".equals(dateOfCommissioned))){record.setDateOfCommissioned(df.parse(dateOfCommissioned));}
			session.update(record);
			 session.beginTransaction().commit();
			 getDao().updateMachineMaster1(record);;
		    
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
		return ActionSupport.SUCCESS;
	}
	
	public String delete() throws IOException {
		try {
			
		getDao().deleteMachineMaster1(machineId);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}


	

	
}



