package beans;

import java.util.Date;

public class ShellDefectsTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer abid;
	private Integer shellDefectId;
	private Integer shellAssetId;
	private String detailShellDefectDescription;
	private Date defectReportedDate;
	private String entryDate;
	private String entryBy;
	private String actionPerformed;
	private String remarks;
	private String status;
	private String remarkEntryDate;
	private String remarkEntryBy;
	
	public ShellDefectsTransaction()
	{
		
	}

	public ShellDefectsTransaction(Integer abid, Integer shellDefectId, Integer shellAssetId,
			String detailShellDefectDescription, Date defectReportedDate, String entryDate, String entryBy,
			String actionPerformed, String remarks, String status, String remarkEntryDate, String remarkEntryBy) {
		super();
		this.abid = abid;
		this.shellDefectId = shellDefectId;
		this.shellAssetId = shellAssetId;
		this.detailShellDefectDescription = detailShellDefectDescription;
		this.defectReportedDate = defectReportedDate;
		this.entryDate = entryDate;
		this.entryBy = entryBy;
		this.actionPerformed = actionPerformed;
		this.remarks = remarks;
		this.status = status;
		this.remarkEntryDate = remarkEntryDate;
		this.remarkEntryBy = remarkEntryBy;
	}

	public Integer getAbid() {
		return abid;
	}

	public void setAbid(Integer abid) {
		this.abid = abid;
	}

	public Integer getShellDefectId() {
		return shellDefectId;
	}

	public void setShellDefectId(Integer shellDefectId) {
		this.shellDefectId = shellDefectId;
	}

	public Integer getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getDetailShellDefectDescription() {
		return detailShellDefectDescription;
	}

	public void setDetailShellDefectDescription(String detailShellDefectDescription) {
		this.detailShellDefectDescription = detailShellDefectDescription;
	}

	public Date getDefectReportedDate() {
		return defectReportedDate;
	}

	public void setDefectReportedDate(Date defectReportedDate) {
		this.defectReportedDate = defectReportedDate;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public String getActionPerformed() {
		return actionPerformed;
	}

	public void setActionPerformed(String actionPerformed) {
		this.actionPerformed = actionPerformed;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRemarkEntryDate() {
		return remarkEntryDate;
	}

	public void setRemarkEntryDate(String remarkEntryDate) {
		this.remarkEntryDate = remarkEntryDate;
	}

	public String getRemarkEntryBy() {
		return remarkEntryBy;
	}

	public void setRemarkEntryBy(String remarkEntryBy) {
		this.remarkEntryBy = remarkEntryBy;
	}
	
}
