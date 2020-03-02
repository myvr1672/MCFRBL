package beans;

import java.util.Date;

public class MachineScheduleDue implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Short scheduleId;
	private Short machineId;
	private String machineSrNo;
	private String machineDescription;
	private String workingShop;
	private String maintenanceShopId;
	private String scheduleType;
	private Date scheduleDate;
	private Date dispatchDateForSchedule;
	 
	public MachineScheduleDue()
	{
		
	}

	public MachineScheduleDue(Short scheduleId, Short machineId, String machineSrNo, String machineDescription,
			String workingShop, String maintenanceShopId, String scheduleType, Date scheduleDate,Date dispatchDateForSchedule) {
		
		this.scheduleId = scheduleId;
		this.machineId = machineId;
		this.machineSrNo = machineSrNo;
		this.machineDescription = machineDescription;
		this.workingShop = workingShop;
		this.maintenanceShopId = maintenanceShopId;
		this.scheduleType = scheduleType;
		this.scheduleDate = scheduleDate;
		this.dispatchDateForSchedule=dispatchDateForSchedule;
	}

	
	
		public Short getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(Short scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Short getMachineId() {
		return machineId;
	}

	public void setMachineId(Short machineId) {
		this.machineId = machineId;
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

	public String getScheduleType() {
		return scheduleType;
	}

	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}

	public Date getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public Date getDispatchDateForSchedule() {
		return dispatchDateForSchedule;
	}

	public void setDispatchDateForSchedule(Date dispatchDateForSchedule) {
		this.dispatchDateForSchedule = dispatchDateForSchedule;
	}

	
	
}
