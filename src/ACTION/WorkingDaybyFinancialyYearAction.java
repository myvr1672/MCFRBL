package ACTION;

import java.util.Calendar;

import hib.dao.hr.IrwisHrHolidayCalenderDao;
import hib.dao.hr.IrwisHrHolidayFinancialCalenderDao;

public class WorkingDaybyFinancialyYearAction {
	
	double totalWorkingDays;
	double currentWorkingDays;
	
	double totalWorkingDaysJan_action;
	public String getFinancialyear() {
		return financialyear;
	}


	public void setFinancialyear(String financialyear) {
		this.financialyear = financialyear;
	}

	double totalWorkingDaysFeb;
	private double totalWorkingDaysMar;
	private double totalWorkingDaysApr;
	private double totalWorkingDaysMay;
	private double totalWorkingDaysJun;
	private double totalWorkingDaysJul;
	private double totalWorkingDaysAug;
	private double totalWorkingDaysSep;
	private double totalWorkingDaysOct;
	private double totalWorkingDaysNov;
	private double totalWorkingDaysDec;
	String financialyear;
	private int yr;
	
		
	public String getWorkingDayByFinancialYear()    //used by navin under financial year working day
	{
		yr=Integer.parseInt(financialyear.substring(2, 4));
		yr1=yr+1;
		int y= Integer.parseInt(financialyear.substring(0, 4));
		//System.out.println("Hello Year:"+y);
		Calendar cal = Calendar.getInstance();
		int current_year= cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH);
		if (month<3)
		{
			current_year=current_year-1;
		}
						   
	    if (y==current_year)
	    {
	    	cal.add(Calendar.DATE, -1);	
	    }
		
	    Calendar syscal = Calendar.getInstance();
	    if (y==current_year)
	    {
	    	syscal.add(Calendar.DATE, -1);	
	    }
	    
	    
		IrwisHrHolidayFinancialCalenderDao irwisHrHolidayFinancialCalenderDao=new IrwisHrHolidayFinancialCalenderDao();
	    IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(y,3,3);
		totalWorkingDaysApr=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(y,4,3);
		totalWorkingDaysMay=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(y,5,3);
		totalWorkingDaysJun=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(y,6,3);
		totalWorkingDaysJul=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(y,7,3);
		totalWorkingDaysAug=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(y,8,3);
		totalWorkingDaysSep=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(y,9,3);
		totalWorkingDaysOct=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(y,10,3);
		totalWorkingDaysNov=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(y,11,3);
		totalWorkingDaysDec=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
         
		cal.set(y+1,0,3);	
		totalWorkingDaysJan_action=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(y+1,1,3);
		totalWorkingDaysFeb=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDaysFeb=totalWorkingDaysJan+irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(syscal.getTime());
		
