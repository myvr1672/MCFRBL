<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="dao.*" %>
    
    <% String contextpath=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>List Of Employees</title>

</head>
<body style="background-color:yellow";>
<table>
<tr>
<td>
<%
DbConnection db=new DbConnection();
Connection con=db.getConnection();
String shi=request.getParameter("shift");
String sub_section1=request.getParameter("count");
String buffer ="<table class='table table-hover'><tr><th>EMP ID</th><th>EMP NAME</th><th colspan='4'>Mark Absentee in a Section</th></tr>";
try{
	int i=1;	
	

	Statement stmt= con.createStatement();
	//String query=("select a.emp_no,a.emp_name,b.shift_id from public.emp_master a join  public.shift_roaster_transaction b on a.emp_no=b.emp_id where (sub_section,shift_id)=('"+(sub_section1)+"','"+(shi)+"')");
	String q=("select a.emp_no,a.emp_name,b.shift_id from public.emp_master a join  public.shift_roaster_transaction b on a.emp_no=b.emp_id where sub_section='"+(sub_section1)+"' and shift_id='"+(shi)+"'");
			System.out.println(q);
	ResultSet rs = stmt.executeQuery(q);

	
	
	while(rs.next())
	{
		String emp_id =rs.getString("emp_no");
		//System.out.println(emp_id);
		String emp_name =rs.getString("emp_name");
		String shift_id =rs.getString("shift_id");
		
		
		Integer f=1;
		Integer s=2;
		Integer fu=3;
		Integer n=4;
		
		
		buffer = buffer+"<tr><td>"+rs.getString("emp_no")+"</td><td>"+rs.getString("emp_name")+"</td>";
		//buffer = buffer+"<td><select name='reason' id='reason'><option disabled selected>Select Absent Reason</option><option value='leave'>Leave</option><option value='sick'>Sick</option><option value='OD'>OD</option><option value='IOD'>IOD</option><option value='absent'>Absent</option></select></td>";
		buffer = buffer+"<td><input type='radio' value='first' name='shift"+i+"' onclick='javascript:absentee(\""+emp_id+"\",\""+shift_id+"\","+f+")'/>First Half</td>";
		buffer = buffer+"<td><input type='radio' value='second' name='shift"+i+"' onclick='javascript:absentee(\""+emp_id+"\",\""+shift_id+"\","+s+")'/>Second Half</td>";
		buffer = buffer+"<td><input type='radio' value='full' name='shift"+i+"' onclick='javascript:absentee(\""+emp_id+"\",\""+shift_id+"\","+fu+")' />Full </td>";
		buffer = buffer+"<td><input type='radio' value='none' name='shift"+i+"' onclick='javascript:absentee(\""+emp_id+"\",\""+shift_id+"\","+n+")' checked/> None</td></tr>";	
		
		i++;
	}
	//System.out.println("Option Value"+buffer);
	buffer=buffer+"</table>";
	response.getWriter().println(buffer);
}

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