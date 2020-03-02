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
	$("#datePickup").hide();
	$( "select[name='shop']" )
	  .change(function () {
		  if($(this).val() == ''){
			  $("#datePickup").hide();
			  }
			  else
				  {
				  $("#datePickup").show();
				  }
			
		  })
		  ;
	$( "#tdt" ).change(function(){
		 $("#shopId").prop( "disabled", true );
		var tdt1=$( "#tdt" ).val();
		var url="<%=contextpath %>/AssetOutTurnRailway.jsp?date=";
		url= url+tdt1;
		url= url+"&shopRSP="+$( "#shopId" ).val();
	 $( "#new-pages" ).load(url);
	});
	
});

</script>
</head>
<body>
<% 
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
String sql_row;
Statement st_row= con.createStatement();
ResultSet rs_row;

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
<p><b>Select Asset for Out-Turn/RSP:</b>&nbsp;&nbsp;
<select name="shop" id="shopId">
   <option value="">Select</option>
   
   <% 
    if(roles.equals("All"))
    {
    	%> 
    	<option value="Coach">Coach Out-Turn</option>
    <% 
   sql_row="select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 and gateout_validity=1 order by substage_sequence";
      }
   else
    {
  sql_row="select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 and gateout_validity=1 order by substage_sequence";
        	// out.println(sql_row);
     }
  rs_row=st_row.executeQuery(sql_row);
  while(rs_row.next())
        {
 	   %>
    <option value=<%=rs_row.getString(1)%>><%=rs_row.getString(1)%> RSP</option>
    <% } %>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
 <span id="datePickup">
<b>Select Date:</b>&nbsp;&nbsp;<input type="date" max="<%=strDate%>" name="date" value=""  id="tdt"/>
 
 </span></p>
<%con.close(); %>
<div id="new-pages"></div>
</body>
</html>