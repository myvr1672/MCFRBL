package beans;

import java.util.Date;

public class MaterialShortage implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer abid;
	private String unifiedPLNo;
	private String plDesc;
	private String qtyAvl;
	private Date dateOfReport;
	private String shop;
	private String entryDate;
	private String entryBy;
	private String actionPerformed;
	private String remarks;
	private String remarkEntryDate;
	private String remarkEntryBy;
	private String status;
	private Integer coachAffected;
	public MaterialShortage()
	{
		
	}

	public MaterialShortage(Integer abid, String unifiedPLNo, String plDesc, String qtyAvl, Date dateOfReport,
			String shop, String entryDate, String entryBy, String actionPerformed, String remarks, String remarkEntryDate,String remarkEntryBy,
			String status, Integer coachAffected) {
		super();
		this.abid = abid;
		this.unifiedPLNo = unifiedPLNo;
		this.plDesc = plDesc;
		this.qtyAvl = qtyAvl;
		this.dateOfReport = dateOfReport;
		this.shop = shop;
		this.entryDate = entryDate;
		this.entryBy = entryBy;
		this.actionPerformed = actionPerformed;
		this.remarks = remarks;
		this.remarkEntryDate=remarkEntryDate;
		this.remarkEntryBy = remarkEntryBy;
		this.status = status;
		this.coachAffected=coachAffected;
	}

	public Integer getAbid() {
		return abid;
	}

	public void setAbid(Integer abid) {
		this.abid = abid;
	}

	public String getUnifiedPLNo() {
		return unifiedPLNo;
	}

	public void setUnifiedPLNo(String unifiedPLNo) {
		this.unifiedPLNo = unifiedPLNo;
	}

	public String getPlDesc() {
		return plDesc;
	}

	public void setPlDesc(String plDesc) {
		this.plDesc = plDesc;
	}

	public String getQtyAvl() {
		return qtyAvl;
	}

	public void setQtyAvl(String qtyAvl) {
		this.qtyAvl = qtyAvl;
	}

	public Date getDateOfReport() {
		return dateOfReport;
	}

	public void setDateOfReport(Date dateOfReport) {
		this.dateOfReport = dateOfReport;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
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

	public String getRemarkEntryBy() {
		return remarkEntryBy;
	}

	public void setRemarkEntryBy(String remarkEntryBy) {
		this.remarkEntryBy = remarkEntryBy;
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

	public Integer getCoachAffected() {
		return coachAffected;
	}

	public void setCoachAffected(Integer coachAffected) {
		this.coachAffected = coachAffected;
	}
	

}
