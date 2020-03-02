package struts.action.master;
import beans.PaintTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;
import dao.DaoIntrPaintSip;



import org.hibernate.Session;

import beans.IntrPaintFinalSipTran;
public class SaveIntrPaintSip {

private String	paintAssetId;
private String	intrPaintSipDocNo;
	
private String	intrPaintSipVersNo;                 							
private String	intrPaintSipDate;            							
private String	furnishingNoIntrSip;
private String	intrPaintSipSurfPrimer;
private String	intrPaintSipSurfPrimerDate;

private String	intrPaintSipAppEpoxyPrimer;
private String	intrPaintSipAppEpoxyPrimerDate;
	
private String	intrPaintSipAppSoundDrawing;
private String	intrPaintSipAppSoundDrawingDate;
	
private String	intrPaintSipAppHeatResistSideWall;
private String	intrPaintSipAppHeatResistSideWallDate;
	
private String	intrPaintSipAppHeatResistFloor;
private String	intrPaintSipAppHeatResistFloorDate;
	
private String	intrPaintSipAppAlumGrosWool;
private String	intrPaintSipAppAlumGrosWoolDate;
	
	
	public String saveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		//    HttpSession httpSession=ServletActionContext.getRequest().getSession();
		Integer paintAssetIdAsInt=Integer.parseInt(paintAssetId);
		// update paint_tran table
		PaintTransaction paintTransaction= (PaintTransaction) session.get(PaintTransaction.class, paintAssetIdAsInt);
		paintTransaction.setFurnishingNumber(furnishingNoIntrSip);
		paintTransaction.setIntrPaintSipFlag(1);
		//end of update paint_tran
		
		// insertion in IntrPaintFinalSipTran
		IntrPaintFinalSipTran intrPaintFinalSipTran=new IntrPaintFinalSipTran(); 
		intrPaintFinalSipTran.setPaintAssetId(paintAssetIdAsInt);
		
		
		intrPaintFinalSipTran.setIntrPaintSipDocNo(intrPaintSipDocNo);
		intrPaintFinalSipTran.setIntrPaintSipVersNo(intrPaintSipVersNo);
		if(!"".equals(intrPaintSipDate))
		{
			intrPaintFinalSipTran.setIntrPaintSipDate(DateUtil.convertToDate(intrPaintSipDate));
			
		}	
		
		intrPaintFinalSipTran.setIntrPaintSipSurfPrimer(intrPaintSipSurfPrimer);
		if (!"".equals(intrPaintSipSurfPrimerDate))
		{				
			intrPaintFinalSipTran.setIntrPaintSipSurfPrimerDate(DateUtil.convertToDate(intrPaintSipSurfPrimerDate));
			
		}
	
		
		intrPaintFinalSipTran.setIntrPaintSipAppEpoxyPrimer(intrPaintSipAppEpoxyPrimer);
		if (!"".equals(intrPaintSipAppEpoxyPrimerDate))
		{	
			intrPaintFinalSipTran.setIntrPaintSipAppEpoxyPrimerDate(DateUtil.convertToDate(intrPaintSipAppEpoxyPrimerDate));
		}
	
		intrPaintFinalSipTran.setIntrPaintSipAppSoundDrawing(intrPaintSipAppSoundDrawing);
		if (!"".equals(intrPaintSipAppSoundDrawingDate))
		{	
			intrPaintFinalSipTran.setIntrPaintSipAppSoundDrawingDate(DateUtil.convertToDate(intrPaintSipAppSoundDrawingDate));
		}
	
	
		intrPaintFinalSipTran.setIntrPaintSipAppHeatResistSideWall(intrPaintSipAppHeatResistSideWall);
		if (!"".equals(intrPaintSipAppHeatResistSideWallDate))
		{	
			intrPaintFinalSipTran.setIntrPaintSipAppHeatResistSideWallDate(DateUtil.convertToDate(intrPaintSipAppHeatResistSideWallDate));
		}
	
		intrPaintFinalSipTran.setIntrPaintSipAppHeatResistFloor(intrPaintSipAppHeatResistFloor);
		 if (!"".equals(intrPaintSipAppHeatResistFloorDate))
			{	
				intrPaintFinalSipTran.setIntrPaintSipAppHeatResistFloorDate(DateUtil.convertToDate(intrPaintSipAppHeatResistFloorDate));
			}
	
