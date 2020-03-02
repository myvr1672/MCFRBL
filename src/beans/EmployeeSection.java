package beans;

public class EmployeeSection implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private String subsectionId;
	private String subsectionDescription;
	private String parentSubsectionId;
	
	public EmployeeSection()
	{
		
	}

	public EmployeeSection(String subsectionId, String subsectionDescription, String parentSubsectionId) {
		super();
		this.subsectionId = subsectionId;
		this.subsectionDescription = subsectionDescription;
		this.parentSubsectionId = parentSubsectionId;
	}

	public String getSubsectionId() {
		return subsectionId;
	}

	public void setSubsectionId(String subsectionId) {
		this.subsectionId = subsectionId;
	}

	public String getSubsectionDescription() {
		return subsectionDescription;
	}

	public void setSubsectionDescription(String subsectionDescription) {
		this.subsectionDescription = subsectionDescription;
	}

	public String getParentSubsectionId() {
		return parentSubsectionId;
	}

	public void setParentSubsectionId(String parentSubsectionId) {
		this.parentSubsectionId = parentSubsectionId;
	}
	

}
