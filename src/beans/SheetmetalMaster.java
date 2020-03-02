package beans;

public class SheetmetalMaster implements java.io.Serializable{
	private static final long serialVersionUID = 1L;

	private String drawingNo;
	private String description;
	private Float sizeLength;
	private Float sizeWidth;
	private Float sizeThickness;
	private String sizeUnit;
	private String rawMaterialUsed;
	private String processP1;
	private String processP2;
	private String processP3;
	private String processP4;
	private String processP5;
	private Integer qpc;
	private String shellType;
	private String componentType;
	private String fileName;
	private String userShop;
	private String entrydate;
	private String entryBy;
	
	
	public SheetmetalMaster()
	{
		
	}

	



	
	public SheetmetalMaster(String drawingNo, String description, Float sizeLength, Float sizeWidth,
			Float sizeThickness, String sizeUnit, String rawMaterialUsed, String processP1, String processP2,
			String processP3, String processP4, String processP5, Integer qpc, String shellType, String componentType,
			String fileName, String userShop, String entrydate, String entryBy) {
		super();
		this.drawingNo = drawingNo;
		this.description = description;
		this.sizeLength = sizeLength;
		this.sizeWidth = sizeWidth;
		this.sizeThickness = sizeThickness;
		this.sizeUnit = sizeUnit;
		this.rawMaterialUsed = rawMaterialUsed;
		this.processP1 = processP1;
		this.processP2 = processP2;
		this.processP3 = processP3;
		this.processP4 = processP4;
		this.processP5 = processP5;
		this.qpc = qpc;
		this.shellType = shellType;
		this.componentType = componentType;
		this.fileName = fileName;
		this.userShop = userShop;
		this.entrydate = entrydate;
		this.entryBy = entryBy;
	}






	public String getDrawingNo() {
		return drawingNo;
	}


	public void setDrawingNo(String drawingNo) {
		this.drawingNo = drawingNo;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public Float getSizeLength() {
		return sizeLength;
	}


	public void setSizeLength(Float sizeLength) {
		this.sizeLength = sizeLength;
	}


	public Float getSizeWidth() {
		return sizeWidth;
	}


	public void setSizeWidth(Float sizeWidth) {
		this.sizeWidth = sizeWidth;
	}


	public Float getSizeThickness() {
		return sizeThickness;
	}


	public void setSizeThickness(Float sizeThickness) {
		this.sizeThickness = sizeThickness;
	}


	public String getSizeUnit() {
		return sizeUnit;
	}

	public void setSizeUnit(String sizeUnit) {
		this.sizeUnit = sizeUnit;
	}

	public String getRawMaterialUsed() {
		return rawMaterialUsed;
	}

	public void setRawMaterialUsed(String rawMaterialUsed) {
		this.rawMaterialUsed = rawMaterialUsed;
	}

	public String getProcessP1() {
		return processP1;
	}

	public void setProcessP1(String processP1) {
		this.processP1 = processP1;
	}

	public String getProcessP2() {
		return processP2;
	}

	public void setProcessP2(String processP2) {
		this.processP2 = processP2;
	}

	public String getProcessP3() {
		return processP3;
	}

	public void setProcessP3(String processP3) {
		this.processP3 = processP3;
	}

	public String getProcessP4() {
		return processP4;
	}

	public void setProcessP4(String processP4) {
		this.processP4 = processP4;
	}

	public String getProcessP5() {
		return processP5;
	}

	public void setProcessP5(String processP5) {
		this.processP5 = processP5;
	}

	public Integer getQpc() {
		return qpc;
	}

	public void setQpc(Integer qpc) {
		this.qpc = qpc;
	}

	public String getShellType() {
		return shellType;
	}

	public void setShellType(String shellType) {
		this.shellType = shellType;
	}

	public String getComponentType() {
		return componentType;
	}

	public void setComponentType(String componentType) {
		this.componentType = componentType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	public String getUserShop() {
		return userShop;
	}

	public void setUserShop(String userShop) {
		this.userShop = userShop;
	}
	
}
