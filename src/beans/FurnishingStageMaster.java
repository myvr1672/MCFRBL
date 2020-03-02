package beans;

public class FurnishingStageMaster implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String substageId;
	private String coachType;
	private String substageDescription;
	private String previousStageId;
	private String nextStageId;
	private Integer stageSequence;
	
	public FurnishingStageMaster()
	{
		
	}

	public FurnishingStageMaster(String substageId, String coachType, String substageDescription,
			String previousStageId, String nextStageId, Integer stageSequence) {
		super();
		this.substageId = substageId;
		this.coachType = coachType;
		this.substageDescription = substageDescription;
		this.previousStageId = previousStageId;
		this.nextStageId = nextStageId;
		this.stageSequence = stageSequence;
	}

	public String getSubstageId() {
		return substageId;
	}

	public void setSubstageId(String substageId) {
		this.substageId = substageId;
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public String getSubstageDescription() {
		return substageDescription;
	}

	public void setSubstageDescription(String substageDescription) {
		this.substageDescription = substageDescription;
	}

	public String getPreviousStageId() {
		return previousStageId;
	}

	public void setPreviousStageId(String previousStageId) {
		this.previousStageId = previousStageId;
	}

	public String getNextStageId() {
		return nextStageId;
	}

	public void setNextStageId(String nextStageId) {
		this.nextStageId = nextStageId;
	}

	public Integer getStageSequence() {
		return stageSequence;
	}

	public void setStageSequence(Integer stageSequence) {
		this.stageSequence = stageSequence;
	}
	
}
