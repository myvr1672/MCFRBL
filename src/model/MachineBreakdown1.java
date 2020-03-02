package model;

public class MachineBreakdown1 implements java.io.Serializable 
{
	
    private static final long serialVersionUID = 1L;
	Integer machine_id;
	String breakdown_details;
	
	
	public MachineBreakdown1(){
		//default Constructor
	}
	
	public MachineBreakdown1(Integer machine_id,String breakdown_details){
		
		this.machine_id=machine_id;
		this.breakdown_details=breakdown_details;
	}

	public Integer getMachine_id() {
		return machine_id;
	}

	public void setMachine_id(Integer machine_id) {
		this.machine_id = machine_id;
	}

	public String getBreakdown_details() {
		return breakdown_details;
	}

	public void setBreakdown_details(String breakdown_details) {
		this.breakdown_details = breakdown_details;
	}
}
