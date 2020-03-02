package beans;

import java.util.Date;

public class MachineScheduleTransaction implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer scheduleId;
	private Integer machineId;
	private String scheduleType;
	private Integer scheduleSequence;
	private Date scheduleDate;
	private Date dispatchDateForSchedule;
	private String scheduleCompletedFlag;
	private Date scheduleCompletedDate;
	private String actionTaken;
	private String remarks;
	public MachineScheduleTransaction()
	{
		
	}
	

	public MachineScheduleTransaction(Integer scheduleId, Integer machineId, String scheduleType,Integer scheduleSequence, Date scheduleDate,
			Date dispatchDateForSchedule, String scheduleCompletedFlag, Date scheduleCompletedDate, String actionTaken, String remarks) {
		super();
		this.scheduleId = scheduleId;
		this.machineId = machineId;
		this.scheduleType = scheduleType;
		this.scheduleDate = scheduleDate;
		this.scheduleCompletedFlag = scheduleCompletedFlag;
		this.scheduleCompletedDate = scheduleCompletedDate;
		this.scheduleSequence=scheduleSequence;
		this.dispatchDateForSchedule=dispatchDateForSchedule;
		this.actionTaken=actionTaken;
		this.remarks=remarks;
	}


	public Integer getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public String getScheduleType() {
		return scheduleType;
	}

	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}

	public Date getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	

	public Integer getScheduleSequence() {
		return scheduleSequence;
	}


	public void setScheduleSequence(Integer scheduleSequence) {
		this.scheduleSequence = scheduleSequence;
	}


	public String getScheduleCompletedFlag() {
		return scheduleCompletedFlag;
	}


	public void setScheduleCompletedFlag(String scheduleCompletedFlag) {
		this.scheduleCompletedFlag = scheduleCompletedFlag;
	}


	public Date getScheduleCompletedDate() {
		return scheduleCompletedDate;
	}


	public void setScheduleCompletedDate(Date scheduleCompletedDate) {
		this.scheduleCompletedDate = scheduleCompletedDate;
	}


	public Date getDispatchDateForSchedule() {
		return dispatchDateForSchedule;
	}


	public void setDispatchDateForSchedule(Date dispatchDateForSchedule) {
		this.dispatchDateForSchedule = dispatchDateForSchedule;
	}


	public String getActionTaken() {
		return actionTaken;
	}


	public void setActionTaken(String actionTaken) {
		this.actionTaken = actionTaken;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	
	

}
