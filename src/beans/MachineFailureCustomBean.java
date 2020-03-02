package beans;

import java.util.Date;

public class MachineFailureCustomBean implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Short breakdownId;
    private Short machineId;
    private Date breakdownDate;
    private String breakdownDetails;
    private String remarks;
    private Date dispatchDateForRepair;
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
	
	public MachineFailureCustomBean()
	{
		
	}

	public MachineFailureCustomBean(Short breakdownId, Short machineId, Date breakdownDate, String breakdownDetails,
			String remarks, Date dispatchDateForRepair, String machineSrNo, String machineType,
			String machineDescription, String make, String model, String purchasedBy, String purchaseNo,
			String workingShop, String maintenanceShopId, Date dateOfComissioned) {
		super();
		this.breakdownId = breakdownId;
		this.machineId = machineId;
		this.breakdownDate = breakdownDate;
		this.breakdownDetails = breakdownDetails;
		this.remarks = remarks;
		this.dispatchDateForRepair = dispatchDateForRepair;
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
	}

	public Short getBreakdownId() {
		return breakdownId;
	}

	public void setBreakdownId(Short breakdownId) {
		this.breakdownId = breakdownId;
	}

	public Short getMachineId() {
		return machineId;
	}

	public void setMachineId(Short machineId) {
		this.machineId = machineId;
	}

	public Date getBreakdownDate() {
		return breakdownDate;
	}

	public void setBreakdownDate(Date breakdownDate) {
		this.breakdownDate = breakdownDate;
	}

	public String getBreakdownDetails() {
		return breakdownDetails;
	}

	public void setBreakdownDetails(String breakdownDetails) {
		this.breakdownDetails = breakdownDetails;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getDispatchDateForRepair() {
		return dispatchDateForRepair;
	}

	public void setDispatchDateForRepair(Date dispatchDateForRepair) {
		this.dispatchDateForRepair = dispatchDateForRepair;
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
	
}