		cal.set(y+1,2,3);
		totalWorkingDaysMar=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());		
		
		totalWorkingDays=totalWorkingDaysJan_action+totalWorkingDaysFeb+totalWorkingDaysMar+totalWorkingDaysApr+
				totalWorkingDaysMay+totalWorkingDaysJun+totalWorkingDaysJul+totalWorkingDaysAug+
				totalWorkingDaysSep+totalWorkingDaysOct+totalWorkingDaysNov+totalWorkingDaysDec;
		if (y==current_year)
		{
		currentWorkingDays=irwisHrHolidayFinancialCalenderDao.getCurrentWorkingDaysUptoPositionDateYearly(syscal.getTime());
		}
		if (y>current_year) {
			currentWorkingDays=0;
		}
		if(y<current_year) {
			currentWorkingDays=totalWorkingDaysJan_action+totalWorkingDaysFeb+totalWorkingDaysMar+totalWorkingDaysApr+
					totalWorkingDaysMay+totalWorkingDaysJun+totalWorkingDaysJul+totalWorkingDaysAug+
					totalWorkingDaysSep+totalWorkingDaysOct+totalWorkingDaysNov+totalWorkingDaysDec;
		}
		
		return "success";
	}
	
	
	public double getTotalWorkingDaysJan_action() {
		return totalWorkingDaysJan_action;
	}

	public void setTotalWorkingDaysJan_action(double totalWorkingDaysJan_action) {
		this.totalWorkingDaysJan_action = totalWorkingDaysJan_action;
	}

	public double getTotalWorkingDays() {
		return totalWorkingDays;
	}

	public void setTotalWorkingDays(double totalWorkingDays) {
		this.totalWorkingDays = totalWorkingDays;
	}

	public double getCurrentWorkingDays() {
		return currentWorkingDays;
	}

	public void setCurrentWorkingDays(double currentWorkingDays) {
		this.currentWorkingDays = currentWorkingDays;
	}

	
	public double getTotalWorkingDaysFeb() {
		return totalWorkingDaysFeb;
	}

	public void setTotalWorkingDaysFeb(double totalWorkingDaysFeb) {
		this.totalWorkingDaysFeb = totalWorkingDaysFeb;
	}

	
	public double getTotalWorkingDaysDec() {
		return totalWorkingDaysDec;
	}

	public void setTotalWorkingDaysDec(double totalWorkingDaysDec) {
		this.totalWorkingDaysDec = totalWorkingDaysDec;
	}

	public double getTotalWorkingDaysNov() {
		return totalWorkingDaysNov;
	}

	public void setTotalWorkingDaysNov(double totalWorkingDaysNov) {
		this.totalWorkingDaysNov = totalWorkingDaysNov;
	}

	public double getTotalWorkingDaysOct() {
		return totalWorkingDaysOct;
	}

	public void setTotalWorkingDaysOct(double totalWorkingDaysOct) {
		this.totalWorkingDaysOct = totalWorkingDaysOct;
	}

	public double getTotalWorkingDaysSep() {
		return totalWorkingDaysSep;
	}

	public void setTotalWorkingDaysSep(double totalWorkingDaysSep) {
		this.totalWorkingDaysSep = totalWorkingDaysSep;
	}

	public double getTotalWorkingDaysAug() {
		return totalWorkingDaysAug;
	}

	public void setTotalWorkingDaysAug(double totalWorkingDaysAug) {
		this.totalWorkingDaysAug = totalWorkingDaysAug;
	}

	public double getTotalWorkingDaysJul() {
		return totalWorkingDaysJul;
	}

	public void setTotalWorkingDaysJul(double totalWorkingDaysJul) {
		this.totalWorkingDaysJul = totalWorkingDaysJul;
	}

	public double getTotalWorkingDaysJun() {
		return totalWorkingDaysJun;
	}

	public void setTotalWorkingDaysJun(double totalWorkingDaysJun) {
		this.totalWorkingDaysJun = totalWorkingDaysJun;
	}

	public double getTotalWorkingDaysMay() {
		return totalWorkingDaysMay;
	}

	public void setTotalWorkingDaysMay(double totalWorkingDaysMay) {
		this.totalWorkingDaysMay = totalWorkingDaysMay;
	}

	public double getTotalWorkingDaysApr() {
		return totalWorkingDaysApr;
	}

	public void setTotalWorkingDaysApr(double totalWorkingDaysApr) {
		this.totalWorkingDaysApr = totalWorkingDaysApr;
	}

	public double getTotalWorkingDaysMar() {
		return totalWorkingDaysMar;
	}

	public void setTotalWorkingDaysMar(double totalWorkingDaysMar) {
		this.totalWorkingDaysMar = totalWorkingDaysMar;
	}

	public int getYr() {
		return yr;
	}


	public void setYr(int yr) {
		this.yr = yr;
	}


	public int getYr1() {
		return yr1;
	}


	public void setYr1(int yr1) {
		this.yr1 = yr1;
	}

	private int yr1;
	

}