		intrPaintFinalSipTran.setIntrPaintSipAppAlumGrosWool(intrPaintSipAppAlumGrosWool);
		if (!"".equals(intrPaintSipAppAlumGrosWoolDate))
		{	
			intrPaintFinalSipTran.setIntrPaintSipAppAlumGrosWoolDate(DateUtil.convertToDate(intrPaintSipAppAlumGrosWoolDate));
		}
			

		// end of code
		// set value of existing data in IntrPaintFinalSipTran
		IntrPaintFinalSipTran ips=(IntrPaintFinalSipTran) session.get(IntrPaintFinalSipTran.class, paintAssetIdAsInt);
	
			if(ips!=null)
			{
				intrPaintFinalSipTran.setIntrPaintFinalDocNo(ips.getIntrPaintFinalDocNo());
				intrPaintFinalSipTran.setIntrPaintFinalVersNo(ips.getIntrPaintFinalVersNo());
				intrPaintFinalSipTran.setIntrPaintFinalDate(ips.getIntrPaintFinalDate());
				intrPaintFinalSipTran.setIntrPaintFinalGarnetBlastingFlag(ips.getIntrPaintFinalGarnetBlastingFlag());
				intrPaintFinalSipTran.setIntrPaintFinalDate(ips.getIntrPaintFinalDate());
				intrPaintFinalSipTran.setIntrPaintFinalGarnetBlastingReas(ips.getIntrPaintFinalGarnetBlastingReas());
				intrPaintFinalSipTran.setIntrPaintFinalEpoxyPhosphateFlag(ips.getIntrPaintFinalEpoxyPhosphateFlag());
				intrPaintFinalSipTran.setIntrPaintFinalEpoxyPhosphateReas(ips.getIntrPaintFinalEpoxyPhosphateReas());
				intrPaintFinalSipTran.setIntrPaintFinalSoundInsulDrawingFlag(ips.getIntrPaintFinalSoundInsulDrawingFlag());
				intrPaintFinalSipTran.setIntrPaintFinalSoundInsulDrawingReas(ips.getIntrPaintFinalSoundInsulDrawingReas());
				intrPaintFinalSipTran.setIntrPaintFinalClearFlag(ips.getIntrPaintFinalClearFlag());
				
				
				
				
			
			}
	
