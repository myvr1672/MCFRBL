package model;


import java.sql.Timestamp;
import java.util.Date;

public class MachinePerformedAction implements java.io.Serializable{

	private Integer machineId;
	private Integer breakdownId;
	
	public MachinePerformedAction(){
		//default Constructor
	}
	
	public MachinePerformedAction(Integer machineId,Integer breakdownId){
		this.machineId=machineId;
		this.breakdownId= breakdownId;
			
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public Integer getBreakdownId() {
		return breakdownId;
	}

	public void setBreakdownId(Integer breakdownId) {
		this.breakdownId = breakdownId;
	}

	
}
