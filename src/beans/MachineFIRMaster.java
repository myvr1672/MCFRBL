package beans;

public class MachineFIRMaster implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
 String failure_code;
 String failure_description;
 
	public MachineFIRMaster(){
		//default Constructor
	}
	
	public MachineFIRMaster(String failure_code,String failure_description){
		
		this.failure_code = failure_code;
		this.failure_description=failure_description;
		
	}

	public String getFailure_code() {
		return failure_code;
	}

	public void setFailure_code(String failure_code) {
		this.failure_code = failure_code;
	}

	public String getFailure_description() {
		return failure_description;
	}

	public void setFailure_description(String failure_description) {
		this.failure_description = failure_description;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	

	

}