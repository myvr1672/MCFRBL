package model;

public class machine_operation implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
 Integer id;
 String operation;
 
	public machine_operation(){
		//default Constructor
	}
	
	public machine_operation(Integer id,String operation){
		
		this.id = id;
		this.operation=operation;
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	

	

}