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
con.setAutoCommit(false);
try
{
String validityDate= request.getParameter("dateField");
String employeeId=request.getParameter("employeeId");
String shiftValue=request.getParameter("qty");
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
sql_qty= "select shift_id, validity_from from public.shift_roaster_transaction where emp_id='"+employeeId+"'" ;
//out.println(sql_qty);

rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(shiftValue!=null && shiftValue != ""){
	sql_insert="insert into public.shift_roaster_transaction (emp_id, "+column_name+", validity_from, entry_date, entry_by) values('"+employeeId+"', '"+shiftValue+"', '"+validityDate+"', '"+entryDate+"', '"+username+"')";
	// System.out.println(sql_insert); 
	int i=st_insert.executeUpdate(sql_insert);
	con.commit();
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
String oldShiftId=rs_qty.getString(1);
SimpleDateFormat df= new SimpleDateFormat("dd-MM-yyyy");
String oldShiftDate=rs_qty.getString(2);

	if(shiftValue==null||shiftValue.equals("")){
		sql_delete=	"delete from public.shift_roaster_transaction where emp_id='"+employeeId+"'" ;
		int i=st_delete.executeUpdate(sql_delete);
		con.commit();
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
		
	
	sql_update="update public.shift_roaster_transaction set "+column_name+"= '"+shiftValue+"', validity_from= '"+validityDate+"', entry_date='"+entryDate+"', entry_by='"+username+"'  where emp_id='"+employeeId+"'";
	//out.println(sql_update);
	String selectQueryfromHistory="select * from public.shift_roaster_history where emp_id='"+employeeId+"' and validity_from='"+oldShiftDate+"'";
ResultSet existingRecord=stExisting.executeQuery(selectQueryfromHistory);
	if(existingRecord.next())
	{
		sql_insert_history= "update public.shift_roaster_history set shift_id= '"+shiftValue+"' where emp_id='"+employeeId+"' and validity_from='"+oldShiftDate+"'";
	}
	else
	{
		sql_insert_history="insert into public.shift_roaster_history (emp_id, shift_id, validity_from, validity_to) values('"+employeeId+"', '"+oldShiftId+"', '"+oldShiftDate+"', prev_work_date('"+validityDate+"'))";	
	}
	int i=st_update.executeUpdate(sql_update);
	
	int j=st_insert_history.executeUpdate(sql_insert_history);
     if(i>0 &&j>0)
     {
    	 con.commit();
         out.println("<b>Updated Successsfully</b>");
        
     }
     else
     {
         out.println("Error While Updating<br>");
         con.rollback();
        
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
	con.commit();
	con.close();
}
%>
</body>
</html>