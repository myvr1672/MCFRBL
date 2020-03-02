package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.FurnishingTransaction;
import dao.DaoFurnishingProduction;
import hibernateConnect.HibernateConfig;

public class ExitForQualityCheckAction {
    
	   private Integer furnishingAssetId;
	   private String stageId;
	   private String dispatchDate;
	   private String assemblyEndDate;
	   private String exitRemark;
	   private String lateReason;
	   private String coachNumber;
	   private String coachType;
	   
	
	
	
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
if(!("".equals(dispatchDate))) { furnishingTransaction.setDispatchDateInQuality(df.parse(dispatchDate)); }
if(!("".equals(assemblyEndDate))) { furnishingTransaction.setAssemblyEndDate(df.parse(assemblyEndDate)); }


furnishingTransaction.setExitRemarkFurnishing(exitRemark);
furnishingTransaction.setLateReasonFurnishing(lateReason);
furnishingTransaction.setCoachNumber(coachNumber);
furnishingTransaction.setCoachType(coachType);
			DaoFurnishingProduction daoFurnishingProduction=new DaoFurnishingProduction();
			
			daoFurnishingProduction.updateFurnishingProgress(furnishingTransaction);
		
		
		return "success";
	}
		catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				System.out.println("--Inside dao.DaoAbnormality getAllAbnormaity() methods finally Block--");
				session.close();
			}			
		}
	}




	public Integer getFurnishingAssetId() {
		return furnishingAssetId;
	}




	public void setFurnishingAssetId(Integer furnishingAssetId) {
		this.furnishingAssetId = furnishingAssetId;
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




	public String getAssemblyEndDate() {
		return assemblyEndDate;
	}




	public void setAssemblyEndDate(String assemblyEndDate) {
		this.assemblyEndDate = assemblyEndDate;
	}




	public String getExitRemark() {
		return exitRemark;
	}




	public void setExitRemark(String exitRemark) {
		this.exitRemark = exitRemark;
	}




	public String getLateReason() {
		return lateReason;
	}




	public void setLateReason(String lateReason) {
		this.lateReason = lateReason;
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
	
}
