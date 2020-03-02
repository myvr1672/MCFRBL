package beans;

import java.sql.Timestamp;


@SuppressWarnings("serial")
public class SpareMaster implements java.io.Serializable{

	
	
	private Integer spareId;
	private String spareDescription;
	private String drawingNo;
	private Integer selfLife;
	private Integer unitPrice;
	private Timestamp entryDate;
	private String entryBy;
	
	
	public SpareMaster()
	{
		
	}

	public SpareMaster(Integer spareId, String spareDescription, String drawingNo, Integer selfLife, Integer unitPrice,
			Timestamp entryDate, String entryBy) {
		super();
		this.spareId = spareId;
		this.spareDescription = spareDescription;
		this.drawingNo = drawingNo;
		this.selfLife = selfLife;
		this.unitPrice = unitPrice;
		this.entryDate = entryDate;
		this.entryBy = entryBy;
	}



	public Integer getSpareId() {
		return spareId;
	}

	public void setSpareId(Integer spareId) {
		this.spareId = spareId;
	}

	public String getSpareDescription() {
		return spareDescription;
	}

	public void setSpareDescription(String spareDescription) {
		this.spareDescription = spareDescription;
	}

	public String getDrawingNo() {
		return drawingNo;
	}



	public void setDrawingNo(String drawingNo) {
		this.drawingNo = drawingNo;
	}



	public Integer getSelfLife() {
		return selfLife;
	}



	public void setSelfLife(Integer selfLife) {
		this.selfLife = selfLife;
	}



	public Integer getUnitPrice() {
		return unitPrice;
	}



	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}



	public Timestamp getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Timestamp entryDate) {
		this.entryDate = entryDate;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	
	
	
}