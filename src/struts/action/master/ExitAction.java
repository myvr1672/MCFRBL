package struts.action.master;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.ShellProgress;
import dao.DaoSheetCutting;
import hibernateConnect.HibernateConfig;
import model.SubStagesMaster;

public class ExitAction {

	
	private Integer assetID;
	private String stageId;
	private String assetNumber;
	private String shellNumber;
	private String bogieNumber;
	private String wheelNumber;
	private String coachNumber;
	private String exitDate;
	private String exitRemarks;
	private String shellType;
	
	public String assignexitDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
Criteria cr1=session.createCriteria(SubStagesMaster.class);
cr1.add(Restrictions.eq("substageId", stageId));
SubStagesMaster subStagesMaster =(SubStagesMaster)cr1.list().get(0);



String nextStages=subStagesMaster.getNextStageId();

String[] nextStageArr;
String delimiter = ", ";
/* given string will be split by the argument delimiter provided. */
nextStageArr = nextStages.split(delimiter);



ShellProgress	shellProgress= new	ShellProgress();
//First row entry

Criteria cr = session.createCriteria(ShellProgress.class);
cr.add(Restrictions.eq("assetID", assetID));

@SuppressWarnings("unchecked")
List<ShellProgress> spList=(List<ShellProgress>)cr.list();
shellProgress=spList.get(0);
/*shellProgress.setSubstageId(stageId); 
shellProgress.setShellNumber(shellNumber);
*/
shellProgress.setExitRemark(exitRemarks);
			
			if(!("".equals(exitDate)))
			{
				
				Date exitDate_Date = df.parse(exitDate);
				shellProgress.setExitDate(exitDate_Date);
			}
			else{
				
				shellProgress.setExitDate(new Date());
			}
			
			
			DaoSheetCutting daoSheetCutting=new DaoSheetCutting();
			
			daoSheetCutting.updateSheetProgress(shellProgress);
			// Second row entry
			
			for(String s:nextStageArr)
			{
			
			
			ShellProgress	shellProgress1= new	ShellProgress();
			shellProgress1.setSubstageId(s);
			shellProgress1.setPreviousStageId(stageId);
			if(stageId.equals("1")) { shellProgress1.setWheelNumber(assetNumber);}
			if(stageId.equals("2")) { shellProgress1.setBogieNumber(bogieNumber); shellProgress1.setWheelNumber(assetNumber);}
			if(stageId.equals("3")||(stageId.equals("4"))) { shellProgress1.setShellNumber(assetNumber);}	
        	if(stageId.equals("5")||stageId.equals("6")||stageId.equals("8")) {shellProgress1.setShellNumber(shellNumber);shellProgress1.setBogieNumber(bogieNumber); shellProgress1.setCoachNumber(coachNumber);}
        
			shellProgress1.setShellType(shellType);
		
			if(!("".equals(exitDate)))
			{
				
				Date exitDate_Date = df.parse(exitDate);
				shellProgress1.setEntryDate(exitDate_Date);
			}
        else{
				
        	shellProgress1.setEntryDate(new Date());
			}
			daoSheetCutting.addSheetProgress(shellProgress1);
			}
			/*// Third row entry
						ShellProgress	shellProgress2= new	ShellProgress();
						shellProgress2.setSubstageId("shell03");
						shellProgress2.setShellNumber(shellNumber);
						if(!("".equals(exitDate)))
						{
							
							Date exitDate_Date = df.parse(exitDate);
							shellProgress2.setEntryDate(exitDate_Date);
						}
						
						daoSheetCutting.addSheetProgress(shellProgress2);
						// Fourth row entry
						ShellProgress	shellProgress3= new	ShellProgress();
						shellProgress3.setSubstageId("shell04");
						shellProgress3.setShellNumber(shellNumber);
						if(!("".equals(exitDate)))
						{
							
							Date exitDate_Date = df.parse(exitDate);
							shellProgress3.setEntryDate(exitDate_Date);
						}
						
						daoSheetCutting.addSheetProgress(shellProgress3);
						// Fifth row entry
						ShellProgress	shellProgress4= new	ShellProgress();
						shellProgress4.setSubstageId("shell05");
						shellProgress4.setShellNumber(shellNumber);
						if(!("".equals(exitDate)))
						{
							
							Date exitDate_Date = df.parse(exitDate);
							shellProgress4.setEntryDate(exitDate_Date);
						}
						
						daoSheetCutting.addSheetProgress(shellProgress4);*/
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

	public String getStageId() {
		return stageId;
	}

	public void setStageId(String stageId) {
		this.stageId = stageId;
	}

	
	public Integer getAssetID() {
		return assetID;
	}

	public void setAssetID(Integer assetID) {
		this.assetID = assetID;
	}

	

	public String getShellNumber() {
		return shellNumber;
	}

	public void setShellNumber(String shellNumber) {
		this.shellNumber = shellNumber;
	}

	public String getBogieNumber() {
		return bogieNumber;
	}

	public void setBogieNumber(String bogieNumber) {
		this.bogieNumber = bogieNumber;
	}

	public String getWheelNumber() {
		return wheelNumber;
	}

	public void setWheelNumber(String wheelNumber) {
		this.wheelNumber = wheelNumber;
	}

	public String getCoachNumber() {
		return coachNumber;
	}

	public void setCoachNumber(String coachNumber) {
		this.coachNumber = coachNumber;
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

	public String getShellType() {
		return shellType;
	}

	public void setShellType(String shellType) {
		this.shellType = shellType;
	}

	public String getAssetNumber() {
		return assetNumber;
	}

	public void setAssetNumber(String assetNumber) {
		this.assetNumber = assetNumber;
	}
	

}
