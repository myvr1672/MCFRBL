package ACTION;



import org.hibernate.Session;

import beans.SheetmetalMaster;

import hibernateConnect.HibernateConfig;


public class GetSheetMetalMasterDetailbyDrawing {
     private Integer drawingNo;
     private Integer qtyPerCOach;
     private String rawMaterialUsed;
     SheetmetalMaster sheetMetalMaster;
	
	  public String getDetails(){
		  {
			  Session session=null;
			  try
			  {
				  
				  session=HibernateConfig.getSession();
				  sheetMetalMaster = (SheetmetalMaster)session.get(SheetmetalMaster.class, drawingNo);
				  qtyPerCOach=sheetMetalMaster.getQpc();
				  rawMaterialUsed=sheetMetalMaster.getRawMaterialUsed();
			  }
			  catch(Exception e){
				  e.printStackTrace();
				  return null;
			  }
			  finally{
					session.close();
				}
		  }
		  return "success";
	  }

	public Integer getDrawingNo() {
		return drawingNo;
	}

	public void setDrawingNo(Integer drawingNo) {
		this.drawingNo = drawingNo;
	}

	public Integer getQtyPerCOach() {
		return qtyPerCOach;
	}

	public void setQtyPerCOach(Integer qtyPerCOach) {
		this.qtyPerCOach = qtyPerCOach;
	}

	public String getRawMaterialUsed() {
		return rawMaterialUsed;
	}

	public void setRawMaterialUsed(String rawMaterialUsed) {
		this.rawMaterialUsed = rawMaterialUsed;
	}

	public SheetmetalMaster getSheetMetalMaster() {
		return sheetMetalMaster;
	}

	public void setSheetMetalMaster(SheetmetalMaster sheetMetalMaster) {
		this.sheetMetalMaster = sheetMetalMaster;
	}

}
