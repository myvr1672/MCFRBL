package ACTION;


import java.util.Calendar;


import hib.dao.hr.IrwisHrHolidayCalenderDao;


public class WorkingDayAction {
	
	double totalWorkingDays;
	double currentWorkingDays;
	double totalWorkingDaysJan;
	double totalWorkingDaysJan_action;
	double totalWorkingDaysFeb;
	double currentWorkingDaysFeb;
	private double totalWorkingDaysDec;
	private double totalWorkingDaysNov;
	private double totalWorkingDaysOct;
	private double totalWorkingDaysSep;
	private double totalWorkingDaysAug;
	private double totalWorkingDaysJul;
	private double totalWorkingDaysJun;
	private double totalWorkingDaysMay;
	private double totalWorkingDaysApr;
	private double totalWorkingDaysMar;
	String year;
	
	
	
	public String working_days()
	{
		
			Calendar cal = Calendar.getInstance();
//			cal.set(2018, 4, 2);
						
		    cal.add(Calendar.DATE, -1);
		    Calendar syscal = Calendar.getInstance();
		    
			IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
			//totalWorkingDays=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDateYearly(syscal.getTime());
			
			cal.set(2018,0,3);
			totalWorkingDaysJan=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
			
			
			
			cal.set(2018,1,3);
			totalWorkingDaysFeb=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			//currentWorkingDaysFeb=totalWorkingDaysJan+irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(syscal.getTime());
			
			cal.set(2018,2,3);
			totalWorkingDaysMar=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
			
			
			
			cal.set(2018,3,3);
			totalWorkingDaysApr=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			
			cal.set(2018,4,3);
			totalWorkingDaysMay=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
			
			
			
			cal.set(2018,5,3);
			totalWorkingDaysJun=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			
			cal.set(2018,6,3);
			totalWorkingDaysJul=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
			
			
			
			cal.set(2018,7,3);
			totalWorkingDaysAug=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			
			cal.set(2018,8,3);
			totalWorkingDaysSep=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
			
			
			
			cal.set(2018,9,3);
			totalWorkingDaysOct=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			
			cal.set(2018,10,3);
			totalWorkingDaysNov=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
			
			
			
			cal.set(2018,11,3);
			totalWorkingDaysDec=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
			
					
			return "success";
		
	}
	
	public String getWorkingDayByYear()
	{
		int y=Integer.parseInt(year);
		
		Calendar cal = Calendar.getInstance();
				
	    //cal.add(Calendar.DATE, -1);
	    Calendar syscal = Calendar.getInstance();
	    syscal.add(Calendar.DATE,-1);
	    int current_year= syscal.get(Calendar.YEAR);
		if (y==current_year)
	    {
	    	cal.add(Calendar.DATE, -1);	
	    }
	//	y=2019;
		IrwisHrHolidayCalenderDao irwisHrHolidayCalenderDao=new IrwisHrHolidayCalenderDao();
		cal.set(y,0,3);	
		totalWorkingDaysJan_action=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(cal.getTime());
		
		
		
		cal.set(y,1,3);
		totalWorkingDaysFeb=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
		//currentWorkingDaysFeb=totalWorkingDaysJan+irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDate(syscal.getTime());
		
		cal.set(y,2,3);
		totalWorkingDaysMar=irwisHrHolidayCalenderDao.getTotalWorkingDaysOfMonth(cal.getTime());
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
         
		totalWorkingDays=totalWorkingDaysJan_action+totalWorkingDaysFeb+totalWorkingDaysMar+totalWorkingDaysApr+
				totalWorkingDaysMay+totalWorkingDaysJun+totalWorkingDaysJul+totalWorkingDaysAug+
				totalWorkingDaysSep+totalWorkingDaysOct+totalWorkingDaysNov+totalWorkingDaysDec;
		
		
		if (y==current_year)
		{
		currentWorkingDays=irwisHrHolidayCalenderDao.getCurrentWorkingDaysUptoPositionDateYearly(syscal.getTime());
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

	public double getTotalWorkingDaysJan() {
		return totalWorkingDaysJan;
	}

	public void setTotalWorkingDaysJan(double totalWorkingDaysJan) {
		this.totalWorkingDaysJan = totalWorkingDaysJan;
	}

	public double getTotalWorkingDaysFeb() {
		return totalWorkingDaysFeb;
	}

	public void setTotalWorkingDaysFeb(double totalWorkingDaysFeb) {
		this.totalWorkingDaysFeb = totalWorkingDaysFeb;
	}

	public double getCurrentWorkingDaysFeb() {
		return currentWorkingDaysFeb;
	}

	public void setCurrentWorkingDaysFeb(double currentWorkingDaysFeb) {
		this.currentWorkingDaysFeb = currentWorkingDaysFeb;
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}



	
	}

