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
<% String contextpath=request.getContextPath();%>
<script src="<%=contextpath%>/js/jquery-1.8.2.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
	 
		$("#fiyrPickup").hide();
		$( "select[name='shop']" )
		  .change(function () {
			 if($(this).val() == ''){
			  $("#fiyrPickup").hide();
			  }
			  else
				  {
				  $("#fiyrPickup").show();
				  }	  
			 
			
		  });
		
	$( "#fyr" ).change(function(){
		 $("#shopId").prop( "disabled", true );
		var financialYear=$("#fyr").val();
		var url="<%=contextpath %>/CreateAnnualTargetRSP.jsp?financialYear=";
		url= url+financialYear+"&shopRSP="+$( "#shopId" ).val();
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
<b>Select Asset for RSP:</b>&nbsp;&nbsp;
<select name="shop" id="shopId">
   <option value="">Select</option>
   
   <% 
    if(roles.equals("All"))
    {
    	 
   sql_row="select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 and gateout_validity=1 order by substage_sequence";
      }
   else
    {
  sql_row="select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 and gateout_validity=1 order by substage_sequence";
        	
     }
  rs_row=st_row.executeQuery(sql_row);
  while(rs_row.next())
        {
 	   %>
    <option value=<%=rs_row.getString(1)%>><%=rs_row.getString(1)%> RSP Target</option>
    <% } 
    con.close();
    %>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
  <span id="fiyrPickup">
<b>Select Financial Year:..</b>&nbsp;&nbsp;
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