		//end of code
		try
		{
			DaoIntrPaintSip dao=new DaoIntrPaintSip();
			dao.saveData(intrPaintFinalSipTran, paintTransaction);
			System.out.println(paintAssetIdAsInt);
			System.out.println(intrPaintSipDocNo);
			System.out.println(intrPaintSipVersNo);
			System.out.println(intrPaintSipDate);
			System.out.println(furnishingNoIntrSip);
			System.out.println(intrPaintSipSurfPrimer);
			System.out.println(intrPaintSipSurfPrimerDate);
			System.out.println(intrPaintSipAppEpoxyPrimer);
			System.out.println(intrPaintSipAppEpoxyPrimerDate);
			System.out.println(intrPaintSipAppSoundDrawing);
			System.out.println(intrPaintSipAppSoundDrawingDate);
			return "success";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "error";
		}
	}


	public String getPaintAssetId() {
		return paintAssetId;
	}


	public void setPaintAssetId(String paintAssetId) {
		this.paintAssetId = paintAssetId;
	}


	public String getIntrPaintSipDocNo() {
		return intrPaintSipDocNo;
	}


	public void setIntrPaintSipDocNo(String intrPaintSipDocNo) {
		this.intrPaintSipDocNo = intrPaintSipDocNo;
	}


	public String getIntrPaintSipVersNo() {
		return intrPaintSipVersNo;
	}


	public void setIntrPaintSipVersNo(String intrPaintSipVersNo) {
		this.intrPaintSipVersNo = intrPaintSipVersNo;
	}


	public String getIntrPaintSipDate() {
		return intrPaintSipDate;
	}


	public void setIntrPaintSipDate(String intrPaintSipDate) {
		this.intrPaintSipDate = intrPaintSipDate;
	}


	public String getFurnishingNoIntrSip() {
		return furnishingNoIntrSip;
	}


	public void setFurnishingNoIntrSip(String furnishingNoIntrSip) {
		this.furnishingNoIntrSip = furnishingNoIntrSip;
	}


	public String getIntrPaintSipSurfPrimer() {
		return intrPaintSipSurfPrimer;
	}


	public void setIntrPaintSipSurfPrimer(String intrPaintSipSurfPrimer) {
		this.intrPaintSipSurfPrimer = intrPaintSipSurfPrimer;
	}


	public String getIntrPaintSipSurfPrimerDate() {
		return intrPaintSipSurfPrimerDate;
	}


	public void setIntrPaintSipSurfPrimerDate(String intrPaintSipSurfPrimerDate) {
		this.intrPaintSipSurfPrimerDate = intrPaintSipSurfPrimerDate;
	}


	public String getIntrPaintSipAppEpoxyPrimer() {
		return intrPaintSipAppEpoxyPrimer;
	}


	public void setIntrPaintSipAppEpoxyPrimer(String intrPaintSipAppEpoxyPrimer) {
		this.intrPaintSipAppEpoxyPrimer = intrPaintSipAppEpoxyPrimer;
	}


	public String getIntrPaintSipAppEpoxyPrimerDate() {
		return intrPaintSipAppEpoxyPrimerDate;
	}


	public void setIntrPaintSipAppEpoxyPrimerDate(String intrPaintSipAppEpoxyPrimerDate) {
		this.intrPaintSipAppEpoxyPrimerDate = intrPaintSipAppEpoxyPrimerDate;
	}


		public String getIntrPaintSipAppSoundDrawing() {
		return intrPaintSipAppSoundDrawing;
	}


	public void setIntrPaintSipAppSoundDrawing(String intrPaintSipAppSoundDrawing) {
		this.intrPaintSipAppSoundDrawing = intrPaintSipAppSoundDrawing;
	}


	public String getIntrPaintSipAppSoundDrawingDate() {
		return intrPaintSipAppSoundDrawingDate;
	}


	public void setIntrPaintSipAppSoundDrawingDate(String intrPaintSipAppSoundDrawingDate) {
		this.intrPaintSipAppSoundDrawingDate = intrPaintSipAppSoundDrawingDate;
	}


		public String getIntrPaintSipAppHeatResistSideWall() {
		return intrPaintSipAppHeatResistSideWall;
	}


	public void setIntrPaintSipAppHeatResistSideWall(String intrPaintSipAppHeatResistSideWall) {
		this.intrPaintSipAppHeatResistSideWall = intrPaintSipAppHeatResistSideWall;
	}


	public String getIntrPaintSipAppHeatResistSideWallDate() {
		return intrPaintSipAppHeatResistSideWallDate;
	}


	public void setIntrPaintSipAppHeatResistSideWallDate(String intrPaintSipAppHeatResistSideWallDate) {
		this.intrPaintSipAppHeatResistSideWallDate = intrPaintSipAppHeatResistSideWallDate;
	}


	public String getIntrPaintSipAppHeatResistFloor() {
		return intrPaintSipAppHeatResistFloor;
	}


	public void setIntrPaintSipAppHeatResistFloor(String intrPaintSipAppHeatResistFloor) {
		this.intrPaintSipAppHeatResistFloor = intrPaintSipAppHeatResistFloor;
	}


	public String getIntrPaintSipAppHeatResistFloorDate() {
		return intrPaintSipAppHeatResistFloorDate;
	}


	public void setIntrPaintSipAppHeatResistFloorDate(String intrPaintSipAppHeatResistFloorDate) {
		this.intrPaintSipAppHeatResistFloorDate = intrPaintSipAppHeatResistFloorDate;
	}


	public String getIntrPaintSipAppAlumGrosWool() {
		return intrPaintSipAppAlumGrosWool;
	}


	public void setIntrPaintSipAppAlumGrosWool(String intrPaintSipAppAlumGrosWool) {
		this.intrPaintSipAppAlumGrosWool = intrPaintSipAppAlumGrosWool;
	}


	public String getIntrPaintSipAppAlumGrosWoolDate() {
		return intrPaintSipAppAlumGrosWoolDate;
	}


	public void setIntrPaintSipAppAlumGrosWoolDate(String intrPaintSipAppAlumGrosWoolDate) {
		this.intrPaintSipAppAlumGrosWoolDate = intrPaintSipAppAlumGrosWoolDate;
	}
	
}
