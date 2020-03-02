package struts.action.master;


import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.FurnishingTransaction;
//import beans.TestingTransaction;
import beans.CoachTurnoutTransaction;

import dao.DaoFurnishingProduction;
import hibernateConnect.HibernateConfig;

public class ExitFurnishAction {

	
	private Integer furnishingAssetId;
	private String stageId;
	private String dispatchDate;
	private String assemblyEndDate;
	private String exitRemark;
	private String lateReason;
	private String coachNumber;
	private String coachType;
	
	private String receiptDate;   // abhi ye use me nahi hai.
	
	
	
	public String assignexitDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
FurnishingTransaction	furnishingTransaction= new	FurnishingTransaction();
//First row entry

Criteria cr = session.createCriteria(FurnishingTransaction.class);
cr.add(Restrictions.eq("furnishingAssetId", furnishingAssetId));

@SuppressWarnings("unchecked")
List<FurnishingTransaction> spList=(List<FurnishingTransaction>)cr.list();
furnishingTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
if(!("".equals(dispatchDate))) { furnishingTransaction.setAssemblyDispatchDate(df.parse(dispatchDate)); }
if(!("".equals(assemblyEndDate))) { furnishingTransaction.setAssemblyEndDate(df.parse(assemblyEndDate)); }

furnishingTransaction.setExitRemarks(exitRemark);
furnishingTransaction.setLateRemarks(lateReason);
furnishingTransaction.setCoachNumber(coachNumber);
furnishingTransaction.setCoachType(coachType);

		
		
			
			DaoFurnishingProduction daoFurnishingProduction=new DaoFurnishingProduction();
			
			daoFurnishingProduction.updateFurnishingProgress(furnishingTransaction);
			// Second row entry
			
			
			return "success";
		} catch (Exception e) {
			
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
	public String assignReceiptDate(){
		
		Session session=null;
		session = HibernateConfig.getSession();
		Date receiptDate_Date=null;
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
FurnishingTransaction	furnishingTransaction= new	FurnishingTransaction();
//First row entry

Criteria cr = session.createCriteria(FurnishingTransaction.class);
cr.add(Restrictions.eq("furnishingAssetId", furnishingAssetId));

@SuppressWarnings("unchecked")
List<FurnishingTransaction> spList=(List<FurnishingTransaction>)cr.list();
furnishingTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
			
			if(!("".equals(receiptDate)))
			{
				
				receiptDate_Date = df.parse(receiptDate);
				furnishingTransaction.setReceiptAtNextStage(receiptDate_Date);
			}
			else{
				
				furnishingTransaction.setReceiptAtNextStage(new Date());
			}
			furnishingTransaction.setAsignedFlag(1);
    
			
			
			// Second row entry in new coach_turnout_trans table
			//Retrieve some value from finishing_trans table
		    
			Integer shellAssetId=	furnishingTransaction.getShellAssetId();
			// retrieve current stage id
            //end of retrieve current stage id
			Integer bogiePpSideAssetId= furnishingTransaction.getBogiePpSideAssetId();
			Integer bogieNppSideAssetId=furnishingTransaction.getBogieNppSideAssetId();
			String coachNumber=furnishingTransaction.getCoachNumber();
			String coachType=furnishingTransaction.getCoachType();
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
			DaoFurnishingProduction daoFurnishingProduction=new DaoFurnishingProduction(); 
			daoFurnishingProduction.updateFurnishingProgress(furnishingTransaction, coachTurnoutTransaction);
			
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
	
			
	public String getAssemblyEndDate() {
		return assemblyEndDate;
	}


	public void setAssemblyEndDate(String assemblyEndDate) {
		this.assemblyEndDate = assemblyEndDate;
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

	public String getDispatchDate() {
		return dispatchDate;
	}

	public void setDispatchDate(String dispatchDate) {
		this.dispatchDate = dispatchDate;
	}

	

	public String getExitRemark() {
		return exitRemark;
	}

	public void setExitRemark(String exitRemark) {
		this.exitRemark = exitRemark;
	}

	

	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}

	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
	}

	public String getCoachNumber() {
		return coachNumber;
	}

	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public String getLateReason() {
		return lateReason;
	}


	public void setLateReason(String lateReason) {
		this.lateReason = lateReason;
	}

	
}
