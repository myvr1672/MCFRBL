<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
     <%@page import="java.util.Date" %>
      <%@page import="java.time.LocalDate" %>
      <%@page import="java.text.SimpleDateFormat" %>
      <%@page import="dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<%
DbConnection db=new DbConnection();
Connection conn=db.getConnection();
System.out.println("hhhhhhh");
String eno=request.getParameter("eno");
System.out.println("Employee Number"+eno);
String subsection="fffffffff";
String dd =request.getParameter("dd");
System.out.println(dd);
String sh=request.getParameter("ss");
//String m="1";
//String g="2";
//String ev="3";
//String n="4";
//String s="5";
String s1="1";
String s2="2";
String g="3";
String s3="4";
String n="5";
String shift=null;
if(sh.equals(s1)){

	 shift="Shift-1";
}
if(sh.equals(s2)){

	 shift="Shift-2";
}
if(sh.equals(g)){

	 shift="general";
}
if(sh.equals(s3)){

	 shift="Shift-3";
}
if(sh.equals(n)){

	 shift="none";
}
System.out.println(eno);
System.out.println(shift);
try
{
	

if ( dd==null || dd=="")
{
	String buffer="<b>****Please select a Date****</b><br/><br/><br/>";
		
	 System.out.println("Option Value"+buffer);
	response.getWriter().println(buffer);
}//end if
else
{

Statement stmt13= conn.createStatement();
String p13 ="SELECT  * FROM public.shift_roaster_transaction   where emp_id='"+eno+"' and validity_from='"+dd+"'";
System.out.println("Query:"+p13);
ResultSet rs5 = stmt13.executeQuery(p13);
if(!rs5.isBeforeFirst() )
{

	

Statement stmt1= conn.createStatement();
String p1 ="SELECT  validity_to FROM public.shift_roaster_history   where emp_id='"+eno+"' order by validity_to limit 1";
System.out.println("Query:"+p1);
ResultSet rs1 = stmt1.executeQuery(p1);
 if(!rs1.isBeforeFirst() )
 {
	 
	 
	 
	//  System.out.println("No data"); 
	 if(shift.equals("Shift-1")||shift.equals("general")||shift.equals("Shift-2")||shift.equals("Shift-3"))
	 {

		    Statement stmt2= conn.createStatement();
			String p2 ="select * from public.shift_roaster_transaction where emp_id='"+eno+"'";
			System.out.println("Query:"+p2);
			ResultSet rs2 = stmt2.executeQuery(p2);
			if(!rs2.isBeforeFirst() )
			{
				Statement stmt3= conn.createStatement();
			    System.out.println("No data");
			    String p3="Insert into public.shift_roaster_transaction (emp_id,shift_id,validity_from,entry_date) values('"+(eno)+"','"+shift+"','"+dd+"','"+java.time.LocalDate.now()+"') ";
				System.out.println("Query:"+p3);
				int i=stmt3.executeUpdate(p3);
				System.out.println("<b>Saved Successsfully</b>"); 
				String buffer="<b>****Success****</b><br/><br/><br/>";
				
				 System.out.println("Option Value"+buffer);
				response.getWriter().println(buffer);
			}//end if
			else
			{  
				while(rs2.next())
				{
					Statement stmt4= conn.createStatement();
					String p4 = "Insert into public.shift_roaster_history(emp_id,shift_id,validity_from,validity_to)values('"+rs2.getString(1)+"','"+rs2.getString(2)+"','"+rs2.getString(3)+"','"+dd+"')";
					System.out.println("Query:"+p4);
					int iii=stmt4.executeUpdate(p4);
					System.out.println("<b>Saved Successsfully</b>");
					
					Statement stmt5= conn.createStatement();
					String p5="update public.shift_roaster_transaction set shift_id='"+ shift +"' , validity_from='"+dd+"',entry_date='"+java.time.LocalDate.now()+"'  where emp_id='"+(eno)+"'";
					System.out.println("Query:"+p5);
				    int iiii=stmt5.executeUpdate(p5);
				    System.out.println("<b>Saved Successsfully</b>");
				    String buffer="<b>****Success****</b><br/><br/><br/>";
					
					 System.out.println("Option Value"+buffer);
					response.getWriter().println(buffer);
				   
				}
			}//end else
	 }//endif
	 else if(shift.equals("none"))
	 {
		 Statement stmt6= conn.createStatement();
			String p6="delete from public.shift_roaster_transaction where emp_id='"+(eno)+"'";
			System.out.println("Query:"+p6);
			int ii=stmt6.executeUpdate(p6);
			System.out.println("<b>removed Successsfully</b>"); 
			String buffer="<b>****Deleted****</b><br/><br/><br/>";
			
			 System.out.println("Option Value"+buffer);
			response.getWriter().println(buffer);
	 }//end else
 }//endif
 else
 {
	 while(rs1.next())
	 {
		     String d1 = (rs1.getString(1));
			 LocalDate dd1 = LocalDate.parse(d1);
			 LocalDate dd2 = LocalDate.parse(dd);
			 boolean isBefore = dd2.isBefore(dd1);
	         System.out.println(isBefore);
	         if(isBefore)
	         {
	        	 System.out.println("shift already alloted for this date");
				 Statement stmt7= conn.createStatement();
				 String p7 ="SELECT  * FROM public.shift_roaster_history   where emp_id='"+eno+"' order by validity_to limit 1";
				 System.out.println("Query:"+p1);
			 	 ResultSet rs3 = stmt7.executeQuery(p7);
			 	 while(rs3.next())
			 	 {
			 		 String a=rs3.getString(1);
			 		 String b=rs3.getString(2);
			 		 String c=rs3.getString(3);
			 		 String d=rs3.getString(4);
			 		 System.out.println(a);
			 		System.out.println(b);
			 		System.out.println(c);
			 		System.out.println(d);
			 		 //String buffer = "<input type='hidden' ,id='h1', value='employee with emp_id '"+a+"' is alloted '"+ b+"' from date '"+c +"' to date '"+ d+"' ' />";
			 		//String buffer="<table><tr><td><input type='hidden' ,id='h1', value='employee with emp_id '"+a+"' is alloted '"+ b+"' from date '"+c +"' to date '"+ d+"' ' /></td><tr></table>";
			 		String buffer="<b>****employee with emp_id '"+a+"' is alloted '"+ b+"' from date '"+c +"' to date '"+ d+"' ****</b><br/><br/>";
			 		
			 		 System.out.println("Option Value"+buffer);
			 		response.getWriter().println(buffer);
			 		System.out.println("jj");
			 	 }// end while
			 	
	         }//end if
	         else
	         {
	        	 if(shift.equals("Shift-1")||shift.equals("general")||shift.equals("Shift-2")||shift.equals("Shift-3"))
	        	 {
	        		 Statement stmt8= conn.createStatement();
						String p8 ="select * from public.shift_roaster_transaction where emp_id='"+eno+"'";
						System.out.println("Query:"+p8);
						ResultSet rs4 = stmt8.executeQuery(p8);
						if(!rs4.isBeforeFirst() )
						{    
						    //System.out.println("No data");
						    Statement stmt9= conn.createStatement();
						    String p9="Insert into public.shift_roaster_transaction (emp_id,shift_id,validity_from,entry_date) values('"+(eno)+"','"+shift+"','"+dd+"','"+java.time.LocalDate.now()+"') ";
							System.out.println("Query:"+p9);
							int i=stmt9.executeUpdate(p9);
							System.out.println("<b>Saved Successsfully</b>"); 
							String buffer="<b>****Success****</b><br/><br/><br/>";
							
							 System.out.println("Option Value"+buffer);
							response.getWriter().println(buffer);
						}//end if
						else
						{
							while(rs4.next())
							{
								Statement stmt10= conn.createStatement();
								String p10="update public.shift_roaster_history set shift_id='"+rs4.getString(2)+"',validity_from='"+rs4.getString(3)+"',validity_to='"+dd+"'  where emp_id='"+eno+"'";
								System.out.println("Query:"+p10);
								int iii=stmt10.executeUpdate(p10);
								System.out.println("<b>Saved Successsfully</b>");
								
								Statement stmt11= conn.createStatement();
								String p11="update public.shift_roaster_transaction set shift_id='"+ shift +"' , validity_from='"+dd+"',entry_date='"+java.time.LocalDate.now()+"'  where emp_id='"+(eno)+"'";
								System.out.println("Query:"+p11);
								int iiii=stmt11.executeUpdate(p11);
								System.out.println("<b>Saved Successsfully</b>");
								String buffer="<b>****Success****</b><br/><br/><br/>";
								
								 System.out.println("Option Value"+buffer);
								response.getWriter().println(buffer);
								
							}// end while
						}//end else
	        	 }// emdif
	        	 else if(shift.equals("none"))
	        	 {
	        		 Statement stmt12= conn.createStatement();
						String p12="delete from public.shift_roaster_transaction where emp_id='"+(eno)+"'";
						System.out.println("Query:"+p12);
						int ii=stmt12.executeUpdate(p12);
						System.out.println("<b>removed Successsfully</b>");
						String buffer="<b>****Deleted****</b><br/><br/><br/>";
						
						 System.out.println("Option Value"+buffer);
						response.getWriter().println(buffer);
	        	 }// end else
	         }// end else
	 }//end while
 }//end else
}//end if
else
{
	while(rs5.next())
	{
		if(shift.equals("Shift-1")||shift.equals("general")||shift.equals("Shift-2")||shift.equals("Shift-3"))
		{
		String a=rs5.getString(1);
		 String b=rs5.getString(2);
		String buffer="<b>****employee with  emp_id '"+a+"' is alloted '"+ b +"' shift  on this date  ****</b><br/><br/><br/>";
		
		response.getWriter().println(buffer);
		}
		if(shift.equals("none"))
   	 {
   		 Statement stmt14= conn.createStatement();
				String p14="delete from public.shift_roaster_transaction where emp_id='"+(eno)+"'";
				System.out.println("Query:"+p14);
				int ii=stmt14.executeUpdate(p14);
				System.out.println("<b>removed Successsfully</b>");
				String buffers="<b>****Deleted****</b><br/><br/><br/>";
				
				 System.out.println("Option Value"+buffers);
				response.getWriter().println(buffers);
   	 }// end else
	}
	
}//endelse
}//end else

}//end try
catch(Exception e)
{
	System.out.println(e);
}// end catch
finally
{
	conn.close();
}
 %>
</body>
</html>