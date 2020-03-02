package struts.action.master;


import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import beans.BogiesetTransaction;
import common.SentEmail;
import dao.DaoBogieProduction;
import hibernateConnect.HibernateConfig;
import model.User;


public class ExitBogieAction {

	
	private Integer bogieAssetId;
	private String stageId;
	private String dispatchDate;
	private String assemblyEndDate;
	private String frameNumber;
	private String frameReceiptDate;
	private String bolsterNumber;
	private String bolsterReceiptDate;
	private String exitRemark;
	private String lateReason;
	private String bogieNumber;
	private String bogieType;
	private String receiptDate;
	private String dispatchTo;
	private String railway;
	private String frameManufacturedBy;
	private String bolsterManufacturedBy;
	
	
	public String assignexitDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
BogiesetTransaction	bogiesetsetTransaction= new	BogiesetTransaction();
//First row entry

Criteria cr = session.createCriteria(BogiesetTransaction.class);
cr.add(Restrictions.eq("bogieAssetId", bogieAssetId));

@SuppressWarnings("unchecked")
List<BogiesetTransaction> spList=(List<BogiesetTransaction>)cr.list();
bogiesetsetTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
if(!("".equals(dispatchDate))) { bogiesetsetTransaction.setAssemblyExitDate(df.parse(dispatchDate)); }
if(!("".equals(assemblyEndDate))) { bogiesetsetTransaction.setAssemblyEndDate(df.parse(assemblyEndDate)); }
bogiesetsetTransaction.setFrameNo(frameNumber);
//if(!("".equals(frameReceiptDate))) { bogiesetsetTransaction.setFrameReceiptDate(df.parse(frameReceiptDate)); }
//else {
	bogiesetsetTransaction.setFrameReceiptDate(new Date());
//	}
bogiesetsetTransaction.setFrameManufacturedBy(frameManufacturedBy);
bogiesetsetTransaction.setBolsNo(bolsterNumber);
//if(!("".equals(bolsterReceiptDate))) {  bogiesetsetTransaction.setBolsReceiptDate(df.parse(bolsterReceiptDate)); }
//else
//{
	bogiesetsetTransaction.setBolsReceiptDate(new Date());
//}
bogiesetsetTransaction.setBolsterManufacturedBy(bolsterManufacturedBy);
bogiesetsetTransaction.setExitRemarks(exitRemark);
bogiesetsetTransaction.setLateRemark(lateReason);
bogiesetsetTransaction.setBogieNumber(bogieNumber);
bogiesetsetTransaction.setBogieType(bogieType);
bogiesetsetTransaction.setDispatchTo(dispatchTo);
bogiesetsetTransaction.setCustomer(railway);
		
		
			
			DaoBogieProduction daoBogieProduction=new DaoBogieProduction();
			
			daoBogieProduction.updateBogieProgress(bogiesetsetTransaction);
// mail code
			
			/*System.out.println("receipient mail code");
			
			SentEmail sentMail=new SentEmail();
            Session session2=HibernateConfig.getSession();
            Criteria cr2=session2.createCriteria(User.class);
            Criterion rest1=Restrictions.eq("userType", "System Admin");  //1
            
            Criterion rest2=Restrictions.and(Restrictions.eq("userType", "Production")
                ,Restrictions.in("roles",new String[] {"Furnishing", "All"}));//2
                cr2.add(Restrictions.or(rest1,rest2));
         // cr2.setProjection(Projections.property("email"));
          //cr2.setProjection(Projections.projectionList().add(Projections.property("email")).add(Projections.property("telephone"))); 
          List <User> users=cr2.list();
          String email[]=new String[users.size()];
          String telephone[]=new String[users.size()];
          int i=0;
          for (User user:users)
          {
        	  email[i]=user.getEmail();
           //String email=  
          telephone[i]="91"+user.getTelephone();
           i++;
          }
          
        if(dispatchTo.equals("rsp")){dispatchTo="RSP";}
        if(dispatchTo.equals("furnishing")){dispatchTo="Furnishing Shop";}
		
        String subject="Bogie No: " +bogieNumber+ " received";
        String content="Bogie No. " +bogieNumber+ " with Frame No: "+frameNumber+" & Bolster No. "+bolsterNumber+", and remarks: "+exitRemark+" is dispatch for "+dispatchTo+" ";
       // sentMail.sentMail("dasgupta.hirak@gmail.com", subject, content);
        sentMail.sentMail(email, subject, content);*/
		// end of send mail	
			
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

