package struts.action.master;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;


import beans.IrwisHrPltLieuCalM;
import beans.IrwisHrPltLieuCalMId;
import beans.IrwisHrPltcalM;
import beans.IrwisHrPltcalMId;


import hib.dao.hr.IrwisHrHolidayCalenderDao;


public class LieuMasterAction {

	String  org_SlNo = "RBL";
	
	
	
private List<IrwisHrPltLieuCalM> records = new ArrayList<IrwisHrPltLieuCalM>();
	


	private String result;
	private String message;
	
	private IrwisHrPltLieuCalM record;
	
	
	private String calHodyDate;
	private String hodyCode;
	private String lieuDate;
	private String remarks;
	boolean res;
	public String create()
	{
	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			
	record = new IrwisHrPltLieuCalM();
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
			
				 
			
			id.setPcalId(org_SlNo);
			id.setPlant(org_SlNo);
			id.setHodyCode(hodyCode);
			//record1 = new IrwisRsInT();
			record.setId(id);
			record.setRemarks(remarks);
			
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			
			res=irwisHrHolidayCalenderDao.assignLieuDate(record);
			if(res==true)
			{
			result="OK";
			}
			else
			{
				message="One Lieu Date is already assigned for the selected holiday date";
				result="ERROR";
			}
			
		}
		else
		{
				
			message="Lieu Date is required";
			result="ERROR";
		}
			return "success";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public String delete()
	{
	
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			
	record = new IrwisHrPltLieuCalM();
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
			//record.setRemarks(remarks);
			
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			
			irwisHrHolidayCalenderDao.deleteLieuDate(record);
			result="OK";
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	
	public String list()
	{
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			Date calHody_Date =null;
			if(!("".equals(calHodyDate)))
			{
				
				calHody_Date = df.parse(calHodyDate);
				
			
				 
			}
			
			
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			records=irwisHrHolidayCalenderDao.getLieuDate(org_SlNo, calHody_Date,hodyCode);
			result="OK";
			
		} catch (Exception e) {
			result = "ERROR";
			message = e.getMessage();
			System.err.println(e.getMessage());
			System.out.println("error listing"+e);
		}
		return "success";
	}
	


	/*
	public String delete()
	{
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			
			record = new IrwisHrPltcalM();
			IrwisHrPltcalMId id=new IrwisHrPltcalMId();
			
			int yr;
			if(!("".equals(calHodyDate)))
			{
				
				Date calHody_Date = df.parse(calHodyDate);
				id.setCalHodyDate(calHody_Date);
			
				 Calendar calDate = Calendar.getInstance();   // this takes current date
				 calDate.setTime(calHody_Date);
				 yr=calDate.get(Calendar.YEAR);
				 id.setCalYr(yr);
			}
			id.setPcalId(org_SlNo);
			id.setHodyCode(hodyCode);
			//record1 = new IrwisRsInT();
			record.setId(id);
			
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			irwisHrHolidayCalenderDao.deleteHolidayDate(record);
			result="OK";
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result = "ERROR";
			message = e.getMessage();
			e.printStackTrace();
			return "error";
		}
	}
	
	*/
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

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	

	

	

	
	public List<IrwisHrPltLieuCalM> getRecords() {
		return records;
	}



	public void setRecords(List<IrwisHrPltLieuCalM> records) {
		this.records = records;
	}



	public IrwisHrPltLieuCalM getRecord() {
		return record;
	}



	public void setRecord(IrwisHrPltLieuCalM record) {
		this.record = record;
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

	public boolean isRes() {
		return res;
	}

	public void setRes(boolean res) {
		this.res = res;
	}
	
}

