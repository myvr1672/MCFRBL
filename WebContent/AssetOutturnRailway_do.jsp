<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
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
<title>Asset Gate-out Quantity insert</title>
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
String date= request.getParameter("date");

String asset_qty=request.getParameter("qty");
String asset_type=request.getParameter("asset_type");
String asset_Subtype=request.getParameter("asset_subtype");
String railway_code=request.getParameter("railway_code");
String column_name =(String)request.getParameter("FIELD");
Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select asset_gateout_qty from public.asset_gateout_qty_t where railway_code='"+railway_code+"' and asset_type='"+asset_type+"' and asset_subtype='"+asset_Subtype+"' and asset_gateout_date='"+date+"'" ;


rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(asset_qty!=null && asset_qty != ""){
	sql_insert="insert into public.asset_gateout_qty_t (railway_code, asset_type, asset_subtype, asset_gateout_date, "+column_name+", entry_date, entry_by) values('"+railway_code+"','"+asset_type+"', '"+asset_Subtype+"',  '"+date+"', "+asset_qty+", '"+entryDate+"', '"+username+"' )";
	
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
	if(asset_qty.isEmpty()){
	sql_delete=	"delete from public.asset_gateout_qty_t where railway_code='"+railway_code+"' and asset_type='"+asset_type+"' and asset_subtype='"+asset_Subtype+"' and asset_gateout_date='"+date+"'" ;
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
	sql_update="update public.asset_gateout_qty_t set "+column_name+"= "+asset_qty+", entry_date='"+entryDate+"', entry_by='"+username+"' where railway_code='"+railway_code+"' and asset_type='"+asset_type+"' and asset_subtype='"+asset_Subtype+"' and asset_gateout_date='"+date+"'" ;
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