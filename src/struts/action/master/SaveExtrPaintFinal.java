package struts.action.master;

import org.hibernate.Session;

import beans.ExtrPaintFinalSipTran;
import beans.PaintTransaction;
import common.DateUtil;
import dao.DaoExtrPaintFinal;
import hibernateConnect.HibernateConfig;

public class SaveExtrPaintFinal {

	private String paintAssetId;
	private String extrPaintFinalDocNo;
	private String extrPaintFinalVersNo;
	private String furnishingNoExtrFinal;
	private String extrPaintFinalDate;
	private String extrPaintFinalSurfDefectFreeFlag;
	private String extrPaintFinalDefectObservSideWallFlag;
	private String extrPaintFinalDefectObservEndWallFlag;
	private String extrPaintFinalDefectObservEndRoofFlag;
	private String extrPaintFinalFinishSurfFlag;
	private String extrPaintFinalAdhensionSurfFlag;
	private String extrPaintFinalGrosValuSideWall;
	private String extrPaintFinalGrosValuEndWall;
	private String extrPaintFinalClearFlag;

	
	
	public String saveData1()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer paintAssetIdAsInt=Integer.parseInt(paintAssetId);
		// update paint_tran table
		PaintTransaction paintTransaction= (PaintTransaction) session.get(PaintTransaction.class, paintAssetIdAsInt);
		paintTransaction.setFurnishingNumber(furnishingNoExtrFinal);
		paintTransaction.setExtrPaintFinalFlag(1);
		//end of update paint_tran
		
		// insertion in ExtrPaintFinalSipTran
		ExtrPaintFinalSipTran extrPaintFinalSipTran=new ExtrPaintFinalSipTran();
		extrPaintFinalSipTran.setPaintAssetId(paintAssetIdAsInt);
		extrPaintFinalSipTran.setExtrPaintFinalDocNo(extrPaintFinalDocNo);
		extrPaintFinalSipTran.setExtrPaintFinalVersNo(extrPaintFinalVersNo);
		
		if(!"".equals(extrPaintFinalDate))
		{
			extrPaintFinalSipTran.setExtrPaintFinalDate(DateUtil.convertToDate(extrPaintFinalDate));
		}	
		extrPaintFinalSipTran.setExtrPaintFinalSurfDefectFreeFlag(extrPaintFinalSurfDefectFreeFlag);
		extrPaintFinalSipTran.setExtrPaintFinalDefectObservSideWallFlag(extrPaintFinalDefectObservSideWallFlag);
		extrPaintFinalSipTran.setExtrPaintFinalDefectObservEndWallFlag(extrPaintFinalDefectObservEndWallFlag);
		extrPaintFinalSipTran.setExtrPaintFinalDefectObservEndRoofFlag(extrPaintFinalDefectObservEndRoofFlag);
		extrPaintFinalSipTran.setExtrPaintFinalFinishSurfFlag(extrPaintFinalFinishSurfFlag);
		extrPaintFinalSipTran.setExtrPaintFinalAdhensionSurfFlag(extrPaintFinalAdhensionSurfFlag);
		if (!"".equals(extrPaintFinalGrosValuSideWall))
		{	
			double extrPaintFinalGrosValuSideWallAsDouble = Double.parseDouble(extrPaintFinalGrosValuSideWall);
			extrPaintFinalSipTran.setExtrPaintFinalGrosValuSideWall(extrPaintFinalGrosValuSideWallAsDouble);
		}
		
		if (!"".equals(extrPaintFinalGrosValuEndWall))
		{	
			double extrPaintFinalGrosValuEndWallAsDouble = Double.parseDouble(extrPaintFinalGrosValuEndWall);
			extrPaintFinalSipTran.setExtrPaintFinalGrosValuEndWall(extrPaintFinalGrosValuEndWallAsDouble);
		}
		
		extrPaintFinalSipTran.setExtrPaintFinalClearFlag(extrPaintFinalClearFlag);

					

		// end of code
		// set value of existing data in IntrPaintFinalSipTran
		ExtrPaintFinalSipTran ips=(ExtrPaintFinalSipTran) session.get(ExtrPaintFinalSipTran.class, paintAssetIdAsInt);
	