	public String assignReceiptDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
BogiesetTransaction	bogiesetTransaction= new	BogiesetTransaction();
//First row entry

Criteria cr = session.createCriteria(BogiesetTransaction.class);
cr.add(Restrictions.eq("bogieAssetId", bogieAssetId));

@SuppressWarnings("unchecked")
List<BogiesetTransaction> spList=(List<BogiesetTransaction>)cr.list();
bogiesetTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
			
			if(!("".equals(receiptDate)))
			{
				
				Date receiptDate_Date = df.parse(receiptDate);
				bogiesetTransaction.setReceiptAtNextStage(receiptDate_Date);
			}
			else{
				
				bogiesetTransaction.setReceiptAtNextStage(new Date());
			}
		
			DaoBogieProduction daoBogieProduction=new DaoBogieProduction();
			
			daoBogieProduction.updateBogieProgress(bogiesetTransaction);
			// Second row entry
			
			
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

	public Integer getBogieAssetId() {
		return bogieAssetId;
	}

	public void setBogieAssetId(Integer bogieAssetId) {
		this.bogieAssetId = bogieAssetId;
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

	public String getFrameNumber() {
		return frameNumber;
	}

	public void setFrameNumber(String frameNumber) {
		this.frameNumber = frameNumber;
	}

	public String getFrameReceiptDate() {
		return frameReceiptDate;
	}

	public void setFrameReceiptDate(String frameReceiptDate) {
		this.frameReceiptDate = frameReceiptDate;
	}

	public String getBolsterNumber() {
		return bolsterNumber;
	}

	public void setBolsterNumber(String bolsterNumber) {
		this.bolsterNumber = bolsterNumber;
	}

	public String getBolsterReceiptDate() {
		return bolsterReceiptDate;
	}

	public void setBolsterReceiptDate(String bolsterReceiptDate) {
		this.bolsterReceiptDate = bolsterReceiptDate;
	}

	public String getExitRemark() {
		return exitRemark;
	}

	public void setExitRemark(String exitRemark) {
		this.exitRemark = exitRemark;
	}

	public String getBogieNumber() {
		return bogieNumber;
	}

	public void setBogieNumber(String bogieNumber) {
		this.bogieNumber = bogieNumber;
	}

	public String getBogieType() {
		return bogieType;
	}

	public void setBogieType(String bogieType) {
		this.bogieType = bogieType;
	}

	public String getLateReason() {
		return lateReason;
	}


	public void setLateReason(String lateReason) {
		this.lateReason = lateReason;
	}

	public String getDispatchTo() {
		return dispatchTo;
	}

	public void setDispatchTo(String dispatchTo) {
		this.dispatchTo = dispatchTo;
	}

	public String getRailway() {
		return railway;
	}

	public void setRailway(String railway) {
		this.railway = railway;
	}

	public String getFrameManufacturedBy() {
		return frameManufacturedBy;
	}

	public void setFrameManufacturedBy(String frameManufacturedBy) {
		this.frameManufacturedBy = frameManufacturedBy;
	}

	public String getBolsterManufacturedBy() {
		return bolsterManufacturedBy;
	}

	public void setBolsterManufacturedBy(String bolsterManufacturedBy) {
		this.bolsterManufacturedBy = bolsterManufacturedBy;
	}

	
}
