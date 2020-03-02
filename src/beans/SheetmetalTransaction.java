package beans;

import java.util.Date;

public class SheetmetalTransaction implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
private String drawingNo;
private Date productionDate;
private Integer qtyProduced;

public SheetmetalTransaction()
{
	
}

public SheetmetalTransaction(String drawingNo, Date productionDate, Integer qtyProduced) {
	super();
	this.drawingNo = drawingNo;
	this.productionDate = productionDate;
	this.qtyProduced = qtyProduced;
}


public Date getProductionDate() {
	return productionDate;
}

public void setProductionDate(Date productionDate) {
	this.productionDate = productionDate;
}

public Integer getQtyProduced() {
	return qtyProduced;
}

public void setQtyProduced(Integer qtyProduced) {
	this.qtyProduced = qtyProduced;
}

public String getDrawingNo() {
	return drawingNo;
}

public void setDrawingNo(String drawingNo) {
	this.drawingNo = drawingNo;
}


}
