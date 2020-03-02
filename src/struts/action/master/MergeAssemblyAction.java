package struts.action.master;

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

public class MergeAssemblyAction {

	
	private Integer assetID_bogie;
	private Integer assetID_paint;
	private String stageID;  // check it
	private String shellNumber;  //available
	private String bogieNumber;   //available
	private String wheelNumber;  //available
	
	private String entryDate;  
	
	private String shellType;  
	
	public String mergeEvent()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
			System.out.println("Hello navin:"+stageID);
			System.out.println("Hello navin bogi:"+bogieNumber);
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();
Criteria cr1=session.createCriteria(SubStagesMaster.class);
cr1.add(Restrictions.eq("substageId", stageID));
SubStagesMaster subStagesMaster =(SubStagesMaster)cr1.list().get(0);



String previousStage=subStagesMaster.getPreviousstageId();

DaoSheetCutting daoSheetCutting=new DaoSheetCutting();
//First row entry
ShellProgress	shellProgress= new	ShellProgress();
Criteria cr = session.createCriteria(ShellProgress.class);
cr.add(Restrictions.eq("assetID", assetID_bogie));
shellProgress=(ShellProgress) cr.list().get(0);
shellProgress.setMergeFunishFlag(1);    //set merging flag =1  for bogie output
daoSheetCutting.updateSheetProgress(shellProgress);

ShellProgress	shellProgress2= new	ShellProgress();
Criteria cr_1 = session.createCriteria(ShellProgress.class);			
cr_1.add(Restrictions.eq("assetID", assetID_paint));
shellProgress2=(ShellProgress) cr_1.list().get(0);
shellProgress2.setMergeFunishFlag(1); //set merging flag=1 for paint output
		
			daoSheetCutting.updateSheetProgress(shellProgress2);
			// Second row entry
			
			System.out.println("Wheel Number: "+wheelNumber);
			
			ShellProgress	shellProgress1= new	ShellProgress();
			shellProgress1.setSubstageId(stageID);
			shellProgress1.setPreviousStageId(previousStage);
			shellProgress1.setWheelNumber(wheelNumber);
        	shellProgress1.setShellNumber(shellNumber);
        	shellProgress1.setBogieNumber(bogieNumber); 
        
			shellProgress1.setShellType(shellType);
		
			if(!("".equals(entryDate)))
			{
				
				Date entryDate_Date = df.parse(entryDate);
				shellProgress1.setEntryDate(entryDate_Date);
			}
        else{
				
        	shellProgress1.setEntryDate(new Date());
			}
			daoSheetCutting.addSheetProgress(shellProgress1);
			
			
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

	
	public String getStageID() {
		return stageID;
	}

	public void setStageID(String stageID) {
		this.stageID = stageID;
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


	public Integer getAssetID_bogie() {
		return assetID_bogie;
	}

	public void setAssetID_bogie(Integer assetID_bogie) {
		this.assetID_bogie = assetID_bogie;
	}

	public Integer getAssetID_paint() {
		return assetID_paint;
	}

	public void setAssetID_paint(Integer assetID_paint) {
		this.assetID_paint = assetID_paint;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getShellType() {
		return shellType;
	}

	public void setShellType(String shellType) {
		this.shellType = shellType;
	}

	
	

}
