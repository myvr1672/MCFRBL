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
	 $("#bogieProduction").hide();
	$("#datePickup").hide();
	$( "select[name='shop']" )
	  .change(function () {
		
		  if($(this).val() == ''){
		  $("#bogieProduction").hide();
		  }
		  else if($(this).val() == 'Bogie')
			  {
			  $("#bogieProduction").show();
			  $('#bogieProductionId option').each(function()
					  {
				  var opt=$(this)
				  var optValue=opt.val();
				  
				  if(optValue=='SIS'||optValue=='Manual')
					  { 
					  opt.addClass('hide'); 
					  
					  }
				  else {opt.removeClass('hide');}
					  
				  	}
			  
			  
					  );
			  }
		  else if($(this).val() == 'SheetMetal')
		  {
		  $("#bogieProduction").show();
		  $('#bogieProductionId option').each(function()
				  {
			  var opt=$(this)
			  var optValue=opt.val();
			  
			  if(optValue=='SIS'||optValue=='KUKA'||optValue=='Manual'||optValue=='FromTrade')
				  { 
				  opt.addClass('hide'); 
				  
				  }
			 			  else {opt.removeClass('hide');}
				  
			  	}
		  
		  
				  );
		  }
		  else if($(this).val() == 'Shell')
		  {
		  $("#bogieProduction").show();
		  $('#bogieProductionId option').each(function()
				  {
			  var opt=$(this)
			  var optValue=opt.val();
			  
			  if(optValue=='KUKA'||optValue=='InHouse')
				  { 
				  opt.addClass('hide'); 
							  }
			  			  else {opt.removeClass('hide');}
				  
			  	}
		  
		  
				  );
		  }
		  else
			  {
			  $("#bogieProduction").show();
			  $('#bogieProductionId option').each(function()
					  {
				  var opt=$(this)
				  var optValue=opt.val();
				  
				  if(optValue=='KUKA'||optValue=='SIS'||optValue=='Manual')
					  { 
					  opt.addClass('hide'); 
					  }
				  else {opt.removeClass('hide');}  
				  	}
			  
			  
					  );
			  }
		
	  })
	  ;
	$( "select[name='bogieProductionFrom']" )
	  .change(function () {
		  
		  $("#shopId").prop( "disabled", true );
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
		  $("#bogieProductionId").prop( "disabled", true );
		var tdt1=$( "#tdt" ).val();
		var url="<%=contextpath %>/ShopStagesCount.jsp?date=";
	    url= url+tdt1+"&prod_from="+$( "#bogieProductionId" ).val()+"&shop="+$( "#shopId" ).val();
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
Date date = new Date();  
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
<select name="shop" id="shopId">
 <option value="">Select</option>
  <% 
    if(roles.equals("All"))
    {
   sql_row="select substages, substage_description from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence";
      }
   else
    {
  sql_row="select substages, substage_description from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence";
        	// out.println(sql_row);
     }
  rs_row=st_row.executeQuery(sql_row);
  while(rs_row.next())
        {
	  String subStage=rs_row.getString(1);
	  String subStageDescription=rs_row.getString(2);
 	   %>
    <option value=<%=subStage%>><%=subStageDescription%> Shop</option>
    <% }
  con.close();%>
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
<span id="bogieProduction">
<b>Production by </b>&nbsp;&nbsp;

  <select name="bogieProductionFrom" id="bogieProductionId">
   <option value="" selected>Select</option>
    <option value="InHouse">In House</option>
    <option value="Manual">Manual</option>
    <option value="KUKA">Kuka Line</option>
    <option value="SIS">SIS Line</option>
    <option value="FromTrade">From Trade</option>
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
<span id="datePickup">
<b>Select Date..&nbsp;&nbsp;<input type="date" max="<%=strDate%>" name="date" value=""  id="tdt"/></b>
 </span>
 </p>

<div id="new-pages"></div>
</body>
</html>