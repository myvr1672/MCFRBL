<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
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
<% String contextpath=request.getContextPath();%>
<style>
.hide {
display: none;
}
div.abc
{
text-align:left;
margin-left:0px;
}

</style>
<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	 $("#machine").hide(); 
	$("#datePickup").hide();
	$( "select[name='shop']" )
	  .change(function () {
		
		  if($(this).val() == ''){
		  $("#machine").hide();
		  }
		  else 
			  {
		$("#machine").show();
		$.ajax({
            type: "post",
            async:false,
            url: "machineDetails.jsp", //this is my servlet
            data: "shop=" +$('#shopId').val(),
            success: function(msg){      
                    $('#machineId').append(msg);
            }
        });
			  }
			  });
	
	$( "select[name='machineForm']" )
	  .change(function () {
		  
		  $("#shopId").prop( "disabled", true );
		  $("#machineId").prop( "disabled", true ); 
		  if($(this).val() == ''){
			  
		  $("#datePickup").hide();
		  }
		  else
			  {
			  $("#datePickup").show();
			  }
		
	  });
	
	$( "#tdt" ).change(function(){
		$("#shopId").prop( "disabled", true );
		  $("#machineId").prop( "disabled", true ); 
		  
		var dateField=$( "#tdt" ).val();
		var url="<%=contextpath %>/MachineUtilization.jsp?date=";
	    url= url+dateField+"&shopId="+$( "#shopId" ).val()+"&machineId="+$( "#machineId" ).val();
		//alert(url);
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
Calendar cal = Calendar.getInstance();  
//cal.add(Calendar.DATE, 15);
Date date=cal.getTime();
DateFormat  formatter = new SimpleDateFormat("YYYY-MM-dd");  
String strDate= formatter.format(date);  
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

%>

<div id="abc" align="left">
<b>Select Shop: </b>&nbsp;&nbsp;
<select name="shop" id="shopId" >
  <option value="">Select</option>
 <%--  <% 
    if(roles.equals("All"))
    {
   sql_row="select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence";
      }
   else
    {
  sql_row="select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence";
        	// out.println(sql_row);
     }
  rs_row=st_row.executeQuery(sql_row);
  while(rs_row.next())
        {
 	   %>
    <option value=<%=rs_row.getString(1)%>><%=rs_row.getString(1)%> Shop</option>
    <% } %>  --%>
 <option value="Bogie">Bogie Shop</option>  
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
<span id="machine">
<b>Select Machine</b>&nbsp;&nbsp;

  <select name="machineForm" id="machineId">
   <option value="" selected>Select</option>
   
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>

<span id="datePickup">
<b>Select Date..&nbsp;&nbsp;<input type="date" max="<%=strDate%>" name="date" value=""  id="tdt"/></b>
 </span>
 </div>

<div id="new-pages"></div>
</body>
</html>