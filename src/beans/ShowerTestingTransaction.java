package beans;

import java.util.Date;

public class ShowerTestingTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer furnishingAssetId;
	   private String docNo;
	   private Date dateOfTesting;
	   private String shift;
	   private String testingTimeFlag;
	   private String leakageRoofFlag;
	   private String leakageJoinEndRoofFlag;
	   private String leakageCantRailAreaFlag;
	   private String leakageVentilatorAreaFlag;
	   private String leakageShutterSlidingFlag;
	   private String leakageAcThroughFlag;
	   private String leakageWindowsFlag;
	   private String remarks;
	   private String entryBy;
	   private Date entryDate;
	   private String showerTestingStatus;
	   
	   
	   
	   public ShowerTestingTransaction()
	   {
		   
	   }


	public ShowerTestingTransaction(Integer furnishingAssetId, String docNo, Date dateOfTesting, String shift,
			String testingTimeFlag, String leakageRoofFlag, String leakageJoinEndRoofFlag,
			String leakageCantRailAreaFlag, String leakageVentilatorAreaFlag, String leakageShutterSlidingFlag,
			String leakageAcThroughFlag, String leakageWindowsFlag, String remarks,String entryBy,Date entryDate,String showerTestingStatus) {
		super();
		this.furnishingAssetId = furnishingAssetId;
		this.docNo = docNo;
		this.dateOfTesting = dateOfTesting;
		this.shift = shift;
		this.testingTimeFlag = testingTimeFlag;
		this.leakageRoofFlag = leakageRoofFlag;
		this.leakageJoinEndRoofFlag = leakageJoinEndRoofFlag;
		this.leakageCantRailAreaFlag = leakageCantRailAreaFlag;
		this.leakageVentilatorAreaFlag = leakageVentilatorAreaFlag;
		this.leakageShutterSlidingFlag = leakageShutterSlidingFlag;
		this.leakageAcThroughFlag = leakageAcThroughFlag;
		this.leakageWindowsFlag = leakageWindowsFlag;
		this.remarks = remarks;
		this.entryBy=entryBy;
		this.entryDate=entryDate;
		this.showerTestingStatus=showerTestingStatus;
	}


	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}


	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}


	public String getDocNo() {
		return docNo;
	}


	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}


	public Date getDateOfTesting() {
		return dateOfTesting;
	}


	public void setDateOfTesting(Date dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}


	public String getShift() {
		return shift;
	}


	public void setShift(String shift) {
		this.shift = shift;
	}


	public String getTestingTimeFlag() {
		return testingTimeFlag;
	}


	public void setTestingTimeFlag(String testingTimeFlag) {
		this.testingTimeFlag = testingTimeFlag;
	}


	public String getLeakageRoofFlag() {
		return leakageRoofFlag;
	}


	public void setLeakageRoofFlag(String leakageRoofFlag) {
		this.leakageRoofFlag = leakageRoofFlag;
	}


	public String getLeakageJoinEndRoofFlag() {
		return leakageJoinEndRoofFlag;
	}


	public void setLeakageJoinEndRoofFlag(String leakageJoinEndRoofFlag) {
		this.leakageJoinEndRoofFlag = leakageJoinEndRoofFlag;
	}


	public String getLeakageCantRailAreaFlag() {
		return leakageCantRailAreaFlag;
	}


	public void setLeakageCantRailAreaFlag(String leakageCantRailAreaFlag) {
		this.leakageCantRailAreaFlag = leakageCantRailAreaFlag;
	}


	public String getLeakageVentilatorAreaFlag() {
		return leakageVentilatorAreaFlag;
	}


	public void setLeakageVentilatorAreaFlag(String leakageVentilatorAreaFlag) {
		this.leakageVentilatorAreaFlag = leakageVentilatorAreaFlag;
	}


	public String getLeakageShutterSlidingFlag() {
		return leakageShutterSlidingFlag;
	}


	public void setLeakageShutterSlidingFlag(String leakageShutterSlidingFlag) {
		this.leakageShutterSlidingFlag = leakageShutterSlidingFlag;
	}


	public String getLeakageAcThroughFlag() {
		return leakageAcThroughFlag;
	}


	public void setLeakageAcThroughFlag(String leakageAcThroughFlag) {
		this.leakageAcThroughFlag = leakageAcThroughFlag;
	}


	public String getLeakageWindowsFlag() {
		return leakageWindowsFlag;
	}


	public void setLeakageWindowsFlag(String leakageWindowsFlag) {
		this.leakageWindowsFlag = leakageWindowsFlag;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
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


	public String getShowerTestingStatus() {
		return showerTestingStatus;
	}


	public void setShowerTestingStatus(String showerTestingStatus) {
		this.showerTestingStatus = showerTestingStatus;
	}
	   
	   
}
