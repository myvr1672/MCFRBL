package beans;

import java.util.Date;

public class WheelSipTransaction implements java.io.Serializable{


	private static final long serialVersionUID = 1L;
	private Integer wheelsetAssetId;
    private String docNoWheelAxleTesting;
    private Date dateOfWheelAxleTesting;
    private String shiftWheelAxleTesting;
    private String drawingNoWheelAxle;
    private String wiNoWheelAxle;
    private String heatNoWheelAxle;
    private String docNoCtrbTesting;
    private Date dateOfCtrbTesting;
    private String shiftCtrbTesting;
    private String drawingNoCtrb;
    private String wiNoCtrb;
    private String docNoQualityClearance;
    private String stampParticularsLeftWheel;
    private String stampParticularsRightWheel;
    private String stampParticularsWheel;
    
    private String stampParticularsAxle;
    private String modificationInWheelAxle;
    private String trialInWheelAxle;
    private String remarksInWheelAxle;
    private String ctrbItemAsDrawingFlag;
    private String ctrbComplianceWiFlag;
    private String fillingGreaseAxleFlag;
    private String differenceOfWheelDiaFlag;
    private String damageInJournalCtrb;
    private String tighteningHexagonalScrews;
    private String modificationInCtrb;
    private String trialInCtrb;
    private String remarksInCtrb;
    private String entryBy;
    private Date entryDate;
    
    public WheelSipTransaction()
    {
    	
    }

	public WheelSipTransaction(Integer wheelsetAssetId, String docNoWheelAxleTesting, Date dateOfWheelAxleTesting,
			String shiftWheelAxleTesting, String drawingNoWheelAxle, String wiNoWheelAxle, String heatNoWheelAxle,
			String docNoCtrbTesting, Date dateOfCtrbTesting, String shiftCtrbTesting, String drawingNoCtrb,
			String wiNoCtrb,String docNoQualityClearance, String stampParticularsLeftWheel, String stampParticularsRightWheel,
			String stampParticularsWheel, String stampParticularsAxle, String modificationInWheelAxle,
			String trialInWheelAxle, String remarksInWheelAxle, String ctrbItemAsDrawingFlag,
			String ctrbComplianceWiFlag, String fillingGreaseAxleFlag, String differenceOfWheelDiaFlag,
			String damageInJournalCtrb, String tighteningHexagonalScrews, String modificationInCtrb, String trialInCtrb,
			String remarksInCtrb, String entryBy, Date entryDate) {
		super();
		this.wheelsetAssetId = wheelsetAssetId;
		this.docNoWheelAxleTesting = docNoWheelAxleTesting;
		this.dateOfWheelAxleTesting = dateOfWheelAxleTesting;
		this.shiftWheelAxleTesting = shiftWheelAxleTesting;
		this.drawingNoWheelAxle = drawingNoWheelAxle;
		this.wiNoWheelAxle = wiNoWheelAxle;
		this.heatNoWheelAxle = heatNoWheelAxle;
		this.docNoCtrbTesting = docNoCtrbTesting;
		this.dateOfCtrbTesting = dateOfCtrbTesting;
		this.shiftCtrbTesting = shiftCtrbTesting;
		this.drawingNoCtrb = drawingNoCtrb;
		this.wiNoCtrb = wiNoCtrb;
		this.docNoQualityClearance=docNoQualityClearance;
		this.stampParticularsLeftWheel = stampParticularsLeftWheel;
		this.stampParticularsRightWheel = stampParticularsRightWheel;
		this.stampParticularsWheel = stampParticularsWheel;
		this.stampParticularsAxle = stampParticularsAxle;
		this.modificationInWheelAxle = modificationInWheelAxle;
		this.trialInWheelAxle = trialInWheelAxle;
		this.remarksInWheelAxle = remarksInWheelAxle;
		this.ctrbItemAsDrawingFlag = ctrbItemAsDrawingFlag;
		this.ctrbComplianceWiFlag = ctrbComplianceWiFlag;
		this.fillingGreaseAxleFlag = fillingGreaseAxleFlag;
		this.differenceOfWheelDiaFlag = differenceOfWheelDiaFlag;
		this.damageInJournalCtrb = damageInJournalCtrb;
		this.tighteningHexagonalScrews = tighteningHexagonalScrews;
		this.modificationInCtrb = modificationInCtrb;
		this.trialInCtrb = trialInCtrb;
		this.remarksInCtrb = remarksInCtrb;
		this.entryBy = entryBy;
		this.entryDate = entryDate;
	}

	public Integer getWheelsetAssetId() {
		return wheelsetAssetId;
	}

	public void setWheelsetAssetId(Integer wheelsetAssetId) {
		this.wheelsetAssetId = wheelsetAssetId;
	}

	public String getDocNoWheelAxleTesting() {
		return docNoWheelAxleTesting;
	}

	public void setDocNoWheelAxleTesting(String docNoWheelAxleTesting) {
		this.docNoWheelAxleTesting = docNoWheelAxleTesting;
	}

	public Date getDateOfWheelAxleTesting() {
		return dateOfWheelAxleTesting;
	}

	public void setDateOfWheelAxleTesting(Date dateOfWheelAxleTesting) {
		this.dateOfWheelAxleTesting = dateOfWheelAxleTesting;
	}

	public String getShiftWheelAxleTesting() {
		return shiftWheelAxleTesting;
	}

	public void setShiftWheelAxleTesting(String shiftWheelAxleTesting) {
		this.shiftWheelAxleTesting = shiftWheelAxleTesting;
	}

	public String getDrawingNoWheelAxle() {
		return drawingNoWheelAxle;
	}

	public void setDrawingNoWheelAxle(String drawingNoWheelAxle) {
		this.drawingNoWheelAxle = drawingNoWheelAxle;
	}

