package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import beans.CoachOutAfterRackFormation;
import beans.CoachTurnoutTransaction;


import dao.DaoCoachTurnoutTransaction;
import hibernateConnect.HibernateConfig;
import com.google.gson.Gson;

public class RackFormationAction {

	String coachNumberJson;
	
	String rackFormationDate;
	String rackID;
	
	
public String createRacks(){
	Gson gson = new Gson();
	String [] coachNumberArr = gson.fromJson(coachNumberJson, String[].class);
	
		Session session=null;
		session = HibernateConfig.getSession();
		Date rackFormationDate_Date=null;
		Transaction tx=null;
		try {
			 tx=session.beginTransaction();	
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
CoachTurnoutTransaction	coachTurnoutTransaction= new	CoachTurnoutTransaction();
CoachOutAfterRackFormation coachOutAfterRackFormation=null;
List<CoachTurnoutTransaction> coachTurnoutTransactionList=new ArrayList<CoachTurnoutTransaction>();
//First row entry
String coachNumbers=null;
DaoCoachTurnoutTransaction daoCoachTurnoutTransaction=new DaoCoachTurnoutTransaction();
for(String s: coachNumberArr)
{
	if(coachNumbers==null){coachNumbers=s;}
	else {coachNumbers=coachNumbers+", "+s; }
	Criteria cr = session.createCriteria(CoachTurnoutTransaction.class);
	cr.add(Restrictions.eq("coachNumber", s));
	coachTurnoutTransaction=(CoachTurnoutTransaction) cr.list().get(0);
	coachTurnoutTransaction.setRackCreated(1);
	coachTurnoutTransactionList.add(coachTurnoutTransaction);
	//daoCoachTurnoutTransaction.updateCoachTurnoutAndSaveCoachOutAfterRack(coachTurnoutTransaction, coachOutAfterRackFormation);
}


//second table operation

coachOutAfterRackFormation=new CoachOutAfterRackFormation();
coachOutAfterRackFormation.setCoachNumbers(coachNumbers);
coachOutAfterRackFormation.setRackId(rackID);
			if(!("".equals(rackFormationDate)))
			{
				
				rackFormationDate_Date = df.parse(rackFormationDate);
				coachOutAfterRackFormation.setRackFormationDate(rackFormationDate_Date);
			}
			else{
				
				coachOutAfterRackFormation.setRackFormationDate(new Date());
			}
			
			daoCoachTurnoutTransaction.updateCoachTurnoutAndSaveCoachOutAfterRack(coachTurnoutTransactionList, coachOutAfterRackFormation);
    
			
			
			// Second row entry in new coach_turnout_trans table
			//Retrieve some value from finishing_trans table
		    
			
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(tx!=null){tx.rollback();}
			if(session!=null){	session.close();}			
		}
	
	}
	
	
	public String getRackFormationDate() {
		return rackFormationDate;
	}
	public void setRackFormationDate(String rackFormationDate) {
		this.rackFormationDate = rackFormationDate;
	}
	public String getRackID() {
		return rackID;
	}
	public void setRackID(String rackID) {
		this.rackID = rackID;
	}

	public String getCoachNumberJson() {
		return coachNumberJson;
	}

	public void setCoachNumberJson(String coachNumberJson) {
		this.coachNumberJson = coachNumberJson;
	}
	
	
	
}
