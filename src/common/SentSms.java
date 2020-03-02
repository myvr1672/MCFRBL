package common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
public class SentSms {

	
	public void sentSms(String phone,String content)
	{
	try
	{

	 // Send data
	content=content.replaceAll(" ", "%20");
	 HttpURLConnection conn = (HttpURLConnection) new URL("http://122.176.77.205:8081/jinvani/SendMessegeServlet?uname=RCRBPY&passwd=rcrbpy@123&text="+content+"&msisdn="+phone+"&mode=Txt").openConnection();
	 conn.setDoOutput(true);
	 conn.setRequestMethod("GET");
	 
	 final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	 final StringBuffer stringBuffer = new StringBuffer();
	 String line;
	 while ((line = rd.readLine()) != null) {
	     stringBuffer.append(line);
	 }
	 rd.close();
	 System.out.println("message send successfully");
	 //return stringBuffer.toString();
	} catch (Exception e) 
	{
	System.out.println(e.getMessage());
	}
	  }



	 

	public void sentBulkSms(String phone[],String content)
	{
	int i;
	content=content.replaceAll(" ", "%20");
	for(i=0;i<phone.length;i++)
	{

	try
	{

	 // Send data

	 HttpURLConnection conn = (HttpURLConnection) new URL("http://122.176.77.205:8081/jinvani/SendMessegeServlet?uname=RCRBPY&passwd=rcrbpy@123&text="+content+"&msisdn="+phone[i]+"&mode=Txt").openConnection();
	 conn.setDoOutput(true);
	 conn.setRequestMethod("GET");
	 
	 final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	 final StringBuffer stringBuffer = new StringBuffer();
	 String line;
	 while ((line = rd.readLine()) != null) {
	     stringBuffer.append(line);
	 }
	 rd.close();
	 System.out.println("message send successfully");
	 //return stringBuffer.toString();
	} catch (Exception e) 
	{
	System.out.println(e.getMessage());
	}
	}

	}


}
