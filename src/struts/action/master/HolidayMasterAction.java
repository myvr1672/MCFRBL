package struts.action.master;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;


import com.opensymphony.xwork2.ActionContext;


import beans.IrwisHrPltcalM;
import beans.IrwisHrPltcalMId;


import hib.dao.hr.IrwisHrHolidayCalenderDao;
public class HolidayMasterAction {
	Map session_map=ActionContext.getContext().getSession();
		String  org_SlNo = "RBL";
	String  userOrgType = (String)session_map.get("userOrgType");
	
	
private List<IrwisHrPltcalM> records = new ArrayList<IrwisHrPltcalM>();
	

private String calHodyDate;
private String hodyCode;
	
	private String result;
	private String message;
	private String jtStartIndex;
	private String jtPageSize;
	
	private String jtSorting;
	private IrwisHrPltcalM record;
	Calendar cal = Calendar.getInstance();
    int yr= cal.get(Calendar.YEAR);
    int month;
	String monthInMMM;
	
	String year=Integer.toString(yr);
	

	
	public String list()
	{
		try {
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			
			records=irwisHrHolidayCalenderDao.getHolidayDates(org_SlNo, Integer.parseInt(year),jtSorting);
			result="OK";
			return "success";
			
		} catch (Exception e) {
			result = "ERROR";
			message = e.getMessage();
			System.err.println(e.getMessage());
			System.out.println("error listing"+e);
			return "error";
		}
		
	}
	
	public String create()
	{
		try {
			 
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			if(!("".equals(calHodyDate)))
			{
				
				Date calHody_Date = df.parse(calHodyDate);
				
		    
				 Calendar calDate = Calendar.getInstance();   // this takes current date
				 calDate.setTime(calHody_Date);
				   yr=calDate.get(Calendar.YEAR);
			}
			
			
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			boolean res=irwisHrHolidayCalenderDao.isFestivalAvailableInCalendarYear(org_SlNo,hodyCode,yr);
			if(res==false)
			{
				Date calHody_Date = df.parse(calHodyDate);
		 //code added by navin
				String checkholidayDate=irwisHrHolidayCalenderDao.checkHolidayOnEnterDate(calHody_Date);
				if(checkholidayDate.equals("false"))
				{
		//End of navin code
			record = new IrwisHrPltcalM();
			IrwisHrPltcalMId id=new IrwisHrPltcalMId();
			
			int yr=0;
			if(!("".equals(calHodyDate)))
			{
				
				 calHody_Date = df.parse(calHodyDate);
				id.setCalHodyDate(calHody_Date);

		    
				 Calendar calDate = Calendar.getInstance();   // this takes current date
				 calDate.setTime(calHody_Date);
				   yr=calDate.get(Calendar.YEAR);
	   month=calDate.get(Calendar.MONTH);
	   month=month+1;

	   monthInMMM=  new SimpleDateFormat("MMM").format(calDate.getTime()).toUpperCase();
				 
				 id.setCalYr(yr);
			}
			id.setPcalId(org_SlNo);
			id.setHodyCode(hodyCode);
			//record1 = new IrwisRsInT();
			record.setCalMonthCode(month);
			record.setCalMonthDesc(monthInMMM);
			record.setId(id);
			
			
			
			irwisHrHolidayCalenderDao.createHolidayDate(record);
			result="OK";
			}
				else
				{
					//String holidayDesc=irwisHrHolidayCalenderDao.getHolidayNameByCode(hodyCode).get(0).getHodyDesc();
					message="Festival "+checkholidayDate+" already exist for selected Date";
					result="ERROR";	
				}
			}
			else
			{
				String holidayDesc=irwisHrHolidayCalenderDao.getHolidayNameByCode(hodyCode).get(0).getHodyDesc();
				
				
				message="Festival "+holidayDesc+" already exist in "+yr;
				result="ERROR";
			}
			
			
			
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result = "ERROR";
			message = e.getMessage();
			e.printStackTrace();
			return "error";
		}
	}
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
	
	public List<IrwisHrPltcalM> getRecords() {
		return records;
	}

	public void setRecords(List<IrwisHrPltcalM> records) {
		this.records = records;
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

	public String getJtStartIndex() {
		return jtStartIndex;
	}

	public void setJtStartIndex(String jtStartIndex) {
		this.jtStartIndex = jtStartIndex;
	}

	public String getJtPageSize() {
		return jtPageSize;
	}

	public void setJtPageSize(String jtPageSize) {
		this.jtPageSize = jtPageSize;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	

	public IrwisHrPltcalM getRecord() {
		return record;
	}

	public void setRecord(IrwisHrPltcalM record) {
		this.record = record;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getOrg_SlNo() {
		return org_SlNo;
	}

	public void setOrg_SlNo(String org_SlNo) {
		this.org_SlNo = org_SlNo;
	}
	
	
}

