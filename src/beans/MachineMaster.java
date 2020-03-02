package beans;

import java.sql.Timestamp;
import java.util.Date;

public class MachineMaster implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer machineId;
	private String machineSrNo;
	private String machineType;
	private String machineDescription;
	private String make;
	private String model;
	private String purchasedBy;
	private String purchaseNo;
	private String workingShop;
	private String maintenanceShopId;
	private Date dateOfComissioned;
	private String entryBy;
	private Timestamp createdDate;
    private String machineStatus;
    private Float machineCost;
    private Float machineLife;
    private String amcAgencyId;
    private Date poDate;
	public MachineMaster()
	{
		
	}

	public MachineMaster(Integer machineId, String machineSrNo, String machineType, String machineDescription,
			String make, String model, String purchasedBy, String purchaseNo, String workingShop,
			String maintenanceShopId, Date dateOfComissioned, String entryBy, Timestamp createdDate, String machineStatus, Float machineCost,Float machineLife,String amcAgencyId,Date poDate ) {
		super();
		this.machineId = machineId;
		this.machineSrNo = machineSrNo;
		this.machineType = machineType;
		this.machineDescription = machineDescription;
		this.make = make;
		this.model = model;
		this.purchasedBy = purchasedBy;
		this.purchaseNo = purchaseNo;
		this.workingShop = workingShop;
		this.maintenanceShopId = maintenanceShopId;
		this.dateOfComissioned = dateOfComissioned;
		this.entryBy = entryBy;
		this.createdDate = createdDate;
		this.machineStatus=machineStatus;
		this.machineCost=machineCost;
		this.machineLife=machineLife;
		this.amcAgencyId=amcAgencyId;
		this.poDate=poDate;
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

	public Date getDateOfComissioned() {
		return dateOfComissioned;
	}

	public void setDateOfComissioned(Date dateOfComissioned) {
		this.dateOfComissioned = dateOfComissioned;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
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

	public Date getPoDate() {
		return poDate;
	}

	public void setPoDate(Date poDate) {
		this.poDate = poDate;
	}

	
	
}
