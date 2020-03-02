package struts.action.master;


import java.util.ArrayList;

import java.util.List;

import beans.IrwisHrPubhodyM;


import hib.dao.hr.IrwisHrHolidayCalenderDao;


public class HolidayAction {
	
	List<IrwisHrPubhodyM> holidayList= new ArrayList<IrwisHrPubhodyM>();
	List<IrwisHrPubhodyM> holidayDescList= new ArrayList<IrwisHrPubhodyM>();
	
	String holiday_code;
	public String getHolidayCodesAndNames()
	{
		try {
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			
			holidayList=irwisHrHolidayCalenderDao.getHolidayCodesAndNames();
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	
	
	
	public String getHolidayNameByCode()
	{
		try {
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			
			holidayDescList=irwisHrHolidayCalenderDao.getHolidayNameByCode(holiday_code);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public List<IrwisHrPubhodyM> getHolidayList() {
		return holidayList;
	}

	public void setHolidayList(List<IrwisHrPubhodyM> holidayList) {
		this.holidayList = holidayList;
	}


	public String getHoliday_code() {
		return holiday_code;
	}


	public void setHoliday_code(String holiday_code) {
		this.holiday_code = holiday_code;
	}


	public List<IrwisHrPubhodyM> getHolidayDescList() {
		return holidayDescList;
	}


	public void setHolidayDescList(List<IrwisHrPubhodyM> holidayDescList) {
		this.holidayDescList = holidayDescList;
	}

	
	


	
}

