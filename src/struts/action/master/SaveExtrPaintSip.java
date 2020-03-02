package struts.action.master;
import beans.PaintTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;
import dao.DaoExtrPaintSip;
import org.hibernate.Session;
import beans.ExtrPaintFinalSipTran;

public class SaveExtrPaintSip {

	private String paintAssetId;
	private String extrPaintSipDocNo;
	private String extrPaintSipVersNo;
	private String furnishingNoExtrSip;
	private String extrPaintSipDate;
	private String extrPaintSipStage1SurfPrep;
	private String extrPaintSipStage1SurfPrepMake;
	private String extrPaintSipStage1SurfPrepDate;
	private String extrPaintSipStage1AppPrimerMake;
	private String extrPaintSipStage1AppPrimer;
	private String extrPaintSipStage1AppPrimerDate;
	private String extrPaintSipStage2AppWallMake;
	private String extrPaintSipStage2AppWall;
	private String extrPaintSipStage2AppWallDate;
	private String extrPaintSipStage2RubFillerMake;
	private String extrPaintSipStage2RubFiller;
	private String extrPaintSipStage2RubFillerDate;
	private String extrPaintSipStage3AppRubMake;
	private String extrPaintSipStage3AppRub;
	private String extrPaintSipStage3AppRubDate;
	private String extrPaintSipStage3AppSurfMake;
	private String extrPaintSipStage3AppSurf;
	private String extrPaintSipStage3AppSurfDate;
	private String extrPaintSipStage3RubSurfMake;
	private String extrPaintSipStage3RubSurf;
	private String extrPaintSipStage3RubSurfDate;
	private String extrPaintSipStage3AppCoatMake;
	private String extrPaintSipStage3AppCoat;
	private String extrPaintSipStage3AppCoatDate;
	private String extrPaintSipGrosValuSideWall;
	private String extrPaintSipGrosValuEndWall;

	public String saveData1()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer paintAssetIdAsInt=Integer.parseInt(paintAssetId);
		// update paint_tran table
		PaintTransaction paintTransaction= (PaintTransaction) session.get(PaintTransaction.class, paintAssetIdAsInt);
		paintTransaction.setFurnishingNumber(furnishingNoExtrSip);
		paintTransaction.setExtrPaintSipFlag(1);
		//end of update paint_tran
		
		// insertion in ExtrPaintFinalSipTran
		ExtrPaintFinalSipTran extrPaintFinalSipTran=new ExtrPaintFinalSipTran();
		extrPaintFinalSipTran.setPaintAssetId(paintAssetIdAsInt);
		extrPaintFinalSipTran.setExtrPaintSipDocNo(extrPaintSipDocNo);
		extrPaintFinalSipTran.setExtrPaintSipVersNo(extrPaintSipVersNo);
		
		if(!"".equals(extrPaintSipDate))
		{
			extrPaintFinalSipTran.setExtrPaintSipDate(DateUtil.convertToDate(extrPaintSipDate));
		}	
		extrPaintFinalSipTran.setExtrPaintSipStage1SurfPrep(extrPaintSipStage1SurfPrep);
		extrPaintFinalSipTran.setExtrPaintSipStage1SurfPrepMake(extrPaintSipStage1SurfPrepMake);
		if (!"".equals(extrPaintSipStage1SurfPrepDate))
		{				
			extrPaintFinalSipTran.setExtrPaintSipStage1SurfPrepDate(DateUtil.convertToDate(extrPaintSipStage1SurfPrepDate));
		}
	
		extrPaintFinalSipTran.setExtrPaintSipStage1AppPrimerMake(extrPaintSipStage1AppPrimerMake);
		extrPaintFinalSipTran.setExtrPaintSipStage1AppPrimer(extrPaintSipStage1AppPrimer);
		if (!"".equals(extrPaintSipStage1AppPrimerDate))
		{	
			extrPaintFinalSipTran.setExtrPaintSipStage1AppPrimerDate(DateUtil.convertToDate(extrPaintSipStage1AppPrimerDate));
		}
		
