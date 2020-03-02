package struts.action.master;
import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import beans.FurnishingTransaction;
import beans.ShowerTestingTransaction;
import common.DateUtil;
import dao.DaoShowerTesting;
import hibernateConnect.HibernateConfig;

public class SaveDataShowerTesting {
	private String furnishingAssetId;
	private String showerTestingDocNo;
	private String showerTestingShift;
	private String showerTestingDate;
	private String showerTestTimeCoach;
	private String leakageRoofArea;
	private String leakagejointEndwallRoof;
	private String leakageCantRailArea;
	private String leakageVentArea;
	private String leakageShutterDoor;
	private String leakageAcTrough;
	private String leakageWindows;
	private String showerTestingConfroming;
	private String showerTestingRemarks;
	private String entryBy;
	private String entryDate;
	
	
	
	public String saveDataShower()
	{
		
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		String userID=(String)httpSession.getAttribute("userid");
		Timestamp entryDate=new Timestamp(System.currentTimeMillis());
		Integer furnishingAssetIdAsInt=Integer.parseInt(furnishingAssetId);
		ShowerTestingTransaction showerTestingTransaction= new ShowerTestingTransaction();
		showerTestingTransaction.setFurnishingAssetId(furnishingAssetIdAsInt);
		if(!"".equals(showerTestingDate))
		{
			showerTestingTransaction.setDateOfTesting(DateUtil.convertToDate(showerTestingDate));
		}
		showerTestingTransaction.setDocNo(showerTestingDocNo);
		showerTestingTransaction.setShift(showerTestingShift);
		showerTestingTransaction.setTestingTimeFlag(showerTestTimeCoach);
		showerTestingTransaction.setLeakageRoofFlag(leakageRoofArea);
		showerTestingTransaction.setLeakageJoinEndRoofFlag(leakagejointEndwallRoof);
		showerTestingTransaction.setLeakageCantRailAreaFlag(leakageCantRailArea);
		showerTestingTransaction.setLeakageVentilatorAreaFlag(leakageVentArea);
		showerTestingTransaction.setLeakageShutterSlidingFlag(leakageShutterDoor);
		showerTestingTransaction.setLeakageAcThroughFlag(leakageAcTrough);
		showerTestingTransaction.setLeakageWindowsFlag(leakageWindows);
		showerTestingTransaction.setShowerTestingStatus(showerTestingConfroming);
		showerTestingTransaction.setRemarks(showerTestingRemarks);
		showerTestingTransaction.setEntryBy(userID);
		showerTestingTransaction.setEntryDate(entryDate);
		
		FurnishingTransaction furnishingTran= (FurnishingTransaction) session.get(FurnishingTransaction.class, furnishingAssetIdAsInt);
		
		furnishingTran.setShowerTestingFlag(1);
		System.out.println("last!!");
		
		
		
		try
		{	
			System.out.println(furnishingAssetIdAsInt);
			DaoShowerTesting dao= new DaoShowerTesting();
			dao.saveTesting(showerTestingTransaction);
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



	public String getShowerTestingDocNo() {
		return showerTestingDocNo;
	}



	public void setShowerTestingDocNo(String showerTestingDocNo) {
		this.showerTestingDocNo = showerTestingDocNo;
	}



	public String getShowerTestingShift() {
		return showerTestingShift;
	}



	public void setShowerTestingShift(String showerTestingShift) {
		this.showerTestingShift = showerTestingShift;
	}



	public String getShowerTestingDate() {
		return showerTestingDate;
	}



	public void setShowerTestingDate(String showerTestingDate) {
		this.showerTestingDate = showerTestingDate;
	}






	public String getLeakageRoofArea() {
		return leakageRoofArea;
	}



	public void setLeakageRoofArea(String leakageRoofArea) {
		this.leakageRoofArea = leakageRoofArea;
	}



	public String getLeakagejointEndwallRoof() {
		return leakagejointEndwallRoof;
	}



	public void setLeakagejointEndwallRoof(String leakagejointEndwallRoof) {
		this.leakagejointEndwallRoof = leakagejointEndwallRoof;
	}



	public String getLeakageCantRailArea() {
		return leakageCantRailArea;
	}



	public void setLeakageCantRailArea(String leakageCantRailArea) {
		this.leakageCantRailArea = leakageCantRailArea;
	}



	public String getLeakageVentArea() {
		return leakageVentArea;
	}



	public void setLeakageVentArea(String leakageVentArea) {
		this.leakageVentArea = leakageVentArea;
	}



	public String getLeakageShutterDoor() {
		return leakageShutterDoor;
	}



	public void setLeakageShutterDoor(String leakageShutterDoor) {
		this.leakageShutterDoor = leakageShutterDoor;
	}



	public String getLeakageAcTrough() {
		return leakageAcTrough;
	}



	public void setLeakageAcTrough(String leakageAcTrough) {
		this.leakageAcTrough = leakageAcTrough;
	}



	public String getLeakageWindows() {
		return leakageWindows;
	}



	public void setLeakageWindows(String leakageWindows) {
		this.leakageWindows = leakageWindows;
	}



	public String getShowerTestingConfroming() {
		return showerTestingConfroming;
	}



	public void setShowerTestingConfroming(String showerTestingConfroming) {
		this.showerTestingConfroming = showerTestingConfroming;
	}



	public String getShowerTestingRemarks() {
		return showerTestingRemarks;
	}



	public void setShowerTestingRemarks(String showerTestingRemarks) {
		this.showerTestingRemarks = showerTestingRemarks;
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



	public String getShowerTestTimeCoach() {
		return showerTestTimeCoach;
	}



	public void setShowerTestTimeCoach(String showerTestTimeCoach) {
		this.showerTestTimeCoach = showerTestTimeCoach;
	}

	
}
