package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.FurnishingTransaction;
import beans.PaintTransaction;

import dao.DaoFurnishingProduction;
import dao.DaoPaintProduction;

import hibernateConnect.HibernateConfig;
import model.SubStagesMaster;

public class ExitPaintAction {

private Integer paintAssetId;
	
	private String assemblyEndDate;
	private String exitDate;

	private String exitRemarks;
	private String lateReason;
	private String receiptDate;
    private String stageId; 
    private Integer shellAssetId;
    private String shellType;
	private String furnishingNumber;
	private String coachType;
    public String assignexitDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
PaintTransaction	paintTransaction= new	PaintTransaction();

//First row entry

Criteria cr = session.createCriteria(PaintTransaction.class);
cr.add(Restrictions.eq("paintAssetId", paintAssetId));

@SuppressWarnings("unchecked")
List<PaintTransaction> spList=(List<PaintTransaction>)cr.list();
paintTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
paintTransaction.setExitRemarks(exitRemarks);
paintTransaction.setLateReason(lateReason);
paintTransaction.setFurnishingNumber(furnishingNumber);
paintTransaction.setCoachType(coachType);


			if(!("".equals(exitDate)))
			{
				
				Date exitDate_Date = df.parse(exitDate);
				paintTransaction.setAssemblyDispatchDate(exitDate_Date);
			}
			else{
				
				paintTransaction.setAssemblyDispatchDate(new Date());
			}
			
			if(!("".equals(assemblyEndDate)))
			{
				
				Date assemblyEndDate_Date = df.parse(assemblyEndDate);
				paintTransaction.setAssemblyEndDate(assemblyEndDate_Date);
			}
			else{
				
				paintTransaction.setAssemblyEndDate(new Date());
			}
			
			DaoPaintProduction daoPaintProduction=new DaoPaintProduction();
			
			daoPaintProduction.updatePaintProgress(paintTransaction);
			
		
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				System.out.println("--Inside dao.ExitPaintAction assignexitDate() methods finally Block--");
				session.close();
			}			
		}
	}
    
    public String assignReceiptDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
PaintTransaction	paintTransaction= new PaintTransaction();
//First row entry

Criteria cr = session.createCriteria(PaintTransaction.class);
cr.add(Restrictions.eq("paintAssetId", paintAssetId));

@SuppressWarnings("unchecked")
List<PaintTransaction> spList=(List<PaintTransaction>)cr.list();
paintTransaction=spList.get(0);
String stageID=paintTransaction.getStageId();
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
Date receiptDate_Date=null;
			if(!("".equals(receiptDate)))
			{
				
				 receiptDate_Date = df.parse(receiptDate);
				paintTransaction.setReceiptAtNextStage(receiptDate_Date);
			}
			else{
				
				paintTransaction.setReceiptAtNextStage(new Date());
			}
		
			
			
			
			// Second row entry
			
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String nextStage=subStagesMaster.getNextStageId();  // stageId for furnishing shop shop
			// Create Furnishing shop entry
			FurnishingTransaction	furnTransaction= new	FurnishingTransaction();
			furnTransaction.setPreviousStageId(stageID);
			furnTransaction.setStageId(nextStage);
			furnTransaction.setShellAssetId(shellAssetId);
			furnTransaction.setShellType(shellType);
			furnTransaction.setPaintAssetId(paintAssetId);
			furnTransaction.setAssemblyStartDate(receiptDate_Date);
            
			DaoPaintProduction daoPaintProduction=new DaoPaintProduction();
			
			daoPaintProduction.updatePaintProgress(paintTransaction);
			DaoFurnishingProduction daoFurnishingProduction=new DaoFurnishingProduction();
			
			daoFurnishingProduction.addFurnishingProgress(furnTransaction);
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoAbnormality getAllAbnormaity() methods finally Block--");
				session.close();
			}			
		}
	}

	public Integer getPaintAssetId() {
		return paintAssetId;
	}

	public void setPaintAssetId(Integer paintAssetId) {
		this.paintAssetId = paintAssetId;
	}

	public String getAssemblyEndDate() {
		return assemblyEndDate;
	}

	public void setAssemblyEndDate(String assemblyEndDate) {
		this.assemblyEndDate = assemblyEndDate;
	}

	public String getExitDate() {
		return exitDate;
	}

	public void setExitDate(String exitDate) {
		this.exitDate = exitDate;
	}

	public String getExitRemarks() {
		return exitRemarks;
	}

	public void setExitRemarks(String exitRemarks) {
		this.exitRemarks = exitRemarks;
	}

	public String getLateReason() {
		return lateReason;
	}

	public void setLateReason(String lateReason) {
		this.lateReason = lateReason;
	}

	public String getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}

	public String getStageId() {
		return stageId;
	}

	public void setStageId(String stageId) {
		this.stageId = stageId;
	}

	public Integer getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getShellType() {
		return shellType;
	}

	public void setShellType(String shellType) {
		this.shellType = shellType;
	}

	public String getFurnishingNumber() {
		return furnishingNumber;
	}

	public void setFurnishingNumber(String furnishingNumber) {
		this.furnishingNumber = furnishingNumber;
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

}
