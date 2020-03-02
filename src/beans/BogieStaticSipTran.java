package beans;

import java.util.Date;

public class BogieStaticSipTran implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer bogieAssetId;
    private String docNo;
    private String shiftOfTesting;
    private Date dateOfTesting;
    private String drawingNo;
    private String wiNo;
    private Integer loadTareZ11;
    private Integer loadTareZ31;
    private Integer loadTareZ41;
    private Integer loadTareZ21;
    private Integer loadTareX;
    private Float loadTareZ12Z22;
    private Float loadTareZ32Z42;
    private Integer loadGrossZ11;
    private Integer loadGrossZ31;
    private Integer loadGrossZ41;
    private Integer loadGrossZ21;
    private Integer loadGrossX;
    private Float loadGrossZ12Z22;
    private Float loadGrossZ32Z42;
    
    private Integer loadTareX14;
    private Integer loadTareX24;
    private Integer loadTareY13;
    private Integer loadTareY33;
    private Integer loadTareASide;
    private Integer loadTareBSide;
    private Integer loadGrossX14;
    private Integer loadGrossX24;
    private Integer loadGrossY13;
    private Integer loadGrossY33;
    private String bogieStaticSipStatus;
    private String entryBy;
    private Date entryTime;
    
    public BogieStaticSipTran()
    {
    	
    }

	public BogieStaticSipTran(Integer bogieAssetId, String docNo, String shiftOfTesting, Date dateOfTesting,
			String drawingNo, String wiNo, Integer loadTareZ11, Integer loadTareZ31, Integer loadTareZ41,
			Integer loadTareZ21, Integer loadTareX, Float loadTareZ12Z22, Float loadTareZ32Z42, Integer loadGrossZ11,
			Integer loadGrossZ31, Integer loadGrossZ41, Integer loadGrossZ21, Integer loadGrossX, Float loadGrossZ12Z22,
			Float loadGrossZ32Z42, Integer loadTareX14, Integer loadTareX24, Integer loadTareY13, Integer loadTareY33,
			Integer loadTareASide, Integer loadTareBSide, Integer loadGrossX14, Integer loadGrossX24,
			Integer loadGrossY13, Integer loadGrossY33, String bogieStaticSipStatus, String entryBy, Date entryTime) {
		super();
		this.bogieAssetId = bogieAssetId;
		this.docNo = docNo;
		this.shiftOfTesting = shiftOfTesting;
		this.dateOfTesting = dateOfTesting;
		this.drawingNo = drawingNo;
		this.wiNo = wiNo;
		this.loadTareZ11 = loadTareZ11;
		this.loadTareZ31 = loadTareZ31;
		this.loadTareZ41 = loadTareZ41;
		this.loadTareZ21 = loadTareZ21;
		this.loadTareX = loadTareX;
		this.loadTareZ12Z22 = loadTareZ12Z22;
		this.loadTareZ32Z42 = loadTareZ32Z42;
		this.loadGrossZ11 = loadGrossZ11;
		this.loadGrossZ31 = loadGrossZ31;
		this.loadGrossZ41 = loadGrossZ41;
		this.loadGrossZ21 = loadGrossZ21;
		this.loadGrossX = loadGrossX;
		this.loadGrossZ12Z22 = loadGrossZ12Z22;
		this.loadGrossZ32Z42 = loadGrossZ32Z42;
		this.loadTareX14 = loadTareX14;
		this.loadTareX24 = loadTareX24;
		this.loadTareY13 = loadTareY13;
		this.loadTareY33 = loadTareY33;
		this.loadTareASide = loadTareASide;
		this.loadTareBSide = loadTareBSide;
		this.loadGrossX14 = loadGrossX14;
		this.loadGrossX24 = loadGrossX24;
		this.loadGrossY13 = loadGrossY13;
		this.loadGrossY33 = loadGrossY33;
		this.bogieStaticSipStatus = bogieStaticSipStatus;
		this.entryBy = entryBy;
		this.entryTime = entryTime;
	}

	public Integer getBogieAssetId() {
		return bogieAssetId;
	}

	public void setBogieAssetId(Integer bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getShiftOfTesting() {
		return shiftOfTesting;
	}

	public void setShiftOfTesting(String shiftOfTesting) {
		this.shiftOfTesting = shiftOfTesting;
	}

	public Date getDateOfTesting() {
		return dateOfTesting;
	}

	public void setDateOfTesting(Date dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}

	public String getDrawingNo() {
		return drawingNo;
	}

	public void setDrawingNo(String drawingNo) {
		this.drawingNo = drawingNo;
	}

	public String getWiNo() {
		return wiNo;
	}

	public void setWiNo(String wiNo) {
		this.wiNo = wiNo;
	}

	public Integer getLoadTareZ11() {
		return loadTareZ11;
	}

	public void setLoadTareZ11(Integer loadTareZ11) {
		this.loadTareZ11 = loadTareZ11;
	}

	public Integer getLoadTareZ31() {
		return loadTareZ31;
	}

	public void setLoadTareZ31(Integer loadTareZ31) {
		this.loadTareZ31 = loadTareZ31;
	}
	
	public Integer getLoadTareZ41() {
		return loadTareZ41;
	}

	public void setLoadTareZ41(Integer loadTareZ41) {
		this.loadTareZ41 = loadTareZ41;
	}

	public Integer getLoadTareZ21() {
		return loadTareZ21;
	}

	public void setLoadTareZ21(Integer loadTareZ21) {
		this.loadTareZ21 = loadTareZ21;
	}

	public Integer getLoadTareX() {
		return loadTareX;
	}

	public void setLoadTareX(Integer loadTareX) {
		this.loadTareX = loadTareX;
	}

	public Float getLoadTareZ12Z22() {
		return loadTareZ12Z22;
	}

	public void setLoadTareZ12Z22(Float loadTareZ12Z22) {
		this.loadTareZ12Z22 = loadTareZ12Z22;
	}

	public Float getLoadTareZ32Z42() {
		return loadTareZ32Z42;
	}

	public void setLoadTareZ32Z42(Float loadTareZ32Z42) {
		this.loadTareZ32Z42 = loadTareZ32Z42;
	}

	public Integer getLoadGrossZ11() {
		return loadGrossZ11;
	}

	public void setLoadGrossZ11(Integer loadGrossZ11) {
		this.loadGrossZ11 = loadGrossZ11;
	}

	public Integer getLoadGrossZ31() {
		return loadGrossZ31;
	}

	public void setLoadGrossZ31(Integer loadGrossZ31) {
		this.loadGrossZ31 = loadGrossZ31;
	}

	public Integer getLoadGrossZ41() {
		return loadGrossZ41;
	}

	public void setLoadGrossZ41(Integer loadGrossZ41) {
		this.loadGrossZ41 = loadGrossZ41;
	}

	public Integer getLoadGrossZ21() {
		return loadGrossZ21;
	}

	public void setLoadGrossZ21(Integer loadGrossZ21) {
		this.loadGrossZ21 = loadGrossZ21;
	}

	public Integer getLoadGrossX() {
		return loadGrossX;
	}

	public void setLoadGrossX(Integer loadGrossX) {
		this.loadGrossX = loadGrossX;
	}

	public Float getLoadGrossZ12Z22() {
		return loadGrossZ12Z22;
	}

	public void setLoadGrossZ12Z22(Float loadGrossZ12Z22) {
		this.loadGrossZ12Z22 = loadGrossZ12Z22;
	}

	public Float getLoadGrossZ32Z42() {
		return loadGrossZ32Z42;
	}

	public void setLoadGrossZ32Z42(Float loadGrossZ32Z42) {
		this.loadGrossZ32Z42 = loadGrossZ32Z42;
	}

	public Integer getLoadTareX14() {
		return loadTareX14;
	}

	public void setLoadTareX14(Integer loadTareX14) {
		this.loadTareX14 = loadTareX14;
	}

	public Integer getLoadTareX24() {
		return loadTareX24;
	}

	public void setLoadTareX24(Integer loadTareX24) {
		this.loadTareX24 = loadTareX24;
	}

	public Integer getLoadTareY13() {
		return loadTareY13;
	}

	public void setLoadTareY13(Integer loadTareY13) {
		this.loadTareY13 = loadTareY13;
	}

	public Integer getLoadTareY33() {
		return loadTareY33;
	}

	public void setLoadTareY33(Integer loadTareY33) {
		this.loadTareY33 = loadTareY33;
	}

	public Integer getLoadTareASide() {
		return loadTareASide;
	}

	public void setLoadTareASide(Integer loadTareASide) {
		this.loadTareASide = loadTareASide;
	}

	public Integer getLoadTareBSide() {
		return loadTareBSide;
	}

	public void setLoadTareBSide(Integer loadTareBSide) {
		this.loadTareBSide = loadTareBSide;
	}

	public Integer getLoadGrossX14() {
		return loadGrossX14;
	}

	public void setLoadGrossX14(Integer loadGrossX14) {
		this.loadGrossX14 = loadGrossX14;
	}

	public Integer getLoadGrossX24() {
		return loadGrossX24;
	}

	public void setLoadGrossX24(Integer loadGrossX24) {
		this.loadGrossX24 = loadGrossX24;
	}

	public Integer getLoadGrossY13() {
		return loadGrossY13;
	}

	public void setLoadGrossY13(Integer loadGrossY13) {
		this.loadGrossY13 = loadGrossY13;
	}

	public Integer getLoadGrossY33() {
		return loadGrossY33;
	}

	public void setLoadGrossY33(Integer loadGrossY33) {
		this.loadGrossY33 = loadGrossY33;
	}

	public String getBogieStaticSipStatus() {
		return bogieStaticSipStatus;
	}

	public void setBogieStaticSipStatus(String bogieStaticSipStatus) {
		this.bogieStaticSipStatus = bogieStaticSipStatus;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	public Date getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(Date entryTime) {
		this.entryTime = entryTime;
	}
    
    
}
