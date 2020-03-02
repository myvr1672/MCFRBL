<html>
<%@ page import="java.util.Calendar" %>
<%@ page import="model.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>
<%@ page import="hibernateConnect.HibernateConfig" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<%@ page import="java.util.Calendar" %>
<head>
<meta charset="ISO-8859-1">
<title>Asset Production</title>
<style>

.customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

.customers td, .customers th {
    border: 1px solid #ddd;
    padding: 2px;
    width: 100px;
    
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
    padding-top: 6px;
    padding-bottom: 6px;
    text-align: left;
    background-color: #8d9c8e;
    color: white;
}
</style>
<% String contextpath=request.getContextPath();%>
<script src="<%=contextpath%>/js/jquery-1.8.2.js" type="text/javascript"></script>
<script type="text/javascript">
function isNumberKey(el, evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    var number = el.value.split('.');
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    //just one dot
    if(number.length>1 && charCode == 46){
         return false;
    }
    //get the carat position
    var caratPos = getSelectionStart(el);
    var dotPos = el.value.indexOf(".");
    if( caratPos > dotPos && dotPos>-1 && (number[1].length > 1)){ //Change 1 to 2 for 3 places of decimal allowed
        return false;
    }
    return true;
}var req;
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
<h1>Coach Dispatched List</h1>


<div id="dep"></div>
 
<% 

DbConnection db=new DbConnection();
Connection con=db.getConnection();

try 
{

Statement st_row, st_column, st_qty,st_query;
st_row=con.createStatement();
st_column=con.createStatement();
st_qty=con.createStatement();
st_query=con.createStatement();
String rail_code, asset_type;
String sql_row, sql_column,sql_query;
ResultSet rs_column, rs_row, rs_qty,rs;
Calendar cal = Calendar.getInstance();
int year=cal.get(Calendar.YEAR);


%>
  <form>
  <b>Financial Year </b>&nbsp;&nbsp;
     <select name="finyr">
        <option disabled selected>select</option>
        
        <option value="<%=year-3%>-<%=year-2%>"><%=year-3%>-<%=year-2%></option>
  <option value="<%=year-2%>-<%=year-1%>"><%=year-2%>-<%=year-1%></option>
  <option value="<%=year-1%>-<%=year%>"><%=year-1%>-<%=year%></option>
  <option value="<%=year%>-<%=year+1%>"><%=year%>-<%=year+1%></option>
  <option value="<%=year+1%>-<%=year+2%>"><%=year+1%>-<%=year+2%></option>
     	
     </select>
     
     <b>Month </b>&nbsp;&nbsp;
     <select name="mon" onchange="this.form.submit()" >
     	<option disabled selected>select</option>
     		<% 
     		 sql_query="select month_code from month_finance_year_master";
     		rs=st_query.executeQuery(sql_query);
			while(rs.next())
        	{ %> 
     			<option><%=rs.getString(1)%></option>
     		<%}%>
     </select>
</form>
<%
	String yr=request.getParameter("finyr");
  	String month=request.getParameter("mon");
  	%>
<p>(Only number values are allowed)</p>

<table class="customers">   
 <tr>
 <th>Description</th>

 <%
        sql_column="select coach_type from public.coach_master";
        rs_column=st_column.executeQuery(sql_column);
        while(rs_column.next())
        {
        	asset_type=rs_column.getString(1);
       %>
   <th><%=asset_type%></th>
    <% }
    %> 
  </tr>
         <%   
       
       sql_row="select railway_code  from public.railway_master";
      
       rs_row=st_row.executeQuery(sql_row);
          while(rs_row.next())
                {
          
         rail_code=rs_row.getString(1);%>
         <tr>
         <th ><%=rail_code%></th>
         <% 
          sql_column="select coach_type from public.coach_master";
          rs_column=st_column.executeQuery(sql_column);
           while(rs_column.next())
           { 
           
        	   asset_type=rs_column.getString(1);
        
          
   String  sql_qty= "select asset_qty from public.asset_rly_prod where asset_type='"+asset_type+"' and railway='"+rail_code+"' and year='"+yr+"' and month_code='"+month+"'" ;
         
   rs_qty=st_qty.executeQuery(sql_qty);  
           String qty="";
           while(rs_qty.next())
           {
         	  qty=rs_qty.getString(1);
         	  if(qty==null)
         	  qty=""; 
           }
           if(!rs_qty.next())
           {     
        	   %>

<td> <input type="text" id="txtChar" onkeypress="return isNumberKey(this, event)" name="asset_qty" size="3"  value="<%=qty%>"  onblur="retrieveURL('Asset_Rly_Production_Year_do.jsp?asset_type=<%=asset_type%>&railway=<%=rail_code%>&year=<%=yr%>&month_code=<%=month%>&FIELD=asset_qty', this.value)"/></td>

    <% 
    }  
    else {
    %>
    	<td><%=qty%></td>
         <%  } } %>
            </tr>
            <% 
           
 }
                }
          
          catch(Exception e)
          {
               out.println("Exception Here "+e.toString());
          }
finally
{
	if(con!=null)
	con.close();
}
             %>   
       
           </table>


  
</body>
</html>
                	 