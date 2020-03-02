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
	
	$( "#amcAgency" ).change(function(){
		var amcAgency=$( "#amcAgency" ).val();
		var url="<%=contextpath %>/MachineBreakDownVendorReport.jsp?vendorName=";
		url= url+amcAgency;
	 $( "#new-pages" ).load(url);
	});
	
});

</script>
</head>
<body>
<% 
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
String sql_amcAgency;
Statement st_amcAgency= con.createStatement();

ResultSet rs_amcAgency;

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
<p><b>Select AMC Agency:</b>&nbsp;&nbsp;
<select name="amcAgency" id="amcAgency">
   <option value="">Select</option>
   <% 
   sql_amcAgency="select amc_agency_id, amc_agency_name from public.machine_amc_agency";
     
   rs_amcAgency=st_amcAgency.executeQuery(sql_amcAgency);
  while(rs_amcAgency.next())
        {
 	   %>
    <option value=<%=rs_amcAgency.getString(1)%>><%=rs_amcAgency.getString(2)%></option>
    <% } %>
  </select></p>
  <hr>
  <% 
    con.close();
    
 %>
 


<div id="new-pages"></div>
</body>
</html>