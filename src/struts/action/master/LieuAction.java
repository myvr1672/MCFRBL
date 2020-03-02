package struts.action.master;


import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;





import beans.IrwisHrPltLieuCalM;
import beans.IrwisHrPltLieuCalMId;


import hib.dao.hr.IrwisHrHolidayCalenderDao;


public class LieuAction {
	
	
	String  org_SlNo = "RBL";

	private String calHodyDate;
	private String hodyCode;
	private String lieuDate;
	private String remarks;
	private String lieuFlag;
	public String assignLieuDate()
	{
	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			
IrwisHrPltLieuCalM record = new IrwisHrPltLieuCalM();
IrwisHrPltLieuCalMId id=new IrwisHrPltLieuCalMId();
			
			
			if(!("".equals(calHodyDate)))
			{
				
				Date calHody_Date = df.parse(calHodyDate);
				id.setCalHodyDate(calHody_Date);
			
				 
			}
			if(!("".equals(lieuDate)))
			{
				
				Date lieuDate_Date = df.parse(lieuDate);
				id.setLieuDate(lieuDate_Date);
			
				 
			}
			id.setPcalId(org_SlNo);
			id.setPlant(org_SlNo);
			id.setHodyCode(hodyCode);
			//record1 = new IrwisRsInT();
			record.setId(id);
			record.setRemarks(remarks);
			
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			
			irwisHrHolidayCalenderDao.assignLieuDate(record);
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	

	
	public String isHolidayHavingLieuDate()
	{
		List<IrwisHrPltLieuCalM> records = new ArrayList<IrwisHrPltLieuCalM>();
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			Date calHody_Date =null;
			if(!("".equals(calHodyDate)))
			{
				
				calHody_Date = df.parse(calHodyDate);
				
			
				 
			}
			
			
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			records=irwisHrHolidayCalenderDao.getLieuDate(org_SlNo, calHody_Date,hodyCode);
			if(records.size()>0)
			{
				lieuFlag="Y";
			}
			else
			{
				lieuFlag="N";
			}
			return "success";
		} catch (Exception e) {
			
			System.out.println("error listing"+e);
		}
		return "success";
	}
	


	
	public String getCalHodyDate() {
		return calHodyDate;
	}

	public void setCalHodyDate(String calHodyDate) {
		this.calHodyDate = calHodyDate;
	}

	public String getHodyCode() {
		return hodyCode;
	}

	public void setHodyCode(String hodyCode) {
		this.hodyCode = hodyCode;
	}

	

	public String getLieuFlag() {
		return lieuFlag;
	}








	public void setLieuFlag(String lieuFlag) {
		this.lieuFlag = lieuFlag;
	}








	public String getLieuDate() {
		return lieuDate;
	}


	public void setLieuDate(String lieuDate) {
		this.lieuDate = lieuDate;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}

