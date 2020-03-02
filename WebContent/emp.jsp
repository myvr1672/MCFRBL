<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
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
String eee=request.getParameter("count");

//String buffer =null;
//String buffer = "<select name='sectionID'><option value='-1'>Select Section</option>";
String buffer ="<table class='table table-hover table-bordered'> <tr><th>EMP NO</th><th>EMP NAME</th><th colspan='5'>SELECT SHIFT FOR ALLOTMENT </th></tr>";
int i=1;
try{
	
	System.out.println("pp");
	
	Statement stmt= con.createStatement();
	String query="select emp_no,emp_name from public.emp_master where sub_section='"+eee +"'";
	System.out.println("Query:"+query);
	ResultSet rs = stmt.executeQuery(query);

	
	while(rs.next())
	{
		String eno =rs.getString("emp_no");
		String ename=rs.getString("emp_name");
	
		//String url="Assignradio.jsp";
		//Integer m=1;   
		//Integer g=2;
		//Integer e=3;
		//Integer n=4;
		//Integer s=5;
		Integer s1=1;   
		Integer s2=2;
		Integer g=3;
		Integer s3=4;
		Integer n=5;
		
		buffer = buffer+"<tr><td>"+rs.getString("emp_no")+"</td><td>"+rs.getString("emp_name")+"</td>";
		buffer = buffer+"<td><input type='radio'  value='shift-1' name='shift"+i+"' onclick='addshift("+eno+","+s1+")'/>Shift-I</td>";
		buffer = buffer+"<td><input type='radio'  value='shift-2' name='shift"+i+"' onclick='addshift("+eno+","+s2+")'/> Shift-II</td>";
		buffer = buffer+"<td><input type='radio'  value='general' name='shift"+i+"' onclick='addshift("+eno+","+g+")'/> General</td>";
		buffer = buffer+"<td><input type='radio'  value='shift-3' name='shift"+i+"' onclick='addshift("+eno+","+s3+")'/> Shift-III</td>";
		buffer = buffer+"<td><input type='radio'  value='none' name='shift"+i+"' onclick='addshift("+eno+","+n+")'/> None</td>";
		//buffer = buffer+"<td><input type='radio' value='general' name='shift"+i+"' onclick='f2()'/> General</td>";
		//buffer = buffer+"<td><input type='radio' value='evening' name='shift"+i+"' onclick='f3()' /> Evening</td>"
		//buffer = buffer+"<td><input type='radio' value='none' name='shift"+i+"' onclick='f4()'/> None</td></tr>";
		//buffer = buffer+"<td><input type='hidden', value='shift"+i+"' id='tt'></td></tr>";
		i++;
	}
	System.out.println("Option Value"+buffer);
	buffer=buffer+"</table>";
	response.getWriter().println(buffer);
	System.out.println("jjj");
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