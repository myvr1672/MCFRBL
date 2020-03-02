package beans;

import java.util.Date;

public class SpareChangeInSchedule implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
private Integer scheduleId;
private String spareDescription;
private String spareSrNo;
private String entryBy;
private Date entryDate;

public SpareChangeInSchedule()
{
	
}

public SpareChangeInSchedule(Integer scheduleId, String spareDescription, String spareSrNo, String entryBy,
		Date entryDate) {
	super();
	this.scheduleId = scheduleId;
	this.spareDescription = spareDescription;
	this.spareSrNo = spareSrNo;
	this.entryBy = entryBy;
	this.entryDate = entryDate;
}

public Integer getScheduleId() {
	return scheduleId;
}

public void setScheduleId(Integer scheduleId) {
	this.scheduleId = scheduleId;
}



public String getSpareDescription() {
	return spareDescription;
}

public void setSpareDescription(String spareDescription) {
	this.spareDescription = spareDescription;
}

public String getSpareSrNo() {
	return spareSrNo;
}

public void setSpareSrNo(String spareSrNo) {
	this.spareSrNo = spareSrNo;
}

public String getEntryBy() {
	return entryBy;
}

public void setEntryBy(String entryBy) {
	this.entryBy = entryBy;
}

public Date getEntryDate() {
	return entryDate;
}

public void setEntryDate(Date entryDate) {
	this.entryDate = entryDate;
}



}
