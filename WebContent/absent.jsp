<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import= "java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
Connection con=db.getConnection();
//System.out.println("kjj");
LocalDate localDate = LocalDate.now();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
String date2=(localDate).format(dtf);
String emp_id=request.getParameter("emp_id");
String shift_id=request.getParameter("shift_id");
String sh=request.getParameter("ss");
String reason=request.getParameter("reason");
System.out.println(reason);
String f="1";
String s="2";
String fu="3";
String n="4";
String absent=null;

if(sh.equals(f)){

	absent="first_half";
}
if(sh.equals(s)){

	absent="second_half";
}
if(sh.equals(fu)){

	absent="full";
}
if(sh.equals(n)){

	 absent="none";
}
try{
	  

	if(absent.equals("first_half")||absent.equals("second_half")||absent.equals("full"))
	{
   // System.out.println("loi");
	Statement stmt= con.createStatement();				
	String query="Insert into public.employee_absent_transaction (emp_id,shift_id,absent_date,absent_type,entry_date,absent_reason) values('"+(emp_id)+"','"+(shift_id)+"','"+(date2)+"','"+(absent)+"','"+(date2)+"','"+(reason)+"')";
	//System.out.println(query);
	stmt.executeUpdate(query);
	// System.out.println("lo");
	
	
	
	 }
	}
	
	catch (Exception e)
	{
		System.out.println(e);
	} 
   
try{
	

	if(absent.equals("first_half")||absent.equals("second_half")||absent.equals("full"))
	{
   	Statement stmt= con.createStatement();
	String query=("Select emp_id,absent_date,absent_type from public.employee_absent_transaction  where (emp_id)='"+(emp_id)+"'");
    ResultSet rs = stmt.executeQuery(query);
      
    while(rs.next())
	{
    	String emp1_no =rs.getString("emp_id");
    	String date1 =rs.getString("absent_date");
    	String absent1 =rs.getString("absent_type");
    //	String reason1 =rs.getString("absent_reason");

    
    if(date1.equals(date2)&&emp1_no.equals(emp_id)&&!absent1.equals(absent)){
    	
      Statement stmt1= con.createStatement();
	  String q3=("Update public.employee_absent_transaction	set absent_type='"+(absent)+"' where (absent_date,emp_id)=('"+(date1)+"','"+(emp1_no)+"')");
	  stmt1.executeUpdate(q3);
    }
	 
	/*   if(date1.equals(date2)&&emp1_no.equals(emp_id)&&!reason1.equals(reason)){
		  
		  Statement stmt4= con.createStatement();
		  String q4=("Update public.employee_absent_transaction	set absent_reason='"+(reason)+"' where (absent_date,emp_id)=('"+(date1)+"','"+(emp1_no)+"')");
		  stmt4.executeUpdate(q4);  } */
	 
	  
}}

else{
         Statement stmt1= con.createStatement();
         String q3=("delete from public.employee_absent_transaction  where (absent_date,emp_id)=('"+(date2)+"','"+(emp_id)+"')");
	     stmt1.execute(q3);
	     
	    
}}

catch (Exception e)
{
	System.out.println(e);
} 


try  {		 
		 	Statement stmt= con.createStatement();
			String query=("Select emp_id,absent_date,absent_type,absent_reason from public.employee_absent_transaction  where (emp_id)='"+(emp_id)+"'");
		    ResultSet rs = stmt.executeQuery(query);
		    System.out.println("lolo");
		      
		    while(rs.next())
			{
		    	String emp1_no =rs.getString("emp_id");
		    	String date1 =rs.getString("absent_date");
		    	String absent1 =rs.getString("absent_type");
		    	String reason1 =rs.getString("absent_reason");
		    	
		    	
	 if(date1.equals(date2)&&emp1_no.equals(emp_id)&&!reason1.equals(reason)){ 
		 System.out.println("lolol");
		  Statement stmt4= con.createStatement();
		  String q4=("Update public.employee_absent_transaction	set absent_reason='"+(reason)+"' where (absent_date,emp_id)=('"+(date1)+"','"+(emp1_no)+"')");
		  stmt4.executeUpdate(q4);  
	 }
	
}}

catch (Exception e)
{
	System.out.println(e);
}


finally
{
	con.close();
}
%>
</body>
</html>