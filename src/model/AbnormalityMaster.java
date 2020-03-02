package model;

public class AbnormalityMaster implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	Integer abnormalityID;
	String abnormalityDescription;
	
	public AbnormalityMaster(){
		//default Constructor
	}
	
	public AbnormalityMaster(Integer abnormalityID, String abnormalityDescription){
	
		this.abnormalityID=abnormalityID;
		this.abnormalityDescription=abnormalityDescription;
	}

	public Integer getAbnormalityID() {
		return abnormalityID;
	}

	public void setAbnormalityID(Integer abnormalityID) {
		this.abnormalityID = abnormalityID;
	}

	public String getAbnormalityDescription() {
		return abnormalityDescription;
	}

	public void setAbnormalityDescription(String abnormalityDescription) {
		this.abnormalityDescription = abnormalityDescription;
	}
	
}
