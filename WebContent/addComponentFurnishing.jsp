<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>
<%@ page import="model.User" %>
<%@ page import="hibernateConnect.HibernateConfig" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<html>
<head>
<% String contextpath=request.getContextPath();

String furnishingAssetId=request.getParameter("assetId");
String coachType=request.getParameter("coachType");

%>
 <style>
.hide {
display: none;
}
.customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

.customers td, .customers th {
    border: 1px solid #ddd;
    padding: 8px;
}
.customers tr, .customers td { line-height: 5px; }
.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #8d9c8e;
    color: white;
}
</style> 

<script type="text/javascript">

var req;

function retrieveURL(url,v)
{
	
    url=url+"&qty="+v;
   

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
<% 
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
String sql_row, sql_column;
Statement st_row= con.createStatement();
Statement st_column=con.createStatement();
ResultSet rs_row, rs_column;
User loginUser = null;
Session session_hibernate = null;
String username= null;
String roles= null;
Integer componentId;
String componentDescription=null;
HttpSession session_http = ServletActionContext.getRequest().getSession(true);
username = (String) session_http.getAttribute("userid");


%>
<input type="hidden" id="furnishingAssetId" value="<%=furnishingAssetId%>" />
<input type="hidden" id="coachType" value="<%=coachType%>"/>
<table class="customers">
            <tr> 
            <th>Sr No</th>
            <th>Item Description</th>
			<th>Make/ Supplier</th>
			<th>Serial No</th>
			   
			</tr> 
<%
sql_row="select component_id, component_description from public.component_master_furnishing where applicable_for_coach='"+coachType+"'";
//System.out.println(sql_row);
rs_row=st_row.executeQuery(sql_row);
int i=1;
while(rs_row.next())
      {
	
 	componentId=Integer.parseInt(rs_row.getString(1));
 	componentDescription=rs_row.getString(2);
	%> 
  <tr>	
  <td><%=i%></td> 
 	<td><b><%=componentDescription%></b></td> 
 <%
 String serialNo="",make="";
 sql_column= "select serial_no, make from public.furnishing_component_transaction where component_id="+componentId+" and furnishing_asset_id="+furnishingAssetId+" and coach_type='"+coachType+"'" ; 
// System.out.println(sql_column);
 rs_column= st_column.executeQuery(sql_column);
 
 if(rs_column.next())
  {
	
 serialNo=rs_column.getString(1); 
 make=rs_column.getString(2);
 
if(serialNo==null) {serialNo="";}
if(make==null){make="";}


 }
 System.out.println("Hi navin input text call");
 %>
 <td><input type="text"  autocomplete="off" name="qty" value="<%=make%>"  onblur="retrieveURL('componentInsertionFurnishing.jsp?furnishingAssetId=<%=furnishingAssetId%>&componentId=<%=componentId%>&coachType=<%=coachType%>&FIELD=make', this.value)"/></td>
  <td><input type="text"  autocomplete="off" name="qty" value="<%=serialNo%>"  onblur="retrieveURL('componentInsertionFurnishing.jsp?furnishingAssetId=<%=furnishingAssetId%>&componentId=<%=componentId%>&coachType=<%=coachType%>&FIELD=serial_no', this.value)"/></td>
 </tr>
 <% 
 i++;
 	}
con.close();
%>
</table>
</body>
</html>