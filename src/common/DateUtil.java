package common;

import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;


 
public class DateUtil {
 
    // List of all date formats that we want to parse.
    // Add your own format here.
    private static List<SimpleDateFormat> dateFormats = new ArrayList<SimpleDateFormat>() {{
    		add(new SimpleDateFormat("dd-MM-yyyy HH:mm:ss"));
    		add(new SimpleDateFormat("dd-MM-yyyy HH:mm"));
    		add(new SimpleDateFormat("dd/MM/yyyy HH:mm"));
    		add(new SimpleDateFormat("HH:mm"));
    		//below line commented by siddhartha on 02 Jan 2016 20:14 as date and month were reversed while saving date
            //add(new SimpleDateFormat("MM/dd/yyyy"));
            add(new SimpleDateFormat("dd/MM/yyyy"));
            add(new SimpleDateFormat("dd-MM-yyyy"));
            add(new SimpleDateFormat("yyyy/MM/dd"));
            add(new SimpleDateFormat("yyyy-MM-dd"));
            add(new SimpleDateFormat("dd.MM.yy"));
            add(new SimpleDateFormat("MM/yyyy"));
           
            /*add(new SimpleDateFormat("dd.M.yyyy"));
            add(new SimpleDateFormat("M/dd/yyyy hh:mm:ss a"));
            add(new SimpleDateFormat("dd.M.yyyy hh:mm:ss a"));
            add(new SimpleDateFormat("dd.MMM.yyyy"));
            add(new SimpleDateFormat("dd-MMM-yyyy"));
            "MM/dd/yyyy"
            */
           
        }
    };
  
    
 //SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
    /**
     * Convert String with various formats into java.util.Date
     * 
     * @param input
     *            Date as a string
     * @return java.util.Date object if input string is parsed 
     *          successfully else returns null
     */
    public static Date convertToDate(String input) {
        Date date = null;
        if(null == input) {
            return null;
        }
        for (SimpleDateFormat format : dateFormats) {
            try {
                format.setLenient(false);
                date = format.parse(input);
            } catch (ParseException e) {
                //Shhh.. try other formats
            }
            if (date != null) {
            	System.out.println(format);
                break;
            }
        }
 
        return date;
    }
    public static Long convertToLong(String input) {
    	Long llong = null;
        if(null == input) {
            return null;
        }
        
        else
        {
         try {
                //format.setLenient(false);
                llong = Long.parseLong(input);
            } 
         catch (Exception e) {
                
            }
            
        }
 
        return llong;
    }
    public static short convertToshort(String input) {
    	short shrt = (Short) null;
        if(null == input) {
            return (Short) null;
        }
        
        else
        {
         try {
                //format.setLenient(false);
        	 shrt = Short.parseShort(input);
            } 
         catch (Exception e) {
                
            }
            
        }
        return shrt;
        
    }  
    
    //short s = Short.parseShort(str);
    
       
    
    public static String convertDateToString(Date indate, String format) //ADDED by Siddhartha/cris on 01 Dec 2017
    {
    	if(null == indate) {
            return "";
        } 
    	 String dateString = null;
    	   SimpleDateFormat sdfr = new SimpleDateFormat(format);//"dd/MMM/yyyy");
    	   /*you can also use DateFormat reference instead of SimpleDateFormat 
    	    * like this: DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
    	    */
    	   try{
    		dateString = sdfr.format( indate );
    	   }catch (Exception ex ){
    		System.out.println(ex);
    	   }
    	   return dateString;
    }
    
    public static String getYearFromDate(Date date){
    	if(date==null) return "";
    	
    	Calendar calendar = new GregorianCalendar();
    	calendar.setTime(date);
    	int year = calendar.get(Calendar.YEAR);
    	//Add one to month {0 - 11}
    	//int month = calendar.get(Calendar.MONTH) + 1;
    	//int day = calendar.get(Calendar.DAY_OF_MONTH);
    	return Integer.toString(year);
    }
    
    public static String getMonthForInt(int num) {
        String month = "wrong";
        DateFormatSymbols dfs = new DateFormatSymbols();
        String[] months = dfs.getShortMonths();
        if (num >= 0 && num <= 11 ) {
            month = months[num];
        }
        return month;
    }
    public static Date getDateWithoutTime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static Date getDateEndTime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static Date yesterday() {
	    final Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DATE, -1);
	    System.out.println(cal.getTime());
	    return cal.getTime();
	}
    
    public static Date getTomorrowDate(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, 1);
        return cal.getTime();
    }
    public static Date currentDate() {
	    final Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DATE, 0);
	    System.out.println(cal.getTime());
	    return cal.getTime();
	}
    public static Date tomorrowDate() {
        final Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DATE, 1);
	    System.out.println(cal.getTime());
	    return cal.getTime();
    }
}