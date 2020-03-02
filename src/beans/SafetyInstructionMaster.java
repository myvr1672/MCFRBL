package beans;

public class SafetyInstructionMaster implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
 Integer safety_instruction_id;
 String safety_instruction_description;
 
 
	public SafetyInstructionMaster(){
		//default Constructor
	}
	
	public SafetyInstructionMaster(Integer safety_instruction_id,String safety_instruction_description){
		
		this.safety_instruction_id = safety_instruction_id;
		this.safety_instruction_description=safety_instruction_description;
		
	}

	public Integer getSafety_instruction_id() {
		return safety_instruction_id;
	}

	public void setSafety_instruction_id(Integer safety_instruction_id) {
		this.safety_instruction_id = safety_instruction_id;
	}

	public String getSafety_instruction_description() {
		return safety_instruction_description;
	}

	public void setSafety_instruction_description(String safety_instruction_description) {
		this.safety_instruction_description = safety_instruction_description;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	

	

}