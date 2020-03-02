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
String activityId=request.getParameter("activityId");
String substageId=request.getParameter("substageId");
String assetId=request.getParameter("assetId");
String inputValue=request.getParameter("qty");	
//String date= request.getParameter("date");

//String shop_production_qty=request.getParameter("qty");

String column_name =(String)request.getParameter("FIELD");

Statement st_qty, st_row, st_insert, st_update, st_delete;
ResultSet rs_qty, rs_row;
String sql_qty, sql_insert, sql_update, sql_delete, sql_row;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
 sql_row= "select * from public.activity_transaction where activity_id='"+activityId+"' and substage_id='"+substageId+"' and asset_id='"+assetId+"' " ;

rs_row=st_qty.executeQuery(sql_row);

if(rs_row.next())
{
	System.out.println("Hello");
	if(inputValue.isEmpty())
	{
		sql_delete=	"delete from public.activity_transaction where activity_id='"+activityId+"' and substage_id='"+substageId+"' and asset_id='"+assetId+"' " ;
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
	else {
	if(column_name.equals("time_taken"))	
	{
		sql_update="update public.activity_transaction set "+column_name+"= "+inputValue+", entry_by='"+username+"', system_entry_time= now() where activity_id='"+activityId+"' and substage_id='"+substageId+"' and asset_id="+assetId+" " ;	
	}
	else
	{
		sql_update="update public.activity_transaction set "+column_name+"= '"+inputValue+"', entry_by='"+username+"' , system_entry_time= now() where activity_id='"+activityId+"' and substage_id='"+substageId+"' and asset_id="+assetId+" " ;		
	}
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
else
{
	if(column_name.equals("time_taken")){
	sql_insert="insert into public.activity_transaction (activity_id, substage_id, asset_id, "+column_name+", entry_by, system_entry_time) values('"+activityId+"' ,'"+substageId+"', "+assetId+", "+inputValue+",  '"+username+"', now() )" ;
	}
	else
	{
		sql_insert="insert into public.activity_transaction (activity_id, substage_id, asset_id, "+column_name+", entry_by, system_entry_time) values('"+activityId+"' ,'"+substageId+"', "+assetId+", '"+inputValue+"',  '"+username+"', now() )" ;	
	}
	System.out.println(sql_insert);
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

con.close();
}

catch(Exception e)
{
out.println("Exception in do file "+e);
}
finally
{
	if(con!=null)
	con.close();
}
%>
</body>
</html>