package struts.action.master;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.FurnishingTransaction;
import beans.PaintTransaction;
import beans.TestingMobileClearance;
//import beans.TestingTransaction;
import dao.DaoFurnishingProduction;
//import dao.DaoPaintProduction;

import hibernateConnect.HibernateConfig;
import model.SubStagesMaster;


public class ExitShellFromPaintAction {

	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");	
	private Integer paintAssetId;
   private String receiptDate;
	
	public String assignReceiptDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");

PaintTransaction	paintTransaction= new	PaintTransaction();
//First row entry

Criteria cr = session.createCriteria(PaintTransaction.class);
cr.add(Restrictions.eq("paintAssetId", paintAssetId));

@SuppressWarnings("unchecked")
List<PaintTransaction> spList=(List<PaintTransaction>)cr.list();
paintTransaction=spList.get(0);
String stageID=paintTransaction.getStageId();
Integer shellAssetId=paintTransaction.getShellAssetId();
String shellType=paintTransaction.getShellType();
String coachType=paintTransaction.getCoachType();

Date receiptDate_Date=null;
			if(!("".equals(receiptDate)))
			{
				
			 receiptDate_Date = df.parse(receiptDate);
				paintTransaction.setReceiptAtNextStage(receiptDate_Date);
			}
			else{
				
				paintTransaction.setReceiptAtNextStage(new Date());
			}
		
			
			paintTransaction.setAsignedFlag(1);
			
			// Second row entry
			
			Timestamp timestamp= new Timestamp(System.currentTimeMillis());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Criteria cr1 = session.createCriteria(SubStagesMaster.class);
			
			cr1.add(Restrictions.eq("substageId", stageID));
			
			SubStagesMaster subStagesMaster = (SubStagesMaster)cr1.list().get(0);
			String nextStage=subStagesMaster.getNextStageId();  // stageId for paint shop
			
			// Create Furnishing shop entry
			FurnishingTransaction	furnishingTransaction= new	FurnishingTransaction();
			furnishingTransaction.setPreviousStageId(stageID);
			furnishingTransaction.setStageId(nextStage);
			furnishingTransaction.setShellAssetId(shellAssetId);
			furnishingTransaction.setPaintAssetId(paintAssetId);
			furnishingTransaction.setShellType(shellType);
			furnishingTransaction.setCoachType(coachType);
			furnishingTransaction.setAssemblyStartDate(receiptDate_Date);
			furnishingTransaction.setTransactionUser(userID);
			furnishingTransaction.setTransactionDate(sdf.format(timestamp));
			furnishingTransaction.setAirBrakeTestingFlag(0);
			furnishingTransaction.setPlumbingTestingFlag(0);
			furnishingTransaction.setCbcTestingFlag(0);
			furnishingTransaction.setElectricalTestingFlag(0);
			furnishingTransaction.setDgLoadTestingFlag(0);
			
		
			DaoFurnishingProduction daoFurnishingProduction=new DaoFurnishingProduction();
			
			daoFurnishingProduction.addFurnishingProgress(furnishingTransaction, paintTransaction);
			
			
			//retrieve newly created furnishing id
//			Criteria cr2 = session.createCriteria(FurnishingTransaction.class);
//			cr2.add(Restrictions.eq("paintAssetId", paintAssetId));
//			FurnishingTransaction	furnishingTransaction1=(FurnishingTransaction) cr2.list().get(0);
//	Integer furnishingId=furnishingTransaction1.getFurnishingAssetId();
//	//Create a new record for Testing Mobile Clearance
//	TestingMobileClearance testingMobileClearance=new TestingMobileClearance();
//	testingMobileClearance.setFurnishingAssetId(furnishingId);
//	testingMobileClearance.setSubstageId("furn01");
//	testingMobileClearance.setTestingStatus("not_ok");
//	testingMobileClearance.setTestingStartDate(new Date());
//	testingMobileClearance.setNotificationStage("00");
//	testingMobileClearance.setSubstageDescription("FLOORING");
//	testingMobileClearance.setSubstageSequence(1);
//	 session=HibernateConfig.getSession();
//	session.save(testingMobileClearance);
			//end of code
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

	public String getReceiptDate() {
		return receiptDate;
	}

	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}
	


	

}
