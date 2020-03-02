package struts.action.master;
import dao.DaoCctvTesting;

import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import beans.CctvTestingTransaction;
import beans.FurnishingTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;
public class SaveDataCctvTesting {
	private String furnishingAssetId;
	private String ccTvDocNo;
	private String ccTvShift;
	private String ccTvDateOfTesting;
	private String ccTvMountCamera6;
	private String ccTvMountNvrRecord;
	private String ccTvDctoDcConvtr;
	private String ccTvMinCapREcrodVideos;
	private String ccTvOneSideCardCap;
	private String ccTvIpProtectDirakLock;
	private String ccTvCableWidConn;
	private String ccTvWorkCamrDayMode;
	private String ccTvWorkCamrNightMood;
	private String ccTvComptGpsRealTimeLoc;
	private String ccTvRecordFeatures;
	private String ccTvTestingStatus;
	private String ccTvMountCamera6Rmk;
	private String ccTvMountNvrRecordRmk;
	private String ccTvDctoDcConvtrRmk;
	private String ccTvMinCapREcrodVideosRmk;
	private String ccTvOneSideCardCapRmk;
	private String ccTvIpProtectDirakLockRmk;
	private String ccTvCableWidConnRmk;
	private String ccTvWorkCamrDayModeRmk;
	private String ccTvWorkCamrNightMoodRmk;
	private String ccTvComptGpsRealTimeLocRmk;
	private String ccTvRecordFeaturesRmk ;
	private String entryBy ;
	private String entryDate ;
	
	
	public String saveDataCctv()
	{
		
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryDate=new Timestamp(System.currentTimeMillis());
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		CctvTestingTransaction cctvTestingTrans= new CctvTestingTransaction();
		FurnishingTransaction furnishingTran= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		furnishingTran.setCctvTestingFlag(1);
		System.out.println("flagvalue="+furnishingTran.getCctvTestingFlag());
		
		//PlumbingTestingTransaction plumbingTestingTransaction= new PlumbingTestingTransaction();
		if(!"".equals(ccTvDateOfTesting))
		{
			cctvTestingTrans.setDateOfCctvTesting(DateUtil.convertToDate(ccTvDateOfTesting));
		}
		cctvTestingTrans.setFurnishingAssetId(furnishingAssetIdAsInt);
		cctvTestingTrans.setDocNoCctv(ccTvDocNo);
		cctvTestingTrans.setShiftCctv(ccTvShift);
		cctvTestingTrans.setMountingOfCameraFlag(ccTvMountCamera6);
		cctvTestingTrans.setMountingOfNvrFlag(ccTvMountNvrRecord);
		cctvTestingTrans.setDcConverterFlag(ccTvDctoDcConvtr);
		cctvTestingTrans.setHddFlag(ccTvMinCapREcrodVideos);
		cctvTestingTrans.setSdCardFlag(ccTvOneSideCardCap);
		cctvTestingTrans.setIpProtectionBoxFlag(ccTvIpProtectDirakLock);
		cctvTestingTrans.setCableConnectorFlag(ccTvCableWidConn);
		cctvTestingTrans.setWorkingCameraInDayFlag(ccTvWorkCamrDayMode);
		cctvTestingTrans.setWorkingCameraInNightFlag(ccTvWorkCamrNightMood);
		cctvTestingTrans.setGpsSupportFlag(ccTvComptGpsRealTimeLoc);
		cctvTestingTrans.setRecordingFeatureFlag(ccTvRecordFeatures);
		cctvTestingTrans.setStatusOfObservation(ccTvTestingStatus);
		cctvTestingTrans.setMountingOfCameraRemark(ccTvMountCamera6Rmk);
		cctvTestingTrans.setMountingOfNvrRemark(ccTvMountNvrRecordRmk);
		cctvTestingTrans.setDcConverterRemark(ccTvDctoDcConvtrRmk);
		cctvTestingTrans.setHddRemark(ccTvMinCapREcrodVideosRmk);
		cctvTestingTrans.setSdCardRemark(ccTvOneSideCardCapRmk);
		cctvTestingTrans.setIpProtectionBoxRemark(ccTvIpProtectDirakLockRmk);
		cctvTestingTrans.setCableConnectorRemark(ccTvCableWidConnRmk);
		cctvTestingTrans.setWorkingCameraInDayRemark(ccTvWorkCamrDayModeRmk);
		cctvTestingTrans.setWorkingCameraInNightRemark(ccTvWorkCamrNightMoodRmk);
		cctvTestingTrans.setGpsSupportRemark(ccTvComptGpsRealTimeLocRmk);
		cctvTestingTrans.setRecordingFeatureRemark(ccTvRecordFeaturesRmk);
		cctvTestingTrans.setEntryBy(userID);
		cctvTestingTrans.setEntryTime(entryDate);
		
		System.out.println("last!!");
		
		
		
		try
		{	
			System.out.println(furnishingAssetIdAsInt);
			DaoCctvTesting dao= new DaoCctvTesting ();
			dao.saveTesting(cctvTestingTrans, furnishingTran);
			//System.out.println(shellAssetIdAsInt);
			System.out.println("new"+furnishingAssetIdAsInt);
			return "success";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		
	}


	public String getFurnishingAssetId() {
		return furnishingAssetId;
	}


	public void setFurnishingAssetId(String furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}


	public String getCcTvDocNo() {
		return ccTvDocNo;
	}


	public void setCcTvDocNo(String ccTvDocNo) {
		this.ccTvDocNo = ccTvDocNo;
	}


	public String getCcTvShift() {
		return ccTvShift;
	}


	public void setCcTvShift(String ccTvShift) {
		this.ccTvShift = ccTvShift;
	}


	public String getCcTvDateOfTesting() {
		return ccTvDateOfTesting;
	}


	public void setCcTvDateOfTesting(String ccTvDateOfTesting) {
		this.ccTvDateOfTesting = ccTvDateOfTesting;
	}


	public String getCcTvMountCamera6() {
		return ccTvMountCamera6;
	}


	public void setCcTvMountCamera6(String ccTvMountCamera6) {
		this.ccTvMountCamera6 = ccTvMountCamera6;
	}


	public String getCcTvMountNvrRecord() {
		return ccTvMountNvrRecord;
	}


	public void setCcTvMountNvrRecord(String ccTvMountNvrRecord) {
		this.ccTvMountNvrRecord = ccTvMountNvrRecord;
	}


	public String getCcTvDctoDcConvtr() {
		return ccTvDctoDcConvtr;
	}


	public void setCcTvDctoDcConvtr(String ccTvDctoDcConvtr) {
		this.ccTvDctoDcConvtr = ccTvDctoDcConvtr;
	}


	public String getCcTvMinCapREcrodVideos() {
		return ccTvMinCapREcrodVideos;
	}


	public void setCcTvMinCapREcrodVideos(String ccTvMinCapREcrodVideos) {
		this.ccTvMinCapREcrodVideos = ccTvMinCapREcrodVideos;
	}


	public String getCcTvOneSideCardCap() {
		return ccTvOneSideCardCap;
	}


	public void setCcTvOneSideCardCap(String ccTvOneSideCardCap) {
		this.ccTvOneSideCardCap = ccTvOneSideCardCap;
	}


	public String getCcTvIpProtectDirakLock() {
		return ccTvIpProtectDirakLock;
	}


	public void setCcTvIpProtectDirakLock(String ccTvIpProtectDirakLock) {
		this.ccTvIpProtectDirakLock = ccTvIpProtectDirakLock;
	}


	public String getCcTvCableWidConn() {
		return ccTvCableWidConn;
	}


	public void setCcTvCableWidConn(String ccTvCableWidConn) {
		this.ccTvCableWidConn = ccTvCableWidConn;
	}


	public String getCcTvWorkCamrDayMode() {
		return ccTvWorkCamrDayMode;
	}


	public void setCcTvWorkCamrDayMode(String ccTvWorkCamrDayMode) {
		this.ccTvWorkCamrDayMode = ccTvWorkCamrDayMode;
	}


	public String getCcTvWorkCamrNightMood() {
		return ccTvWorkCamrNightMood;
	}


	public void setCcTvWorkCamrNightMood(String ccTvWorkCamrNightMood) {
		this.ccTvWorkCamrNightMood = ccTvWorkCamrNightMood;
	}


	public String getCcTvComptGpsRealTimeLoc() {
		return ccTvComptGpsRealTimeLoc;
	}


	public void setCcTvComptGpsRealTimeLoc(String ccTvComptGpsRealTimeLoc) {
		this.ccTvComptGpsRealTimeLoc = ccTvComptGpsRealTimeLoc;
	}


	public String getCcTvRecordFeatures() {
		return ccTvRecordFeatures;
	}


	public void setCcTvRecordFeatures(String ccTvRecordFeatures) {
		this.ccTvRecordFeatures = ccTvRecordFeatures;
	}


	public String getCcTvTestingStatus() {
		return ccTvTestingStatus;
	}


	public void setCcTvTestingStatus(String ccTvTestingStatus) {
		this.ccTvTestingStatus = ccTvTestingStatus;
	}


	public String getCcTvMountCamera6Rmk() {
		return ccTvMountCamera6Rmk;
	}


	public void setCcTvMountCamera6Rmk(String ccTvMountCamera6Rmk) {
		this.ccTvMountCamera6Rmk = ccTvMountCamera6Rmk;
	}


	public String getCcTvMountNvrRecordRmk() {
		return ccTvMountNvrRecordRmk;
	}


	public void setCcTvMountNvrRecordRmk(String ccTvMountNvrRecordRmk) {
		this.ccTvMountNvrRecordRmk = ccTvMountNvrRecordRmk;
	}


	public String getCcTvDctoDcConvtrRmk() {
		return ccTvDctoDcConvtrRmk;
	}


	public void setCcTvDctoDcConvtrRmk(String ccTvDctoDcConvtrRmk) {
		this.ccTvDctoDcConvtrRmk = ccTvDctoDcConvtrRmk;
	}


	public String getCcTvMinCapREcrodVideosRmk() {
		return ccTvMinCapREcrodVideosRmk;
	}


	public void setCcTvMinCapREcrodVideosRmk(String ccTvMinCapREcrodVideosRmk) {
		this.ccTvMinCapREcrodVideosRmk = ccTvMinCapREcrodVideosRmk;
	}


	public String getCcTvOneSideCardCapRmk() {
		return ccTvOneSideCardCapRmk;
	}


	public void setCcTvOneSideCardCapRmk(String ccTvOneSideCardCapRmk) {
		this.ccTvOneSideCardCapRmk = ccTvOneSideCardCapRmk;
	}


	public String getCcTvIpProtectDirakLockRmk() {
		return ccTvIpProtectDirakLockRmk;
	}


	public void setCcTvIpProtectDirakLockRmk(String ccTvIpProtectDirakLockRmk) {
		this.ccTvIpProtectDirakLockRmk = ccTvIpProtectDirakLockRmk;
	}


	public String getCcTvCableWidConnRmk() {
		return ccTvCableWidConnRmk;
	}


	public void setCcTvCableWidConnRmk(String ccTvCableWidConnRmk) {
		this.ccTvCableWidConnRmk = ccTvCableWidConnRmk;
	}


	public String getCcTvWorkCamrDayModeRmk() {
		return ccTvWorkCamrDayModeRmk;
	}


	public void setCcTvWorkCamrDayModeRmk(String ccTvWorkCamrDayModeRmk) {
		this.ccTvWorkCamrDayModeRmk = ccTvWorkCamrDayModeRmk;
	}


	public String getCcTvWorkCamrNightMoodRmk() {
		return ccTvWorkCamrNightMoodRmk;
	}


	public void setCcTvWorkCamrNightMoodRmk(String ccTvWorkCamrNightMoodRmk) {
		this.ccTvWorkCamrNightMoodRmk = ccTvWorkCamrNightMoodRmk;
	}


	public String getCcTvComptGpsRealTimeLocRmk() {
		return ccTvComptGpsRealTimeLocRmk;
	}


	public void setCcTvComptGpsRealTimeLocRmk(String ccTvComptGpsRealTimeLocRmk) {
		this.ccTvComptGpsRealTimeLocRmk = ccTvComptGpsRealTimeLocRmk;
	}


	public String getCcTvRecordFeaturesRmk() {
		return ccTvRecordFeaturesRmk;
	}


	public void setCcTvRecordFeaturesRmk(String ccTvRecordFeaturesRmk) {
		this.ccTvRecordFeaturesRmk = ccTvRecordFeaturesRmk;
	}


	public String getEntryBy() {
		return entryBy;
	}


	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}


	public String getEntryDate() {
		return entryDate;
	}


	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}
	
	

}
