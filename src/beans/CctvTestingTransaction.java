package beans;

import java.util.Date;

public class CctvTestingTransaction implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	private Integer furnishingAssetId;
	private String docNoCctv;
	private Date dateOfCctvTesting;
	private String shiftCctv;
    private String mountingOfCameraFlag;
    private String mountingOfCameraRemark;
    private String mountingOfNvrFlag;
    private String mountingOfNvrRemark;
    private String dcConverterFlag;
    private String dcConverterRemark;
    private String hddFlag;
    private String hddRemark;
    private String sdCardFlag;
    private String sdCardRemark;
    private String ipProtectionBoxFlag;
    private String ipProtectionBoxRemark;
    private String cableConnectorFlag;
    private String cableConnectorRemark;
    private String workingCameraInDayFlag;
    private String workingCameraInDayRemark;
    private String workingCameraInNightFlag;
    private String workingCameraInNightRemark;
    private String gpsSupportFlag;
    private String gpsSupportRemark;
    private String recordingFeatureFlag;
    private String recordingFeatureRemark;
  
    private String statusOfObservation;
    
    private String entryBy;
    private Date entryTime;
	
	public CctvTestingTransaction()
	{
		
	}

	public CctvTestingTransaction(Integer furnishingAssetId, String docNoCctv, Date dateOfCctvTesting, String shiftCctv,
			String mountingOfCameraFlag, String mountingOfCameraRemark, String mountingOfNvrFlag,
			String mountingOfNvrRemark, String dcConverterFlag, String dcConverterRemark, String hddFlag,
			String hddRemark, String sdCardFlag, String sdCardRemark, String ipProtectionBoxFlag,
			String ipProtectionBoxRemark, String cableConnectorFlag, String cableConnectorRemark,
			String workingCameraInDayFlag, String workingCameraInDayRemark, String workingCameraInNightFlag,
			String workingCameraInNightRemark, String gpsSupportFlag, String gpsSupportRemark,
			String recordingFeatureFlag, String recordingFeatureRemark, 
			String statusOfObservation, String entryBy, Date entryTime) {
		super();
		this.furnishingAssetId = furnishingAssetId;
		this.docNoCctv = docNoCctv;
		this.dateOfCctvTesting = dateOfCctvTesting;
		this.shiftCctv = shiftCctv;
		this.mountingOfCameraFlag = mountingOfCameraFlag;
		this.mountingOfCameraRemark = mountingOfCameraRemark;
		this.mountingOfNvrFlag = mountingOfNvrFlag;
		this.mountingOfNvrRemark = mountingOfNvrRemark;
		this.dcConverterFlag = dcConverterFlag;
		this.dcConverterRemark = dcConverterRemark;
		this.hddFlag = hddFlag;
		this.hddRemark = hddRemark;
		this.sdCardFlag = sdCardFlag;
		this.sdCardRemark = sdCardRemark;
		this.ipProtectionBoxFlag = ipProtectionBoxFlag;
		this.ipProtectionBoxRemark = ipProtectionBoxRemark;
		this.cableConnectorFlag = cableConnectorFlag;
		this.cableConnectorRemark = cableConnectorRemark;
		this.workingCameraInDayFlag = workingCameraInDayFlag;
		this.workingCameraInDayRemark = workingCameraInDayRemark;
		this.workingCameraInNightFlag = workingCameraInNightFlag;
		this.workingCameraInNightRemark = workingCameraInNightRemark;
		this.gpsSupportFlag = gpsSupportFlag;
		this.gpsSupportRemark = gpsSupportRemark;
		this.recordingFeatureFlag = recordingFeatureFlag;
		this.recordingFeatureRemark = recordingFeatureRemark;
		this.statusOfObservation = statusOfObservation;
		this.statusOfObservation = statusOfObservation;
		this.entryBy = entryBy;
		this.entryTime = entryTime;
	}

	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getDocNoCctv() {
		return docNoCctv;
	}

	public void setDocNoCctv(String docNoCctv) {
		this.docNoCctv = docNoCctv;
	}

	public Date getDateOfCctvTesting() {
		return dateOfCctvTesting;
	}

	public void setDateOfCctvTesting(Date dateOfCctvTesting) {
		this.dateOfCctvTesting = dateOfCctvTesting;
	}

	public String getShiftCctv() {
		return shiftCctv;
	}

	public void setShiftCctv(String shiftCctv) {
		this.shiftCctv = shiftCctv;
	}

	public String getMountingOfCameraFlag() {
		return mountingOfCameraFlag;
	}

	public void setMountingOfCameraFlag(String mountingOfCameraFlag) {
		this.mountingOfCameraFlag = mountingOfCameraFlag;
	}

	public String getMountingOfCameraRemark() {
		return mountingOfCameraRemark;
	}

	public void setMountingOfCameraRemark(String mountingOfCameraRemark) {
		this.mountingOfCameraRemark = mountingOfCameraRemark;
	}

	public String getMountingOfNvrFlag() {
		return mountingOfNvrFlag;
	}

	public void setMountingOfNvrFlag(String mountingOfNvrFlag) {
		this.mountingOfNvrFlag = mountingOfNvrFlag;
	}

	public String getMountingOfNvrRemark() {
		return mountingOfNvrRemark;
	}

	public void setMountingOfNvrRemark(String mountingOfNvrRemark) {
		this.mountingOfNvrRemark = mountingOfNvrRemark;
	}

	public String getDcConverterFlag() {
		return dcConverterFlag;
	}

	public void setDcConverterFlag(String dcConverterFlag) {
		this.dcConverterFlag = dcConverterFlag;
	}

	public String getDcConverterRemark() {
		return dcConverterRemark;
	}

	public void setDcConverterRemark(String dcConverterRemark) {
		this.dcConverterRemark = dcConverterRemark;
	}

	public String getHddFlag() {
		return hddFlag;
	}

	public void setHddFlag(String hddFlag) {
		this.hddFlag = hddFlag;
	}

	public String getHddRemark() {
		return hddRemark;
	}

	public void setHddRemark(String hddRemark) {
		this.hddRemark = hddRemark;
	}

	public String getSdCardFlag() {
		return sdCardFlag;
	}

	public void setSdCardFlag(String sdCardFlag) {
		this.sdCardFlag = sdCardFlag;
	}

	public String getSdCardRemark() {
		return sdCardRemark;
	}

	public void setSdCardRemark(String sdCardRemark) {
		this.sdCardRemark = sdCardRemark;
	}

	public String getIpProtectionBoxFlag() {
		return ipProtectionBoxFlag;
	}

	public void setIpProtectionBoxFlag(String ipProtectionBoxFlag) {
		this.ipProtectionBoxFlag = ipProtectionBoxFlag;
	}

	
	public String getIpProtectionBoxRemark() {
		return ipProtectionBoxRemark;
	}

	public void setIpProtectionBoxRemark(String ipProtectionBoxRemark) {
		this.ipProtectionBoxRemark = ipProtectionBoxRemark;
	}

	public String getCableConnectorFlag() {
		return cableConnectorFlag;
	}

	public void setCableConnectorFlag(String cableConnectorFlag) {
		this.cableConnectorFlag = cableConnectorFlag;
	}

	public String getCableConnectorRemark() {
		return cableConnectorRemark;
	}

	public void setCableConnectorRemark(String cableConnectorRemark) {
		this.cableConnectorRemark = cableConnectorRemark;
	}

	public String getWorkingCameraInDayFlag() {
		return workingCameraInDayFlag;
	}

	public void setWorkingCameraInDayFlag(String workingCameraInDayFlag) {
		this.workingCameraInDayFlag = workingCameraInDayFlag;
	}

	public String getWorkingCameraInDayRemark() {
		return workingCameraInDayRemark;
	}

	public void setWorkingCameraInDayRemark(String workingCameraInDayRemark) {
		this.workingCameraInDayRemark = workingCameraInDayRemark;
	}

	public String getWorkingCameraInNightFlag() {
		return workingCameraInNightFlag;
	}

	public void setWorkingCameraInNightFlag(String workingCameraInNightFlag) {
		this.workingCameraInNightFlag = workingCameraInNightFlag;
	}

	public String getWorkingCameraInNightRemark() {
		return workingCameraInNightRemark;
	}

	public void setWorkingCameraInNightRemark(String workingCameraInNightRemark) {
		this.workingCameraInNightRemark = workingCameraInNightRemark;
	}

	public String getGpsSupportFlag() {
		return gpsSupportFlag;
	}

	public void setGpsSupportFlag(String gpsSupportFlag) {
		this.gpsSupportFlag = gpsSupportFlag;
	}

	public String getGpsSupportRemark() {
		return gpsSupportRemark;
	}

	public void setGpsSupportRemark(String gpsSupportRemark) {
		this.gpsSupportRemark = gpsSupportRemark;
	}

	public String getRecordingFeatureFlag() {
		return recordingFeatureFlag;
	}

	public void setRecordingFeatureFlag(String recordingFeatureFlag) {
		this.recordingFeatureFlag = recordingFeatureFlag;
	}

	public String getRecordingFeatureRemark() {
		return recordingFeatureRemark;
	}

	public void setRecordingFeatureRemark(String recordingFeatureRemark) {
		this.recordingFeatureRemark = recordingFeatureRemark;
	}

	

	public String getStatusOfObservation() {
		return statusOfObservation;
	}

	public void setStatusOfObservation(String statusOfObservation) {
		this.statusOfObservation = statusOfObservation;
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
