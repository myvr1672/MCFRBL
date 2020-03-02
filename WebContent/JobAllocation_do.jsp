<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>
<%@ page import="model.User" %>

<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Coach Quantity insert</title>
</head>
<body>
<%

String username= null;

HttpSession session_http = ServletActionContext.getRequest().getSession(true);
username = (String) session_http.getAttribute("userid");

DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
try
{
String date= request.getParameter("date");

String employeeId=request.getParameter("employeeId");
String shiftId=request.getParameter("shiftId");
String jobId=request.getParameter("jobId");
String jobAllotedTime=request.getParameter("qty");
String column_name =(String)request.getParameter("FIELD");

Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select job_alloted_time from public.job_allocation_trans where emp_id='"+employeeId+"' and shift_id='"+shiftId+"' and job_seq_no="+jobId+" and job_alocation_date='"+date+"'" ;
rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(jobAllotedTime!=null && jobAllotedTime != ""){
	sql_insert="insert into public.job_allocation_trans (emp_id, shift_id, job_seq_no,job_alocation_date,  "+column_name+", created_by, created_date) values('"+employeeId+"' ,'"+shiftId+"', "+jobId+", '"+date+"', "+jobAllotedTime+", '"+username+"', now() )" ;
	//System.out.println(sql_insert);
	int i=st_insert.executeUpdate(sql_insert);
    if(i>0)
    {
        out.println("<b>Saved Successsfully</b>");
       
    }
    else
    {
        out.println("Error While Saving<br>");
        out.println(sql_insert);
    }
	}
	else{
		out.println("<i>Kindy enter quantity or leave blank, if not available</i>");
	}
	
    
}
else
{
	if(jobAllotedTime.isEmpty()){
	sql_delete=	"delete from public.job_allocation_trans where emp_id='"+employeeId+"' and shift_id='"+shiftId+"' and job_seq_no="+jobId+" and job_alocation_date='"+date+"'" ;
	int i=st_delete.executeUpdate(sql_delete);
	if(i>0)
    {
        out.println("<b>Delete Successsfully</b>");
       
    }
    else
    {
        out.println("Error While Deleting<br>");
       
    }
	}
	else{
	sql_update="update public.job_allocation_trans set "+column_name+"= "+jobAllotedTime+", created_by='"+username+"', created_date =now() where emp_id='"+employeeId+"' and shift_id='"+shiftId+"' and job_seq_no="+jobId+" and job_alocation_date='"+date+"'" ;
	 
	int i=st_update.executeUpdate(sql_update);
     if(i>0)
     {
         out.println("<b>Updated Successsfully</b>");
        
     }
     else
     {
         out.println("Error While Updating<br>");
        
     }
   }
}
con.close();
}
catch(Exception e)
{
out.println("Exception in do file "+e);
}
%>
</body>
</html>