package beans;

//import java.util.Date;

public class MachineList implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer machineId;
	private String machineSrNo;
	private String machineDescription;
	private String workingShop;
	//private String maintenanceShopId;
	
	public MachineList()
	{
		
	}
	

	public MachineList(Integer machineId, String machineSrNo,
			String machineDescription, String workingShop) {
		super();
		
		this.machineId = machineId;
		this.machineSrNo = machineSrNo;
		this.machineDescription = machineDescription;
		this.workingShop = workingShop;
		//this.maintenanceShopId = maintenanceShopId;
		
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


	/*public String getMaintenanceShopId() {
		return maintenanceShopId;
	}


	public void setMaintenanceShopId(String maintenanceShopId) {
		this.maintenanceShopId = maintenanceShopId;
	}*/


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	

}
