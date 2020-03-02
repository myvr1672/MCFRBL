package struts.action.master;


import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import beans.PaintTransaction;
import beans.ShellTransaction;
import common.SentEmail;
import dao.DaoPaintProduction;
import dao.DaoShellProduction;
import hibernateConnect.HibernateConfig;
import model.SubStagesMaster;
import model.User;


public class ExitShellAction {

	
	private Integer shellAssetId;
	
	private String assemblyEndDate;
	private String exitDate;
	private String shellNumber;
	private String exitRemarks;
	private String lateReason;
	private String receiptDate;
	//private String underFrameNumber;
	private String stageId;    // previousStage Id for paint shop
	private String shellType;
	
	public String assignexitDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
ShellTransaction	shellTransaction= new	ShellTransaction();

//First row entry

Criteria cr = session.createCriteria(ShellTransaction.class);
cr.add(Restrictions.eq("shellAssetId", shellAssetId));

@SuppressWarnings("unchecked")
List<ShellTransaction> spList=(List<ShellTransaction>)cr.list();
shellTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
shellTransaction.setExitRemarks(exitRemarks);
shellTransaction.setShellNumber(shellNumber);
shellTransaction.setLateRemarks(lateReason);
shellTransaction.setUnderFrameNumber(shellNumber);
			if(!("".equals(exitDate)))
			{
				
				Date exitDate_Date = df.parse(exitDate);
				shellTransaction.setAssemblyDispatchDate(exitDate_Date);
			}
			else{
				
				shellTransaction.setAssemblyDispatchDate(new Date());
			}
			
			if(!("".equals(assemblyEndDate)))
			{
				
				Date assemblyEndDate_Date = df.parse(assemblyEndDate);
				shellTransaction.setAssemblyEndDate(assemblyEndDate_Date);
			}
			else{
				
				shellTransaction.setAssemblyEndDate(new Date());
			}
			
			DaoShellProduction daoShellProduction=new DaoShellProduction();
			
			daoShellProduction.updateShellProgress(shellTransaction);
		//sent mail
			
		/*	System.out.println("receipient mail code");
			
			SentEmail sentMail=new SentEmail();
            Session session2=HibernateConfig.getSession();
            Criteria cr2=session2.createCriteria(User.class);
            Criterion rest1=Restrictions.eq("userType", "System Admin");  //1
            
            Criterion rest2=Restrictions.and(Restrictions.eq("userType", "Production")
                ,Restrictions.in("roles",new String[] {"Paint", "All"}));//2
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
       
		
        String subject="Shell No: " +shellNumber+ " received";
        String content="Shell No. " +shellNumber+ "  and remarks: "+exitRemarks+" is received in Paint Shop ";
       // sentMail.sentMail("dasgupta.hirak@gmail.com", subject, content);
        sentMail.sentMail_1(email, subject, content);	*/
			
			
			
			
			
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

	public String assignReceiptDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
ShellTransaction	shellTransaction= new	ShellTransaction();
//First row entry

Criteria cr = session.createCriteria(ShellTransaction.class);
cr.add(Restrictions.eq("shellAssetId", shellAssetId));

@SuppressWarnings("unchecked")
List<ShellTransaction> spList=(List<ShellTransaction>)cr.list();
shellTransaction=spList.get(0);
String stageID=shellTransaction.getStageId();
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
Date receiptDate_Date=null;
			if(!("".equals(receiptDate)))
			{
				
				 receiptDate_Date = df.parse(receiptDate);
				shellTransaction.setReceiptatNextStage(receiptDate_Date);
			}
			else{
				
				shellTransaction.setReceiptatNextStage(new Date());
			}
		
			
			shellTransaction.setAsignedFlag(1);
			
			// Second row entry
			
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String nextStage=subStagesMaster.getNextStageId();  // stageId for paint shop
			// Create Paint shop entry
			PaintTransaction	paintTransaction= new	PaintTransaction();
			paintTransaction.setPreviousStageId(stageID);
			paintTransaction.setStageId(nextStage);
			paintTransaction.setShellAssetId(shellAssetId);
			paintTransaction.setShellType(shellType);
			paintTransaction.setAssemblyStartDate(receiptDate_Date);
            
			DaoShellProduction daoShellProduction=new DaoShellProduction();
			
			daoShellProduction.updateShellProgress(shellTransaction);
			DaoPaintProduction daoPaintProduction=new DaoPaintProduction();
			
			daoPaintProduction.addPaintProgress(paintTransaction);
			
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





	public Integer getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(Integer shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getShellNumber() {
		return shellNumber;
	}

	public void setShellNumber(String shellNumber) {
		this.shellNumber = shellNumber;
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

	public String getShellType() {
		return shellType;
	}

	public void setShellType(String shellType) {
		this.shellType = shellType;
	}

	

}
