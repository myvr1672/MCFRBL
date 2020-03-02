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
String railwayCode=request.getParameter("railway_code");
String assetType=request.getParameter("asset_type");
String asset_Subtype=request.getParameter("asset_sub_type");
String financialYear= request.getParameter("financialYear");
String assetRSPQty=request.getParameter("qty");
String column_name =(String)request.getParameter("FIELD");

Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select asset_rsp_qty from public.asset_annual_rsp_target where railway_code='"+railwayCode+"' and asset_type='"+assetType+"' and asset_sub_type='"+asset_Subtype+"' and financial_yr='"+financialYear+"'" ;
//out.println(sql_qty);

rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(assetRSPQty!=null && assetRSPQty != ""){
	sql_insert="insert into public.asset_annual_rsp_target (railway_code, asset_type, asset_sub_type, financial_yr, "+column_name+", entry_date, entry_by) values('"+railwayCode+"', '"+assetType+"', '"+asset_Subtype+"', '"+financialYear+"', "+assetRSPQty+", '"+entryDate+"', '"+username+"')";
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
	if(assetRSPQty.isEmpty()){
		sql_delete=	"delete from public.asset_annual_rsp_target where railway_code='"+railwayCode+"' and asset_type='"+assetType+"' and asset_sub_type='"+asset_Subtype+"' and financial_yr='"+financialYear+"'" ;
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
		
	
	sql_update="update public.asset_annual_rsp_target set "+column_name+"= "+assetRSPQty+", entry_date='"+entryDate+"', entry_by='"+username+"' where asset_type='"+assetType+"' and asset_sub_type='"+asset_Subtype+"' and financial_yr='"+financialYear+"'" ;
	
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