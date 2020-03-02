import java.util.Date;


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
String sectionn=request.getParameter("count");
//System.out.println(sectionn);
//String buffer =null;
  
String buffer = "<select name='sectionID'><option value='-1'>Select Section</option>";
try{
	
	
	
	Statement stmt= con.createStatement();
	//String query="select * from public.employee_section where shop_id="+Integer.parseInt(sectionn) +"";
	String query="SELECT subsection_id,subsection_description FROM public.employee_section where parent_subsection_id='"+sectionn+"'";
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