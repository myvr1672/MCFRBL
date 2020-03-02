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
String dateOfProduction= request.getParameter("dateOfProduction");
String machine_production_qty=request.getParameter("qty");
String machineId=request.getParameter("machineId");
String machineOperationId=request.getParameter("machineOperationId");

String column_name =(String)request.getParameter("FIELD");

Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select qty_produced from public.machine_production_trans where machine_id="+machineId+" and machine_operation_id="+machineOperationId+" and date_of_production='"+dateOfProduction+"' " ;
rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(machine_production_qty!=null && machine_production_qty != ""){
	sql_insert="insert into public.machine_production_trans (machine_id, machine_operation_id, date_of_production,  "+column_name+", created_by, transaction_time) values("+machineId+" ,"+machineOperationId+", '"+dateOfProduction+"',"+machine_production_qty+",  '"+username+"', now() )" ;
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
	if(machine_production_qty.isEmpty()){
	sql_delete=	"delete from public.machine_production_trans where machine_id="+machineId+" and machine_operation_id="+machineOperationId+" and date_of_production='"+dateOfProduction+"' " ;
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
	sql_update="update public.machine_production_trans set "+column_name+"= "+machine_production_qty+", created_by='"+username+"', transaction_time =now() where machine_id="+machineId+" and machine_operation_id="+machineOperationId+" and date_of_production='"+dateOfProduction+"' " ;
	 
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
finally
{
	if(con!=null)
	{
		con.close();
	}
}
%>
</body>
</html>