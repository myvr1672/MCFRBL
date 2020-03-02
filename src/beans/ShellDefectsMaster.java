package beans;

public class ShellDefectsMaster implements java.io.Serializable{


	private static final long serialVersionUID = 1L;
	private Integer shellDefectId;
	private String shellDefectDescription;
	
	public ShellDefectsMaster()
	{
		
	}

	public ShellDefectsMaster(Integer shellDefectId, String shellDefectDescription) {
		super();
		this.shellDefectId = shellDefectId;
		this.shellDefectDescription = shellDefectDescription;
	}

	public Integer getShellDefectId() {
		return shellDefectId;
	}

	public void setShellDefectId(Integer shellDefectId) {
		this.shellDefectId = shellDefectId;
	}

	public String getShellDefectDescription() {
		return shellDefectDescription;
	}

	public void setShellDefectDescription(String shellDefectDescription) {
		this.shellDefectDescription = shellDefectDescription;
	}
	
}
