<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Annual Coach Target</title>
</head>
<body>
<%
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
try
{
String financialYear= request.getParameter("financialYear");

String target_qty=request.getParameter("qty");
String coach_type=request.getParameter("coach_type");
String column_name =(String)request.getParameter("FIELD");
Statement st_qty,st_insert, st_update, st_delete;
ResultSet rs_qty;
String sql_qty, sql_insert, sql_update, sql_delete;
st_qty= con.createStatement();
st_insert= con.createStatement();
st_update=con.createStatement();
st_delete=con.createStatement();
sql_qty= "select yr_coach_target from public.coach_target where coach_type='"+coach_type+"' and financial_year='"+financialYear+"'" ;
//out.println(sql_qty);

rs_qty=st_qty.executeQuery(sql_qty);

if(!rs_qty.next())
{
	if(target_qty!=null && target_qty != ""){
	sql_insert="insert into public.coach_target (coach_type, financial_year, "+column_name+") values('"+coach_type+"' , '"+financialYear+"', "+target_qty+" )";
	  
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
	if(target_qty.isEmpty()){
		sql_delete=	"delete from public.coach_target where coach_type='"+coach_type+"' and financial_year='"+financialYear+"'" ;
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
		
	
	sql_update="update public.coach_target set "+column_name+"= "+target_qty+" where coach_type='"+coach_type+"' and financial_year='"+financialYear+"'" ;
	
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