			if(ips!=null)
			{
				
				
				extrPaintFinalSipTran.setExtrPaintSipDocNo(ips.getExtrPaintSipDocNo());
				extrPaintFinalSipTran.setExtrPaintSipVersNo(ips.getExtrPaintSipVersNo());
				extrPaintFinalSipTran.setExtrPaintSipDate(ips.getExtrPaintSipDate());
				extrPaintFinalSipTran.setExtrPaintSipStage1SurfPrep(ips.getExtrPaintSipStage1SurfPrep());
				extrPaintFinalSipTran.setExtrPaintSipStage1SurfPrepMake(ips.getExtrPaintSipStage1SurfPrepMake());
				extrPaintFinalSipTran.setExtrPaintSipStage1SurfPrepDate(ips.getExtrPaintSipStage1SurfPrepDate());
				extrPaintFinalSipTran.setExtrPaintSipStage1AppPrimer(ips.getExtrPaintSipStage1AppPrimer());
				extrPaintFinalSipTran.setExtrPaintSipStage1AppPrimerMake(ips.getExtrPaintSipStage1AppPrimerMake());
				extrPaintFinalSipTran.setExtrPaintSipStage1AppPrimerDate(ips.getExtrPaintSipStage1AppPrimerDate());
				extrPaintFinalSipTran.setExtrPaintSipStage2AppWall(ips.getExtrPaintSipStage2AppWall());
				extrPaintFinalSipTran.setExtrPaintSipStage2AppWallMake(ips.getExtrPaintSipStage2AppWallMake());
				extrPaintFinalSipTran.setExtrPaintSipStage2AppWallDate(ips.getExtrPaintSipStage2AppWallDate());
				extrPaintFinalSipTran.setExtrPaintSipStage2RubFiller(ips.getExtrPaintSipStage2RubFiller());
				extrPaintFinalSipTran.setExtrPaintSipStage2RubFillerMake(ips.getExtrPaintSipStage2RubFillerMake());
				extrPaintFinalSipTran.setExtrPaintSipStage2RubFillerDate(ips.getExtrPaintSipStage2RubFillerDate());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppRub(ips.getExtrPaintSipStage3AppRub());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppRubMake(ips.getExtrPaintSipStage3AppRubMake());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppRubDate(ips.getExtrPaintSipStage3AppRubDate());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppSurf(ips.getExtrPaintSipStage3AppSurf());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppSurfMake(ips.getExtrPaintSipStage3AppSurfMake());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppSurfDate(ips.getExtrPaintSipStage3AppSurfDate());
				extrPaintFinalSipTran.setExtrPaintSipStage3RubSurf(ips.getExtrPaintSipStage3RubSurf());
				extrPaintFinalSipTran.setExtrPaintSipStage3RubSurfMake(ips.getExtrPaintSipStage3RubSurfMake());
				extrPaintFinalSipTran.setExtrPaintSipStage3RubSurfDate(ips.getExtrPaintSipStage3RubSurfDate());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppCoat(ips.getExtrPaintSipStage3AppCoat());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppCoatMake(ips.getExtrPaintSipStage3AppCoatMake());
				extrPaintFinalSipTran.setExtrPaintSipStage3AppCoatDate(ips.getExtrPaintSipStage3AppCoatDate());
				extrPaintFinalSipTran.setExtrPaintSipGrosValuSideWall(ips.getExtrPaintSipGrosValuSideWall());
				extrPaintFinalSipTran.setExtrPaintSipGrosValuEndWall(ips.getExtrPaintSipGrosValuEndWall());
				
				
															
			
			}
	
		//end of code
			