		extrPaintFinalSipTran.setExtrPaintSipStage2AppWallMake(extrPaintSipStage2AppWallMake);
		extrPaintFinalSipTran.setExtrPaintSipStage2AppWall(extrPaintSipStage2AppWall);
		if (!"".equals(extrPaintSipStage2AppWallDate))
		{	
			extrPaintFinalSipTran.setExtrPaintSipStage2AppWallDate(DateUtil.convertToDate(extrPaintSipStage2AppWallDate));
		}
		
		extrPaintFinalSipTran.setExtrPaintSipStage2RubFillerMake(extrPaintSipStage2RubFillerMake);
		extrPaintFinalSipTran.setExtrPaintSipStage2RubFiller(extrPaintSipStage2RubFiller);
		if (!"".equals(extrPaintSipStage2RubFillerDate))
		{	
			extrPaintFinalSipTran.setExtrPaintSipStage2RubFillerDate(DateUtil.convertToDate(extrPaintSipStage2RubFillerDate));
		}
		
		extrPaintFinalSipTran.setExtrPaintSipStage3AppRubMake(extrPaintSipStage3AppRubMake);
		extrPaintFinalSipTran.setExtrPaintSipStage3AppRub(extrPaintSipStage3AppRub);
		if (!"".equals(extrPaintSipStage3AppRubDate))
		{	
			extrPaintFinalSipTran.setExtrPaintSipStage3AppRubDate(DateUtil.convertToDate(extrPaintSipStage3AppRubDate));
		}
		
		extrPaintFinalSipTran.setExtrPaintSipStage3AppSurfMake(extrPaintSipStage3AppSurfMake);
		extrPaintFinalSipTran.setExtrPaintSipStage3AppSurf(extrPaintSipStage3AppSurf);
		if (!"".equals(extrPaintSipStage3AppSurfDate))
		{	
			extrPaintFinalSipTran.setExtrPaintSipStage3AppSurfDate(DateUtil.convertToDate(extrPaintSipStage3AppSurfDate));
		}
		
		extrPaintFinalSipTran.setExtrPaintSipStage3RubSurfMake(extrPaintSipStage3RubSurfMake);
		extrPaintFinalSipTran.setExtrPaintSipStage3RubSurf(extrPaintSipStage3RubSurf);
		if (!"".equals(extrPaintSipStage3RubSurfDate))
		{	
			extrPaintFinalSipTran.setExtrPaintSipStage3RubSurfDate(DateUtil.convertToDate(extrPaintSipStage3RubSurfDate));
		}
		
		extrPaintFinalSipTran.setExtrPaintSipStage3AppCoatMake(extrPaintSipStage3AppCoatMake);
		extrPaintFinalSipTran.setExtrPaintSipStage3AppCoat(extrPaintSipStage3AppCoat);
		if (!"".equals(extrPaintSipStage3AppCoatDate))
		{	
			extrPaintFinalSipTran.setExtrPaintSipStage3AppCoatDate(DateUtil.convertToDate(extrPaintSipStage3AppCoatDate));
		}
		
		if (!"".equals(extrPaintSipGrosValuSideWall))
		{	
			double extrPaintSipGrosValuSideWallAsDouble = Double.parseDouble(extrPaintSipGrosValuSideWall);
			extrPaintFinalSipTran.setExtrPaintSipGrosValuSideWall(extrPaintSipGrosValuSideWallAsDouble);
		}
		
		if (!"".equals(extrPaintSipGrosValuEndWall))
		{	
			double extrPaintSipGrosValuEndWallAsDouble = Double.parseDouble(extrPaintSipGrosValuEndWall);
			extrPaintFinalSipTran.setExtrPaintSipGrosValuEndWall(extrPaintSipGrosValuEndWallAsDouble);
		}
		
					

		// end of code
		// set value of existing data in IntrPaintFinalSipTran
		ExtrPaintFinalSipTran ips=(ExtrPaintFinalSipTran) session.get(ExtrPaintFinalSipTran.class, paintAssetIdAsInt);
	
