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
String subsectionn=request.getParameter("count");
//System.out.println("jj");
//String buffer =null;
String buffer = "<select name='subsectionID'><option value='-1'>Select Sub Section</option>";
try{
	

	
	Statement stmt= con.createStatement();
	//String query="select * from public.subsection where section_id="+subsectionn+"";
	String query="SELECT subsection_id,subsection_description FROM public.employee_section where parent_subsection_id='"+subsectionn+"'";
	//System.out.println("Query:"+query);
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next())
	{
		buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";
	}
	//System.out.println("Option Value"+buffer);
	buffer=buffer+"</select>";
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