			try
			{
				DaoExtrPaintFinal dao=new DaoExtrPaintFinal();
				dao.saveData1(extrPaintFinalSipTran, paintTransaction);
				System.out.println("After");
				System.out.println(paintAssetIdAsInt);
				System.out.println(extrPaintFinalDocNo);
				System.out.println(extrPaintFinalVersNo);
				System.out.println(extrPaintFinalDate);
				System.out.println(furnishingNoExtrFinal);
				System.out.println(extrPaintFinalSurfDefectFreeFlag);
				
				
				
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



	public String getExtrPaintFinalDocNo() {
		return extrPaintFinalDocNo;
	}



	public void setExtrPaintFinalDocNo(String extrPaintFinalDocNo) {
		this.extrPaintFinalDocNo = extrPaintFinalDocNo;
	}



	public String getExtrPaintFinalVersNo() {
		return extrPaintFinalVersNo;
	}



	public void setExtrPaintFinalVersNo(String extrPaintFinalVersNo) {
		this.extrPaintFinalVersNo = extrPaintFinalVersNo;
	}



	public String getFurnishingNoExtrFinal() {
		return furnishingNoExtrFinal;
	}



	public void setFurnishingNoExtrFinal(String furnishingNoExtrFinal) {
		this.furnishingNoExtrFinal = furnishingNoExtrFinal;
	}



	public String getExtrPaintFinalDate() {
		return extrPaintFinalDate;
	}



	public void setExtrPaintFinalDate(String extrPaintFinalDate) {
		this.extrPaintFinalDate = extrPaintFinalDate;
	}



	public String getExtrPaintFinalSurfDefectFreeFlag() {
		return extrPaintFinalSurfDefectFreeFlag;
	}



	public void setExtrPaintFinalSurfDefectFreeFlag(String extrPaintFinalSurfDefectFreeFlag) {
		this.extrPaintFinalSurfDefectFreeFlag = extrPaintFinalSurfDefectFreeFlag;
	}



	public String getExtrPaintFinalDefectObservSideWallFlag() {
		return extrPaintFinalDefectObservSideWallFlag;
	}



	public void setExtrPaintFinalDefectObservSideWallFlag(String extrPaintFinalDefectObservSideWallFlag) {
		this.extrPaintFinalDefectObservSideWallFlag = extrPaintFinalDefectObservSideWallFlag;
	}



	public String getExtrPaintFinalDefectObservEndWallFlag() {
		return extrPaintFinalDefectObservEndWallFlag;
	}



	public void setExtrPaintFinalDefectObservEndWallFlag(String extrPaintFinalDefectObservEndWallFlag) {
		this.extrPaintFinalDefectObservEndWallFlag = extrPaintFinalDefectObservEndWallFlag;
	}



	public String getExtrPaintFinalDefectObservEndRoofFlag() {
		return extrPaintFinalDefectObservEndRoofFlag;
	}



	public void setExtrPaintFinalDefectObservEndRoofFlag(String extrPaintFinalDefectObservEndRoofFlag) {
		this.extrPaintFinalDefectObservEndRoofFlag = extrPaintFinalDefectObservEndRoofFlag;
	}



	public String getExtrPaintFinalFinishSurfFlag() {
		return extrPaintFinalFinishSurfFlag;
	}



	public void setExtrPaintFinalFinishSurfFlag(String extrPaintFinalFinishSurfFlag) {
		this.extrPaintFinalFinishSurfFlag = extrPaintFinalFinishSurfFlag;
	}



	public String getExtrPaintFinalAdhensionSurfFlag() {
		return extrPaintFinalAdhensionSurfFlag;
	}



	public void setExtrPaintFinalAdhensionSurfFlag(String extrPaintFinalAdhensionSurfFlag) {
		this.extrPaintFinalAdhensionSurfFlag = extrPaintFinalAdhensionSurfFlag;
	}



	public String getExtrPaintFinalGrosValuSideWall() {
		return extrPaintFinalGrosValuSideWall;
	}



	public void setExtrPaintFinalGrosValuSideWall(String extrPaintFinalGrosValuSideWall) {
		this.extrPaintFinalGrosValuSideWall = extrPaintFinalGrosValuSideWall;
	}



	public String getExtrPaintFinalGrosValuEndWall() {
		return extrPaintFinalGrosValuEndWall;
	}



	public void setExtrPaintFinalGrosValuEndWall(String extrPaintFinalGrosValuEndWall) {
		this.extrPaintFinalGrosValuEndWall = extrPaintFinalGrosValuEndWall;
	}



	public String getExtrPaintFinalClearFlag() {
		return extrPaintFinalClearFlag;
	}



	public void setExtrPaintFinalClearFlag(String extrPaintFinalClearFlag) {
		this.extrPaintFinalClearFlag = extrPaintFinalClearFlag;
	}


	
	
}
