package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.CoachTurnoutTransaction;
import beans.FinishingTransaction;
import beans.FurnishingTransaction;
import dao.DaoFinishingProduction;

import hibernateConnect.HibernateConfig;


public class ExitFinishingAction {
       private Integer finishingAssetId;
       private String assemblyEndDate;
       private String exitDate;
       private String exitRemarks;
       private String lateReason;
	private String receiptDate;
	public String assignexitDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
FinishingTransaction	finishingTransaction= new	FinishingTransaction();

//First row entry

Criteria cr = session.createCriteria(FinishingTransaction.class);
cr.add(Restrictions.eq("finishingAssetId", finishingAssetId));

@SuppressWarnings("unchecked")
List<FinishingTransaction> spList=(List<FinishingTransaction>)cr.list();
finishingTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
finishingTransaction.setExitRemarks(exitRemarks);
finishingTransaction.setLateRemarks(lateReason);


			if(!("".equals(exitDate)))
			{
				
				Date exitDate_Date = df.parse(exitDate);
				finishingTransaction.setAssemblyDispatchDate(exitDate_Date);
			}
			else{
				
				finishingTransaction.setAssemblyDispatchDate(new Date());
			}
			
			if(!("".equals(assemblyEndDate)))
			{
				
				Date assemblyEndDate_Date = df.parse(assemblyEndDate);
				finishingTransaction.setAssemblyEndDate(assemblyEndDate_Date);
			}
			else{
				
				finishingTransaction.setAssemblyEndDate(new Date());
			}
			
			DaoFinishingProduction daoFinishingProduction=new DaoFinishingProduction();
			
			daoFinishingProduction.updateFinishingProgress(finishingTransaction);
			
		
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				System.out.println("--Inside dao.ExitFinishingAction assignexitDate() methods finally Block--");
				session.close();
			}			
		}
	}
    
	public String assignReceiptDate(){
		
		Session session=null;
		session = HibernateConfig.getSession();
		Date receiptDate_Date=null;
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
FinishingTransaction	finishingTransaction= new	FinishingTransaction();
//First row entry

Criteria cr = session.createCriteria(FinishingTransaction.class);
cr.add(Restrictions.eq("finishingAssetId", finishingAssetId));

@SuppressWarnings("unchecked")
List<FinishingTransaction> spList=(List<FinishingTransaction>)cr.list();
finishingTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
			
			if(!("".equals(receiptDate)))
			{
				
				receiptDate_Date = df.parse(receiptDate);
				finishingTransaction.setReceiptAtNextStage(receiptDate_Date);
			}
			else{
				
				finishingTransaction.setReceiptAtNextStage(new Date());
			}
		finishingTransaction.setAsignedFlag(1);
    
			
			
			// Second row entry in new coach_turnout_trans table
			//Retrieve some value from finishing_trans table
		    
			Integer shellAssetId=	finishingTransaction.getShellAssetId();
			// retrieve current stage id
             
			
			//end of retrieve current stage id
			Integer bogiePpSideAssetId= finishingTransaction.getBogiePpSideAssetId();
			Integer bogieNppSideAssetId=finishingTransaction.getBogieNppSideAssetId();
			String coachNumber=finishingTransaction.getCoachNumber();
			// retrieve coach type
			Integer furnishingAssetId= finishingTransaction.getFurnishingAssetId();
			FurnishingTransaction	furnishingTransaction= new	FurnishingTransaction();
			Criteria cr_coachtype = session.createCriteria(FurnishingTransaction.class);
			cr_coachtype.add(Restrictions.eq("furnishingAssetId", furnishingAssetId));

			@SuppressWarnings("unchecked")
			List<FurnishingTransaction> furnishingList=(List<FurnishingTransaction>)cr_coachtype.list();
			furnishingTransaction=furnishingList.get(0);
			String coachType=furnishingTransaction.getCoachType();
			//end of retrieving coach type
			
			
			
			// end of retrieval
			//set value in coach_turnout_trans
			CoachTurnoutTransaction coachTurnoutTransaction=new CoachTurnoutTransaction();
			
			coachTurnoutTransaction.setCoachNumber(coachNumber);
			coachTurnoutTransaction.setCoachType(coachType);
			coachTurnoutTransaction.setShellAssetId(shellAssetId);
			coachTurnoutTransaction.setBogiePpSideAssetId(bogiePpSideAssetId);
			coachTurnoutTransaction.setBogieNppSideAssetId(bogieNppSideAssetId);
			coachTurnoutTransaction.setCoachManufacturedDate(receiptDate_Date);
			
			//end of coach_turnout_trans
			DaoFinishingProduction daoFinishingProduction=new DaoFinishingProduction(); 
			daoFinishingProduction.updateFinishingProgress(finishingTransaction, coachTurnoutTransaction);
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				System.out.println("--Inside dao.ExitFinishingAction assignReceiptDate() methods finally Block--");
				session.close();
			}			
		}
		
		
		
	}
	
	
	public String getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}

	public Integer getFinishingAssetId() {
		return finishingAssetId;
	}

	public void setFinishingAssetId(Integer finishingAssetId) {
		this.finishingAssetId = finishingAssetId;
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
	
	
	
}
