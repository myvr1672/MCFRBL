package beans;

import java.util.Date;

public class CoachTurnoutTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String coachNumber;
	private String coachType;
	private Integer shellAssetId;
	private Integer bogiePpSideAssetId;
	private Integer bogieNppSideAssetId;
	private Date coachDispatchedDate;
	private Date coachComissionedDate;
	private Integer rackCreated;
	private String dispatchedRailway;
	private Date coachManufacturedDate;
	
	public CoachTurnoutTransaction()
	{
		
	}

	public CoachTurnoutTransaction(String coachNumber, String coachType, Integer shellAssetId,
			Integer bogiePpSideAssetId, Integer bogieNppSideAssetId, Date coachDispatchedDate,
			Date coachComissionedDate, Integer rackCreated, String dispatchedRailway, Date coachManufacturedDate) {
		super();
		this.coachNumber = coachNumber;
		this.coachType = coachType;
		this.shellAssetId = shellAssetId;
		this.bogiePpSideAssetId = bogiePpSideAssetId;
		this.bogieNppSideAssetId = bogieNppSideAssetId;
		this.coachDispatchedDate = coachDispatchedDate;
		this.coachComissionedDate = coachComissionedDate;
		this.rackCreated = rackCreated;
		this.dispatchedRailway = dispatchedRailway;
		this.coachManufacturedDate=coachManufacturedDate;
	}

	public String getCoachNumber() {
		return coachNumber;
	}

	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public Integer getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public Integer getBogiePpSideAssetId() {
		return bogiePpSideAssetId;
	}

	public void setBogiePpSideAssetId(Integer bogiePpSideAssetId) {
		this.bogiePpSideAssetId = bogiePpSideAssetId;
	}

	public Integer getBogieNppSideAssetId() {
		return bogieNppSideAssetId;
	}

	public void setBogieNppSideAssetId(Integer bogieNppSideAssetId) {
		this.bogieNppSideAssetId = bogieNppSideAssetId;
	}

	public Date getCoachDispatchedDate() {
		return coachDispatchedDate;
	}

	public void setCoachDispatchedDate(Date coachDispatchedDate) {
		this.coachDispatchedDate = coachDispatchedDate;
	}

	public Date getCoachComissionedDate() {
		return coachComissionedDate;
	}

	public void setCoachComissionedDate(Date coachComissionedDate) {
		this.coachComissionedDate = coachComissionedDate;
	}

	public Integer getRackCreated() {
		return rackCreated;
	}

	public void setRackCreated(Integer rackCreated) {
		this.rackCreated = rackCreated;
	}

	public String getDispatchedRailway() {
		return dispatchedRailway;
	}

	public void setDispatchedRailway(String dispatchedRailway) {
		this.dispatchedRailway = dispatchedRailway;
	}

	public Date getCoachManufacturedDate() {
		return coachManufacturedDate;
	}

	public void setCoachManufacturedDate(Date coachManufacturedDate) {
		this.coachManufacturedDate = coachManufacturedDate;
	}
	
	
}
