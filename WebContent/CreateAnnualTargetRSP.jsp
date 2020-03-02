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
<title>Annual RSP Target</title>
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

<p>(Only number values are allowed)</p>
<% String financialYear=request.getParameter("financialYear");
String assetForRSP=request.getParameter("shopRSP");
%>
			<table class="customers">
			<tr> <th rowspan="2"><%=assetForRSP %>Type</th><th colspan="16">RSP Quantity</th></tr>
			<tr>
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
		            
		            int yearEntered= Integer.parseInt(financialYear.substring(0, 4));
		            //out.println(yearEntered);
			try {

				Statement st_qty, st_row, st_column;
				st_row=con.createStatement();
				st_column=con.createStatement();
				st_qty=con.createStatement();
				String sql_row, sql_column;
				String asset_Subtype, railway_code;
				ResultSet rs_column, rs_row, rs_qty;				
									
	sql_column="select railway_code from public.railway_master";
        rs_column=st_column.executeQuery(sql_column);
        while(rs_column.next())
        {
        	railway_code=rs_column.getString(1);
       %>
   <th><%=railway_code%></th>
    <% 
    }
    %> 
      </tr>
  
  <% 
	sql_row = "select asset_subtype from public.asset_master where asset_type= '"+assetForRSP+"'";
	rs_row = st_row.executeQuery(sql_row);
	while (rs_row.next()) {
	asset_Subtype = rs_row.getString(1); %>
	<tr>
	<th><%=asset_Subtype%></th>
	<% 
     sql_column="select railway_code from public.railway_master";
     rs_column=st_column.executeQuery(sql_column);
     while(rs_column.next())
       { 
    railway_code=rs_column.getString(1);
String sql_qty = "select asset_rsp_qty from public.asset_annual_rsp_target where railway_code='"+railway_code+"' and asset_sub_type='"+asset_Subtype+"' and asset_type='"+assetForRSP+"' and financial_yr='"+financialYear+"'";
					//out.println(sql_qty);
		 rs_qty = st_qty.executeQuery(sql_qty);

					String qty = "";
					while (rs_qty.next())
					{
						qty = rs_qty.getString(1);
						if (qty == null)
							qty = "";
					}
		%>
               	
 <%  if(yearEntered>=current_year)  //current_year
    {
    %>
  <td><input type="text" name="qty" value="<%=qty%>" size="2" onkeypress="return isNumberKey(event)" onblur="retrieveURL('CreateAnnualTargetRSP_do.jsp?railway_code=<%=railway_code%>&asset_type=<%=assetForRSP%>&asset_sub_type=<%=asset_Subtype%>&financialYear=<%=financialYear%>&FIELD=asset_rsp_qty', this.value)"/></td>
  <%  }
   else
   { %>
   <td><%=qty%></td>
 <%  } }%> 
    </tr>
 <%  
                	}
	con.close();
          }
			
          catch(Exception e)
          {
               out.println("Exception  "+e.toString());
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