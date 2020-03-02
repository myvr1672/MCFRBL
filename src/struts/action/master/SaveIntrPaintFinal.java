package struts.action.master;
import org.hibernate.Session;
import dao.DaoIntrPaintFinal;

import beans.IntrPaintFinalSipTran;
import beans.PaintTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveIntrPaintFinal {

	private String paintAssetId;
	private String intrPaintFinalDocNo;
	private String intrPaintFinalVersNo;
	private String furnishingNoIntrFinal;
	private String intrPaintFinalDate;
	private String intrPaintFinalGarnetBlastingFlag;
	private String intrPaintFinalGarnetBlastingReas;
	private String intrPaintFinalEpoxyPhosphateFlag;
	private String intrPaintFinalEpoxyPhosphateReas;
	private String intrPaintFinalSoundInsulDrawingFlag;
	private String intrPaintFinalSoundInsulDrawingReas;
	private String intrPaintFinalClearFlag;

	public String saveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer paintAssetIdAsInt=Integer.parseInt(paintAssetId);
		
		// update paint_tran table
		PaintTransaction paintTransaction= (PaintTransaction) session.get(PaintTransaction.class, paintAssetIdAsInt);
		paintTransaction.setFurnishingNumber(furnishingNoIntrFinal);
		paintTransaction.setIntrPaintFinalFlag(1);
		//end of update paint_tran
		
		// insertion in IntrPaintFinalSipTran
		IntrPaintFinalSipTran intrPaintFinalSipTran=new IntrPaintFinalSipTran();
		intrPaintFinalSipTran.setPaintAssetId(paintAssetIdAsInt);
		System.out.println("paintAssetIdAsInt"+paintAssetIdAsInt);
		
		intrPaintFinalSipTran.setIntrPaintFinalDocNo(intrPaintFinalDocNo);
		intrPaintFinalSipTran.setIntrPaintFinalVersNo(intrPaintFinalVersNo);
		if(!"".equals(intrPaintFinalDate))
		{
			intrPaintFinalSipTran.setIntrPaintFinalDate(DateUtil.convertToDate(intrPaintFinalDate));
			System.out.println("intr paint final date"+intrPaintFinalDate);
		}	
		intrPaintFinalSipTran.setIntrPaintFinalGarnetBlastingFlag(intrPaintFinalGarnetBlastingFlag);
		intrPaintFinalSipTran.setIntrPaintFinalGarnetBlastingReas(intrPaintFinalGarnetBlastingReas);
		intrPaintFinalSipTran.setIntrPaintFinalEpoxyPhosphateFlag(intrPaintFinalEpoxyPhosphateFlag);
		intrPaintFinalSipTran.setIntrPaintFinalEpoxyPhosphateReas(intrPaintFinalEpoxyPhosphateReas);
		intrPaintFinalSipTran.setIntrPaintFinalSoundInsulDrawingFlag(intrPaintFinalSoundInsulDrawingFlag);
		intrPaintFinalSipTran.setIntrPaintFinalSoundInsulDrawingReas(intrPaintFinalSoundInsulDrawingReas);
		intrPaintFinalSipTran.setIntrPaintFinalClearFlag(intrPaintFinalClearFlag);
		
		
		// end of code
		// set value of existing data in IntrPaintFinalSipTran
		IntrPaintFinalSipTran ips=(IntrPaintFinalSipTran) session.get(IntrPaintFinalSipTran.class, paintAssetIdAsInt);
	
			if(ips!=null)
			{
				intrPaintFinalSipTran.setIntrPaintSipDocNo(ips.getIntrPaintSipDocNo());
				intrPaintFinalSipTran.setIntrPaintSipVersNo(ips.getIntrPaintSipVersNo());
				intrPaintFinalSipTran.setIntrPaintSipDate(ips.getIntrPaintSipDate());
				intrPaintFinalSipTran.setIntrPaintSipSurfPrimer(ips.getIntrPaintSipSurfPrimer());
				intrPaintFinalSipTran.setIntrPaintSipSurfPrimerDate(ips.getIntrPaintSipSurfPrimerDate());
				intrPaintFinalSipTran.setIntrPaintSipAppEpoxyPrimer(ips.getIntrPaintSipAppEpoxyPrimer());
				intrPaintFinalSipTran.setIntrPaintSipAppEpoxyPrimerDate(ips.getIntrPaintSipAppEpoxyPrimerDate());
				intrPaintFinalSipTran.setIntrPaintSipAppSoundDrawing(ips.getIntrPaintSipAppSoundDrawing());
				intrPaintFinalSipTran.setIntrPaintSipAppSoundDrawingDate(ips.getIntrPaintSipAppSoundDrawingDate());
				intrPaintFinalSipTran.setIntrPaintSipAppHeatResistSideWall(ips.getIntrPaintSipAppHeatResistSideWall());
				intrPaintFinalSipTran.setIntrPaintSipAppHeatResistSideWallDate(ips.getIntrPaintSipAppHeatResistSideWallDate());
				intrPaintFinalSipTran.setIntrPaintSipAppHeatResistFloor(ips.getIntrPaintSipAppHeatResistFloor());
				intrPaintFinalSipTran.setIntrPaintSipAppHeatResistFloorDate(ips.getIntrPaintSipAppHeatResistFloorDate());
				intrPaintFinalSipTran.setIntrPaintSipAppAlumGrosWool(ips.getIntrPaintSipAppAlumGrosWool());
				intrPaintFinalSipTran.setIntrPaintSipAppAlumGrosWoolDate(ips.getIntrPaintSipAppAlumGrosWoolDate());
				
				
				
			
			}
	
		//end of code
			try
			{
				DaoIntrPaintFinal dao=new DaoIntrPaintFinal();
				dao.saveData(intrPaintFinalSipTran, paintTransaction);
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

	public String getIntrPaintFinalDocNo() {
		return intrPaintFinalDocNo;
	}

	public void setIntrPaintFinalDocNo(String intrPaintFinalDocNo) {
		this.intrPaintFinalDocNo = intrPaintFinalDocNo;
	}

	public String getIntrPaintFinalVersNo() {
		return intrPaintFinalVersNo;
	}

	public void setIntrPaintFinalVersNo(String intrPaintFinalVersNo) {
		this.intrPaintFinalVersNo = intrPaintFinalVersNo;
	}

	public String getFurnishingNoIntrFinal() {
		return furnishingNoIntrFinal;
	}

	public void setFurnishingNoIntrFinal(String furnishingNoIntrFinal) {
		this.furnishingNoIntrFinal = furnishingNoIntrFinal;
	}

	public String getIntrPaintFinalDate() {
		return intrPaintFinalDate;
	}

	public void setIntrPaintFinalDate(String intrPaintFinalDate) {
		this.intrPaintFinalDate = intrPaintFinalDate;
	}

	public String getIntrPaintFinalGarnetBlastingFlag() {
		return intrPaintFinalGarnetBlastingFlag;
	}

	public void setIntrPaintFinalGarnetBlastingFlag(String intrPaintFinalGarnetBlastingFlag) {
		this.intrPaintFinalGarnetBlastingFlag = intrPaintFinalGarnetBlastingFlag;
	}

	public String getIntrPaintFinalGarnetBlastingReas() {
		return intrPaintFinalGarnetBlastingReas;
	}

	public void setIntrPaintFinalGarnetBlastingReas(String intrPaintFinalGarnetBlastingReas) {
		this.intrPaintFinalGarnetBlastingReas = intrPaintFinalGarnetBlastingReas;
	}

	public String getIntrPaintFinalEpoxyPhosphateFlag() {
		return intrPaintFinalEpoxyPhosphateFlag;
	}

	public void setIntrPaintFinalEpoxyPhosphateFlag(String intrPaintFinalEpoxyPhosphateFlag) {
		this.intrPaintFinalEpoxyPhosphateFlag = intrPaintFinalEpoxyPhosphateFlag;
	}

	public String getIntrPaintFinalEpoxyPhosphateReas() {
		return intrPaintFinalEpoxyPhosphateReas;
	}

	public void setIntrPaintFinalEpoxyPhosphateReas(String intrPaintFinalEpoxyPhosphateReas) {
		this.intrPaintFinalEpoxyPhosphateReas = intrPaintFinalEpoxyPhosphateReas;
	}

	public String getIntrPaintFinalSoundInsulDrawingFlag() {
		return intrPaintFinalSoundInsulDrawingFlag;
	}

	public void setIntrPaintFinalSoundInsulDrawingFlag(String intrPaintFinalSoundInsulDrawingFlag) {
		this.intrPaintFinalSoundInsulDrawingFlag = intrPaintFinalSoundInsulDrawingFlag;
	}

	public String getIntrPaintFinalSoundInsulDrawingReas() {
		return intrPaintFinalSoundInsulDrawingReas;
	}

	public void setIntrPaintFinalSoundInsulDrawingReas(String intrPaintFinalSoundInsulDrawingReas) {
		this.intrPaintFinalSoundInsulDrawingReas = intrPaintFinalSoundInsulDrawingReas;
	}

	public String getIntrPaintFinalClearFlag() {
		return intrPaintFinalClearFlag;
	}

	public void setIntrPaintFinalClearFlag(String intrPaintFinalClearFlag) {
		this.intrPaintFinalClearFlag = intrPaintFinalClearFlag;
	}
	
		
}