	public String getWiNoWheelAxle() {
		return wiNoWheelAxle;
	}

	public void setWiNoWheelAxle(String wiNoWheelAxle) {
		this.wiNoWheelAxle = wiNoWheelAxle;
	}

	public String getHeatNoWheelAxle() {
		return heatNoWheelAxle;
	}

	public void setHeatNoWheelAxle(String heatNoWheelAxle) {
		this.heatNoWheelAxle = heatNoWheelAxle;
	}

	public String getDocNoCtrbTesting() {
		return docNoCtrbTesting;
	}

	public void setDocNoCtrbTesting(String docNoCtrbTesting) {
		this.docNoCtrbTesting = docNoCtrbTesting;
	}

	public Date getDateOfCtrbTesting() {
		return dateOfCtrbTesting;
	}

	public void setDateOfCtrbTesting(Date dateOfCtrbTesting) {
		this.dateOfCtrbTesting = dateOfCtrbTesting;
	}

	public String getShiftCtrbTesting() {
		return shiftCtrbTesting;
	}

	public void setShiftCtrbTesting(String shiftCtrbTesting) {
		this.shiftCtrbTesting = shiftCtrbTesting;
	}

	public String getDrawingNoCtrb() {
		return drawingNoCtrb;
	}

	public void setDrawingNoCtrb(String drawingNoCtrb) {
		this.drawingNoCtrb = drawingNoCtrb;
	}

	public String getWiNoCtrb() {
		return wiNoCtrb;
	}

	public void setWiNoCtrb(String wiNoCtrb) {
		this.wiNoCtrb = wiNoCtrb;
	}

	public String getStampParticularsLeftWheel() {
		return stampParticularsLeftWheel;
	}

	public void setStampParticularsLeftWheel(String stampParticularsLeftWheel) {
		this.stampParticularsLeftWheel = stampParticularsLeftWheel;
	}

	public String getStampParticularsRightWheel() {
		return stampParticularsRightWheel;
	}

	public void setStampParticularsRightWheel(String stampParticularsRightWheel) {
		this.stampParticularsRightWheel = stampParticularsRightWheel;
	}

	public String getStampParticularsWheel() {
		return stampParticularsWheel;
	}

	public void setStampParticularsWheel(String stampParticularsWheel) {
		this.stampParticularsWheel = stampParticularsWheel;
	}

	public String getStampParticularsAxle() {
		return stampParticularsAxle;
	}

	public void setStampParticularsAxle(String stampParticularsAxle) {
		this.stampParticularsAxle = stampParticularsAxle;
	}

	public String getModificationInWheelAxle() {
		return modificationInWheelAxle;
	}

	public void setModificationInWheelAxle(String modificationInWheelAxle) {
		this.modificationInWheelAxle = modificationInWheelAxle;
	}

	public String getTrialInWheelAxle() {
		return trialInWheelAxle;
	}

	public void setTrialInWheelAxle(String trialInWheelAxle) {
		this.trialInWheelAxle = trialInWheelAxle;
	}

	public String getRemarksInWheelAxle() {
		return remarksInWheelAxle;
	}

	public void setRemarksInWheelAxle(String remarksInWheelAxle) {
		this.remarksInWheelAxle = remarksInWheelAxle;
	}

	public String getCtrbItemAsDrawingFlag() {
		return ctrbItemAsDrawingFlag;
	}

	public void setCtrbItemAsDrawingFlag(String ctrbItemAsDrawingFlag) {
		this.ctrbItemAsDrawingFlag = ctrbItemAsDrawingFlag;
	}

	public String getCtrbComplianceWiFlag() {
		return ctrbComplianceWiFlag;
	}

	public void setCtrbComplianceWiFlag(String ctrbComplianceWiFlag) {
		this.ctrbComplianceWiFlag = ctrbComplianceWiFlag;
	}

	public String getFillingGreaseAxleFlag() {
		return fillingGreaseAxleFlag;
	}

	public void setFillingGreaseAxleFlag(String fillingGreaseAxleFlag) {
		this.fillingGreaseAxleFlag = fillingGreaseAxleFlag;
	}

	public String getDifferenceOfWheelDiaFlag() {
		return differenceOfWheelDiaFlag;
	}

	public void setDifferenceOfWheelDiaFlag(String differenceOfWheelDiaFlag) {
		this.differenceOfWheelDiaFlag = differenceOfWheelDiaFlag;
	}

	public String getDamageInJournalCtrb() {
		return damageInJournalCtrb;
	}

	public void setDamageInJournalCtrb(String damageInJournalCtrb) {
		this.damageInJournalCtrb = damageInJournalCtrb;
	}

	public String getTighteningHexagonalScrews() {
		return tighteningHexagonalScrews;
	}

	public void setTighteningHexagonalScrews(String tighteningHexagonalScrews) {
		this.tighteningHexagonalScrews = tighteningHexagonalScrews;
	}

	public String getModificationInCtrb() {
		return modificationInCtrb;
	}

	public void setModificationInCtrb(String modificationInCtrb) {
		this.modificationInCtrb = modificationInCtrb;
	}

	public String getTrialInCtrb() {
		return trialInCtrb;
	}

	public void setTrialInCtrb(String trialInCtrb) {
		this.trialInCtrb = trialInCtrb;
	}

	public String getRemarksInCtrb() {
		return remarksInCtrb;
	}

	public void setRemarksInCtrb(String remarksInCtrb) {
		this.remarksInCtrb = remarksInCtrb;
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

	public String getDocNoQualityClearance() {
		return docNoQualityClearance;
	}

	public void setDocNoQualityClearance(String docNoQualityClearance) {
		this.docNoQualityClearance = docNoQualityClearance;
	}
    
}
