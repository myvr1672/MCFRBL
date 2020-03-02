<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<style>
.customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

.customers td, .customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #8d9c8e;
    color: white;
}
</style>
<title>Annual Target</title>
<script type="text/javascript">
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
var req;
var which;
var req1;

function retrieveURL(url,v)
{
	 //tdt=document.getElementById("tdt").value;
	
    //  url=url+"&qty="+v+"&tdt="+tdt;
    url=url+"&qty="+v;
      //alert(url);

  if (window.XMLHttpRequest) { // Non-IE browsers
    req = new XMLHttpRequest();
    req.onreadystatechange = processStateChange;
    try {
      req.open("GET", url, true);
    } catch (e) {
      alert(e);
    }
    req.send(null);
  } else if (window.ActiveXObject) { // IE
    req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
      req.onreadystatechange = processStateChange;
      req.open("GET", url, true);
      req.send();
    }
  }
}

function processStateChange() {
  if (req.readyState == 4) { // Complete
    if (req.status == 200) { // OK response
      document.getElementById("dep").innerHTML = req.responseText;


    } else {
              document.getElementById("dep").innerHTML = req.responseText;
      alert("Problem: " + req.statusText);
    }
  }

}
</script>

</head>
<body>

<div id="dep"></div>

			<%@ page import="java.util.*" %>
			<%@ page import="java.sql.*" %>
			<%@ page import="java.text.*" %>
			 <%@ page import="dao.*" %>
		<%
			Calendar cal = Calendar.getInstance();
			       int current_year= cal.get(Calendar.YEAR);
			       int month=cal.get(Calendar.MONTH);
			       if (month<3)
			       {
			       	current_year=current_year-1;
			       }
		          
			
				DbConnection db=new DbConnection();
		            Connection con=db.getConnection();
		            String financialYear=request.getParameter("financialYear");
		            String shopfortarget=request.getParameter("shop");
		            
		            String assetType="";
		            if(shopfortarget.equals("Testing")) {assetType="Coach";}
		            else if(shopfortarget.equals("Furnishing")) {assetType="Coach";}
		            else if(shopfortarget.equals("Electrical")) {assetType="Coach";}
		            else if(shopfortarget.equals("Paint")) {assetType="Shell";}
		            else {assetType=shopfortarget;}
		            
		            String targetFirm= request.getParameter("prod_from");
		            int yearEntered= Integer.parseInt(financialYear.substring(0, 4));
		           // int yearEntered_query= Integer.parseInt(financialYear.substring(0, 4));
		            int yr_display=Integer.parseInt(financialYear.substring(2, 4));
		            
		            //out.println(yearEntered);
		            
			try {

				Statement st_row, st_column, st_qty;
st_row=con.createStatement();
st_column=con.createStatement();
st_qty=con.createStatement();
String assetSubType, monthly_code;
int month_seq;
String sql_row, sql_column;
ResultSet rs_column, rs_row, rs_qty;

  
  %>
  
  <p>(Only number values are allowed)</p>
			<table class="customers">
			<tr> <th>Description</th><th colspan="12">Month</th></tr>  
 <tr>
 <th><%=shopfortarget%> Type</th>

 <%

        sql_column="select month_code, month_seq from public.month_finance_year_master order by month_seq";
        rs_column=st_column.executeQuery(sql_column);
        boolean m=false;
        while(rs_column.next())
        {
        	monthly_code=rs_column.getString(1);
        	month_seq=Integer.parseInt(rs_column.getString(2));
        	if(month_seq>=10)
        	{
        		if(m==false)
        		{
        		yr_display=yr_display+1;
        		
        		m=true;
        		}
        	}
       %>
   <th><%=monthly_code%>,<%=yr_display%></th>
    <% }
    %> 
      </tr>
         <%   
       sql_row="select asset_subtype from public.asset_master where asset_type= '"+assetType+"'";
             rs_row=st_row.executeQuery(sql_row);
          while(rs_row.next())
                {
         assetSubType=rs_row.getString(1); %>
         <tr>
         <th ><%=assetSubType%></th>
         <% 
  sql_column="select month_code, month_seq from public.month_finance_year_master order by month_seq";
   rs_column=st_column.executeQuery(sql_column);
     while(rs_column.next())
           { 
           
        	   monthly_code=rs_column.getString(1);
        	   month_seq=Integer.parseInt(rs_column.getString(2));          
          
    String  sql_qty= "select asset_monthly_target_qty from public.shop_monthly_target where fin_yr_code='"+financialYear+"' and asset_sub_type='"+assetSubType+"' and month_code='"+monthly_code+"' and asset_type= '"+shopfortarget+"' and target_for='"+targetFirm+"'" ;
           rs_qty=st_qty.executeQuery(sql_qty);  
           String qty="";
           while(rs_qty.next())
           {
         	  qty=rs_qty.getString(1);
         	  if(qty==null)
         	  qty=""; 
           }
           if(yearEntered>=current_year)
           {        %>
 <td><input type="text" name="qty" value="<%=qty%>" size="2" onkeypress="return isNumberKey(event)" onblur="retrieveURL('CreateMonthlyTarget_do.jsp?assetSubType=<%=assetSubType%>&month_code=<%=monthly_code%>&fin_yr_code=<%=financialYear%>&targetFirm=<%=targetFirm%>&shopforTarget=<%=shopfortarget%>&FIELD=asset_monthly_target_qty', this.value)"/></td>
    <% }  
    else {
    %>
    	<td><%=qty%></td>
         <%  } } %>
            </tr>
            <% 
           
 }
          con.close();
                }
          
          catch(Exception e)
          {
               out.println("Exception Here "+e.toString());
          }
			finally
	          {
	        	  if(con!=null)
	        	  {
	        		  con.close();
	        	  }
	          }
             %>   
       
           </table>
</body>
</html>