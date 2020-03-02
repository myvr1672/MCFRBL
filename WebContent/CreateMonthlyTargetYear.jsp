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
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.hide {
display: none;
}

</style>
<% String contextpath=request.getContextPath();%>
<script src="<%=contextpath%>/js/jquery-1.8.2.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
	 $("#shopProduction").hide();
		$("#fiyrPickup").hide();
		$( "select[name='shop']" )
		  .change(function () {
			  
			  if($(this).val() == ''){
			  $("#shopProduction").hide();
			  }
			  else if($(this).val() == 'Bogie')
			  {
			  $("#shopProduction").show();
			 
			  $('#shopProductionId option').each(function()
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
		  else if($(this).val() == 'Shell')
		  {
		  $("#shopProduction").show();
		  $('#shopProductionId option').each(function()
				  {
			  var opt=$(this)
			  var optValue=opt.val();
			  
			  if(optValue=='KUKA'||optValue=='SIS'||optValue=='InHouse'||optValue=='FromTrade')
				  { 
				  opt.addClass('hide'); 
							  }
			  else {opt.removeClass('hide');
			  }
				  
			  	}
		  
		  
				  );
		  }
			  
			  else
				  {
				  $("#shopProduction").show();
				  $('#shopProductionId option').each(function()
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
		$( "select[name='shopProductionFrom']" )
		  .change(function () {
			  
			  $("#shopId").prop( "disabled", true );
			  if($(this).val() == ''){
			  $("#fiyrPickup").hide();
			  }
			  else
				  {
				  $("#fiyrPickup").show();
				  }
			
		  })
		  ;
	$( "#fyr" ).change(function(){
		 $("#shopProductionId").prop( "disabled", true );
		var financialYear=$("#fyr").val();
		var url="<%=contextpath %>/CreateMonthlyTarget.jsp?financialYear=";
		
		url= url+financialYear+"&prod_from="+$( "#shopProductionId" ).val()+"&shop="+$( "#shopId" ).val();
		//alert(url);
	 $( "#new-pages" ).load(url);
	});
	
});
</script>
</head>
<body>
<% DbConnection db=new DbConnection();
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
%>
<p> 
<b>Select Shop:</b>&nbsp;&nbsp;
<select name="shop" id="shopId">
   <option value="">Select</option>
   
   <% 
    if(roles.equals("All"))
    { 
    	%>
    	<option value="Coach">Coach</option>
    	<% 
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
 	   %>
    <option value=<%=rs_row.getString(1)%>><%=rs_row.getString(2)%> Shop</option>
    <% } 
    con.close();
    %>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
<span id="shopProduction">
<b>Production by </b>&nbsp;&nbsp;
  <select name="shopProductionFrom" id="shopProductionId">
   <option value="" selected>Select</option>
    <option value="InHouse">In House</option>
    <option value="Manual">Manual</option>
    <option value="KUKA">Kuka Line</option>
    <option value="SIS">SIS Line</option>
    <option value="FromTrade">From Trade</option>
  </select>&nbsp;&nbsp;&nbsp;&nbsp;
  </span>
  <span id="fiyrPickup">
<b>Select Financial...</b>&nbsp;&nbsp;
<select name="financialYear"  id="fyr">
<%
Calendar cal = Calendar.getInstance();
int year= cal.get(Calendar.YEAR);
%>
  <option value="" selected>Select</option>
  
  <option value="<%=year-3%>-<%=year-2%>"><%=year-3%>-<%=year-2%></option>
  <option value="<%=year-2%>-<%=year-1%>"><%=year-2%>-<%=year-1%></option>
  <option value="<%=year-1%>-<%=year%>"><%=year-1%>-<%=year%></option>
  <option value="<%=year%>-<%=year+1%>"><%=year%>-<%=year+1%></option>
  <option value="<%=year+1%>-<%=year+2%>"><%=year+1%>-<%=year+2%></option>
 </select>
 </span>
 </p>
<div id="new-pages"></div>
</body>
</html>