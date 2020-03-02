<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
<style>
.error-msg{
   background-color: #FF0000;
}
</style>
<% String contextpath=request.getContextPath();%>

<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	
	
	$( "#buttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		
		
		
		var url="<%=contextpath %>/extrPaintSipReport.jsp?paint_asset_id="+$( "#assetid" ).val();
		 $( "#new-pages" ).load(url);
		
	});
	
});

</script>
</head>
<body>
<div id="errorMessage"></div>
<p><b>Enter Paint Asset ID</b> <input type ="text" id="assetid" name="assetid"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="buttonId" value="Run Report"/></p>
 
<hr />

<div id="new-pages"></div>
</body>
</html>