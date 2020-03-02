package beans;

import java.sql.Timestamp;
//import java.util.Date;

public class SpareChangeInMachinefailure implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer machineId;
    private Integer breakdownId;
    private String spareDescription;
    private String spareSrNo;
    private String entryBy;
    private Timestamp entryDate;
    
    public SpareChangeInMachinefailure()
    {
    	
    }

	public SpareChangeInMachinefailure(Integer machineId, Integer breakdownId, String spareDescription,
			String spareSrNo, String entryBy, Timestamp entryDate) {
		super();
		this.machineId = machineId;
		this.breakdownId = breakdownId;
		this.spareDescription = spareDescription;
		this.spareSrNo = spareSrNo;
		this.entryBy = entryBy;
		this.entryDate = entryDate;
	}

	public Integer getMachineId() {
		return machineId;
	}

	public void setMachineId(Integer machineId) {
		this.machineId = machineId;
	}

	public Integer getBreakdownId() {
		return breakdownId;
	}

	public void setBreakdownId(Integer breakdownId) {
		this.breakdownId = breakdownId;
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

	public Timestamp getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Timestamp entryDate) {
		this.entryDate = entryDate;
	}

	
	
    
	
	
}
