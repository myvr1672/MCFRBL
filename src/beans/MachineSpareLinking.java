package beans;

import java.util.Date;

public class MachineSpareLinking implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	private Integer spareId;
	private Integer parentId;
	private Integer qty;
	private String entryBy;
	private Date entryDate;
	private Integer childLevel;
	
public MachineSpareLinking()
{
	
}

public MachineSpareLinking(Integer spareId, Integer parentId, Integer qty, String entryBy, Date entryDate, Integer childLevel) {
	super();
	this.spareId = spareId;
	this.parentId = parentId;
	this.qty = qty;
	this.entryBy = entryBy;
	this.entryDate = entryDate;
	this.childLevel=childLevel;
}

public Integer getSpareId() {
	return spareId;
}

public void setSpareId(Integer spareId) {
	this.spareId = spareId;
}

public Integer getParentId() {
	return parentId;
}

public void setParentId(Integer parentId) {
	this.parentId = parentId;
}

public Integer getQty() {
	return qty;
}

public void setQty(Integer qty) {
	this.qty = qty;
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

public Integer getChildLevel() {
	return childLevel;
}

public void setChildLevel(Integer childLevel) {
	this.childLevel = childLevel;
}
	
}
