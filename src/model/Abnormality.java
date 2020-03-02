package model;


import java.util.Date;

public class Abnormality implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	Integer abid;
	String abnormalityDescription;
	String detailAbnormalityDescription;
	Date createdate;
	String shop;
	String entrydate;
	String entryBy;
	Integer abnormalityID;
	String actionPerformed;
	String remarks;
	String remarkEntrydate;
	String remarkEntryBy;
	String status;
	
	public Abnormality(){
		//default Constructor
	}
	
	public Abnormality(Integer abid,String abnormalityDescription,Date createdate, String shop, String entryDate, String entryBy, Integer abnormalityID, String actionPerformed,String remarks, String remarkEntrydate, String remarkEntryBy, String status, String detailAbnormalityDescription ){
		this.abid= abid;
		this.abnormalityDescription=abnormalityDescription;
		this.detailAbnormalityDescription=detailAbnormalityDescription;
		this.createdate= createdate;
		this.shop=shop;
		this.entrydate=entryDate;
		this.entryBy=entryBy;
		this.abnormalityID=abnormalityID;	
		this.actionPerformed=actionPerformed;
		this.remarks=remarks;
		this.remarkEntrydate=remarkEntrydate;
		this.remarkEntryBy=remarkEntryBy;
		this.status=status;
	}

	public Integer getAbid() {
		return abid;
	}

	public void setAbid(Integer abid) {
		this.abid = abid;
	}

	public String getAbnormalityDescription() {
		return abnormalityDescription;
	}

	public void setAbnormalityDescription(String abnormalityDescription) {
		this.abnormalityDescription = abnormalityDescription;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getEntrydate() {
		return entrydate;
	}

	public void setEntrydate(String entrydate) {
		this.entrydate = entrydate;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Integer getAbnormalityID() {
		return abnormalityID;
	}

	public void setAbnormalityID(Integer abnormalityID) {
		this.abnormalityID = abnormalityID;
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

	public String getRemarkEntrydate() {
		return remarkEntrydate;
	}

	public void setRemarkEntrydate(String remarkEntrydate) {
		this.remarkEntrydate = remarkEntrydate;
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

	public String getDetailAbnormalityDescription() {
		return detailAbnormalityDescription;
	}

	public void setDetailAbnormalityDescription(String detailAbnormalityDescription) {
		this.detailAbnormalityDescription = detailAbnormalityDescription;
	}
	
	
}
