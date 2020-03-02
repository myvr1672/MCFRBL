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
	$('#fromDate').datepicker({
        //inline: true,
        dateFormat: 'dd-mm-yy',
        changeMonth: true,
        maxDate: new Date(),
        changeYear: true,
        yearRange: '-1:+1',
        constrainInput: true,
        duration: '',
        gotoCurrent: true,

    }).datepicker("setDate", new Date()); 
	$('#toDate').datepicker({
        //inline: true,
        dateFormat: 'dd-mm-yy',
        changeMonth: true,
        maxDate: new Date(),
        changeYear: true,
        yearRange: '-1:+1',
        constrainInput: true,
        duration: '',
        gotoCurrent: true,

    }).datepicker("setDate", new Date()); 
	
	
	$( "#buttonId" ).click(function(){
		 $('input').attr('required', true);  
		
		var startDate = new Date($('#fromDate').val());
		var endDate = new Date($('#toDate').val());

		if (startDate > endDate){
			 $("#errorMessage").html("From Date should be less than End Date")
             .addClass("error-msg");
	    return false;
		}
		
		var url="<%=contextpath %>/MachineBreakDownReportDateWise.jsp?startDate="+$( "#fromDate" ).val()+"&endDate="+$( "#toDate" ).val();
	 $( "#new-pages" ).load(url);
	});
	
});

</script>
</head>
<body>
<div id="errorMessage"></div>
<p>Select Date Range</p>&nbsp;&nbsp;&nbsp; From Date :&nbsp;&nbsp; <input type ="text" id="fromDate" name="fromDate"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Date :&nbsp;&nbsp; <input type ="text" id="toDate" name="toDate"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="buttonId" value="Run Report"/>
 


<div id="new-pages"></div>
</body>
</html>