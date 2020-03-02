package ACTION;

import java.util.Calendar;

import hib.dao.hr.IrwisHrHolidayFinancialCalenderDao;

public class DashboardAction {

	double totalWorkingDays;
	double currentWorkingDays;
	
	double totalWorkingDaysJan_action;
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

	
	public double[] dash_board_FOR_BIRT()    //used by navin under financial year working day
	{
		double workingdays[] = new double[2];
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);	
		int current_year= cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH);
		if (month<3)
		{
			current_year=current_year-1;
		}
					   
	   
	    Calendar syscal = Calendar.getInstance();
	 	  syscal.add(Calendar.DATE, -1);	
	    
	    
		IrwisHrHolidayFinancialCalenderDao irwisHrHolidayFinancialCalenderDao=new IrwisHrHolidayFinancialCalenderDao();
		
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,3,3);
		totalWorkingDaysApr=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(current_year,4,3);
		totalWorkingDaysMay=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,5,3);
		totalWorkingDaysJun=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(current_year,6,3);
		totalWorkingDaysJul=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,7,3);
		totalWorkingDaysAug=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(current_year,8,3);
		totalWorkingDaysSep=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,9,3);
		totalWorkingDaysOct=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(current_year,10,3);
		totalWorkingDaysNov=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,11,3);
		totalWorkingDaysDec=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
         
		cal.set(current_year+1,0,3);	
		totalWorkingDaysJan_action=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year+1,1,3);
		totalWorkingDaysFeb=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDaysFeb=totalWorkingDaysJan+irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(syscal.getTime());
		
		cal.set(current_year+1,2,3);
		totalWorkingDaysMar=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());		
		
		currentWorkingDays=irwisHrHolidayFinancialCalenderDao.getCurrentWorkingDaysUptoPositionDateYearly(syscal.getTime());
		
		
totalWorkingDays=totalWorkingDaysJan_action+totalWorkingDaysFeb+totalWorkingDaysMar+totalWorkingDaysApr+
					totalWorkingDaysMay+totalWorkingDaysJun+totalWorkingDaysJul+totalWorkingDaysAug+
					totalWorkingDaysSep+totalWorkingDaysOct+totalWorkingDaysNov+totalWorkingDaysDec;
		
workingdays[0]=totalWorkingDays;
workingdays[1]=currentWorkingDays;
		return workingdays;
	}
	
	
		
	public String dash_board()    //used by navin under financial year working day
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);	
		int current_year= cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH);
		if (month<3)
		{
			current_year=current_year-1;
		}
					   
	   
	    Calendar syscal = Calendar.getInstance();
	 	  syscal.add(Calendar.DATE, -1);	
	    
	    
		IrwisHrHolidayFinancialCalenderDao irwisHrHolidayFinancialCalenderDao=new IrwisHrHolidayFinancialCalenderDao();
		
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,3,3);
		totalWorkingDaysApr=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(current_year,4,3);
		totalWorkingDaysMay=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,5,3);
		totalWorkingDaysJun=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(current_year,6,3);
		totalWorkingDaysJul=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,7,3);
		totalWorkingDaysAug=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(current_year,8,3);
		totalWorkingDaysSep=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,9,3);
		totalWorkingDaysOct=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		
		cal.set(current_year,10,3);
		totalWorkingDaysNov=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year,11,3);
		totalWorkingDaysDec=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
         
		cal.set(current_year+1,0,3);	
		totalWorkingDaysJan_action=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(current_year+1,1,3);
		totalWorkingDaysFeb=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDaysFeb=totalWorkingDaysJan+irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(syscal.getTime());
		
		cal.set(current_year+1,2,3);
		totalWorkingDaysMar=irwisHrHolidayFinancialCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());		
		
		currentWorkingDays=irwisHrHolidayFinancialCalenderDao.getCurrentWorkingDaysUptoPositionDateYearly(syscal.getTime());
		
		
totalWorkingDays=totalWorkingDaysJan_action+totalWorkingDaysFeb+totalWorkingDaysMar+totalWorkingDaysApr+
					totalWorkingDaysMay+totalWorkingDaysJun+totalWorkingDaysJul+totalWorkingDaysAug+
					totalWorkingDaysSep+totalWorkingDaysOct+totalWorkingDaysNov+totalWorkingDaysDec;
		
		
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


}
