package struts.action.master;


import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import beans.WheelsetTransaction;
import common.SentEmail;
import dao.DaoWheelProduction;
import hibernateConnect.HibernateConfig;
import model.User;


public class ExitWheelAction {

	
	private Integer wheelsetAssetId;
	
	
	private String exitDate;
	
	private String exitRemarks;
	
	private String receiptDate;
	private String dispatchTo;
	private String railway;
	private String axleNumber;
	
	
	public String assignexitDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
WheelsetTransaction	wheelsetTransaction= new	WheelsetTransaction();
//First row entry

Criteria cr = session.createCriteria(WheelsetTransaction.class);
cr.add(Restrictions.eq("wheelsetAssetId", wheelsetAssetId));

@SuppressWarnings("unchecked")
List<WheelsetTransaction> spList=(List<WheelsetTransaction>)cr.list();
wheelsetTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
wheelsetTransaction.setRemarks(exitRemarks);
wheelsetTransaction.setDispatchTo(dispatchTo);
wheelsetTransaction.setCustomer(railway);
			if(!("".equals(exitDate)))
			{
				
				Date exitDate_Date = df.parse(exitDate);
				wheelsetTransaction.setAssemblyDispatchDate(exitDate_Date);
			}
			else{
				
				wheelsetTransaction.setAssemblyDispatchDate(new Date());
			}
			
			
			DaoWheelProduction daoWheelProduction=new DaoWheelProduction();
			
			daoWheelProduction.updateWheelProgress(wheelsetTransaction);
			//mail sent code
			/*SentEmail sentMail=new SentEmail();
            Session session2=HibernateConfig.getSession();
            Criteria cr2=session2.createCriteria(User.class);
            Criterion rest1=Restrictions.eq("userType", "System Admin");  //1
            
            Criterion rest2=Restrictions.and(Restrictions.eq("userType", "Production")
                ,Restrictions.in("roles",new String[] {"Bogie", "All"}));//2
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
          
        @SuppressWarnings("unchecked")
		//String[]  receipient=(String[]) cr2.list().toArray(new String[cr2.list().size()]);
        //String[]  receipient=
        //System.out.println("receipient->"+receipient.toString());
        String subject="Axle No: "+axleNumber+ " received";
        String content="Wheelset with Axle No: "+axleNumber+", and remarks: "+exitRemarks+" is Received to you";
       // sentMail.sentMail("dasgupta.hirak@gmail.com", subject, content);
        sentMail.sentMail(email, subject, content);*/
			
			//end of sent mail code
		
			
			
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
WheelsetTransaction	wheelsetTransaction= new	WheelsetTransaction();
//First row entry

Criteria cr = session.createCriteria(WheelsetTransaction.class);
cr.add(Restrictions.eq("wheelsetAssetId", wheelsetAssetId));

@SuppressWarnings("unchecked")
List<WheelsetTransaction> spList=(List<WheelsetTransaction>)cr.list();
wheelsetTransaction=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
			
			if(!("".equals(receiptDate)))
			{
				
				Date receiptDate_Date = df.parse(receiptDate);
				wheelsetTransaction.setReceiptAtNextStage(receiptDate_Date);
			}
			else{
				
				wheelsetTransaction.setReceiptAtNextStage(new Date());
			}
		
			DaoWheelProduction daoWheelProduction=new DaoWheelProduction();
			
			daoWheelProduction.updateWheelProgress(wheelsetTransaction);
			
			
			
			
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
	


	public Integer getWheelsetAssetId() {
		return wheelsetAssetId;
	}





	public void setWheelsetAssetId(Integer wheelsetAssetId) {
		this.wheelsetAssetId = wheelsetAssetId;
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


	public String getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
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

	public String getAxleNumber() {
		return axleNumber;
	}

	public void setAxleNumber(String axleNumber) {
		this.axleNumber = axleNumber;
	}

	
	

}
