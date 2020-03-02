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
<title>Coach Gate-out Quantity insert</title>
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
String month_code= request.getParameter("month_code");

String asset_qty=request.getParameter("qty");
String assetSubType=request.getParameter("assetSubType");
String year_code=request.getParameter("fin_yr_code");
String shopforTarget=request.getParameter("shopforTarget");
String targetFirm=request.getParameter("targetFirm");
String column_name =(String)request.getParameter("FIELD");
Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select asset_monthly_target_qty from public.shop_monthly_target where asset_sub_type='"+assetSubType+"' and month_code='"+month_code+"' and fin_yr_code='"+year_code+"' and asset_type='"+shopforTarget+"' and target_for='"+targetFirm+"'" ;


rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(asset_qty!=null && asset_qty != ""){
	sql_insert="insert into public.shop_monthly_target (asset_sub_type, asset_type, target_for, fin_yr_code, month_code, "+column_name+", entry_date, entry_by) values('"+assetSubType+"','"+shopforTarget+"', '"+targetFirm+"', '"+year_code+"', '"+month_code+"', "+asset_qty+", '"+entryDate+"', '"+username+"')";
	
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
	sql_delete=	"delete from public.shop_monthly_target where asset_sub_type='"+assetSubType+"' and asset_type='"+shopforTarget+"' and target_for='"+targetFirm+"' and fin_yr_code='"+year_code+"' and month_code='"+month_code+"'";
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
	sql_update="update public.shop_monthly_target set "+column_name+"= "+asset_qty+", entry_date='"+entryDate+"', entry_by='"+username+"' where asset_sub_type='"+assetSubType+"' and asset_type='"+shopforTarget+"' and target_for='"+targetFirm+"' and fin_yr_code='"+year_code+"' and month_code='"+month_code+"'";
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