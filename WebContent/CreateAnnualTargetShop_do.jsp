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
<title>Annual Coach Target</title>
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
String financialYear= request.getParameter("financialYear");

String asset_target_qty=request.getParameter("qty");
String asset_Subtype=request.getParameter("asset_sub_type");
String targetShop=request.getParameter("target_shop");
String targetFor=request.getParameter("target_for");
System.out.println("Target For"+targetFor);
String column_name =(String)request.getParameter("FIELD");
Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select asset_target_qty from public.shop_annual_target where asset_sub_type='"+asset_Subtype+"' and target_shop='"+targetShop+"' and target_for='"+targetFor+"' and financial_yr='"+financialYear+"'" ;
//out.println(sql_qty);

rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(asset_target_qty!=null && asset_target_qty != ""){
	sql_insert="insert into public.shop_annual_target (asset_sub_type, target_shop, target_for, financial_yr, "+column_name+", entry_date, entry_by) values('"+asset_Subtype+"', '"+targetShop+"', '"+targetFor+"', '"+financialYear+"', "+asset_target_qty+", '"+entryDate+"', '"+username+"')";;
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
		out.println("<i>Kindy enter Target Quantity or leave blank, if not available</i>");
	}
}
else
{
	if(asset_target_qty.isEmpty()){
		sql_delete=	"delete from public.shop_annual_target where asset_sub_type='"+asset_Subtype+"' and target_shop='"+targetShop+"' and target_for='"+targetFor+"' and financial_yr='"+financialYear+"'" ;
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
		
	
	sql_update="update public.shop_annual_target set "+column_name+"= "+asset_target_qty+" where asset_sub_type='"+asset_Subtype+"' and target_shop='"+targetShop+"' and target_for='"+targetFor+"' and financial_yr='"+financialYear+"'" ;
	
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
out.println("Exception  "+e);
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