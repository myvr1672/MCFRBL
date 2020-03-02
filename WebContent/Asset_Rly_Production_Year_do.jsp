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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
try
{
String month_code= request.getParameter("month_code");

String asset_qty=request.getParameter("qty");
String asset_type=request.getParameter("asset_type");
String fin_year=request.getParameter("year");
String rail_code=request.getParameter("railway");
String column_name =(String)request.getParameter("FIELD");
Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select asset_qty from public.asset_rly_prod where asset_type='"+asset_type+"' and month_code='"+month_code+"' and year='"+fin_year+"' and railway='"+rail_code+"'" ;

rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(asset_qty!=null && asset_qty != ""){
	sql_insert="insert into public.asset_rly_prod (asset_type, railway, year, month_code, "+column_name+") values('"+asset_type+"','"+rail_code+"', '"+fin_year+"', '"+month_code+"', "+asset_qty+")";
	
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
	sql_delete=	"delete from public.asset_rly_prod where asset_type='"+asset_type+"' and year='"+fin_year+"' and month_code='"+month_code+"'";
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
	sql_update="update public.asset_rly_prod set "+column_name+"= "+asset_qty+" where asset_type='"+asset_type+"' and  year='"+fin_year+"' and month_code='"+month_code+"' and railway='"+rail_code+"'";
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