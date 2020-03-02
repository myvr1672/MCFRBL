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
<% String contextpath=request.getContextPath();%>
<style>
.hide {
display: none;
}

</style>
<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	 $("#subShop").hide();
	 $("#section").hide();
	 $("#shift").hide();
	$("#datePickup").hide();
	$( "select[name='shop']" )
	  .change(function () {
		
		  if($(this).val() == ''){
		  $("#subShop").hide();
		  }
		  else 
			  {
		$("#subShop").show();
		$.ajax({
            type: "post",
            async:false,
            url: "subShop.jsp", //this is my servlet
            data: "shop=" +$('#shopId').val(),
            success: function(msg){      
                    $('#subShopId').append(msg);
            }
        });
			  }
			  });
	$( "select[name='subShopFrom']" )
	  .change(function () {
		  
		  $("#shopId").prop( "disabled", true );
		  if($(this).val() == ''){
			  $("#section").hide();  
		  $("#datePickup").hide();
		  $("#shift").hide();
		  }
		  else
			  {
			  $("#section").show();
			  $.ajax({
		            type: "post",
		            async:false, 
		            url: "subShop.jsp", //this is my servlet
		            data: "shop=" +$('#subShopId').val(),
		            success: function(msg){      
		                    $('#subSectionId').append(msg);
		            }
		        });
			  }
		
	  });
	$( "select[name='subSectionFrom']" )
	  .change(function () {
		  
		  $("#shopId").prop( "disabled", true );
		  $("#subShopId").prop( "disabled", true ); 
		  
		  if($(this).val() == ''){
			  
		  $("#shift").hide();
		  }
		  else
			  {
			  $("#shift").show();
			  }
		
	  });
	$( "select[name='shiftFrom']" )
	  .change(function () {
		  
		  $("#shopId").prop( "disabled", true );
		  $("#subShopId").prop( "disabled", true ); 
		  $("#subSectionId").prop( "disabled", true ); 
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
		  $("#subShopId").prop( "disabled", true ); 
		  $("#subSectionId").prop( "disabled", true );
		  $("#shiftId").prop( "disabled", true );
		var dateField=$( "#tdt" ).val();
		var url="<%=contextpath %>/JobAllocation.jsp?date=";
	    url= url+dateField+"&subSectionId="+$( "#subSectionId" ).val()+"&shift="+$( "#shiftId" ).val();
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
Calendar cal=Calendar.getInstance();
cal.add(Calendar.DATE, 3);
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

<p>
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
    <% } %> --%>
 <option value="Wheel">Wheel Shop</option>   
 <option value="Bogie">Bogie Shop</option>
  <option value="Shell">Shell Shop</option>   
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
<span id="subShop">
<b>Sub Shop</b>&nbsp;&nbsp;

  <select name="subShopFrom" id="subShopId">
   <option value="" selected>Select</option>
   
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
 <span id="section">
<b>Section</b>&nbsp;&nbsp;

  <select name="subSectionFrom" id="subSectionId">
   <option value="" selected>Select</option>
   
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
  <span id="shift">
<b>Shift</b>&nbsp;&nbsp;
  <select name="shiftFrom" id="shiftId">
   <option value="" selected>Select</option>
   <option value="general">General</option>
   <option value="morning">Shift-I</option>
   <option value="evening">Shift-II</option>
   <option value="night">Shift-III</option>
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
  
<span id="datePickup">
<b>Select Date..&nbsp;&nbsp;<input type="date" max="<%=strDate%>" name="date" value=""  id="tdt"/></b>
 </span>
 </p>

<div id="new-pages"></div>
</body>
</html>