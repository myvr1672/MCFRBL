<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
<% String contextpath=request.getContextPath();%>

<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	
	$( "#tdt" ).change(function(){
		var tdt1=$( "#tdt" ).val();
		var url="<%=contextpath %>/CoachStagesCount.jsp?date=";
		url= url+tdt1;
	 $( "#new-pages" ).load(url);
	});
	
});

</script>
</head>
<body>
<% 
Date date = new Date();  
DateFormat  formatter = new SimpleDateFormat("YYYY-MM-dd");  
String strDate= formatter.format(date);  
%>
<h2 align="left" > Please select Date for Enter Progress...</h2>

<p align="left"><b>Select Date:</b>&nbsp;&nbsp;<input type="date" max="<%=strDate%>" name="date" value=""  id="tdt"/>
 </p>
<p></p>
<div id="new-pages"></div>
</body>
</html>