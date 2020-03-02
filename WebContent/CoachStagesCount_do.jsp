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

String coach_qty=request.getParameter("qty");
String coach_type=request.getParameter("coach_type");
String coach_stages=request.getParameter("stages");
String column_name =(String)request.getParameter("FIELD");
Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select coach_prod_qty from public.coach_production_qty_t where coach_type='"+coach_type+"' and stages='"+coach_stages+"' and date='"+date+"'" ;


rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(coach_qty!=null && coach_qty != ""){
	sql_insert="insert into public.coach_production_qty_t (coach_type, stages, date, "+column_name+", user_id, created_date) values('"+coach_type+"' ,'"+coach_stages+"',  '"+date+"', "+coach_qty+", '"+username+"', now() )";
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
	if(coach_qty.isEmpty()){
	sql_delete=	"delete from public.coach_production_qty_t where coach_type='"+coach_type+"' and stages='"+coach_stages+"' and date='"+date+"'" ;
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
	sql_update="update public.coach_production_qty_t set "+column_name+"= "+coach_qty+", user_id='"+username+"', created_date =now() where coach_type='"+coach_type+"' and stages='"+coach_stages+"' and date='"+date+"'" ;
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
	con.close();
}
%>
</body>
</html>