			if(ips!=null)
			{
				
				
				extrPaintFinalSipTran.setExtrPaintFinalDocNo(ips.getExtrPaintFinalDocNo());
				extrPaintFinalSipTran.setExtrPaintFinalVersNo(ips.getExtrPaintFinalVersNo());
				extrPaintFinalSipTran.setExtrPaintFinalDate(ips.getExtrPaintFinalDate());
				extrPaintFinalSipTran.setExtrPaintFinalSurfDefectFreeFlag(ips.getExtrPaintFinalSurfDefectFreeFlag());
				extrPaintFinalSipTran.setExtrPaintFinalDefectObservSideWallFlag(ips.getExtrPaintFinalDefectObservSideWallFlag());
				extrPaintFinalSipTran.setExtrPaintFinalDefectObservEndWallFlag(ips.getExtrPaintFinalDefectObservEndWallFlag());
				extrPaintFinalSipTran.setExtrPaintFinalDefectObservEndRoofFlag(ips.getExtrPaintFinalDefectObservEndRoofFlag());
				extrPaintFinalSipTran.setExtrPaintFinalFinishSurfFlag(ips.getExtrPaintFinalFinishSurfFlag());
				extrPaintFinalSipTran.setExtrPaintFinalAdhensionSurfFlag(ips.getExtrPaintFinalAdhensionSurfFlag());
				extrPaintFinalSipTran.setExtrPaintFinalGrosValuSideWall(ips.getExtrPaintFinalGrosValuSideWall());
				extrPaintFinalSipTran.setExtrPaintFinalGrosValuEndWall(ips.getExtrPaintFinalGrosValuEndWall());
				extrPaintFinalSipTran.setExtrPaintFinalClearFlag(ips.getExtrPaintFinalClearFlag());
															
			
			}
	
		//end of code
			
