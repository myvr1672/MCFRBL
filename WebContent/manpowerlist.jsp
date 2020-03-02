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
String buffer = "<table class='table table-hover'><tr><th>EMP ID</th><th>EMP NAME</th><th>ALLOCATION DATE</th><th>HOURS BOOKED</th></tr>";
try{
	
	Statement stmt= con.createStatement();
	String query=("SELECT a.emp_no,a.emp_name,c.job_alocation_date, sum(c.job_alloted_time) FROM public.emp_master a , public.job_activity_master b, public.job_allocation_trans c, public.job_transaction d,public.set_date e where a.sub_section=b.subsection_id and a.emp_no=c.emp_id and c.job_seq_no = d.job_seq_no and b.job_activity_id= d.activity_id  and c.job_alocation_date::date between strt_fin_date(e.crnt_date::date) and  prev_work_date(e.crnt_date::date) and b.subsection_id='"+(sub)+"' and b.job_activity_id='"+(job)+"' group by (a.emp_no,a.emp_name,c.job_alocation_date)");


	/*String query=("SELECT a.emp_no,a.emp_name,a.validity_from,a.validity_to FROM public.emp_master a JOIN public.job_activity_master b ON a.sub_section=b.subsection_id WHERE subsection_id='"+(sub)+"' and job_activity_id='"+(job)+"'");*/
	System.out.println("Query:"+query);
	ResultSet rs = stmt.executeQuery(query);
	while(rs.next())
	{
		buffer=buffer+"<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;"+rs.getString(4)+"</td></tr>";
	}
	
	System.out.println("Option Value"+buffer);
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