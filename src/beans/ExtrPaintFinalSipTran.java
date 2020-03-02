package beans;
import java.util.Date;
public class ExtrPaintFinalSipTran implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Integer paintAssetId;
	private String extrPaintSipDocNo; 
	private String extrPaintSipVersNo; 
	private Date extrPaintSipDate;
	private String extrPaintSipStage1SurfPrep;
	private String extrPaintSipStage1SurfPrepMake;
	private Date extrPaintSipStage1SurfPrepDate;
	private String extrPaintSipStage1AppPrimer;
	private String extrPaintSipStage1AppPrimerMake;
	private Date extrPaintSipStage1AppPrimerDate;
	private String extrPaintSipStage2AppWall;
	private String extrPaintSipStage2AppWallMake;
	private Date extrPaintSipStage2AppWallDate;
	private String extrPaintSipStage2RubFiller;
	private String extrPaintSipStage2RubFillerMake;
	private Date extrPaintSipStage2RubFillerDate;
	private String extrPaintSipStage3AppRub;
	private String extrPaintSipStage3AppRubMake;
	private Date extrPaintSipStage3AppRubDate;
	private String extrPaintSipStage3AppSurf;
	private String extrPaintSipStage3AppSurfMake;
	private Date extrPaintSipStage3AppSurfDate;
	private String extrPaintSipStage3RubSurf;
	private String extrPaintSipStage3RubSurfMake;
	private Date extrPaintSipStage3RubSurfDate;
    private String extrPaintSipStage3AppCoat;
	private String extrPaintSipStage3AppCoatMake;
	private Date extrPaintSipStage3AppCoatDate;
	private Double extrPaintSipGrosValuSideWall;
	private Double extrPaintSipGrosValuEndWall;
    private String extrPaintFinalDocNo;
	private String extrPaintFinalVersNo;
	private Date extrPaintFinalDate;
	private String extrPaintFinalSurfDefectFreeFlag;
	private String extrPaintFinalDefectObservSideWallFlag;
	private String extrPaintFinalDefectObservEndWallFlag;
	private String extrPaintFinalDefectObservEndRoofFlag;
	private String extrPaintFinalFinishSurfFlag;
	private String extrPaintFinalAdhensionSurfFlag;
	private Double extrPaintFinalGrosValuSideWall;
	private Double extrPaintFinalGrosValuEndWall;
	private String extrPaintFinalClearFlag;

	
	public ExtrPaintFinalSipTran() {
		// TODO Auto-generated constructor stub
	}


	public ExtrPaintFinalSipTran(Integer paintAssetId, String extrPaintSipDocNo, String extrPaintSipVersNo,
			Date extrPaintSipDate, String extrPaintSipStage1SurfPrep, String extrPaintSipStage1SurfPrepMake,
			Date extrPaintSipStage1SurfPrepDate, String extrPaintSipStage1AppPrimer,
			String extrPaintSipStage1AppPrimerMake, Date extrPaintSipStage1AppPrimerDate,
			String extrPaintSipStage2AppWall, String extrPaintSipStage2AppWallMake, Date extrPaintSipStage2AppWallDate,
			String extrPaintSipStage2RubFiller, String extrPaintSipStage2RubFillerMake,
			Date extrPaintSipStage2RubFillerDate, String extrPaintSipStage3AppRub, String extrPaintSipStage3AppRubMake,
			Date extrPaintSipStage3AppRubDate, String extrPaintSipStage3AppSurf, String extrPaintSipStage3AppSurfMake,
			Date extrPaintSipStage3AppSurfDate, String extrPaintSipStage3RubSurf, String extrPaintSipStage3RubSurfMake,
			Date extrPaintSipStage3RubSurfDate, String extrPaintSipStage3AppCoat, String extrPaintSipStage3AppCoatMake,
			Date extrPaintSipStage3AppCoatDate, Double extrPaintSipGrosValuSideWall, Double extrPaintSipGrosValuEndWall,
			String extrPaintFinalDocNo, String extrPaintFinalVersNo, Date extrPaintFinalDate,
			String extrPaintFinalSurfDefectFreeFlag, String extrPaintFinalDefectObservSideWallFlag,
			String extrPaintFinalDefectObservEndWallFlag, String extrPaintFinalDefectObservEndRoofFlag,
			String extrPaintFinalFinishSurfFlag, String extrPaintFinalAdhensionSurfFlag,
			Double extrPaintFinalGrosValuSideWall, Double extrPaintFinalGrosValuEndWall,
			String extrPaintFinalClearFlag) {
		super();
		this.paintAssetId = paintAssetId;
		this.extrPaintSipDocNo = extrPaintSipDocNo;
		this.extrPaintSipVersNo = extrPaintSipVersNo;
		this.extrPaintSipDate = extrPaintSipDate;
		this.extrPaintSipStage1SurfPrep = extrPaintSipStage1SurfPrep;
		this.extrPaintSipStage1SurfPrepMake = extrPaintSipStage1SurfPrepMake;
		this.extrPaintSipStage1SurfPrepDate = extrPaintSipStage1SurfPrepDate;
		this.extrPaintSipStage1AppPrimer = extrPaintSipStage1AppPrimer;
		this.extrPaintSipStage1AppPrimerMake = extrPaintSipStage1AppPrimerMake;
		this.extrPaintSipStage1AppPrimerDate = extrPaintSipStage1AppPrimerDate;
		this.extrPaintSipStage2AppWall = extrPaintSipStage2AppWall;
		this.extrPaintSipStage2AppWallMake = extrPaintSipStage2AppWallMake;
		this.extrPaintSipStage2AppWallDate = extrPaintSipStage2AppWallDate;
		this.extrPaintSipStage2RubFiller = extrPaintSipStage2RubFiller;
		this.extrPaintSipStage2RubFillerMake = extrPaintSipStage2RubFillerMake;
		this.extrPaintSipStage2RubFillerDate = extrPaintSipStage2RubFillerDate;
		this.extrPaintSipStage3AppRub = extrPaintSipStage3AppRub;
		this.extrPaintSipStage3AppRubMake = extrPaintSipStage3AppRubMake;
		this.extrPaintSipStage3AppRubDate = extrPaintSipStage3AppRubDate;
		this.extrPaintSipStage3AppSurf = extrPaintSipStage3AppSurf;
		this.extrPaintSipStage3AppSurfMake = extrPaintSipStage3AppSurfMake;
		this.extrPaintSipStage3AppSurfDate = extrPaintSipStage3AppSurfDate;
		this.extrPaintSipStage3RubSurf = extrPaintSipStage3RubSurf;
		this.extrPaintSipStage3RubSurfMake = extrPaintSipStage3RubSurfMake;
		this.extrPaintSipStage3RubSurfDate = extrPaintSipStage3RubSurfDate;
		this.extrPaintSipStage3AppCoat = extrPaintSipStage3AppCoat;
		this.extrPaintSipStage3AppCoatMake = extrPaintSipStage3AppCoatMake;
		this.extrPaintSipStage3AppCoatDate = extrPaintSipStage3AppCoatDate;
		this.extrPaintSipGrosValuSideWall = extrPaintSipGrosValuSideWall;
		this.extrPaintSipGrosValuEndWall = extrPaintSipGrosValuEndWall;
		this.extrPaintFinalDocNo = extrPaintFinalDocNo;
		this.extrPaintFinalVersNo = extrPaintFinalVersNo;
		this.extrPaintFinalDate = extrPaintFinalDate;
		this.extrPaintFinalSurfDefectFreeFlag = extrPaintFinalSurfDefectFreeFlag;
		this.extrPaintFinalDefectObservSideWallFlag = extrPaintFinalDefectObservSideWallFlag;
		this.extrPaintFinalDefectObservEndWallFlag = extrPaintFinalDefectObservEndWallFlag;
		this.extrPaintFinalDefectObservEndRoofFlag = extrPaintFinalDefectObservEndRoofFlag;
		this.extrPaintFinalFinishSurfFlag = extrPaintFinalFinishSurfFlag;
		this.extrPaintFinalAdhensionSurfFlag = extrPaintFinalAdhensionSurfFlag;
		this.extrPaintFinalGrosValuSideWall = extrPaintFinalGrosValuSideWall;
		this.extrPaintFinalGrosValuEndWall = extrPaintFinalGrosValuEndWall;
		this.extrPaintFinalClearFlag = extrPaintFinalClearFlag;
	}


	public Integer getPaintAssetId() {
		return paintAssetId;
	}


	public void setPaintAssetId(Integer paintAssetId) {
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


	public Date getExtrPaintSipDate() {
		return extrPaintSipDate;
	}


	public void setExtrPaintSipDate(Date extrPaintSipDate) {
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


	public Date getExtrPaintSipStage1SurfPrepDate() {
		return extrPaintSipStage1SurfPrepDate;
	}


	public void setExtrPaintSipStage1SurfPrepDate(Date extrPaintSipStage1SurfPrepDate) {
		this.extrPaintSipStage1SurfPrepDate = extrPaintSipStage1SurfPrepDate;
	}


	public String getExtrPaintSipStage1AppPrimer() {
		return extrPaintSipStage1AppPrimer;
	}


	public void setExtrPaintSipStage1AppPrimer(String extrPaintSipStage1AppPrimer) {
		this.extrPaintSipStage1AppPrimer = extrPaintSipStage1AppPrimer;
	}


	public String getExtrPaintSipStage1AppPrimerMake() {
		return extrPaintSipStage1AppPrimerMake;
	}


	public void setExtrPaintSipStage1AppPrimerMake(String extrPaintSipStage1AppPrimerMake) {
		this.extrPaintSipStage1AppPrimerMake = extrPaintSipStage1AppPrimerMake;
	}


	public Date getExtrPaintSipStage1AppPrimerDate() {
		return extrPaintSipStage1AppPrimerDate;
	}


	public void setExtrPaintSipStage1AppPrimerDate(Date extrPaintSipStage1AppPrimerDate) {
		this.extrPaintSipStage1AppPrimerDate = extrPaintSipStage1AppPrimerDate;
	}


	public String getExtrPaintSipStage2AppWall() {
		return extrPaintSipStage2AppWall;
	}


	public void setExtrPaintSipStage2AppWall(String extrPaintSipStage2AppWall) {
		this.extrPaintSipStage2AppWall = extrPaintSipStage2AppWall;
	}


	public String getExtrPaintSipStage2AppWallMake() {
		return extrPaintSipStage2AppWallMake;
	}


	public void setExtrPaintSipStage2AppWallMake(String extrPaintSipStage2AppWallMake) {
		this.extrPaintSipStage2AppWallMake = extrPaintSipStage2AppWallMake;
	}


	public Date getExtrPaintSipStage2AppWallDate() {
		return extrPaintSipStage2AppWallDate;
	}


	public void setExtrPaintSipStage2AppWallDate(Date extrPaintSipStage2AppWallDate) {
		this.extrPaintSipStage2AppWallDate = extrPaintSipStage2AppWallDate;
	}


		public String getExtrPaintSipStage2RubFiller() {
		return extrPaintSipStage2RubFiller;
	}


	public void setExtrPaintSipStage2RubFiller(String extrPaintSipStage2RubFiller) {
		this.extrPaintSipStage2RubFiller = extrPaintSipStage2RubFiller;
	}


	public String getExtrPaintSipStage2RubFillerMake() {
		return extrPaintSipStage2RubFillerMake;
	}


	public void setExtrPaintSipStage2RubFillerMake(String extrPaintSipStage2RubFillerMake) {
		this.extrPaintSipStage2RubFillerMake = extrPaintSipStage2RubFillerMake;
	}


	public Date getExtrPaintSipStage2RubFillerDate() {
		return extrPaintSipStage2RubFillerDate;
	}


	public void setExtrPaintSipStage2RubFillerDate(Date extrPaintSipStage2RubFillerDate) {
		this.extrPaintSipStage2RubFillerDate = extrPaintSipStage2RubFillerDate;
	}


	public String getExtrPaintSipStage3AppRub() {
		return extrPaintSipStage3AppRub;
	}


	public void setExtrPaintSipStage3AppRub(String extrPaintSipStage3AppRub) {
		this.extrPaintSipStage3AppRub = extrPaintSipStage3AppRub;
	}


	public String getExtrPaintSipStage3AppRubMake() {
		return extrPaintSipStage3AppRubMake;
	}


	public void setExtrPaintSipStage3AppRubMake(String extrPaintSipStage3AppRubMake) {
		this.extrPaintSipStage3AppRubMake = extrPaintSipStage3AppRubMake;
	}


	public Date getExtrPaintSipStage3AppRubDate() {
		return extrPaintSipStage3AppRubDate;
	}


	public void setExtrPaintSipStage3AppRubDate(Date extrPaintSipStage3AppRubDate) {
		this.extrPaintSipStage3AppRubDate = extrPaintSipStage3AppRubDate;
	}


	public String getExtrPaintSipStage3AppSurf() {
		return extrPaintSipStage3AppSurf;
	}


	public void setExtrPaintSipStage3AppSurf(String extrPaintSipStage3AppSurf) {
		this.extrPaintSipStage3AppSurf = extrPaintSipStage3AppSurf;
	}


	public String getExtrPaintSipStage3AppSurfMake() {
		return extrPaintSipStage3AppSurfMake;
	}


	public void setExtrPaintSipStage3AppSurfMake(String extrPaintSipStage3AppSurfMake) {
		this.extrPaintSipStage3AppSurfMake = extrPaintSipStage3AppSurfMake;
	}


	public Date getExtrPaintSipStage3AppSurfDate() {
		return extrPaintSipStage3AppSurfDate;
	}


	public void setExtrPaintSipStage3AppSurfDate(Date extrPaintSipStage3AppSurfDate) {
		this.extrPaintSipStage3AppSurfDate = extrPaintSipStage3AppSurfDate;
	}


	public String getExtrPaintSipStage3RubSurf() {
		return extrPaintSipStage3RubSurf;
	}


	public void setExtrPaintSipStage3RubSurf(String extrPaintSipStage3RubSurf) {
		this.extrPaintSipStage3RubSurf = extrPaintSipStage3RubSurf;
	}


	public String getExtrPaintSipStage3RubSurfMake() {
		return extrPaintSipStage3RubSurfMake;
	}


	public void setExtrPaintSipStage3RubSurfMake(String extrPaintSipStage3RubSurfMake) {
		this.extrPaintSipStage3RubSurfMake = extrPaintSipStage3RubSurfMake;
	}


	public Date getExtrPaintSipStage3RubSurfDate() {
		return extrPaintSipStage3RubSurfDate;
	}


	public void setExtrPaintSipStage3RubSurfDate(Date extrPaintSipStage3RubSurfDate) {
		this.extrPaintSipStage3RubSurfDate = extrPaintSipStage3RubSurfDate;
	}


	public String getExtrPaintSipStage3AppCoat() {
		return extrPaintSipStage3AppCoat;
	}


	public void setExtrPaintSipStage3AppCoat(String extrPaintSipStage3AppCoat) {
		this.extrPaintSipStage3AppCoat = extrPaintSipStage3AppCoat;
	}


	public String getExtrPaintSipStage3AppCoatMake() {
		return extrPaintSipStage3AppCoatMake;
	}


	public void setExtrPaintSipStage3AppCoatMake(String extrPaintSipStage3AppCoatMake) {
		this.extrPaintSipStage3AppCoatMake = extrPaintSipStage3AppCoatMake;
	}


	public Date getExtrPaintSipStage3AppCoatDate() {
		return extrPaintSipStage3AppCoatDate;
	}


	public void setExtrPaintSipStage3AppCoatDate(Date extrPaintSipStage3AppCoatDate) {
		this.extrPaintSipStage3AppCoatDate = extrPaintSipStage3AppCoatDate;
	}


	public Double getExtrPaintSipGrosValuSideWall() {
		return extrPaintSipGrosValuSideWall;
	}


	public void setExtrPaintSipGrosValuSideWall(Double extrPaintSipGrosValuSideWall) {
		this.extrPaintSipGrosValuSideWall = extrPaintSipGrosValuSideWall;
	}


	public Double getExtrPaintSipGrosValuEndWall() {
		return extrPaintSipGrosValuEndWall;
	}


	public void setExtrPaintSipGrosValuEndWall(Double extrPaintSipGrosValuEndWall) {
		this.extrPaintSipGrosValuEndWall = extrPaintSipGrosValuEndWall;
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


	public Date getExtrPaintFinalDate() {
		return extrPaintFinalDate;
	}


	public void setExtrPaintFinalDate(Date extrPaintFinalDate) {
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


	public Double getExtrPaintFinalGrosValuSideWall() {
		return extrPaintFinalGrosValuSideWall;
	}


	public void setExtrPaintFinalGrosValuSideWall(Double extrPaintFinalGrosValuSideWall) {
		this.extrPaintFinalGrosValuSideWall = extrPaintFinalGrosValuSideWall;
	}


	public Double getExtrPaintFinalGrosValuEndWall() {
		return extrPaintFinalGrosValuEndWall;
	}


	public void setExtrPaintFinalGrosValuEndWall(Double extrPaintFinalGrosValuEndWall) {
		this.extrPaintFinalGrosValuEndWall = extrPaintFinalGrosValuEndWall;
	}


	public String getExtrPaintFinalClearFlag() {
		return extrPaintFinalClearFlag;
	}


	public void setExtrPaintFinalClearFlag(String extrPaintFinalClearFlag) {
		this.extrPaintFinalClearFlag = extrPaintFinalClearFlag;
	}


	
	
	
	
	
		
	
	

}
