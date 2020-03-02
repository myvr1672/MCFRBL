package beans;

import java.util.Date;

public class CoachOutAfterRackFormation implements java.io.Serializable{


	private static final long serialVersionUID = 1L;
	
	private Integer coachOutID;
	private String rackId;
	private String coachNumbers;
	private Date rackFormationDate;
	private Date dispatchDate;
	private String remarks;
	private Date comissionedDate;
	private String dispatchedRailway;
	

	public CoachOutAfterRackFormation()
	{
		
	}

	public CoachOutAfterRackFormation(Integer coachOutID, String rackId, String coachNumbers, Date rackFormationDate,
			Date dispatchDate, String remarks, Date comissionedDate, String dispatchedRailway) {
		super();
		this.coachOutID = coachOutID;
		this.rackId = rackId;
		this.coachNumbers = coachNumbers;
		this.rackFormationDate = rackFormationDate;
		this.dispatchDate = dispatchDate;
		this.remarks = remarks;
		this.comissionedDate = comissionedDate;
		this.dispatchedRailway = dispatchedRailway;
	}

	public Integer getCoachOutID() {
		return coachOutID;
	}

	public void setCoachOutID(Integer coachOutID) {
		this.coachOutID = coachOutID;
	}

	public String getRackId() {
		return rackId;
	}

	public void setRackId(String rackId) {
		this.rackId = rackId;
	}

	public String getCoachNumbers() {
		return coachNumbers;
	}

	public void setCoachNumbers(String coachNumbers) {
		this.coachNumbers = coachNumbers;
	}

	public Date getRackFormationDate() {
		return rackFormationDate;
	}

	public void setRackFormationDate(Date rackFormationDate) {
		this.rackFormationDate = rackFormationDate;
	}

	public Date getDispatchDate() {
		return dispatchDate;
	}

	public void setDispatchDate(Date dispatchDate) {
		this.dispatchDate = dispatchDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getComissionedDate() {
		return comissionedDate;
	}

	public void setComissionedDate(Date comissionedDate) {
		this.comissionedDate = comissionedDate;
	}

	public String getDispatchedRailway() {
		return dispatchedRailway;
	}

	public void setDispatchedRailway(String dispatchedRailway) {
		this.dispatchedRailway = dispatchedRailway;
	}
	
	
	
}
