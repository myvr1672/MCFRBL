<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.User" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %>
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
<% String contextpath=request.getContextPath();%>

<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	$("#shopSelection").hide();
	$( "select[name='machineType']" )
	  .change(function () {
		  if($(this).val() == ''){
			  $("#shopSelection").hide();
			  }
			  else
				  {
				  $("#shopSelection").show();
				  }
			
		  })
		  ;
	$( "#shop" ).change(function(){
		 $("#machineType").prop( "disabled", true );
		var shop=$( "#shop" ).val();
		var url="<%=contextpath %>/MachineMasterReport.jsp?shopName=";
		url= url+shop;
		url= url+"&machineType="+$( "#machineType" ).val();
	 $( "#new-pages" ).load(url);
	});
	
});

</script>
</head>
<body>
<% 
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
String sql_shop, sql_machineType;
Statement st_shop= con.createStatement();
Statement st_machineType=con.createStatement();
ResultSet rs_machineType, rs_shop;

User loginUser = null;
Session session_hibernate = null;
String username= null;
String roles= null;
HttpSession session_http = ServletActionContext.getRequest().getSession(true);
username = (String) session_http.getAttribute("userid");

if (username != null)
{
session_hibernate = HibernateConfig.getSession();
loginUser = (User)session_hibernate.get(User.class,username.trim());

 roles= loginUser.getRoles();
 roles = roles.replaceAll(", ","','");
}

Date date = new Date();  
DateFormat  formatter = new SimpleDateFormat("YYYY-MM-dd");  
String strDate= formatter.format(date);  
%>
<p><b>Select Machine Type:</b>&nbsp;&nbsp;
<select name="machineType" id="machineType">
   <option value="">Select</option>
   <% 
   sql_machineType="select machine_type_id, machine_type_description from public.machine_type";
     
   rs_machineType=st_machineType.executeQuery(sql_machineType);
  while(rs_machineType.next())
        {
 	   %>
    <option value=<%=rs_machineType.getString(1)%>><%=rs_machineType.getString(2)%></option>
    <% } %>
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
   <span id="shopSelection">
  <b>Select Shop: </b>&nbsp;&nbsp;
  <select name="shop" id="shop">
  <option value="">Select</option>
  <%
  if(roles.equals("All")){
	 sql_shop="select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence" ;
  }
  else
  {
	  sql_shop="select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence";
  }
  rs_shop=st_shop.executeQuery(sql_shop);
  while(rs_shop.next())
  {
	%>
	<option value=<%=rs_shop.getString(1)%>><%=rs_shop.getString(1)%> Shop</option>  
<%   }
  if(roles.equals("All")){ %>
  <option value="All">All Shop</option> 
  <% } %>
  </select>
  </span> </p>
  <hr>
  <% 
    con.close();
    
 %>
 


<div id="new-pages"></div>
</body>
</html>