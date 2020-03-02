<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>     
<%@ page import="java.text.DateFormat" %>
<%@ page import ="java.text.ParseException" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date" %>
<%@ page import = "java.time.LocalDate" %>
<%@ page import="dao.*" %>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Present And Absent List</title>
<style>
.another
td,th{
text-align:center;
}
/*  #another  th, td {
  border: 2px solid black;
  border-collapse: collapse;
}
#another th, td {
  padding: 5px;
  text-align: center;    
}
#another tr:hover {background-color: #ddd;}  */
 
</style>
</head>
<body>

<form>
  <h3 style="text-align:center;">Present/Absent List</h3>
  <br><br>
  <h4>**Please Set All The Fields**</h4>
  <br><br>
<!--   <div class="container"> -->
<!-- <div class="row table-responsive"> -->
  <table >
  <tr>
  <td >
    <input id="date" type="date" name="date" value="" class="form-control" />
    </td>
    <td >
     <select name="abspst" class="form-control"  >
     <option value="" disabled selected>Select your option</option>
     <option value="absent">Absent</option>
     <option value="present">Present</option>
     </select>
     </td>
       
     <td >
     <select name="shift" class="form-control" onchange="this.form.submit()" >
     <option value="" disabled selected>Select the shift</option>
     <option value="morning">Shift-I</option>
     <option value="evening">Shift-II</option>
     <option value="night">Shift-III</option>
     <option value="general">General</option>
     </select>
      </td>
      
    
    
     </tr>
      </table>
     <br> <br>
<!--      </div> -->
<!--      </div> -->
</form>

<%
DbConnection db=new DbConnection();
Connection con=db.getConnection();
try{
	

int error=0;
String date = "2012-10-12";
if(request.getParameterMap().containsKey("date")!=false)
{
 date = request.getParameter("date");
 if(date.equals(""))
 {
	 date = "2012-10-12";	 
 }
 
}

String shift = "general";
if(request.getParameterMap().containsKey("shift")!=false)
{
 shift = request.getParameter("shift").toString();
}
String shiftdisp="General";
if(shift.equals("morning"))
{
	shiftdisp = "Shift-I";
}
else if(shift.equals("evening"))
{
	shiftdisp = "Shift-II";
}
else if(shift.equals("night"))
{
	shiftdisp = "Shift-III";
}
else if(shift.equals("general"))
{
	shiftdisp = "General";
}


/* String abstyp = "full";
if(request.getParameterMap().containsKey("abstyp")!=false)
{
 abstyp = request.getParameter("abstyp").toString();
}
 */

 LocalDate localDate = LocalDate.parse(date);
 String absent_typ= "";


String abspst = "null";
if(request.getParameterMap().containsKey("abspst")!=false)
{
 abspst=request.getParameter("abspst").toString();
}

Statement stmt= con.createStatement();

String abs = "null" ;
String full = "Full Shift";

if(date.equals("2012-10-12"))
{
	error=1;
}
	
 
if(abspst.equals("absent") && error!=1)
{
	%>
	<br><br>
	<p style="font-size:30px" align="center">List Of Employees Not Available In MCF On <%=localDate%> in <%=shiftdisp%></p>
	<br>
	<table style="width:50%" align="center" class="another" border="2">
	
	<tr>
  <th>EMPLOYEE ID</th>
  <th>EMOLOYEE NAME</th> 
  <th>REASON FOR NOT AVAILABLE</th> 
  </tr>

	<% 
	ResultSet rs = stmt.executeQuery("Select distinct t1.emp_no,t1.emp_name,t2.absent_type FROM public.emp_master AS t1 LEFT JOIN (select emp_id , absent_type from public.employee_absent_transaction WHERE public.employee_absent_transaction.absent_date='"+localDate+"' and public.employee_absent_transaction.shift_id='"+shift+"') AS t2 ON t1.emp_no = t2.emp_id WHERE t2.emp_id IS NOT NULL ");
	while(rs.next())
	{
		absent_typ = rs.getString(3);
		//System.out.println(absent_typ);
	
		if(absent_typ.equals("leave"))
		{
			absent_typ = "LEAVE";
		}
		else if(absent_typ.equals("sick"))
		{
			absent_typ = "SICK";
		}
		else if(absent_typ.equals("od"))
		{
			absent_typ = "ON DUTY";
		}
		else if(absent_typ.equals("iod"))
		{
			absent_typ = "IOD";
		}
		else if(absent_typ.equals("absent"))
		{
			absent_typ = "ABSENT";
		}
		%>
		
		<tr>
		<td> <%=rs.getInt(1)%>  </td>
		<td><%=rs.getString(2)%> </td>
		<td><%=absent_typ%> </td>
		</tr>
		
		<% 
	}
	%>
	</table>
	<% 
}

else if(abspst.equals("present") && error!=1)
{
	
	
%>
<br><br>
<p align="center" style="font-size:30px">List Of  Employees Present In MCF On <%=localDate%> In <%=shiftdisp%> </p>
<br>
	<table style="width:50%" align="center"  class="another" border="2">
	
	<tr>
  <th>EMPLOYEE ID</th>
  <th>EMOLOYEE NAME</th>   
   </tr>

	<% 
	
	ResultSet rs = stmt.executeQuery("SELECT t1.emp_no,t1.emp_name FROM public.emp_master as t1 LEFT JOIN (select public.employee_absent_transaction.emp_id,public.employee_absent_transaction.absent_type from public.employee_absent_transaction WHERE public.employee_absent_transaction.absent_date = '"+localDate+" ' and public.employee_absent_transaction.shift_id='"+shift+"') AS t2 ON t2.emp_id = t1.emp_no WHERE t2.emp_id IS  NULL ");
	
	while(rs.next())
	{
		
		%>
		
		 <tr>
		<td> <%=rs.getInt(1)%>  </td>
		<td> <%=rs.getString(2)%> </td>
		</tr>
		
		<% 
	}
	
	
	%>
	
	</table>
	<% 
}
}
catch(Exception e)
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