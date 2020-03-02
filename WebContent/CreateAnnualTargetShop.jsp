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

<p>(Only number values are allowed)</p>
<% String financialYear=request.getParameter("financialYear");
String productionFrom=request.getParameter("prod_from");
String shop=request.getParameter("shop");

String assetType="";
if(shop.equals("Testing")) {assetType="Coach";}
else if(shop.equals("Furnishing")) {assetType="Coach";}
else if(shop.equals("Electrical")) {assetType="Coach";}
else if(shop.equals("Paint")) {assetType="Shell";}
else {assetType=shop;}




%>
			<table class="customers">
			<tr> <th><%=shop %>Type</th><th>Target Quantity</th>
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

				Statement st, st_qty;
				st = con.createStatement();
				st_qty = con.createStatement();
				String asset_Subtype;
				// st1=conn.createStatement();

				//   String dept=(String)session.getAttribute("usr_dept");
				// String org_slno=(String)session.getAttribute("orgSlNo");
				// Long Lrole_id=(Long)session.getAttribute("roleId");
				// String role_id=Lrole_id.toString();
				// String user_id=(String)session.getAttribute("userId");
				String sql;
				//   String hr_sec_id="",hr_sec_desc="";
				//  if(role_id.equals("502"))
				// {
	sql = "select asset_subtype from public.asset_master where asset_type= '"+assetType+"'";
	ResultSet rs = st.executeQuery(sql);
	while (rs.next()) {
	asset_Subtype = rs.getString(1);
	String sql_qty = "select asset_target_qty from public.shop_annual_target where asset_sub_type='"+asset_Subtype+"' and target_shop='"+shop+"' and target_for='"+productionFrom+"' and financial_yr='"+financialYear+"'";
					//out.println(sql_qty);
					ResultSet rs_qty = st_qty.executeQuery(sql_qty);

					String qty = "";
					while (rs_qty.next()) {
						qty = rs_qty.getString(1);
						if (qty == null)
							qty = "";
					}
		%>
               	<tr>
               
    <td><%=asset_Subtype%></td>
   <%  if(yearEntered>=current_year)  //current_year
    {%>
    <td><input type="text" name="qty" value="<%=qty%>" size="20" onkeypress="return isNumberKey(event)" onblur="retrieveURL('CreateAnnualTargetShop_do.jsp?asset_sub_type=<%=asset_Subtype%>&target_shop=<%=shop%>&target_for=<%=productionFrom%>&financialYear=<%=financialYear%>&FIELD=asset_target_qty', this.value)"/></td>
  <%  }
   else
   { %>
   <td><%=qty%></td>
 <%  }%> 
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