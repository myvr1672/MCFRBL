package model;



public class SubStagesMaster implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	String substageId;
	String substageDescription;
	String parentStage;
	String substages;
	Integer subStageValidity;
	String parentStageId;
	Integer qtyPerCoach;
	Integer manhourRequired;
	String completionTime;
	Integer sustageSequence;
	Integer gateoutValidity;
	String previousstageId;
	String nextStageId;
	
	
	
	
	public SubStagesMaster(){
		//default Constructor
	}
	
	public SubStagesMaster(String substageId,String substageDescription,
			String parentStage,String substages,Integer subStageValidity,String parentStageId,
			Integer qtyPerCoach,Integer manhourRequired, String completionTime,Integer sustageSequence,Integer gateoutValidity,String previousstageId,
	String nextStageId ){
		this.substageId=substageId;
		this.substageDescription=substageDescription;
		this.parentStage=parentStage;
		this.substages=substages;
		this.subStageValidity=subStageValidity;
		this.parentStageId=parentStageId;
		this.qtyPerCoach=qtyPerCoach;
		this.manhourRequired=manhourRequired;
		this.completionTime=completionTime;
		this.sustageSequence=sustageSequence;
		this.gateoutValidity=gateoutValidity;
		this.previousstageId=previousstageId;
		this.nextStageId=nextStageId;
			
				
	}

	public String getSubstageId() {
		return substageId;
	}

	public void setSubstageId(String substageId) {
		this.substageId = substageId;
	}

	public String getSubstageDescription() {
		return substageDescription;
	}

	public void setSubstageDescription(String substageDescription) {
		this.substageDescription = substageDescription;
	}

	public String getParentStage() {
		return parentStage;
	}

	public void setParentStage(String parentStage) {
		this.parentStage = parentStage;
	}

	public String getSubstages() {
		return substages;
	}

	public void setSubstages(String substages) {
		this.substages = substages;
	}

	public Integer getSubStageValidity() {
		return subStageValidity;
	}

	public void setSubStageValidity(Integer subStageValidity) {
		this.subStageValidity = subStageValidity;
	}

	public String getParentStageId() {
		return parentStageId;
	}

	public void setParentStageId(String parentStageId) {
		this.parentStageId = parentStageId;
	}

	public Integer getQtyPerCoach() {
		return qtyPerCoach;
	}

	public void setQtyPerCoach(Integer qtyPerCoach) {
		this.qtyPerCoach = qtyPerCoach;
	}

	public Integer getManhourRequired() {
		return manhourRequired;
	}

	public void setManhourRequired(Integer manhourRequired) {
		this.manhourRequired = manhourRequired;
	}

	public String getCompletionTime() {
		return completionTime;
	}

	public void setCompletionTime(String completionTime) {
		this.completionTime = completionTime;
	}

	public Integer getSustageSequence() {
		return sustageSequence;
	}

	public void setSustageSequence(Integer sustageSequence) {
		this.sustageSequence = sustageSequence;
	}

	public Integer getGateoutValidity() {
		return gateoutValidity;
	}

	public void setGateoutValidity(Integer gateoutValidity) {
		this.gateoutValidity = gateoutValidity;
	}

	public String getPreviousstageId() {
		return previousstageId;
	}

	public void setPreviousstageId(String previousstageId) {
		this.previousstageId = previousstageId;
	}

	public String getNextStageId() {
		return nextStageId;
	}

	public void setNextStageId(String nextStageId) {
		this.nextStageId = nextStageId;
	}

	
	
}
