<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Shift Record</title>
</head>
<body>
<%
String username= null;

HttpSession session_http = ServletActionContext.getRequest().getSession(true);
username = (String) session_http.getAttribute("userid");

SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
String entryDate= sdf.format(timestamp);
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 

try
{
String absentDate= request.getParameter("dateField");
String employeeId=request.getParameter("employeeId");
String shiftId=request.getParameter("shift");
String absentType=request.getParameter("qty");
String column_name =(String)request.getParameter("FIELD");
Statement st_qty,st_insert, st_update, st_delete, st_insert_history, stExisting;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete, sql_insert_history;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
stExisting=con.createStatement();
st_insert_history=con.createStatement();
sql_qty= "select absent_type from public.employee_absent_transaction where emp_id='"+employeeId+"' and shift_id='"+shiftId+"' and absent_date='"+absentDate+"'" ;
//out.println(sql_qty);

rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(absentType!=null && absentType != ""){
	sql_insert="insert into public.employee_absent_transaction (emp_id, shift_id, absent_date, "+column_name+", entry_date, entry_by) values('"+employeeId+"', '"+shiftId+"', '"+absentDate+"','"+absentType+"', '"+entryDate+"', '"+username+"')";
	 System.out.println(sql_insert); 
	int i=st_insert.executeUpdate(sql_insert);
	
    if(i>0)
    {
        out.println("<b>Saved Successsfully</b>");
       
    }
    else
    {
        out.println("Error While Saving<br>");
       // out.println(sql_insert);
    }
	}
	else{
		out.println("<i>Kindy choose shift or leave blank, if not available</i>");
	}
}
else
{


if(absentType==null || absentType.equals(""))
{
		sql_delete=	"delete from public.employee_absent_transaction where emp_id='"+employeeId+"' and shift_id='"+shiftId+"' and absent_date='"+absentDate+"'" ;
		System.out.println(sql_delete);
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
		
	
	sql_update="update public.employee_absent_transaction set "+column_name+"= '"+absentType+"', entry_date='"+entryDate+"', entry_by='"+username+"'  where emp_id='"+employeeId+"' and shift_id='"+shiftId+"' and absent_date='"+absentDate+"'" ;
	System.out.println(sql_update);
	
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

}
catch(Exception e)
{
out.println("Exception  "+e);
}
finally
{
	
	con.close();
}
%>
</body>
</html>