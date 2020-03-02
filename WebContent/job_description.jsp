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
String job=request.getParameter("job");
String sub=request.getParameter("sub");
//System.out.println(job);
String buffer = "<select name='jobID'><option value='-1'>Select job description</option>";
try{
	
	
	
	Statement stmt= con.createStatement();
	Statement stmt1= con.createStatement();
	//String query="select * from public.employee_section where shop_id="+Integer.parseInt(sectionn) +"";
	String query="SELECT job_activity_id,job_activity_description FROM public.job_activity_master WHERE subsection_id='"+(sub)+"'";
	//String query1="SELECT a.emp_no,a.emp_name,a.validity_from,a.validity_to FROM a.emp_master JOIN b.job_activity_master ON a.sub_section=b.subsection_id WHERE subsection_id='"+(sub)+"'";
	//System.out.println("Query:"+query);
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next())
	{
		buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";
	}
	
	//System.out.println("Option Value"+buffer);
	buffer=buffer+"</select>";
	response.getWriter().println(buffer);
	//System.out.println("jjj");
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