			try
			{
				DaoExtrPaintSip dao=new DaoExtrPaintSip();
				dao.saveData1(extrPaintFinalSipTran, paintTransaction);
				System.out.println("After");
				System.out.println(paintAssetIdAsInt);
				System.out.println(extrPaintSipDocNo);
				System.out.println(extrPaintSipVersNo);
				System.out.println(extrPaintSipDate);
				System.out.println(furnishingNoExtrSip);
				System.out.println(extrPaintSipStage1SurfPrep);
				System.out.println(extrPaintSipStage1SurfPrepMake);
				System.out.println(extrPaintSipStage2RubFillerDate);
				
				
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

	public String getExtrPaintSipDocNo() {
		return extrPaintSipDocNo;
	}

	public void setExtrPaintSipDocNo(String extrPaintSipDocNo) {
		this.extrPaintSipDocNo = extrPaintSipDocNo;
	}

	public String getExtrPaintSipVersNo() {
		return extrPaintSipVersNo;
	}

	public void setExtrPaintSipVersNo(String extrPaintSipVersNo) {
		this.extrPaintSipVersNo = extrPaintSipVersNo;
	}

	public String getFurnishingNoExtrSip() {
		return furnishingNoExtrSip;
	}

	public void setFurnishingNoExtrSip(String furnishingNoExtrSip) {
		this.furnishingNoExtrSip = furnishingNoExtrSip;
	}

	public String getExtrPaintSipDate() {
		return extrPaintSipDate;
	}

	public void setExtrPaintSipDate(String extrPaintSipDate) {
		this.extrPaintSipDate = extrPaintSipDate;
	}

	public String getExtrPaintSipStage1SurfPrep() {
		return extrPaintSipStage1SurfPrep;
	}

	public void setExtrPaintSipStage1SurfPrep(String extrPaintSipStage1SurfPrep) {
		this.extrPaintSipStage1SurfPrep = extrPaintSipStage1SurfPrep;
	}

	public String getExtrPaintSipStage1SurfPrepMake() {
		return extrPaintSipStage1SurfPrepMake;
	}

	public void setExtrPaintSipStage1SurfPrepMake(String extrPaintSipStage1SurfPrepMake) {
		this.extrPaintSipStage1SurfPrepMake = extrPaintSipStage1SurfPrepMake;
	}

	public String getExtrPaintSipStage1SurfPrepDate() {
		return extrPaintSipStage1SurfPrepDate;
	}

	public void setExtrPaintSipStage1SurfPrepDate(String extrPaintSipStage1SurfPrepDate) {
		this.extrPaintSipStage1SurfPrepDate = extrPaintSipStage1SurfPrepDate;
	}

	public String getExtrPaintSipStage1AppPrimerMake() {
		return extrPaintSipStage1AppPrimerMake;
	}

	public void setExtrPaintSipStage1AppPrimerMake(String extrPaintSipStage1AppPrimerMake) {
		this.extrPaintSipStage1AppPrimerMake = extrPaintSipStage1AppPrimerMake;
	}

	public String getExtrPaintSipStage1AppPrimer() {
		return extrPaintSipStage1AppPrimer;
	}

	public void setExtrPaintSipStage1AppPrimer(String extrPaintSipStage1AppPrimer) {
		this.extrPaintSipStage1AppPrimer = extrPaintSipStage1AppPrimer;
	}

	public String getExtrPaintSipStage1AppPrimerDate() {
		return extrPaintSipStage1AppPrimerDate;
	}

	public void setExtrPaintSipStage1AppPrimerDate(String extrPaintSipStage1AppPrimerDate) {
		this.extrPaintSipStage1AppPrimerDate = extrPaintSipStage1AppPrimerDate;
	}

	public String getExtrPaintSipStage2AppWallMake() {
		return extrPaintSipStage2AppWallMake;
	}

	public void setExtrPaintSipStage2AppWallMake(String extrPaintSipStage2AppWallMake) {
		this.extrPaintSipStage2AppWallMake = extrPaintSipStage2AppWallMake;
	}

	public String getExtrPaintSipStage2AppWall() {
		return extrPaintSipStage2AppWall;
	}

	public void setExtrPaintSipStage2AppWall(String extrPaintSipStage2AppWall) {
		this.extrPaintSipStage2AppWall = extrPaintSipStage2AppWall;
	}

	public String getExtrPaintSipStage2AppWallDate() {
		return extrPaintSipStage2AppWallDate;
	}

	public void setExtrPaintSipStage2AppWallDate(String extrPaintSipStage2AppWallDate) {
		this.extrPaintSipStage2AppWallDate = extrPaintSipStage2AppWallDate;
	}

	public String getExtrPaintSipStage2RubFillerMake() {
		return extrPaintSipStage2RubFillerMake;
	}

	public void setExtrPaintSipStage2RubFillerMake(String extrPaintSipStage2RubFillerMake) {
		this.extrPaintSipStage2RubFillerMake = extrPaintSipStage2RubFillerMake;
	}

	public String getExtrPaintSipStage2RubFiller() {
		return extrPaintSipStage2RubFiller;
	}

	public void setExtrPaintSipStage2RubFiller(String extrPaintSipStage2RubFiller) {
		this.extrPaintSipStage2RubFiller = extrPaintSipStage2RubFiller;
	}

	public String getExtrPaintSipStage2RubFillerDate() {
		return extrPaintSipStage2RubFillerDate;
	}

	public void setExtrPaintSipStage2RubFillerDate(String extrPaintSipStage2RubFillerDate) {
		this.extrPaintSipStage2RubFillerDate = extrPaintSipStage2RubFillerDate;
	}

	public String getExtrPaintSipStage3AppRubMake() {
		return extrPaintSipStage3AppRubMake;
	}

	public void setExtrPaintSipStage3AppRubMake(String extrPaintSipStage3AppRubMake) {
		this.extrPaintSipStage3AppRubMake = extrPaintSipStage3AppRubMake;
	}

	public String getExtrPaintSipStage3AppRub() {
		return extrPaintSipStage3AppRub;
	}

	public void setExtrPaintSipStage3AppRub(String extrPaintSipStage3AppRub) {
		this.extrPaintSipStage3AppRub = extrPaintSipStage3AppRub;
	}

	public String getExtrPaintSipStage3AppRubDate() {
		return extrPaintSipStage3AppRubDate;
	}

	public void setExtrPaintSipStage3AppRubDate(String extrPaintSipStage3AppRubDate) {
		this.extrPaintSipStage3AppRubDate = extrPaintSipStage3AppRubDate;
	}

	public String getExtrPaintSipStage3AppSurfMake() {
		return extrPaintSipStage3AppSurfMake;
	}

	public void setExtrPaintSipStage3AppSurfMake(String extrPaintSipStage3AppSurfMake) {
		this.extrPaintSipStage3AppSurfMake = extrPaintSipStage3AppSurfMake;
	}

	public String getExtrPaintSipStage3AppSurf() {
		return extrPaintSipStage3AppSurf;
	}

	public void setExtrPaintSipStage3AppSurf(String extrPaintSipStage3AppSurf) {
		this.extrPaintSipStage3AppSurf = extrPaintSipStage3AppSurf;
	}

	public String getExtrPaintSipStage3AppSurfDate() {
		return extrPaintSipStage3AppSurfDate;
	}

	public void setExtrPaintSipStage3AppSurfDate(String extrPaintSipStage3AppSurfDate) {
		this.extrPaintSipStage3AppSurfDate = extrPaintSipStage3AppSurfDate;
	}

	public String getExtrPaintSipStage3RubSurfMake() {
		return extrPaintSipStage3RubSurfMake;
	}

	public void setExtrPaintSipStage3RubSurfMake(String extrPaintSipStage3RubSurfMake) {
		this.extrPaintSipStage3RubSurfMake = extrPaintSipStage3RubSurfMake;
	}

	public String getExtrPaintSipStage3RubSurf() {
		return extrPaintSipStage3RubSurf;
	}

	public void setExtrPaintSipStage3RubSurf(String extrPaintSipStage3RubSurf) {
		this.extrPaintSipStage3RubSurf = extrPaintSipStage3RubSurf;
	}

	public String getExtrPaintSipStage3RubSurfDate() {
		return extrPaintSipStage3RubSurfDate;
	}

	public void setExtrPaintSipStage3RubSurfDate(String extrPaintSipStage3RubSurfDate) {
		this.extrPaintSipStage3RubSurfDate = extrPaintSipStage3RubSurfDate;
	}

	public String getExtrPaintSipStage3AppCoatMake() {
		return extrPaintSipStage3AppCoatMake;
	}

	public void setExtrPaintSipStage3AppCoatMake(String extrPaintSipStage3AppCoatMake) {
		this.extrPaintSipStage3AppCoatMake = extrPaintSipStage3AppCoatMake;
	}

	public String getExtrPaintSipStage3AppCoat() {
		return extrPaintSipStage3AppCoat;
	}

	public void setExtrPaintSipStage3AppCoat(String extrPaintSipStage3AppCoat) {
		this.extrPaintSipStage3AppCoat = extrPaintSipStage3AppCoat;
	}

	public String getExtrPaintSipStage3AppCoatDate() {
		return extrPaintSipStage3AppCoatDate;
	}

	public void setExtrPaintSipStage3AppCoatDate(String extrPaintSipStage3AppCoatDate) {
		this.extrPaintSipStage3AppCoatDate = extrPaintSipStage3AppCoatDate;
	}

	public String getExtrPaintSipGrosValuSideWall() {
		return extrPaintSipGrosValuSideWall;
	}

	public void setExtrPaintSipGrosValuSideWall(String extrPaintSipGrosValuSideWall) {
		this.extrPaintSipGrosValuSideWall = extrPaintSipGrosValuSideWall;
	}

	public String getExtrPaintSipGrosValuEndWall() {
		return extrPaintSipGrosValuEndWall;
	}

	public void setExtrPaintSipGrosValuEndWall(String extrPaintSipGrosValuEndWall) {
		this.extrPaintSipGrosValuEndWall = extrPaintSipGrosValuEndWall;
	}
	
	
	
}